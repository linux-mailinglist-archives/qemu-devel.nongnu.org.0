Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1C51F111
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:19:50 +0200 (CEST)
Received: from localhost ([::1]:57172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnnNd-0006bH-Bm
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn4c-0007ab-CN
 for qemu-devel@nongnu.org; Sun, 08 May 2022 16:00:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn4a-00079f-5M
 for qemu-devel@nongnu.org; Sun, 08 May 2022 16:00:10 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn3R-0000yR-WF; Sun, 08 May 2022 20:59:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:56:40 +0100
Message-Id: <20220508195650.28590-44-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 43/53] hppa: move hppa_pci_ignore_ops from pci.c to machine.c
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

The memory region only has one user which is for ensuring accesses to the ISA
bus memory do not fault.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220504092600.10048-44-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/hppa_sys.h |  1 -
 hw/hppa/machine.c  | 23 +++++++++++++++++++++++
 hw/hppa/pci.c      | 26 --------------------------
 3 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index 9964d4a7a7..d984b2895d 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -10,7 +10,6 @@
 #define enable_lasi_lan()       0
 
 /* hppa_pci.c.  */
-extern const MemoryRegionOps hppa_pci_ignore_ops;
 extern const MemoryRegionOps hppa_pci_conf1_ops;
 extern const MemoryRegionOps hppa_pci_iack_ops;
 
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index f3d72b4c35..ca595d343e 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -57,6 +57,29 @@ static Notifier hppa_system_powerdown_notifier = {
     .notify = hppa_powerdown_req
 };
 
+/* Fallback for unassigned PCI I/O operations.  Avoids MCHK.  */
+static uint64_t ignore_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void ignore_write(void *opaque, hwaddr addr, uint64_t v, unsigned size)
+{
+}
+
+static const MemoryRegionOps hppa_pci_ignore_ops = {
+    .read = ignore_read,
+    .write = ignore_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+};
 
 static ISABus *hppa_isa_bus(void)
 {
diff --git a/hw/hppa/pci.c b/hw/hppa/pci.c
index a92dcb6b9e..4d62d54c22 100644
--- a/hw/hppa/pci.c
+++ b/hw/hppa/pci.c
@@ -12,32 +12,6 @@
 #include "trace.h"
 
 
-/* Fallback for unassigned PCI I/O operations.  Avoids MCHK.  */
-
-static uint64_t ignore_read(void *opaque, hwaddr addr, unsigned size)
-{
-    return 0;
-}
-
-static void ignore_write(void *opaque, hwaddr addr, uint64_t v, unsigned size)
-{
-}
-
-const MemoryRegionOps hppa_pci_ignore_ops = {
-    .read = ignore_read,
-    .write = ignore_write,
-    .endianness = DEVICE_BIG_ENDIAN,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 8,
-    },
-    .impl = {
-        .min_access_size = 1,
-        .max_access_size = 8,
-    },
-};
-
-
 /* PCI config space reads/writes, to byte-word addressable memory.  */
 static uint64_t bw_conf1_read(void *opaque, hwaddr addr,
                               unsigned size)
-- 
2.20.1


