Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E475E9341
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:59:06 +0200 (CEST)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocRDs-000135-Jy
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQtp-0006PM-Pj; Sun, 25 Sep 2022 08:38:21 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQto-0007Pg-9C; Sun, 25 Sep 2022 08:38:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BC66A75A164;
 Sun, 25 Sep 2022 14:38:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8534B75A163; Sun, 25 Sep 2022 14:38:18 +0200 (CEST)
Message-Id: <a1968d614d1f12a282c94f0a6121c22f962cfc00.1664108862.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664108862.git.balaton@eik.bme.hu>
References: <cover.1664108862.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 11/13] hw/ppc/mac.h: Move PROM and KERNEL defines to board
 code
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sun, 25 Sep 2022 14:38:18 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, PP_MIME_FAKE_ASCII_TEXT=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 32ab730600..94a8b72fb1 100644
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
index 1355d032ff..cfdee21cd2 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -57,10 +57,15 @@
 
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


