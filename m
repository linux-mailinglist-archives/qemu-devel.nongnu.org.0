Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE376504BE
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p714x-0001PW-Ae; Sun, 18 Dec 2022 16:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p714F-000132-Qy; Sun, 18 Dec 2022 16:19:45 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p714C-0001xu-QC; Sun, 18 Dec 2022 16:19:31 -0500
Received: by mail-lf1-x135.google.com with SMTP id cf42so11132339lfb.1;
 Sun, 18 Dec 2022 13:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c08hVl9D9/u/T28Fz+sqopcOehEP0Ikwgs0RHn7FUE4=;
 b=i2att2n0VwJ/3bKuHh8FH1yazM93JCE0oN6KSYqmvj6Cz9Gj611BMt8spLu3Y12KXF
 cPp/S/v/NOL6jXJI8ruawtnYPdTXUXyenZUo1g4x6TAKHgUyEUdHn7f2b6Mc+tqN3HbU
 LU0d3aLUVvR8n7jiscE36RCBbvZxNtK/vfcf0I1321iJG0XtFUAuoUdYjexMt1/qL83/
 FOd/HEhIGy9YsBZOtXzMP8OzLADMKgOOxSfCW/kW8mWDrfgAqHtUGeJ7OcyieFJRDPsh
 MqsaeUFjYHhkNTmZtUUfkWmI5rQKbheH9S+dIIFc6hDQkq/R1K5zKYvAs6YTNl+A4J1P
 9dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c08hVl9D9/u/T28Fz+sqopcOehEP0Ikwgs0RHn7FUE4=;
 b=QA6UNfs0Oz7oSW+CEWBzrWFRPgJ1tOfgFwTLPww/lcQJmHuUzFjXQcIfVoN7lJI+cG
 K03iM+FOyiL2YvusPltSv1GzfsP1CLBuO/4HjSGE9JDybdi3/HgJwjQ0NdlHIpmLd1HW
 /QjaC2oliL8Sctzdh8mtdnx+LNcMWiUW+9Foa27mT4zRY5/wexuBGqOLXYzf4WIBLiuM
 ydgDvCNxMVFO3tolRZXSfl/QVe/l7RM0FHUdTYqIBWuR6soMThrEMnGlbdprONywPAMH
 ggADAeNOEojboM3L25caGsUPeq0TOS8FH1bbcsm6Zfc6IoIDRsT4MhXXLhFKulYateII
 WiKw==
X-Gm-Message-State: ANoB5pnCfJfyIu771Yh/VPn1tfXzCMO4wQPn0XcehFAH7JGXXJZosjL2
 g/faCWPwJE92wQfu2ZP3A6wIN126Uw3qZA08
X-Google-Smtp-Source: AA0mqf7y5TuS4sZBgSUoJKgbKm+06bRy6oQEVkQWRf79FkFRfJYO2bTUxQn6w3xrvUPx6ZeDR+/sFw==
X-Received: by 2002:a05:6512:de:b0:4b5:2ef3:fd2a with SMTP id
 c30-20020a05651200de00b004b52ef3fd2amr16845051lfp.47.1671398366785; 
 Sun, 18 Dec 2022 13:19:26 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 w7-20020a05651234c700b0049464d89e40sm902620lfr.72.2022.12.18.13.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 13:19:26 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 6/7] hw/arm: Allwinner A10 enable SPL load from MMC
Date: Sun, 18 Dec 2022 22:19:17 +0100
Message-Id: <20221218211918.3592-7-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch enables copying of SPL from MMC if `-kernel` parameter is not
passed when starting QEMU. SPL is copied to SRAM_A.

The approach is reused from Allwinner H3 implementation.

Tested with Armbian and custom Yocto image.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/arm/allwinner-a10.c         | 18 ++++++++++++++++++
 hw/arm/cubieboard.c            |  5 +++++
 include/hw/arm/allwinner-a10.h | 21 +++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 17e439777e..dc1966ff7a 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -24,7 +24,9 @@
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/usb/hcd-ohci.h"
+#include "hw/loader.h"
 
+#define AW_A10_SRAM_A_BASE      0x00000000
 #define AW_A10_DRAMC_BASE       0x01c01000
 #define AW_A10_MMC0_BASE        0x01c0f000
 #define AW_A10_CCM_BASE         0x01c20000
@@ -38,6 +40,22 @@
 #define AW_A10_RTC_BASE         0x01c20d00
 #define AW_A10_I2C0_BASE        0x01c2ac00
 
+void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk)
+{
+    const int64_t rom_size = 32 * KiB;
+    g_autofree uint8_t *buffer = g_new0(uint8_t, rom_size);
+
+    if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) < 0) {
+        error_setg(&error_fatal, "%s: failed to read BlockBackend data",
+                   __func__);
+        return;
+    }
+
+    rom_add_blob("allwinner-a10.bootrom", buffer, rom_size,
+                  rom_size, AW_A10_SRAM_A_BASE,
+                  NULL, NULL, NULL, NULL, false);
+}
+
 static void aw_a10_init(Object *obj)
 {
     AwA10State *s = AW_A10(obj);
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index afc7980414..37659c35fd 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -99,6 +99,11 @@ static void cubieboard_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
                                 machine->ram);
 
+    /* Load target kernel or start using BootROM */
+    if (!machine->kernel_filename && blk && blk_is_available(blk)) {
+        /* Use Boot ROM to copy data from SD card to SRAM */
+        allwinner_a10_bootrom_setup(a10, blk);
+    }
     /* TODO create and connect IDE devices for ide_drive_get() */
 
     cubieboard_binfo.ram_size = machine->ram_size;
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 763935fca9..b3c9ed24c7 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -15,6 +15,7 @@
 #include "hw/misc/allwinner-a10-ccm.h"
 #include "hw/misc/allwinner-a10-dramc.h"
 #include "hw/i2c/allwinner-i2c.h"
+#include "sysemu/block-backend.h"
 
 #include "target/arm/cpu.h"
 #include "qom/object.h"
@@ -47,4 +48,24 @@ struct AwA10State {
     OHCISysBusState ohci[AW_A10_NUM_USB];
 };
 
+/**
+ * Emulate Boot ROM firmware setup functionality.
+ *
+ * A real Allwinner A10 SoC contains a Boot ROM
+ * which is the first code that runs right after
+ * the SoC is powered on. The Boot ROM is responsible
+ * for loading user code (e.g. a bootloader) from any
+ * of the supported external devices and writing the
+ * downloaded code to internal SRAM. After loading the SoC
+ * begins executing the code written to SRAM.
+ *
+ * This function emulates the Boot ROM by copying 32 KiB
+ * of data from the given block device and writes it to
+ * the start of the first internal SRAM memory.
+ *
+ * @s: Allwinner A10 state object pointer
+ * @blk: Block backend device object pointer
+ */
+void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk);
+
 #endif
-- 
2.30.2


