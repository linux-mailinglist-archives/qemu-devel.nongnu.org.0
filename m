Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218AB60D20D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:56:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onN2v-0006sC-3J; Tue, 25 Oct 2022 12:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2n-0006YB-TY; Tue, 25 Oct 2022 12:44:49 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2l-0002FR-Jt; Tue, 25 Oct 2022 12:44:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1E40875A15B;
 Tue, 25 Oct 2022 18:44:46 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D991075A156; Tue, 25 Oct 2022 18:44:45 +0200 (CEST)
Message-Id: <0dc9e33cf44fff8c7d980949aad0bd9f9f3428cf.1666715145.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666715145.git.balaton@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 11/19] hw/ppc/mac.h: Move PROM and KERNEL defines to board
 code
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Tue, 25 Oct 2022 18:44:45 +0200 (CEST)
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The PROM_FILENAME and KERNEL_* defines are used by mac_oldworld and
mac_newworld but they don't have to be identical so these could be
moved to the individual boards.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac.h          | 4 ----
 hw/ppc/mac_newworld.c | 4 ++++
 hw/ppc/mac_oldworld.c | 7 ++++++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index fe77a6c6db..3e2df262ee 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -30,10 +30,6 @@
 #include "hw/sysbus.h"
 
 #define NVRAM_SIZE        0x2000
-#define PROM_FILENAME    "openbios-ppc"
-
-#define KERNEL_LOAD_ADDR 0x01000000
-#define KERNEL_GAP       0x00100000
 
 /* Mac NVRAM */
 #define TYPE_MACIO_NVRAM "macio-nvram"
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 957f301d6c..c05e29bf67 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -83,9 +83,13 @@
 
 #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
 
+#define PROM_FILENAME "openbios-ppc"
 #define PROM_BASE 0xfff00000
 #define PROM_SIZE (1 * MiB)
 
+#define KERNEL_LOAD_ADDR 0x01000000
+#define KERNEL_GAP       0x00100000
+
 #define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
 typedef struct Core99MachineState Core99MachineState;
 DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index e1a22f8eba..5213cbcc04 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -58,10 +58,15 @@
 
 #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
 
-#define GRACKLE_BASE 0xfec00000
+#define PROM_FILENAME "openbios-ppc"
 #define PROM_BASE 0xffc00000
 #define PROM_SIZE (4 * MiB)
 
+#define KERNEL_LOAD_ADDR 0x01000000
+#define KERNEL_GAP       0x00100000
+
+#define GRACKLE_BASE 0xfec00000
+
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
                             Error **errp)
 {
-- 
2.30.4


