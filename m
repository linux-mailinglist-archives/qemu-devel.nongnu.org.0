Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4246B7394
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:15:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfBH-0003Uh-VZ; Mon, 13 Mar 2023 06:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfAy-0003Ao-B3
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:13:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfAt-0004LT-OI
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678702381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNRm4hA44NhwZhX/j70InGgs7Ee47UrlVNMceHDhSeo=;
 b=eFpks42Uu0zkZiTBKAbOxybfScaS9/jaHdUAUTceONsQoXMRNjwXDV8AE1O1C0Ub2gpwRC
 rQlN7wcWIvxa33Vl9NQgm9DoXj2UDyQUBXWZi43fvjaqdKGVkQGaCsglwiflkdtQVfqfSs
 z9mUdr46fjz+kndQOD03xYCJKE4t+/k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-GRVBU5xFP7yaI5yVERBrvg-1; Mon, 13 Mar 2023 06:13:00 -0400
X-MC-Unique: GRVBU5xFP7yaI5yVERBrvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5145A18483B4;
 Mon, 13 Mar 2023 10:13:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89FB7140E95F;
 Mon, 13 Mar 2023 10:12:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 11/18] ui/sdl: get the GL context from the window
Date: Mon, 13 Mar 2023 14:12:00 +0400
Message-Id: <20230313101207.375125-12-marcandre.lureau@redhat.com>
In-Reply-To: <20230313101207.375125-1-marcandre.lureau@redhat.com>
References: <20230313101207.375125-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

There is no guarantee to have a current GL context here. The current
code seems to rely on the renderer using a GL backend, and to set a
current GL context. But this is not always the case, for example if the
renderer backend is DirectX.

This change is enough to fix using virgl with sdl2 on win32, on my setup.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/sdl2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 8cb77416af..137f7ab57f 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -101,7 +101,7 @@ void sdl2_window_create(struct sdl2_console *scon)
                                          flags);
     scon->real_renderer = SDL_CreateRenderer(scon->real_window, -1, 0);
     if (scon->opengl) {
-        scon->winctx = SDL_GL_GetCurrentContext();
+        scon->winctx = SDL_GL_CreateContext(scon->real_window);
     }
     sdl_update_caption(scon);
 }
@@ -112,6 +112,8 @@ void sdl2_window_destroy(struct sdl2_console *scon)
         return;
     }
 
+    SDL_GL_DeleteContext(scon->winctx);
+    scon->winctx = NULL;
     SDL_DestroyRenderer(scon->real_renderer);
     scon->real_renderer = NULL;
     SDL_DestroyWindow(scon->real_window);
-- 
2.39.2


