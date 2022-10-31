Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB69613ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbCa-00088S-Jr; Mon, 31 Oct 2022 16:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCX-000829-DZ; Mon, 31 Oct 2022 16:16:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCR-0001Cw-85; Mon, 31 Oct 2022 16:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HVs15WeIzupcMr7rgMwMEI0bZZSh2MhSc6xOwkoNU1k=; b=Or/5HWLUsPD2FhGhM89+ohw9JD
 FVVynFsGkXi8O8Kc4h2nz21ttvW0w4tbJnxfbMlPmoD3W1I90P8yNIYnoBxM2g7CgMKXGdRDorFy0
 Y1NAkr7e0H+Q18h57Og4w+MVkpXhvz224uqnVhyXElFnogxZC1qFRNUuhI/WE7q+ytkV9dA/to02y
 /3GEUP+t7Imey8Tar/rYu3eLoekTd8SdJoPvP5WFHw7+GYz80ovTWSHxhhmWXRemZOiH3GN/humlx
 D84Y1pe6t37nmJbmVbtG2E7jxJvYClosX+f4Rg9l1/HddukWJOLbng1jkhZyfOLGH0wRgneBsLV1g
 YVw2x5xflsT6XlawdzUDi7cGZ/qSUdDo7cVRu7FrEcvBkpBKJVZFcB+Xm3kniGyg61G3/4oyDp2g3
 KBxIiARA12BGy0HjqFit7nEoYjXtELcHC1DyUOpGlF25ZUN+1WDjvZy0kW0iyHcHIy9ukl/rEyEuG
 rdP/cT9tx23yMnOFLG6vpYrdD0Bwzqk9Ae3dSQgJN9uGEXQdaJSeYyUdPdCxY+2l/0Pm0aM8E/8Cs
 tEa8nDktEudEvKJx90zbP7utcWC0Ns/bxh75BvB2Myn+VoeFfhO2CH+rlhJCIN+xZGuM26eBRY03v
 zrv2OVeqvYaRF2nBaMFmCpEoIki2nBh+67cgCl804=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCC-0003Dd-9P; Mon, 31 Oct 2022 20:15:47 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:33 +0000
Message-Id: <20221031201435.677168-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 12/14] mac_nvram: Use NVRAM_SIZE constant
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

The NVRAM_SIZE constant was defined but not used. Rename it to
MACIO_NVRAM_SIZE to match the device model and use it where appropriate.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <5b53c70438dfb46837af8a094e753706b06c4ec6.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
index eb597bbe20..6b2d781dea 100644
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
2.30.2


