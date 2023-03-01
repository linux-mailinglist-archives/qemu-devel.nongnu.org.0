Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27696A6E1B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXND9-0003fV-VB; Wed, 01 Mar 2023 09:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1pXNCx-0003dj-LN
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1pXNCw-0007DT-4K
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677680004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aJ2/KyzoT+tG29/B+6ymO7W5UIO++PHxYkcANkmj6DA=;
 b=PWfT4R3ac4qfbFJsANIxp+uf81wCJSl6LPjtK47EXbE5tiRcUxYlHknspDeccafmkGj7CH
 bxFiWUdKl3NfiRY7Ctf+uCciysUTOeGiAx7AlWvYId6Xf2+eYx2NWgcCHTgwxRiKCw1RZ0
 eglk/M0rg6m9DQphh5w/O23NWyozfWE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-wGUxHPjwO0uzDaYSY18mZw-1; Wed, 01 Mar 2023 09:13:23 -0500
X-MC-Unique: wGUxHPjwO0uzDaYSY18mZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C8CA182A43C
 for <qemu-devel@nongnu.org>; Wed,  1 Mar 2023 14:12:13 +0000 (UTC)
Received: from centennial.enunes.eu (unknown [10.43.17.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA144029A7A;
 Wed,  1 Mar 2023 14:12:12 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: qemu-devel@nongnu.org
Cc: Erico Nunes <ernunes@redhat.com>
Subject: [PATCH] ui/sdl2: remove workaround forcing x11
Date: Wed,  1 Mar 2023 15:12:05 +0100
Message-Id: <20230301141205.514338-1-ernunes@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ernunes@redhat.com;
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
---
 ui/sdl2.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 8cb77416af..03f353232f 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -825,22 +825,6 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 
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
     if (SDL_Init(SDL_INIT_VIDEO)) {
         fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
                 SDL_GetError());
-- 
2.39.2


