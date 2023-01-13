Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D343C669BA8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnI-0001Ub-97; Fri, 13 Jan 2023 09:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmk-000124-5o
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003lK-8V
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so17449676wms.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JHSt7/WOQwiLTuQ6eeYq7HrmU1hC/3lzuHdwebI3rPk=;
 b=YvTfNM7eh8lMuzV66tOmUoBV0bppearxC3SVdvgBt7YrWo0V7HRca5tEmwfKSQW09o
 IT57J7jONLzbSGXAB8IGJtBxpRcLRs20gFPdN14MdapY2llghKmxYB4FGbp+iqHCqTZb
 GjASl6r3l3wol+xhr3X2+hr+6R4wgdYCumttgGcrHRsxVrzbH5mOjazUSFPTSzhP2B/V
 l3kzmKJAN8npHaD6Og+V/ZiYCOd8wAhjK7eWtQV8jf8tSmMegXvs2WNn83xDzAp7gaz7
 m/46us4u3BtmVliigh2hEQqNCXmfTyHQVpgqbUi6edPp9uV0gBSOP1nBwp1nS7TVmRoE
 1Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JHSt7/WOQwiLTuQ6eeYq7HrmU1hC/3lzuHdwebI3rPk=;
 b=7+BiTPHifPgOFXATPgsvrMMbbF+EaejrzB3noquNv3d69+9M3h4TqZ5Vd9Gq17gFCS
 +cYI6+HXFgC84sqpsCG3pghNe4elt6pPp7A4L3ukG8MbteCi3QPiWxK9AnooBYbLhjUn
 ftvTAhz8cG256REOYQpaWI372wDI6MY/8c1huZ9UA+wRSWgQ3Fprsy+Finzp6gXPz5+x
 M0A91Mm4EmbZggC1k7/HEEIrlqqzhGYhONOat8CaDQQf/EeeXbNT8pPNz5vf73uGmOFW
 zUTOEYuGSrZjyFlIgw0Tz0Y2Lj/58ml2vWypHiIjY1KhfjWiGVekthupKSk4AYshhPOs
 gQIg==
X-Gm-Message-State: AFqh2kp45GkFxiaHQEc/TgS9/VXOaZE++rOUZhdaR7Vo2xGuSosLVTdD
 bZ2CGseQdXQOR7OlyfRovuzwm3XZvKCpki8+
X-Google-Smtp-Source: AMrXdXu0EBycHv+efBeiHFUSdAsocjUB6ZxzxlRDQa2Jx1QQAE6m6H/ZRUHlZ0iM08pNpxc7YwEECg==
X-Received: by 2002:a05:600c:250:b0:3d2:2043:9cbf with SMTP id
 16-20020a05600c025000b003d220439cbfmr57230338wmj.10.1673619107714; 
 Fri, 13 Jan 2023 06:11:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/38] hw/arm: Remove unreachable code calling
 pflash_cfi01_register()
Date: Fri, 13 Jan 2023 14:11:11 +0000
Message-Id: <20230113141126.535646-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since its QOM'ification in commit 368a354f02 ("pflash_cfi0x:
QOMified") the pflash_cfi01_register() function does not fail.

This call was later converted with a script to use &error_fatal,
still unable to fail. Remove the unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-14-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/gumstix.c     | 18 ++++++------------
 hw/arm/mainstone.c   | 13 +++++--------
 hw/arm/omap_sx1.c    | 22 ++++++++--------------
 hw/arm/versatilepb.c |  6 ++----
 hw/arm/z2.c          |  9 +++------
 5 files changed, 24 insertions(+), 44 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 579d3635774..2ca4140c9fc 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -69,12 +69,9 @@ static void connex_init(MachineState *machine)
     }
 
     /* Numonyx RC28F128J3F75 */
-    if (!pflash_cfi01_register(0x00000000, "connext.rom", CONNEX_FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0)) {
-        error_report("Error registering flash memory");
-        exit(1);
-    }
+    pflash_cfi01_register(0x00000000, "connext.rom", CONNEX_FLASH_SIZE,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0);
 
     /* Interrupt line of NIC is connected to GPIO line 36 */
     smc91c111_init(&nd_table[0], 0x04000300,
@@ -96,12 +93,9 @@ static void verdex_init(MachineState *machine)
     }
 
     /* Micron RC28F256P30TFA */
-    if (!pflash_cfi01_register(0x00000000, "verdex.rom", VERDEX_FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0)) {
-        error_report("Error registering flash memory");
-        exit(1);
-    }
+    pflash_cfi01_register(0x00000000, "verdex.rom", VERDEX_FLASH_SIZE,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0);
 
     /* Interrupt line of NIC is connected to GPIO line 99 */
     smc91c111_init(&nd_table[0], 0x04000300,
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index eebaed6e3ea..68329c46178 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -130,14 +130,11 @@ static void mainstone_common_init(MachineState *machine,
     /* There are two 32MiB flash devices on the board */
     for (i = 0; i < 2; i ++) {
         dinfo = drive_get(IF_PFLASH, 0, i);
-        if (!pflash_cfi01_register(mainstone_flash_base[i],
-                                   i ? "mainstone.flash1" : "mainstone.flash0",
-                                   MAINSTONE_FLASH_SIZE,
-                                   dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                                   FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
-            error_report("Error registering flash memory");
-            exit(1);
-        }
+        pflash_cfi01_register(mainstone_flash_base[i],
+                              i ? "mainstone.flash1" : "mainstone.flash0",
+                              MAINSTONE_FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
     }
 
     mst_irq = sysbus_create_simple("mainstone-fpga", MST_FPGA_PHYS,
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index d1b0ec3264e..1d156bc3441 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -152,13 +152,10 @@ static void sx1_init(MachineState *machine, const int version)
 
     fl_idx = 0;
     if ((dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
-        if (!pflash_cfi01_register(OMAP_CS0_BASE,
-                                   "omap_sx1.flash0-1", flash_size,
-                                   blk_by_legacy_dinfo(dinfo),
-                                   SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
-                           fl_idx);
-        }
+        pflash_cfi01_register(OMAP_CS0_BASE,
+                              "omap_sx1.flash0-1", flash_size,
+                              blk_by_legacy_dinfo(dinfo),
+                              SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
         fl_idx++;
     }
 
@@ -174,13 +171,10 @@ static void sx1_init(MachineState *machine, const int version)
         memory_region_add_subregion(address_space,
                                 OMAP_CS1_BASE + FLASH1_SIZE, &cs[1]);
 
-        if (!pflash_cfi01_register(OMAP_CS1_BASE,
-                                   "omap_sx1.flash1-1", FLASH1_SIZE,
-                                   blk_by_legacy_dinfo(dinfo),
-                                   SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
-                           fl_idx);
-        }
+        pflash_cfi01_register(OMAP_CS1_BASE,
+                              "omap_sx1.flash1-1", FLASH1_SIZE,
+                              blk_by_legacy_dinfo(dinfo),
+                              SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
         fl_idx++;
     } else {
         memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index ecc1f6cf74f..43172d72ea4 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -385,13 +385,11 @@ static void versatile_init(MachineState *machine, int board_id)
     /* 0x34000000 NOR Flash */
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(VERSATILE_FLASH_ADDR, "versatile.flash",
+    pflash_cfi01_register(VERSATILE_FLASH_ADDR, "versatile.flash",
                           VERSATILE_FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                           VERSATILE_FLASH_SECT_SIZE,
-                          4, 0x0089, 0x0018, 0x0000, 0x0, 0)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
-    }
+                          4, 0x0089, 0x0018, 0x0000, 0x0, 0);
 
     versatile_binfo.ram_size = machine->ram_size;
     versatile_binfo.board_id = board_id;
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 839be3ca169..dc25304290a 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -312,12 +312,9 @@ static void z2_init(MachineState *machine)
     mpu = pxa270_init(z2_binfo.ram_size, machine->cpu_type);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
-        error_report("Error registering flash memory");
-        exit(1);
-    }
+    pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
 
     /* setup keypad */
     pxa27x_register_keypad(mpu->kp, map, 0x100);
-- 
2.34.1


