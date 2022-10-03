Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D655F3794
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:20:46 +0200 (CEST)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSrl-00054d-E3
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoj-00055i-LZ; Mon, 03 Oct 2022 16:13:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoh-00010I-RH; Mon, 03 Oct 2022 16:13:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7A05175A163;
 Mon,  3 Oct 2022 22:13:23 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 568A175A157; Mon,  3 Oct 2022 22:13:23 +0200 (CEST)
Message-Id: <3d962792a15bbb861808bc7604c9616ff25667cd.1664827008.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664827008.git.balaton@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 09/13] hw/ppc/mac.h: Move macio specific parts out from
 shared header
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Mon,  3 Oct 2022 22:13:23 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, PP_MIME_FAKE_ASCII_TEXT=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the parts specific to and only used by macio out from the shared
mac.h into macio.c where they better belong.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c         |  5 +++--
 hw/ppc/mac.h                  | 23 -----------------------
 include/hw/misc/macio/macio.h | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index c1fad43f6c..f9f0758b03 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -37,8 +37,9 @@
 #include "hw/intc/heathrow_pic.h"
 #include "trace.h"
 
-/* Note: this code is strongly inspirated from the corresponding code
- * in PearPC */
+#define ESCC_CLOCK 3686400
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
 
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 6c05f3bfd2..26cf15b1ce 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -38,6 +38,27 @@
 #include "hw/ppc/openpic.h"
 #include "qom/object.h"
 
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
 /* MacIO virtual bus */
 #define TYPE_MACIO_BUS "macio-bus"
 OBJECT_DECLARE_SIMPLE_TYPE(MacIOBusState, MACIO_BUS)
-- 
2.30.4


