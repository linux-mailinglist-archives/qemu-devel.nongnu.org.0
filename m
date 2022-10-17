Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1926017CF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:38:31 +0200 (CEST)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVwQ-00086l-Tz
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVf5-0001rz-43; Mon, 17 Oct 2022 15:20:33 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVf2-0002m4-Di; Mon, 17 Oct 2022 15:20:30 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-132b8f6f1b2so14353945fac.11; 
 Mon, 17 Oct 2022 12:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z4z/7w0u2RzMHLlCWRbg3vhnghoeagJa/cuTWFZXPzo=;
 b=cI2mBeHQK/NOzH3K9JMe/qdCgLoPQnJZu2k2pzkAO3P/uL9yeWFZmeaMd6F90W1lEk
 itzu0bx4M+RSEnTCN3/xCOSw+Ad7nSvNhvmKbJ+WhFAvt7pwjBc0Nr9WtpvA/ACVFKNF
 syH8jNGrU0kJzMfFNuEmp1rwrQzP19RW7vwAIyTKN69fwbj7vaD7ctLNqzISTpU8c1lJ
 ssNcmDZ5UWX9jN86VTsqSgf2FfOdAcHXEG3XQB3Apmc0yPBz1NeEo9ZMSFm5HzErJvUa
 SJsNjb87xFD6lxDlyscDWDI8qBiKM+fyenm5pxAsaEo4LiW/n7jIMeEfy4v8J7sNSolV
 lBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4z/7w0u2RzMHLlCWRbg3vhnghoeagJa/cuTWFZXPzo=;
 b=vHV+TvW2J2yVO5YFhOa+9p2SpBzA+oApsdxGmaGRbglc93cDAF/OFZXI21PhQhKdd0
 0N8Km5+Zkak7n6gKFR77bTDb0VMZ06waVwZMsOKA4qiMTwXFrQ1yb3Z5vtIP3RE+PZmw
 /fiNxj9VeYHeTG5X1ecyg5VM1g1OcjJGmuHlnsmgz90kDZDx1qXUpHlYDb/0dlnochOz
 nEIdcZNMFbuTdkOh+8rqmOcn/7JRF4dm9llWcTk0KLCmo8eBKIy0UUruA4HvWD/WyRfv
 CmO3TuibqXuDfq+vdYDE7i39eyMOHkHJMn+nwQo0NLd/dTCR0lZ2eLgkECbA/+/zCEHE
 //0Q==
X-Gm-Message-State: ACrzQf1AoMXwlaRgGTc5qSBHEWgjg4AV5y4ifvJ0z6qYbqihGra1RNfk
 UNLOJAlCAtNWT7OExdYsXw9xVSQNLUA=
X-Google-Smtp-Source: AMsMyM5AA3af0bmFjx58VsbvBxQ6Z3RaP+bxM12KbFPr7YFNoxNHdUxgskjFvYvRKeBkFIrCssaDKQ==
X-Received: by 2002:a05:6870:9125:b0:132:4cc:eb79 with SMTP id
 o37-20020a056870912500b0013204cceb79mr16858673oae.79.1666034426434; 
 Mon, 17 Oct 2022 12:20:26 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 04/38] ppc4xx: Introduce Ppc4xxSdramBank struct
Date: Mon, 17 Oct 2022 16:19:35 -0300
Message-Id: <20221017192009.92404-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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

Instead of storing sdram bank parameters in unrelated arrays put them
in a struct so it's clear they belong to the same bank and simplify
the state struct using this bank type.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <5eb82d0424c584b2b9e6f7bc51560f8189ed21bb.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_uc.c      | 49 +++++++++++++++++-----------------
 hw/ppc/ppc4xx_devs.c    | 59 ++++++++++++++++++++---------------------
 include/hw/ppc/ppc4xx.h |  8 ++++++
 3 files changed, 61 insertions(+), 55 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 53e981ddf4..db33334e29 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -16,7 +16,7 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "exec/memory.h"
-#include "hw/ppc/ppc.h"
+#include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci.h"
 #include "sysemu/block-backend.h"
@@ -485,11 +485,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
 typedef struct ppc440_sdram_t {
     uint32_t addr;
     int nbanks;
-    MemoryRegion containers[4]; /* used for clipping */
-    MemoryRegion *ram_memories;
-    hwaddr ram_bases[4];
-    hwaddr ram_sizes[4];
-    uint32_t bcr[4];
+    Ppc4xxSdramBank bank[4];
 } ppc440_sdram_t;
 
 enum {
@@ -570,23 +566,23 @@ static uint64_t sdram_size(uint32_t bcr)
 static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
                           uint32_t bcr, int enabled)
 {
-    if (sdram->bcr[i] & 1) {
+    if (sdram->bank[i].bcr & 1) {
         /* First unmap RAM if enabled */
         memory_region_del_subregion(get_system_memory(),
-                                    &sdram->containers[i]);
-        memory_region_del_subregion(&sdram->containers[i],
-                                    &sdram->ram_memories[i]);
-        object_unparent(OBJECT(&sdram->containers[i]));
+                                    &sdram->bank[i].container);
+        memory_region_del_subregion(&sdram->bank[i].container,
+                                    &sdram->bank[i].ram);
+        object_unparent(OBJECT(&sdram->bank[i].container));
     }
-    sdram->bcr[i] = bcr & 0xffe0ffc1;
+    sdram->bank[i].bcr = bcr & 0xffe0ffc1;
     if (enabled && (bcr & 1)) {
-        memory_region_init(&sdram->containers[i], NULL, "sdram-containers",
+        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
                            sdram_size(bcr));
-        memory_region_add_subregion(&sdram->containers[i], 0,
-                                    &sdram->ram_memories[i]);
+        memory_region_add_subregion(&sdram->bank[i].container, 0,
+                                    &sdram->bank[i].ram);
         memory_region_add_subregion(get_system_memory(),
                                     sdram_base(bcr),
-                                    &sdram->containers[i]);
+                                    &sdram->bank[i].container);
     }
 }
 
@@ -595,9 +591,9 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->ram_sizes[i] != 0) {
-            sdram_set_bcr(sdram, i, sdram_bcr(sdram->ram_bases[i],
-                                              sdram->ram_sizes[i]), 1);
+        if (sdram->bank[i].size != 0) {
+            sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
+                                              sdram->bank[i].size), 1);
         } else {
             sdram_set_bcr(sdram, i, 0, 0);
         }
@@ -614,9 +610,9 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
     case SDRAM_R1BAS:
     case SDRAM_R2BAS:
     case SDRAM_R3BAS:
-        if (sdram->ram_sizes[dcrn - SDRAM_R0BAS]) {
-            ret = sdram_bcr(sdram->ram_bases[dcrn - SDRAM_R0BAS],
-                            sdram->ram_sizes[dcrn - SDRAM_R0BAS]);
+        if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
+            ret = sdram_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
+                            sdram->bank[dcrn - SDRAM_R0BAS].size);
         }
         break;
     case SDRAM_CONF1HB:
@@ -701,12 +697,15 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                        int do_init)
 {
     ppc440_sdram_t *sdram;
+    int i;
 
     sdram = g_malloc0(sizeof(*sdram));
     sdram->nbanks = nbanks;
-    sdram->ram_memories = ram_memories;
-    memcpy(sdram->ram_bases, ram_bases, nbanks * sizeof(hwaddr));
-    memcpy(sdram->ram_sizes, ram_sizes, nbanks * sizeof(hwaddr));
+    for (i = 0; i < nbanks; i++) {
+        sdram->bank[i].ram = ram_memories[i];
+        sdram->bank[i].base = ram_bases[i];
+        sdram->bank[i].size = ram_sizes[i];
+    }
     qemu_register_reset(&sdram_reset, sdram);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index b4cd10f735..1226ec4aa9 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -42,10 +42,7 @@ typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
 struct ppc4xx_sdram_t {
     uint32_t addr;
     int nbanks;
-    MemoryRegion containers[4]; /* used for clipping */
-    MemoryRegion *ram_memories;
-    hwaddr ram_bases[4];
-    hwaddr ram_sizes[4];
+    Ppc4xxSdramBank bank[4];
     uint32_t besr0;
     uint32_t besr1;
     uint32_t bear;
@@ -53,7 +50,6 @@ struct ppc4xx_sdram_t {
     uint32_t status;
     uint32_t rtr;
     uint32_t pmit;
-    uint32_t bcr[4];
     uint32_t tr;
     uint32_t ecccfg;
     uint32_t eccesr;
@@ -131,26 +127,26 @@ static target_ulong sdram_size(uint32_t bcr)
 static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
                           uint32_t bcr, int enabled)
 {
-    if (sdram->bcr[i] & 0x00000001) {
+    if (sdram->bank[i].bcr & 0x00000001) {
         /* Unmap RAM */
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bcr[i]),
-                                 sdram_size(sdram->bcr[i]));
+        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
+                                 sdram_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
-                                    &sdram->containers[i]);
-        memory_region_del_subregion(&sdram->containers[i],
-                                    &sdram->ram_memories[i]);
-        object_unparent(OBJECT(&sdram->containers[i]));
+                                    &sdram->bank[i].container);
+        memory_region_del_subregion(&sdram->bank[i].container,
+                                    &sdram->bank[i].ram);
+        object_unparent(OBJECT(&sdram->bank[i].container));
     }
-    sdram->bcr[i] = bcr & 0xFFDEE001;
+    sdram->bank[i].bcr = bcr & 0xFFDEE001;
     if (enabled && (bcr & 0x00000001)) {
         trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
-        memory_region_init(&sdram->containers[i], NULL, "sdram-containers",
+        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
                            sdram_size(bcr));
-        memory_region_add_subregion(&sdram->containers[i], 0,
-                                    &sdram->ram_memories[i]);
+        memory_region_add_subregion(&sdram->bank[i].container, 0,
+                                    &sdram->bank[i].ram);
         memory_region_add_subregion(get_system_memory(),
                                     sdram_base(bcr),
-                                    &sdram->containers[i]);
+                                    &sdram->bank[i].container);
     }
 }
 
@@ -159,9 +155,9 @@ static void sdram_map_bcr(ppc4xx_sdram_t *sdram)
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->ram_sizes[i] != 0) {
-            sdram_set_bcr(sdram, i, sdram_bcr(sdram->ram_bases[i],
-                                              sdram->ram_sizes[i]), 1);
+        if (sdram->bank[i].size != 0) {
+            sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
+                                              sdram->bank[i].size), 1);
         } else {
             sdram_set_bcr(sdram, i, 0x00000000, 0);
         }
@@ -173,10 +169,10 @@ static void sdram_unmap_bcr(ppc4xx_sdram_t *sdram)
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bcr[i]),
-                                 sdram_size(sdram->bcr[i]));
+        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
+                                 sdram_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
-                                    &sdram->ram_memories[i]);
+                                    &sdram->bank[i].ram);
     }
 }
 
@@ -214,16 +210,16 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
             ret = sdram->pmit;
             break;
         case 0x40: /* SDRAM_B0CR */
-            ret = sdram->bcr[0];
+            ret = sdram->bank[0].bcr;
             break;
         case 0x44: /* SDRAM_B1CR */
-            ret = sdram->bcr[1];
+            ret = sdram->bank[1].bcr;
             break;
         case 0x48: /* SDRAM_B2CR */
-            ret = sdram->bcr[2];
+            ret = sdram->bank[2].bcr;
             break;
         case 0x4C: /* SDRAM_B3CR */
-            ret = sdram->bcr[3];
+            ret = sdram->bank[3].bcr;
             break;
         case 0x80: /* SDRAM_TR */
             ret = -1; /* ? */
@@ -358,13 +354,16 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
                        int do_init)
 {
     ppc4xx_sdram_t *sdram;
+    int i;
 
     sdram = g_new0(ppc4xx_sdram_t, 1);
     sdram->irq = irq;
     sdram->nbanks = nbanks;
-    sdram->ram_memories = ram_memories;
-    memcpy(sdram->ram_bases, ram_bases, nbanks * sizeof(hwaddr));
-    memcpy(sdram->ram_sizes, ram_sizes, nbanks * sizeof(hwaddr));
+    for (i = 0; i < nbanks; i++) {
+        sdram->bank[i].ram = ram_memories[i];
+        sdram->bank[i].base = ram_bases[i];
+        sdram->bank[i].size = ram_sizes[i];
+    }
     qemu_register_reset(&sdram_reset, sdram);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index a1781afa8e..2af0d60577 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -29,6 +29,14 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
+typedef struct {
+    MemoryRegion ram;
+    MemoryRegion container; /* used for clipping */
+    hwaddr base;
+    hwaddr size;
+    uint32_t bcr;
+} Ppc4xxSdramBank;
+
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
                         hwaddr ram_bases[], hwaddr ram_sizes[],
-- 
2.37.3


