Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB85D60D1FA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:52:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onN2v-0006vn-UA; Tue, 25 Oct 2022 12:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2q-0006bY-2B; Tue, 25 Oct 2022 12:44:52 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2o-0002Fq-Bj; Tue, 25 Oct 2022 12:44:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 267F275A15D;
 Tue, 25 Oct 2022 18:44:48 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0341875A157; Tue, 25 Oct 2022 18:44:48 +0200 (CEST)
Message-Id: <119e41ecd111e5c40f39775b90b692bd7e31c7d4.1666715145.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666715145.git.balaton@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 13/19] mac_nvram: Use NVRAM_SIZE constant
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Tue, 25 Oct 2022 18:44:48 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The NVRAM_SIZE constant was defined but not used. Rename it to
MACIO_NVRAM_SIZE to match the device model and use it where appropriate.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c        | 2 +-
 hw/ppc/mac_newworld.c        | 4 ++--
 include/hw/nvram/mac_nvram.h | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 93a7c7bbc8..08dbdd7fc0 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -226,7 +226,7 @@ static void macio_oldworld_init(Object *obj)
 
     object_initialize_child(OBJECT(s), "nvram", &os->nvram, TYPE_MACIO_NVRAM);
     dev = DEVICE(&os->nvram);
-    qdev_prop_set_uint32(dev, "size", 0x2000);
+    qdev_prop_set_uint32(dev, "size", MACIO_NVRAM_SIZE);
     qdev_prop_set_uint32(dev, "it_shift", 4);
 
     for (i = 0; i < 2; i++) {
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 0a72da89ca..5d2fd69f35 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -450,12 +450,12 @@ static void ppc_core99_init(MachineState *machine)
         nvram_addr = 0xFFE00000;
     }
     dev = qdev_new(TYPE_MACIO_NVRAM);
-    qdev_prop_set_uint32(dev, "size", 0x2000);
+    qdev_prop_set_uint32(dev, "size", MACIO_NVRAM_SIZE);
     qdev_prop_set_uint32(dev, "it_shift", 1);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, nvram_addr);
     nvr = MACIO_NVRAM(dev);
-    pmac_format_nvram_partition(nvr, 0x2000);
+    pmac_format_nvram_partition(nvr, MACIO_NVRAM_SIZE);
     /* No PCI init: the BIOS will do it */
 
     dev = qdev_new(TYPE_FW_CFG_MEM);
diff --git a/include/hw/nvram/mac_nvram.h b/include/hw/nvram/mac_nvram.h
index baa9f6a5a6..b780aca470 100644
--- a/include/hw/nvram/mac_nvram.h
+++ b/include/hw/nvram/mac_nvram.h
@@ -29,9 +29,8 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
-#define NVRAM_SIZE        0x2000
+#define MACIO_NVRAM_SIZE 0x2000
 
-/* Mac NVRAM */
 #define TYPE_MACIO_NVRAM "macio-nvram"
 OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
 
-- 
2.30.4


