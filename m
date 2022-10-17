Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7AA6017D4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:39:10 +0200 (CEST)
Received: from localhost ([::1]:55796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVx6-0000WK-Iy
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVf7-0001s8-72; Mon, 17 Oct 2022 15:20:34 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:43625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVf4-0002nP-Tt; Mon, 17 Oct 2022 15:20:32 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1324e7a1284so14385498fac.10; 
 Mon, 17 Oct 2022 12:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tO+FE161ZHrjjX3lOeKtKuS/Ie/mQPjsgJGVKPgoeB0=;
 b=YHZ/egoWeJpo6+jDnOzHNf1fI1s36wIPba4FGbrEO+ykhl2tCnTXnX1gEHy5hj+IRt
 6rlmTHingknZgsgZjyANyl9dzXF8QGQuUVEW0TRu67xX/sx7M9+nAc3HeHmH9/jtaWB4
 RL2WTF3Wd05IzVg3AugmzLiNYCPNTt3gVZVVpuj3nFdW63cFrFU4+9Kw5ZBGjuXYZ+/A
 JUKBhWcJsWZDTIPw1wob7MGat8xo4/NI2eHeGN1PztMk/biARhuNP86UJMdWT0avm7gU
 7JupB6DDZgeLVfI9UJQTFIr1YsCG6Pe9WP3Bzcl/U2U0avZsZ876mZMnKXS+T55ngGPw
 l61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tO+FE161ZHrjjX3lOeKtKuS/Ie/mQPjsgJGVKPgoeB0=;
 b=m+fPWUeop1cKn4J4zeSpwi4bm5x/2p7TpbHhfPUS0in6IeNO24O9z103zOrSQokV/g
 DOJscUv2a/dxMkabM7AVuiZFx12sLgIfFjCKCFuYd8L+ANnTb1IpD3nBOi89BT3SMau0
 qiqjnkGrH6VsIvTbztqK3QI55Z4aOIA0DzzeF1SGcgM+QjHLkebaqdxPj1sSLNGeVTPJ
 j/S6WsApuKCqGVM21FA5u08uYfoizETL2av25EMfJPmHKt9nJqpMZga7MMcWHAx0tzBz
 7JHFpavkOcJYsFIGz0U5X5+xg5QOUgeacXfi1zx/+ICuNJ4ulQIAQBKtY9ASTkVv0Cau
 VqfQ==
X-Gm-Message-State: ACrzQf0dFSiAloPVxNqPPHN3EOS1N5sj91J/9zLhAY/aGLzdTuuj5YFi
 nTGk998KEdOTcCgjLPcs2T91zueJISM=
X-Google-Smtp-Source: AMsMyM7uwWh53FI0Siu23Mqm+EhneazOlvStzzpZJhQLKTHTgXluv91mAwi7PBoARN/nfZrXTcvt/g==
X-Received: by 2002:a05:6870:ea8f:b0:136:ddfe:bee2 with SMTP id
 s15-20020a056870ea8f00b00136ddfebee2mr16928611oap.151.1666034428972; 
 Mon, 17 Oct 2022 12:20:28 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 05/38] ppc4xx_sdram: Get rid of the init RAM hack
Date: Mon, 17 Oct 2022 16:19:36 -0300
Message-Id: <20221017192009.92404-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

The do_init parameter of ppc4xx_sdram_init() is used to map memory
regions that is normally done by the firmware by programming the SDRAM
controller. Do this from board code emulating what firmware would do
when booting a kernel directly from -kernel without a firmware so we
can get rid of this do_init hack.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <d6c44c870befa1a075e21f1a59926dcdaff63f6b.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h         |  1 -
 hw/ppc/ppc405_boards.c  |  3 +--
 hw/ppc/ppc405_uc.c      |  4 +---
 hw/ppc/ppc440_bamboo.c  |  4 +++-
 hw/ppc/ppc4xx_devs.c    | 12 +++++++-----
 include/hw/ppc/ppc4xx.h |  5 +++--
 6 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 1e558c7831..756865621b 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -169,7 +169,6 @@ struct Ppc405SoCState {
     /* Public */
     MemoryRegion ram_banks[2];
     hwaddr ram_bases[2], ram_sizes[2];
-    bool do_dram_init;
 
     MemoryRegion *dram_mr;
     hwaddr ram_size;
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 083f12b23e..1eaeca8806 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -288,8 +288,6 @@ static void ppc405_init(MachineState *machine)
                              machine->ram_size, &error_fatal);
     object_property_set_link(OBJECT(&ppc405->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
-    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
-                             kernel_filename != NULL, &error_abort);
     object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
                              &error_abort);
     qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
@@ -349,6 +347,7 @@ static void ppc405_init(MachineState *machine)
 
     /* Load ELF kernel and rootfs.cpio */
     } else if (kernel_filename && !machine->firmware) {
+        ppc4xx_sdram_enable(&ppc405->soc.cpu.env);
         boot_from_kernel(machine, &ppc405->soc.cpu);
     }
 }
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 2ca42fdef6..1e02347e57 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1081,8 +1081,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                              s->ram_bases[0], s->ram_sizes[0]);
 
     ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
-                      s->ram_banks, s->ram_bases, s->ram_sizes,
-                      s->do_dram_init);
+                      s->ram_banks, s->ram_bases, s->ram_sizes);
 
     /* External bus controller */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
@@ -1160,7 +1159,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 static Property ppc405_soc_properties[] = {
     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 5ec82fa8c2..409a8840da 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -211,7 +211,9 @@ static void bamboo_init(MachineState *machine)
     ppc4xx_sdram_init(env,
                       qdev_get_gpio_in(uicdev, 14),
                       PPC440EP_SDRAM_NR_BANKS, ram_memories,
-                      ram_bases, ram_sizes, 1);
+                      ram_bases, ram_sizes);
+    /* Enable SDRAM memory regions, this should be done by the firmware */
+    ppc4xx_sdram_enable(env);
 
     /* PCI */
     dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 1226ec4aa9..3475589679 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -350,8 +350,7 @@ static void sdram_reset(void *opaque)
 void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
                        MemoryRegion *ram_memories,
                        hwaddr *ram_bases,
-                       hwaddr *ram_sizes,
-                       int do_init)
+                       hwaddr *ram_sizes)
 {
     ppc4xx_sdram_t *sdram;
     int i;
@@ -369,9 +368,12 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
-    if (do_init) {
-        sdram_map_bcr(sdram);
-    }
+}
+
+void ppc4xx_sdram_enable(CPUPPCState *env)
+{
+    ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x20);
+    ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x80000000);
 }
 
 /*
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 2af0d60577..13b3229851 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -37,6 +37,8 @@ typedef struct {
     uint32_t bcr;
 } Ppc4xxSdramBank;
 
+void ppc4xx_sdram_enable(CPUPPCState *env);
+
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
                         hwaddr ram_bases[], hwaddr ram_sizes[],
@@ -45,8 +47,7 @@ void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
 void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
                         MemoryRegion ram_memories[],
                         hwaddr *ram_bases,
-                        hwaddr *ram_sizes,
-                        int do_init);
+                        hwaddr *ram_sizes);
 
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
-- 
2.37.3


