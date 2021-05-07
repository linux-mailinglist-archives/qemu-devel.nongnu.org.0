Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA6376A07
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 20:29:34 +0200 (CEST)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf5ED-0005yb-FT
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 14:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lf51C-0000b2-3X
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:16:06 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:40976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lf4vJ-0001Se-81
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:10:02 -0400
Received: from fwd35.aul.t-online.de (fwd35.aul.t-online.de [172.20.27.145])
 by mailout03.t-online.de (Postfix) with SMTP id 8AC0F45C28;
 Fri,  7 May 2021 20:09:57 +0200 (CEST)
Received: from linpower.localnet
 (ZqtQHUZOYhDgo1SN7lyAkFmJ1m33jdZdpYGpxm8pmCNM12RwdKcwMb6KQllRk91Zp0@[46.86.52.8])
 by fwd35.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lf4vB-2WNKNM0; Fri, 7 May 2021 20:09:53 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 5E00B20061B; Fri,  7 May 2021 20:09:53 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 01/11] ps2: fix mouse stream corruption
Date: Fri,  7 May 2021 20:09:43 +0200
Message-Id: <20210507180953.8530-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <a898b0d5-7086-9699-ae8b-9524ad319b01@t-online.de>
References: <a898b0d5-7086-9699-ae8b-9524ad319b01@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: ZqtQHUZOYhDgo1SN7lyAkFmJ1m33jdZdpYGpxm8pmCNM12RwdKcwMb6KQllRk91Zp0
X-TOI-EXPURGATEID: 150726::1620410994-0000C8B5-6F5A20C4/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ad93643-547d-4b5f-85fd-22d3f1e1d7df
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 7abe7eb294 "ps2: Fix mouse stream corruption due to lost data"
added code to avoid mouse stream corruptions but the calculation of
the needed free queue size was wrong. Fix this.

To reproduce, open a text file with the vim 7.3 32 bit for DOS exe-
cutable in a FreeDOS client started with -display sdl and move the
mouse around for a few seconds. You will quickly see erratic mouse
movements and unexpected mouse clicks. CuteMouse (ctmouse.exe) in
FreeDOS doesn't try to re-sync the mouse stream.

Fixes: 7abe7eb294 ("ps2: Fix mouse stream corruption due to lost data")
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/ps2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 72cdb80ae1..d9f79e8260 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -645,7 +645,8 @@ void ps2_keyboard_set_translation(void *opaque, int mode)
 
 static int ps2_mouse_send_packet(PS2MouseState *s)
 {
-    const int needed = 3 + (s->mouse_type - 2);
+    /* IMPS/2 and IMEX send 4 bytes, PS2 sends 3 bytes */
+    const int needed = s->mouse_type ? 4 : 3;
     unsigned int b;
     int dx1, dy1, dz1;
 
-- 
2.26.2


