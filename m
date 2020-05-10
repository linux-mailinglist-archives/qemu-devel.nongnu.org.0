Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9B71CCCFF
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 20:46:50 +0200 (CEST)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXqyP-000428-CC
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 14:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jXqv5-0007yL-LN
 for qemu-devel@nongnu.org; Sun, 10 May 2020 14:43:23 -0400
Received: from mailout10.t-online.de ([194.25.134.21]:57546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jXqv4-0005RT-K1
 for qemu-devel@nongnu.org; Sun, 10 May 2020 14:43:23 -0400
Received: from fwd04.aul.t-online.de (fwd04.aul.t-online.de [172.20.26.149])
 by mailout10.t-online.de (Postfix) with SMTP id 090F741965F5;
 Sun, 10 May 2020 20:43:21 +0200 (CEST)
Received: from linpower.localnet
 (rfrsC4ZTwhO4Go+wFNndvRwBbTUI1uyEh7ff6Kb+FcrT2aOrB-k7zJiVgnDvZALQAR@[46.86.59.135])
 by fwd04.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jXqv2-1yhw7U0; Sun, 10 May 2020 20:43:20 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id A2B3D20062F; Sun, 10 May 2020 20:43:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 07/10] ui/sdl2: start in full screen with grab enabled
Date: Sun, 10 May 2020 20:43:01 +0200
Message-Id: <20200510184304.9267-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <2393388c-86c3-4d7e-178e-2c7e6d14a8de@t-online.de>
References: <2393388c-86c3-4d7e-178e-2c7e6d14a8de@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: rfrsC4ZTwhO4Go+wFNndvRwBbTUI1uyEh7ff6Kb+FcrT2aOrB-k7zJiVgnDvZALQAR
X-TOI-MSGID: b3634502-8402-4b03-97e3-884f063e2b54
Received-SPF: none client-ip=194.25.134.21;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout10.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 14:43:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To do it's work the sdl_grab_start() function needs a pointer
to a sdl2_console structure.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/sdl2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index ec1cb8131f..c88ac97a79 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -871,17 +871,16 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
         SDL_SetWindowIcon(sdl2_console[0].real_window, icon);
     }
 
-    gui_grab = 0;
-    if (gui_fullscreen) {
-        sdl_grab_start(0);
-    }
-
     mouse_mode_notifier.notify = sdl_mouse_mode_change;
     qemu_add_mouse_mode_change_notifier(&mouse_mode_notifier);
 
     sdl_cursor_hidden = SDL_CreateCursor(&data, &data, 8, 1, 0, 0);
     sdl_cursor_normal = SDL_GetCursor();
 
+    if (gui_fullscreen) {
+        sdl_grab_start(&sdl2_console[0]);
+    }
+
     atexit(sdl_cleanup);
 }
 
-- 
2.26.1


