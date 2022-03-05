Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0994CE52B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:14:43 +0100 (CET)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQVBC-0007zi-Dn
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:14:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV88-0000HK-Qu
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:11:32 -0500
Received: from [2001:41c9:1:41f::167] (port=58954
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV87-00072f-AS
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:11:32 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV7S-00082l-31; Sat, 05 Mar 2022 14:10:53 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  5 Mar 2022 14:10:41 +0000
Message-Id: <20220305141044.31911-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
References: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 09/12] mos6522: record last_irq_levels in mos6522_set_irq()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To detect edge-triggered IRQs it is necessary to store the last state of each
IRQ in a last_irq_levels bitmap.

Note: this is a migration break for machines which use mos6522 instances which
are g3beige/mac99 (PPC) and q800 (m68k).

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mos6522.c         | 11 +++++++++--
 include/hw/misc/mos6522.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 2c20decca1..c67123f864 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -72,6 +72,12 @@ static void mos6522_set_irq(void *opaque, int n, int level)
     }
 
     mos6522_update_irq(s);
+
+    if (level) {
+        s->last_irq_levels |= 1 << n;
+    } else {
+        s->last_irq_levels &= ~(1 << n);
+    }
 }
 
 static uint64_t get_counter_value(MOS6522State *s, MOS6522Timer *ti)
@@ -544,8 +550,8 @@ static const VMStateDescription vmstate_mos6522_timer = {
 
 const VMStateDescription vmstate_mos6522 = {
     .name = "mos6522",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(a, MOS6522State),
         VMSTATE_UINT8(b, MOS6522State),
@@ -556,6 +562,7 @@ const VMStateDescription vmstate_mos6522 = {
         VMSTATE_UINT8(pcr, MOS6522State),
         VMSTATE_UINT8(ifr, MOS6522State),
         VMSTATE_UINT8(ier, MOS6522State),
+        VMSTATE_UINT8(last_irq_levels, MOS6522State),
         VMSTATE_STRUCT_ARRAY(timers, MOS6522State, 2, 0,
                              vmstate_mos6522_timer, MOS6522Timer),
         VMSTATE_END_OF_LIST()
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index 193a3dc870..babea99e06 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -133,6 +133,7 @@ struct MOS6522State {
     uint64_t frequency;
 
     qemu_irq irq;
+    uint8_t last_irq_levels;
 };
 
 #define TYPE_MOS6522 "mos6522"
-- 
2.20.1


