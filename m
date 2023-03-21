Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577296C2D7C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXui-0000Sk-Dc; Tue, 21 Mar 2023 05:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXuc-0000Q3-Tt
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:04:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXub-0001m6-Er
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679389448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vH7zTPiaoGaq8Q2uwTCzLejD9bpRmFXSK20hMRwDRzc=;
 b=DrOUrdQFwUbrzfPWiOiQg3kJzwC1rkn+5G9pctJWAACo+FDbn+U0BgAAd8k9e3efdbf2pD
 h4omiyTfmaLi3QegY+7RB5j1pm2tbV1r+qSwo7qu8xNUpd44GCn/zogmF+wLG+qdmdTm1l
 +g3hLOqvNg+XrFkhHikdxxoKUXkYRsw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-QUJnkEp0OZCNKCmZSLToDw-1; Tue, 21 Mar 2023 05:04:05 -0400
X-MC-Unique: QUJnkEp0OZCNKCmZSLToDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B6EE185A7A2;
 Tue, 21 Mar 2023 09:04:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3F0642C827;
 Tue, 21 Mar 2023 09:04:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Erico Nunes <ernunes@redhat.com>
Subject: [PULL 6/7] ui/sdl2: remove workaround forcing x11
Date: Tue, 21 Mar 2023 13:03:33 +0400
Message-Id: <20230321090334.1841607-7-marcandre.lureau@redhat.com>
In-Reply-To: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
References: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
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

From: Erico Nunes <ernunes@redhat.com>

This workaround was put in place in the original implementation almost
10 years ago, considering a very old SDL2 version. Currently it prevents
users to run in a wayland-only environment without manually forcing the
backend.
The SDL2 wayland backend has been supported by distributions for a very
long time (e.g. in Fedora, first available 8 years ago), and is now
considered stable and becoming the default for new SDL2 releases.
Instead of requiring the x11 backend to exist by default, let new qemu
releases run with the default chosen by the installed SDL2 version.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230301141205.514338-1-ernunes@redhat.com>
---
 ui/sdl2.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 35c58c1104..b12dec4caf 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -843,22 +843,6 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 
     assert(o->type == DISPLAY_TYPE_SDL);
 
-#ifdef __linux__
-    /* on Linux, SDL may use fbcon|directfb|svgalib when run without
-     * accessible $DISPLAY to open X11 window.  This is often the case
-     * when qemu is run using sudo.  But in this case, and when actually
-     * run in X11 environment, SDL fights with X11 for the video card,
-     * making current display unavailable, often until reboot.
-     * So make x11 the default SDL video driver if this variable is unset.
-     * This is a bit hackish but saves us from bigger problem.
-     * Maybe it's a good idea to fix this in SDL instead.
-     */
-    if (!g_setenv("SDL_VIDEODRIVER", "x11", 0)) {
-        fprintf(stderr, "Could not set SDL_VIDEODRIVER environment variable\n");
-        exit(1);
-    }
-#endif
-
     if (SDL_GetHintBoolean("QEMU_ENABLE_SDL_LOGGING", SDL_FALSE)) {
         SDL_LogSetAllPriority(SDL_LOG_PRIORITY_VERBOSE);
     }
-- 
2.39.2


