Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750FC42CCD2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:29:14 +0200 (CEST)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maloH-0006vo-Gj
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malhL-0003Us-IP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:22:03 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48438
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malhH-0006zE-VR
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:22:03 -0400
Received: from [2a00:23c4:8b9d:d300:c17b:cf83:be43:9708] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malh4-0000Dh-E8; Wed, 13 Oct 2021 22:21:46 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 13 Oct 2021 22:21:31 +0100
Message-Id: <20211013212132.31519-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:d300:c17b:cf83:be43:9708
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 7/8] q800: wire up remaining IRQs in classic mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Explicitly wire up the remaining IRQs in classic mode to enable the use of
g_assert_not_reached() in the default case to detect any unexpected IRQs.

Add a comment explaining the IRQ routing differences in A/UX mode based
upon the comments in NetBSD (also noting that at least A/UX 3.0.1 still
uses classic mode).

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index d55e6a7541..fa851e2ec9 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -111,6 +111,37 @@ struct GLUEState {
 
 #define GLUE_IRQ_NUBUS_9       0
 
+/*
+ * The GLUE logic on the Quadra 800 supports 2 different IRQ routing modes
+ * controlled from the VIA1 auxmode GPIO (port B bit 6) which are documented
+ * in NetBSD as follows:
+ *
+ * A/UX mode (Linux, NetBSD, auxmode GPIO low)
+ *
+ *   Level 0:        Spurious: ignored
+ *   Level 1:        Software
+ *   Level 2:        VIA2 (except ethernet, sound)
+ *   Level 3:        Ethernet
+ *   Level 4:        Serial (SCC)
+ *   Level 5:        Sound
+ *   Level 6:        VIA1
+ *   Level 7:        NMIs: parity errors, RESET button, YANCC error
+ *
+ * Classic mode (default: used by MacOS, A/UX 3.0.1, auxmode GPIO high)
+ *
+ *   Level 0:        Spurious: ignored
+ *   Level 1:        VIA1 (clock, ADB)
+ *   Level 2:        VIA2 (NuBus, SCSI)
+ *   Level 3:
+ *   Level 4:        Serial (SCC)
+ *   Level 5:
+ *   Level 6:
+ *   Level 7:        Non-maskable: parity errors, RESET button
+ *
+ * Note that despite references to A/UX mode in Linux and NetBSD, at least
+ * A/UX 3.0.1 still uses Classic mode.
+ */
+
 static void GLUE_set_irq(void *opaque, int irq, int level)
 {
     GLUEState *s = opaque;
@@ -144,10 +175,25 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
     case 1:
         /* Classic mode */
         switch (irq) {
+        case GLUE_IRQ_IN_VIA1:
+            irq = 0;
+            break;
+
+        case GLUE_IRQ_IN_VIA2:
+            irq = 1;
+            break;
+
         case GLUE_IRQ_IN_SONIC:
             /* Route to VIA2 instead */
             qemu_set_irq(s->irqs[GLUE_IRQ_NUBUS_9], level);
             return;
+
+        case GLUE_IRQ_IN_ESCC:
+            irq = 3;
+            break;
+
+        default:
+            g_assert_not_reached();
         }
         break;
 
-- 
2.20.1


