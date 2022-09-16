Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9575BB4AD
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 01:12:10 +0200 (CEST)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZKVG-0005bn-07
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 19:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZKR0-0002QM-GP; Fri, 16 Sep 2022 19:07:46 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:18372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZKQk-0000ZL-Ow; Fri, 16 Sep 2022 19:07:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C5D5275A167;
 Sat, 17 Sep 2022 01:07:25 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A4FD675A15D; Sat, 17 Sep 2022 01:07:25 +0200 (CEST)
Message-Id: <3fd567b3162f70414fcbb7d074e3a7731360f6e4.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663368422.git.balaton@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 07/10] hw/ppc/mac.h: Move macio specific atuff out from shared
 header
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sat, 17 Sep 2022 01:07:25 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Move the parts specific to and only used by macio out from the shared
mac.h into macio.c where they better belong.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/misc/macio/macio.c | 26 ++++++++++++++++++++++++--
 hw/ppc/mac.h          | 23 -----------------------
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index c1fad43f6c..eca5983a4d 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -37,8 +37,30 @@
 #include "hw/intc/heathrow_pic.h"
 #include "trace.h"
 
-/* Note: this code is strongly inspirated from the corresponding code
- * in PearPC */
+#define ESCC_CLOCK 3686400
+
+/* Old World IRQs */
+#define OLDWORLD_CUDA_IRQ      0x12
+#define OLDWORLD_ESCCB_IRQ     0x10
+#define OLDWORLD_ESCCA_IRQ     0xf
+#define OLDWORLD_IDE0_IRQ      0xd
+#define OLDWORLD_IDE0_DMA_IRQ  0x2
+#define OLDWORLD_IDE1_IRQ      0xe
+#define OLDWORLD_IDE1_DMA_IRQ  0x3
+
+/* New World IRQs */
+#define NEWWORLD_CUDA_IRQ      0x19
+#define NEWWORLD_PMU_IRQ       0x19
+#define NEWWORLD_ESCCB_IRQ     0x24
+#define NEWWORLD_ESCCA_IRQ     0x25
+#define NEWWORLD_IDE0_IRQ      0xd
+#define NEWWORLD_IDE0_DMA_IRQ  0x2
+#define NEWWORLD_IDE1_IRQ      0xe
+#define NEWWORLD_IDE1_DMA_IRQ  0x3
+#define NEWWORLD_EXTING_GPIO1  0x2f
+#define NEWWORLD_EXTING_GPIO9  0x37
+
+/* Note: this code is strongly inspired by the corresponding code in PearPC */
 
 /*
  * The mac-io has two interfaces to the ESCC. One is called "escc-legacy",
diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index e97087c7e7..55cb02c990 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -35,29 +35,6 @@
 #define KERNEL_LOAD_ADDR 0x01000000
 #define KERNEL_GAP       0x00100000
 
-#define ESCC_CLOCK 3686400
-
-/* Old World IRQs */
-#define OLDWORLD_CUDA_IRQ      0x12
-#define OLDWORLD_ESCCB_IRQ     0x10
-#define OLDWORLD_ESCCA_IRQ     0xf
-#define OLDWORLD_IDE0_IRQ      0xd
-#define OLDWORLD_IDE0_DMA_IRQ  0x2
-#define OLDWORLD_IDE1_IRQ      0xe
-#define OLDWORLD_IDE1_DMA_IRQ  0x3
-
-/* New World IRQs */
-#define NEWWORLD_CUDA_IRQ      0x19
-#define NEWWORLD_PMU_IRQ       0x19
-#define NEWWORLD_ESCCB_IRQ     0x24
-#define NEWWORLD_ESCCA_IRQ     0x25
-#define NEWWORLD_IDE0_IRQ      0xd
-#define NEWWORLD_IDE0_DMA_IRQ  0x2
-#define NEWWORLD_IDE1_IRQ      0xe
-#define NEWWORLD_IDE1_DMA_IRQ  0x3
-#define NEWWORLD_EXTING_GPIO1  0x2f
-#define NEWWORLD_EXTING_GPIO9  0x37
-
 /* Grackle PCI */
 #define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
 
-- 
2.30.4


