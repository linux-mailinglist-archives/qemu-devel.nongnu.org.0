Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FE6B7541
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:05:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfxL-0003qR-Mq; Mon, 13 Mar 2023 07:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfwy-0003Kg-Ax
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfwt-00049m-GQ
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678705358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhE3AcxmHVC4u/opADe16KcYlQlGfL+eB1ZCKzapxic=;
 b=BWnQkw9jCEt46eOW7R6pPPvXzeeK0cd3Gm77DM6adIFIZB1fGp++h/YqVVtcfGGMii/cUk
 5wzsIEvbgaff4Mhom9WFOr6jD/BDCGcsNijOnbDtCv/+dw7qNxeAj5XRjPUuPv0eMnEUfD
 dxGliRNUML+ol/auU0ASh0tP6f2tl7s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-nniK2a7XOOm6YDbSsY843A-1; Mon, 13 Mar 2023 07:02:37 -0400
X-MC-Unique: nniK2a7XOOm6YDbSsY843A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 943F31C05EAD;
 Mon, 13 Mar 2023 11:02:36 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883AE492C13;
 Mon, 13 Mar 2023 11:02:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 15/18] ui/sdl: try to instantiate the matching opengl renderer
Date: Mon, 13 Mar 2023 15:01:23 +0400
Message-Id: <20230313110126.383392-16-marcandre.lureau@redhat.com>
In-Reply-To: <20230313110126.383392-1-marcandre.lureau@redhat.com>
References: <20230313110126.383392-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

-display sdl,gl=es didn't actually use OpenGL ES.

Using OpenGL ES allows to use ANGLE, which works generally better than
Windows/OEM OpenGL driver.

(note: users can still bypass the QEMU choice with SDL_RENDER_DRIVER
environment variable)

(note: for some reason, specifying a driver disables batching and
breaks rendering, so enable it explicitly)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/sdl2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 221cdced60..35c58c1104 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -58,6 +58,11 @@ static Notifier mouse_mode_notifier;
 #define SDL2_MAX_IDLE_COUNT (2 * GUI_REFRESH_INTERVAL_DEFAULT \
                              / SDL2_REFRESH_INTERVAL_BUSY + 1)
 
+/* introduced in SDL 2.0.10 */
+#ifndef SDL_HINT_RENDER_BATCHING
+#define SDL_HINT_RENDER_BATCHING "SDL_RENDER_BATCHING"
+#endif
+
 static void sdl_update_caption(struct sdl2_console *scon);
 
 static struct sdl2_console *get_scon_from_window(uint32_t window_id)
@@ -99,7 +104,18 @@ void sdl2_window_create(struct sdl2_console *scon)
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


