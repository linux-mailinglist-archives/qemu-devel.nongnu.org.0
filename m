Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF7604D0A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:20:28 +0200 (CEST)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBno-0004O3-Uw
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1olBXl-0006h1-Q2; Wed, 19 Oct 2022 12:03:58 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:60177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1olBX6-0001T5-Ls; Wed, 19 Oct 2022 12:03:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6F03374638A;
 Wed, 19 Oct 2022 18:03:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 780DF74632B; Wed, 19 Oct 2022 18:02:59 +0200 (CEST)
Message-Id: <04bb3445439c2f37b99e74b3fdf4e62c2e6f7e04.1666194485.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666194485.git.balaton@eik.bme.hu>
References: <cover.1666194485.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 8/8] ppc4xx_sdram: Add errp parameter to
 ppc4xx_sdram_banks()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Date: Wed, 19 Oct 2022 18:02:59 +0200 (CEST)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not exit from ppc4xx_sdram_banks() but report error via an errp
parameter instead.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/ppc4xx_sdram.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index 7c097efe20..8d7137faf3 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -52,10 +52,12 @@
  * must be one of a small set of sizes. The number of banks and the supported
  * sizes varies by SoC.
  */
-static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
+static bool ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                                Ppc4xxSdramBank ram_banks[],
-                               const ram_addr_t sdram_bank_sizes[])
+                               const ram_addr_t sdram_bank_sizes[],
+                               Error **errp)
 {
+    ERRP_GUARD();
     ram_addr_t size_left = memory_region_size(ram);
     ram_addr_t base = 0;
     ram_addr_t bank_size;
@@ -93,14 +95,16 @@ static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                                    sdram_bank_sizes[i] / MiB,
                                    sdram_bank_sizes[i + 1] ? ", " : "");
         }
-        error_report("at most %d bank%s of %s MiB each supported",
-                     nr_banks, nr_banks == 1 ? "" : "s", s->str);
-        error_printf("Possible valid RAM size: %" PRIi64 " MiB\n",
-            used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
+        error_setg(errp, "Invalid SDRAM banks");
+        error_append_hint(errp, "at most %d bank%s of %s MiB each supported\n",
+                          nr_banks, nr_banks == 1 ? "" : "s", s->str);
+        error_append_hint(errp, "Possible valid RAM size: %" PRIi64 " MiB\n",
+                  used_size ? used_size / MiB : sdram_bank_sizes[i - 1] / MiB);
 
         g_string_free(s, true);
-        exit(EXIT_FAILURE);
+        return false;
     }
+    return true;
 }
 
 static void sdram_bank_map(Ppc4xxSdramBank *bank)
@@ -399,7 +403,10 @@ static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Missing dram memory region");
         return;
     }
-    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
+    if (!ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank,
+                            valid_bank_sizes, errp)) {
+        return;
+    }
     for (i = 0; i < s->nbanks; i++) {
         if (s->bank[i].size) {
             s->bank[i].bcr = sdram_ddr_bcr(s->bank[i].base, s->bank[i].size);
@@ -666,7 +673,10 @@ static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Missing dram memory region");
         return;
     }
-    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
+    if (!ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank,
+                            valid_bank_sizes, errp)) {
+        return;
+    }
     for (i = 0; i < s->nbanks; i++) {
         if (s->bank[i].size) {
             s->bank[i].bcr = sdram_ddr2_bcr(s->bank[i].base, s->bank[i].size);
-- 
2.30.4


