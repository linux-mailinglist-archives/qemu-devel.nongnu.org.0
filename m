Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AD13908E8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:25:24 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbk3-0006dY-3g
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba2-0002Yp-WC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:03 -0400
Received: from mailout06.t-online.de ([194.25.134.19]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbZq-0003Zo-QG
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:02 -0400
Received: from fwd08.aul.t-online.de (fwd08.aul.t-online.de [172.20.26.151])
 by mailout06.t-online.de (Postfix) with SMTP id 62D9FF7423;
 Tue, 25 May 2021 20:14:44 +0200 (CEST)
Received: from linpower.localnet
 (VrzTPmZHZhoKTe2v6w-01qcSpG+yc8r6G-Zu28Jc3Afq97hsW9-7z5IIM7NJErKZTF@[93.236.158.49])
 by fwd08.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llbZi-1waDh20; Tue, 25 May 2021 20:14:42 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 8463720046A; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 01/12] ps2: fix mouse stream corruption
Date: Tue, 25 May 2021 20:14:30 +0200
Message-Id: <20210525181441.27768-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: VrzTPmZHZhoKTe2v6w-01qcSpG+yc8r6G-Zu28Jc3Afq97hsW9-7z5IIM7NJErKZTF
X-TOI-EXPURGATEID: 150726::1621966482-0000AFFF-0E7F0764/0/0 CLEAN NORMAL
X-TOI-MSGID: 575ba29a-574c-4f4e-978a-653cdc7f65cb
Received-SPF: none client-ip=194.25.134.19;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout06.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


