Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C316624FD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:06:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqjU-0003Qk-Qh; Mon, 09 Jan 2023 06:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjQ-0003Nr-V8
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:26 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjO-0008Ef-K7
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:24 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso6805556wmb.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qf8hVEmg0ERboJd2XrjaxSQd2LANKOJppGaLQo7Delg=;
 b=rZw61EjvJ2aYT97ub4xB6LRt0F0xKKVA7oyA6cAW8S1IFPjUS/Yz9764XoSoSowELq
 cXr2LYvoz+Kgv58GWRXtRps6MXW6H8ayOfFDu0ED3zg5MiaecsrM2OZVSciSLl1+GM8e
 0uVLHf3YgeKs0LpnwhhWIF4nDIw4OG1l0x73Trm3O+YbD8pEI9yeVwzzkPQSjpjKFYwh
 ppSH/nWekBU2upQdEvQvaK9By5MYBvap9n1PgSVpAZ49mnO3oVvL88w05ABINR74P2wV
 m4NQ4/Z5ejtPaXsRZBneY5M6nJFFvqLAaUAHlDLlW9gJhKKtbb3foBsMC4vfj1unf9us
 D66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qf8hVEmg0ERboJd2XrjaxSQd2LANKOJppGaLQo7Delg=;
 b=d3p3lNrnl9hLIglsTvMO3n2VsfYOz5+JpryNKQpHqKXQMhlAnirAcYkfOvQFtM3F+i
 CL5EHKJAFEqVWh+DD8HdnQf3yvihqKxQK77RHwyVK6ArvLZbz/swj90Iw2PurNMgMYRa
 12+0Vx5FDEcmX93TNxzAJZdjiTNH5M5auqG0F+FLnDQdC/wuVEDavGtb9wfkbKtJfWE7
 e0lkNTtRY83EckgzhZZAvpe6QC5UNlH61ooeBuK2eJluu5nrNcSbTjlw5VMASTUHl+ck
 Tb9bi2pBUgE5F8Sz8FdLZrxWRgZA9k9YqG4YcrqYJ3YE0uxmwGqvLomjtxFFDMl/Zfqb
 7cPg==
X-Gm-Message-State: AFqh2koAr0nMtiRnnkmXgpXP855r/3SDGEfdQirBr3E2KPUoObi62haG
 /4/4dPUx7BbNpqc+mQmYbHgx6l6coUDd+sjG
X-Google-Smtp-Source: AMrXdXudqt2o6vTr+fNpPiV4sj8QtRtMx4ZCoIIgjfiwfXVGhbwVjsQeHpmKX7YDnxzRIPfSc+UeXw==
X-Received: by 2002:a05:600c:4148:b0:3d3:52bb:3985 with SMTP id
 h8-20020a05600c414800b003d352bb3985mr46187630wmm.31.1673265260851; 
 Mon, 09 Jan 2023 03:54:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003d9a71ee54dsm10937675wmj.36.2023.01.09.03.54.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/13] hw/arm: Remove unreachable code calling
 pflash_cfi01_register()
Date: Mon,  9 Jan 2023 12:53:16 +0100
Message-Id: <20230109115316.2235-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Since its QOM'ification in commit 368a354f02 ("pflash_cfi0x:
QOMified") the pflash_cfi01_register() function does not fail.

This call was later converted with a script to use &error_fatal,
still unable to fail. Remove the unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/gumstix.c     | 18 ++++++------------
 hw/arm/mainstone.c   | 13 +++++--------
 hw/arm/omap_sx1.c    | 22 ++++++++--------------
 hw/arm/versatilepb.c |  6 ++----
 hw/arm/z2.c          |  9 +++------
 5 files changed, 24 insertions(+), 44 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 579d363577..2ca4140c9f 100644
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
index eebaed6e3e..68329c4617 100644
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
index d1b0ec3264..1d156bc344 100644
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
index ecc1f6cf74..43172d72ea 100644
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
index 839be3ca16..dc25304290 100644
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
2.38.1


