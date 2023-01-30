Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0B8680BEB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:26:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSIn-0008Hn-JK; Mon, 30 Jan 2023 06:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSIH-0006r2-9c
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:25:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSIE-0008Rg-3C
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DqnBGgS558Elqkbht6uWfnsyLmdI55OPGuBv8KeYBbE=;
 b=T2V2+tidaFN80iNIKJZQPdYeCWrag5xT9O444S3o3Z0m9v5FoCqDQJpUPPf6/9incu5hk8
 9lEpbgSDnk3zm5i1CvkLtLLg/p6geQ5sszf4RYSbYMtzTmBS+dxwhY0RehrkgYLAC4RSIs
 kIHenyaVxof8HRVp/k7DxdSuVfvTvEA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-4qZRrKhlMx6KSBAUKV5suQ-1; Mon, 30 Jan 2023 06:25:43 -0500
X-MC-Unique: 4qZRrKhlMx6KSBAUKV5suQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F7C9811E9C
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:25:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 548E8492B01;
 Mon, 30 Jan 2023 11:25:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 11/11] ui/sdl: get the GL context from the window
Date: Mon, 30 Jan 2023 15:24:31 +0400
Message-Id: <20230130112431.69559-12-marcandre.lureau@redhat.com>
In-Reply-To: <20230130112431.69559-1-marcandre.lureau@redhat.com>
References: <20230130112431.69559-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
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
 ui/sdl2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 8cb77416af..f259e4c4d1 100644
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
-- 
2.39.1


