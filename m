Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66339519CDC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:24:47 +0200 (CEST)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCBa-0002Go-Hh
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIR-0008Vm-EK
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIP-000472-M2
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:47 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHE-0002VG-Py; Wed, 04 May 2022 10:26:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:37 +0100
Message-Id: <20220504092600.10048-28-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 27/50] lasi: move LASIState and associated QOM structures
 to lasi.h
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/lasi.c | 44 +-------------------------------------
 hw/hppa/lasi.h | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 43 deletions(-)
 create mode 100644 hw/hppa/lasi.h

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 242713c7bd..c1dfd5310f 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -24,50 +24,8 @@
 #include "hw/input/lasips2.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
+#include "lasi.h"
 
-#define TYPE_LASI_CHIP "lasi-chip"
-
-#define LASI_IRR        0x00    /* RO */
-#define LASI_IMR        0x04
-#define LASI_IPR        0x08
-#define LASI_ICR        0x0c
-#define LASI_IAR        0x10
-
-#define LASI_PCR        0x0C000 /* LASI Power Control register */
-#define LASI_ERRLOG     0x0C004 /* LASI Error Logging register */
-#define LASI_VER        0x0C008 /* LASI Version Control register */
-#define LASI_IORESET    0x0C00C /* LASI I/O Reset register */
-#define LASI_AMR        0x0C010 /* LASI Arbitration Mask register */
-#define LASI_IO_CONF    0x7FFFE /* LASI primary configuration register */
-#define LASI_IO_CONF2   0x7FFFF /* LASI secondary configuration register */
-
-#define LASI_BIT(x)     (1ul << (x))
-#define LASI_IRQ_BITS   (LASI_BIT(5) | LASI_BIT(7) | LASI_BIT(8) | LASI_BIT(9) \
-            | LASI_BIT(13) | LASI_BIT(14) | LASI_BIT(16) | LASI_BIT(17) \
-            | LASI_BIT(18) | LASI_BIT(19) | LASI_BIT(20) | LASI_BIT(21) \
-            | LASI_BIT(26))
-
-#define ICR_BUS_ERROR_BIT  LASI_BIT(8)  /* bit 8 in ICR */
-#define ICR_TOC_BIT        LASI_BIT(1)  /* bit 1 in ICR */
-
-OBJECT_DECLARE_SIMPLE_TYPE(LasiState, LASI_CHIP)
-
-struct LasiState {
-    PCIHostState parent_obj;
-
-    uint32_t irr;
-    uint32_t imr;
-    uint32_t ipr;
-    uint32_t icr;
-    uint32_t iar;
-
-    uint32_t errlog;
-    uint32_t amr;
-    uint32_t rtc;
-    time_t rtc_ref;
-
-    MemoryRegion this_mem;
-};
 
 static bool lasi_chip_mem_valid(void *opaque, hwaddr addr,
                                 unsigned size, bool is_write,
diff --git a/hw/hppa/lasi.h b/hw/hppa/lasi.h
new file mode 100644
index 0000000000..559aae2560
--- /dev/null
+++ b/hw/hppa/lasi.h
@@ -0,0 +1,58 @@
+/*
+ * HP-PARISC Lasi chipset emulation.
+ *
+ * (C) 2019 by Helge Deller <deller@gmx.de>
+ *
+ * This work is licensed under the GNU GPL license version 2 or later.
+ *
+ * Documentation available at:
+ * https://parisc.wiki.kernel.org/images-parisc/7/79/Lasi_ers.pdf
+ */
+
+#ifndef LASI_H
+#define LASI_H
+
+#define TYPE_LASI_CHIP "lasi-chip"
+OBJECT_DECLARE_SIMPLE_TYPE(LasiState, LASI_CHIP)
+
+#define LASI_IRR        0x00    /* RO */
+#define LASI_IMR        0x04
+#define LASI_IPR        0x08
+#define LASI_ICR        0x0c
+#define LASI_IAR        0x10
+
+#define LASI_PCR        0x0C000 /* LASI Power Control register */
+#define LASI_ERRLOG     0x0C004 /* LASI Error Logging register */
+#define LASI_VER        0x0C008 /* LASI Version Control register */
+#define LASI_IORESET    0x0C00C /* LASI I/O Reset register */
+#define LASI_AMR        0x0C010 /* LASI Arbitration Mask register */
+#define LASI_IO_CONF    0x7FFFE /* LASI primary configuration register */
+#define LASI_IO_CONF2   0x7FFFF /* LASI secondary configuration register */
+
+#define LASI_BIT(x)     (1ul << (x))
+#define LASI_IRQ_BITS   (LASI_BIT(5) | LASI_BIT(7) | LASI_BIT(8) | LASI_BIT(9) \
+            | LASI_BIT(13) | LASI_BIT(14) | LASI_BIT(16) | LASI_BIT(17) \
+            | LASI_BIT(18) | LASI_BIT(19) | LASI_BIT(20) | LASI_BIT(21) \
+            | LASI_BIT(26))
+
+#define ICR_BUS_ERROR_BIT  LASI_BIT(8)  /* bit 8 in ICR */
+#define ICR_TOC_BIT        LASI_BIT(1)  /* bit 1 in ICR */
+
+struct LasiState {
+    PCIHostState parent_obj;
+
+    uint32_t irr;
+    uint32_t imr;
+    uint32_t ipr;
+    uint32_t icr;
+    uint32_t iar;
+
+    uint32_t errlog;
+    uint32_t amr;
+    uint32_t rtc;
+    time_t rtc_ref;
+
+    MemoryRegion this_mem;
+};
+
+#endif
-- 
2.20.1


