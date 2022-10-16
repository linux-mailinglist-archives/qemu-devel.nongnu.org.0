Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B25FFF3B
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 14:42:01 +0200 (CEST)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok2xs-0006ni-FN
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 08:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2kq-0002O0-0M; Sun, 16 Oct 2022 08:28:32 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2kn-0000P3-RC; Sun, 16 Oct 2022 08:28:31 -0400
Received: by mail-ej1-x633.google.com with SMTP id fy4so19429899ejc.5;
 Sun, 16 Oct 2022 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9xhgZvYPWo0i0B3XY0iJhUjKZsA8oBVL8w/xbgfcgQ=;
 b=gXoduU2TGHGeTOMgJJD/Wj/s/7+EkKUtDOyMdcJ9ZJTUmMqGTAFC38sjPBK96BGvhO
 DDkDI44Q0AS+VvUfCH+D/W28VxeRwzj9oKxVHD5njYq1vdih7dizuuShs6oePxJjQLL4
 7zhVin134inrc1jb1I5YQufqPVAGJWe4HjjOGsyfeclkGm7CNcy8+7W871CcuUdBa3aw
 PKJWZSKLtly4jID8qk+QCqFeN5k/jEcwEr+UmHIkEh6SYO4umnKpdgl54XBDjBlOTg1G
 SA1iCRHERiDNNs/BeytUA10ra5X7Tvx1R5Iyb7nwHdm6S1qL7dCa+s2XgHJUZW6RL82K
 iVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9xhgZvYPWo0i0B3XY0iJhUjKZsA8oBVL8w/xbgfcgQ=;
 b=zsTszpos8LGpnJIn2n7lDMyvBfwyyZzgvkN2vvOejkNedVIv04qM4Wj6JRHWdB1QXt
 Ml6vMP4C8hIUWrfGQ6FSlp8QBW/SzQA60Bwb/3JjaveBwNcPZj9/3BQ7QK9ZwwKyRekk
 qpsG2bDC9gfGnfo48csFJAZsuo0LD92i6DR5nc8Z7FCqsuwxKKvIzWqf0HSwSxVBGMiM
 L4Z0rzV9QeQxJngquH8kMPYY103K0/lQ/XCR7NBQPgdbDhgKGGt+/gWHDZu+o1DxRa/t
 bkJ+hOwEKc0EKJ736NG/OZiRibAF48U0Gfdv1AO0Yc7cxi6fwr4U0A4Dd4bCuTeNEtly
 l+Gw==
X-Gm-Message-State: ACrzQf0x2WhEn6iVS4YYeTcVliFjhOzfyEZlDug8DrvUK3gu1fqG0o3J
 qq1zc/YNFY/5/DA+qxMoA6j5YqIfkvY=
X-Google-Smtp-Source: AMsMyM5GA6DErhy5GSULRnCJOfQNARu//5Y4IuOrEgNH3WvG3VM9C5ls7/XWymiDHEmwNFqQV4JCtg==
X-Received: by 2002:a17:907:60c8:b0:78d:bc56:8f04 with SMTP id
 hv8-20020a17090760c800b0078dbc568f04mr4788337ejc.560.1665923307083; 
 Sun, 16 Oct 2022 05:28:27 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-006-139.89.14.pool.telefonica.de. [89.14.6.139])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm5504467edq.6.2022.10.16.05.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:28:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 2/9] hw/{arm,ppc}: Resolve unreachable code
Date: Sun, 16 Oct 2022 14:27:30 +0200
Message-Id: <20221016122737.93755-3-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016122737.93755-1-shentey@gmail.com>
References: <20221016122737.93755-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pflash_cfi01_register() always returns with a non-NULL pointer (otherwise
it would crash internally). Therefore, the bodies of the if-statements
are unreachable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/gumstix.c     | 18 ++++++------------
 hw/arm/mainstone.c   | 13 +++++--------
 hw/arm/omap_sx1.c    | 22 ++++++++--------------
 hw/arm/versatilepb.c |  6 ++----
 hw/arm/z2.c          |  9 +++------
 hw/ppc/sam460ex.c    | 12 ++++--------
 6 files changed, 28 insertions(+), 52 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 3a4bc332c4..1296628ed9 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -65,12 +65,9 @@ static void connex_init(MachineState *machine)
         exit(1);
     }
 
-    if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, 0)) {
-        error_report("Error registering flash memory");
-        exit(1);
-    }
+    pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          sector_len, 2, 0, 0, 0, 0, 0);
 
     /* Interrupt line of NIC is connected to GPIO line 36 */
     smc91c111_init(&nd_table[0], 0x04000300,
@@ -95,12 +92,9 @@ static void verdex_init(MachineState *machine)
         exit(1);
     }
 
-    if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, 0)) {
-        error_report("Error registering flash memory");
-        exit(1);
-    }
+    pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          sector_len, 2, 0, 0, 0, 0, 0);
 
     /* Interrupt line of NIC is connected to GPIO line 99 */
     smc91c111_init(&nd_table[0], 0x04000300,
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 8454b65458..40f708f2d3 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -130,14 +130,11 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
     /* There are two 32MiB flash devices on the board */
     for (i = 0; i < 2; i ++) {
         dinfo = drive_get(IF_PFLASH, 0, i);
-        if (!pflash_cfi01_register(mainstone_flash_base[i],
-                                   i ? "mainstone.flash1" : "mainstone.flash0",
-                                   MAINSTONE_FLASH,
-                                   dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                                   sector_len, 4, 0, 0, 0, 0, 0)) {
-            error_report("Error registering flash memory");
-            exit(1);
-        }
+        pflash_cfi01_register(mainstone_flash_base[i],
+                              i ? "mainstone.flash1" : "mainstone.flash0",
+                              MAINSTONE_FLASH,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              sector_len, 4, 0, 0, 0, 0, 0);
     }
 
     mst_irq = sysbus_create_simple("mainstone-fpga", MST_FPGA_PHYS,
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 57829b3744..820652265b 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -153,13 +153,10 @@ static void sx1_init(MachineState *machine, const int version)
 
     fl_idx = 0;
     if ((dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
-        if (!pflash_cfi01_register(OMAP_CS0_BASE,
-                                   "omap_sx1.flash0-1", flash_size,
-                                   blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, 0)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
-                           fl_idx);
-        }
+        pflash_cfi01_register(OMAP_CS0_BASE,
+                              "omap_sx1.flash0-1", flash_size,
+                              blk_by_legacy_dinfo(dinfo),
+                              sector_size, 4, 0, 0, 0, 0, 0);
         fl_idx++;
     }
 
@@ -175,13 +172,10 @@ static void sx1_init(MachineState *machine, const int version)
         memory_region_add_subregion(address_space,
                                 OMAP_CS1_BASE + flash1_size, &cs[1]);
 
-        if (!pflash_cfi01_register(OMAP_CS1_BASE,
-                                   "omap_sx1.flash1-1", flash1_size,
-                                   blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, 0)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
-                           fl_idx);
-        }
+        pflash_cfi01_register(OMAP_CS1_BASE,
+                              "omap_sx1.flash1-1", flash1_size,
+                              blk_by_legacy_dinfo(dinfo),
+                              sector_size, 4, 0, 0, 0, 0, 0);
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
index 9c1e876207..082ccc557e 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -311,12 +311,9 @@ static void z2_init(MachineState *machine)
     mpu = pxa270_init(address_space_mem, z2_binfo.ram_size, machine->cpu_type);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 4, 0, 0, 0, 0, 0)) {
-        error_report("Error registering flash memory");
-        exit(1);
-    }
+    pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          sector_len, 4, 0, 0, 0, 0, 0);
 
     /* setup keypad */
     pxa27x_register_keypad(mpu->kp, map, 0x100);
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 850bb3b817..8089dd015b 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -111,14 +111,10 @@ static int sam460ex_load_uboot(void)
     DriveInfo *dinfo;
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
-                               "sam460ex.flash", FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1)) {
-        error_report("Error registering flash memory");
-        /* XXX: return an error instead? */
-        exit(1);
-    }
+    pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
+                          "sam460ex.flash", FLASH_SIZE,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
 
     if (!dinfo) {
         /*error_report("No flash image given with the 'pflash' parameter,"
-- 
2.38.0


