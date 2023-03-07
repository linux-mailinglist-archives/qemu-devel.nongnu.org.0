Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD66ADE25
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVx6-00057f-Sa; Tue, 07 Mar 2023 06:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVx4-0004xT-CF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVx3-00038z-1p
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678190272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RJQY43s2GclWYOsh3Cy5FP1kKhEpDMEydGU9O04K9g=;
 b=At43oeFkS2OFrQy1s/iHWdRgobemu9le/KSd/iRZTVlNgkJhvfFb0SauhVPToPdzMZnjos
 cbnUzwoJ4mb+Jjv+xAonEsgyq2FIjku7mDQlL0zZz1E1VY+C+wJsjvB6iZIMmZpqiQ5saz
 6+ih7vv+3/CaX6Yf5BEa4s/HjrIGKss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-WYKWQ7SyPrCtCbZXkZHG6w-1; Tue, 07 Mar 2023 06:57:49 -0500
X-MC-Unique: WYKWQ7SyPrCtCbZXkZHG6w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0786B85A588;
 Tue,  7 Mar 2023 11:57:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09D05492C14;
 Tue,  7 Mar 2023 11:57:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 15/18] ui/sdl: try to instantiate the matching opengl
 renderer
Date: Tue,  7 Mar 2023 15:56:34 +0400
Message-Id: <20230307115637.2464377-16-marcandre.lureau@redhat.com>
In-Reply-To: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

User can still bypass the QEMU choice with SDL_RENDER_DRIVER environment
variable. (for some reason, specifying a driver disables batching and
breaks rendering, so enable it explicitly)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/sdl2.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 592eca3e1c..e83ea53628 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -99,7 +99,18 @@ void sdl2_window_create(struct sdl2_console *scon)
                                          surface_width(scon->surface),
                                          surface_height(scon->surface),
                                          flags);
+    if (scon->opengl) {
+        const char *driver = "opengl";
+
+        if (scon->opts->gl == DISPLAYGL_MODE_ES) {
+            driver = "opengles2";
+        }
+
+        SDL_SetHint(SDL_HINT_RENDER_DRIVER, driver);
+        SDL_SetHint(SDL_HINT_RENDER_BATCHING, "1");
+    }
     scon->real_renderer = SDL_CreateRenderer(scon->real_window, -1, 0);
+
     if (scon->opengl) {
         scon->winctx = SDL_GL_CreateContext(scon->real_window);
     }
-- 
2.39.2


