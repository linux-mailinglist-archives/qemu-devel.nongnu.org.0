Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8223C6E59F3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 08:57:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pofGz-0008Nm-14; Tue, 18 Apr 2023 02:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pofGu-0008NJ-B1
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:57:01 -0400
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pofGs-0006mp-ID
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:56:59 -0400
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout01.t-online.de (Postfix) with SMTP id 440A96C24;
 Tue, 18 Apr 2023 08:56:55 +0200 (CEST)
Received: from linpower.localnet ([79.208.18.128]) by fwd78.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pofGm-0OEEBF0; Tue, 18 Apr 2023 08:56:52 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 691BA2002DC; Tue, 18 Apr 2023 08:56:52 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v2 1/1] ui/sdl2: disable SDL_HINT_GRAB_KEYBOARD on Windows
Date: Tue, 18 Apr 2023 08:56:52 +0200
Message-Id: <20230418065652.7152-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <59ffc014-ec48-64a4-3403-7e64c5594053@t-online.de>
References: <59ffc014-ec48-64a4-3403-7e64c5594053@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1681801012-E6719C0B-4A80D678/0/0 CLEAN NORMAL
X-TOI-MSGID: 44d21f12-6ebd-4995-90c0-4b8e387e6fc6
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Windows sends an extra left control key up/down input event for
every right alt key up/down input event for keyboards with
international layout. Since commit 830473455f ("ui/sdl2: fix
handling of AltGr key on Windows") QEMU uses a Windows low level
keyboard hook procedure to reliably filter out the special left
control key and to grab the keyboard on Windows.

The SDL2 version 2.0.16 introduced its own Windows low level
keyboard hook procedure to grab the keyboard. Windows calls this
callback before the QEMU keyboard hook procedure. This disables
the special left control key filter when the keyboard is grabbed.

To fix the problem, disable the SDL2 Windows low level keyboard
hook procedure.

Reported-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/sdl2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 00aadfae37..9d703200bf 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -855,7 +855,10 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 #ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR /* only available since SDL 2.0.8 */
     SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
 #endif
+#ifndef CONFIG_WIN32
+    /* QEMU uses its own low level keyboard hook procecure on Windows */
     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
+#endif
 #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
     SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
 #endif
-- 
2.35.3


