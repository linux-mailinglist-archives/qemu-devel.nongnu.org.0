Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857475E8CBB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 14:54:20 +0200 (CEST)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc4fj-00061S-Ke
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 08:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4GQ-0008Rl-2H; Sat, 24 Sep 2022 08:28:11 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:62693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4GM-0001CD-3U; Sat, 24 Sep 2022 08:28:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C4A4075A16D;
 Sat, 24 Sep 2022 14:27:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A359E75A16C; Sat, 24 Sep 2022 14:27:58 +0200 (CEST)
Message-Id: <23560b6a71682d513f3dd8e9ed3852f51d5eb309.1664021647.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664021647.git.balaton@eik.bme.hu>
References: <cover.1664021647.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 09/25] ppc440_sdram: Split off map/unmap of sdram banks for
 later reuse
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Sep 2022 14:27:58 +0200 (CEST)
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/ppc440_uc.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 8eae4ad9f0..900b7ab998 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -23,6 +23,7 @@
 #include "sysemu/reset.h"
 #include "ppc440.h"
 #include "qom/object.h"
+#include "trace.h"
 
 /*****************************************************************************/
 /* L2 Cache as SRAM */
@@ -563,26 +564,34 @@ static uint64_t sdram_size(uint32_t bcr)
     return size;
 }
 
+static void sdram_bank_map(Ppc4xxSdramBank *bank)
+{
+    memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
+    memory_region_add_subregion(&bank->container, 0, &bank->ram);
+    memory_region_add_subregion(get_system_memory(), bank->base,
+                                &bank->container);
+}
+
+static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
+{
+    memory_region_del_subregion(get_system_memory(), &bank->container);
+    memory_region_del_subregion(&bank->container, &bank->ram);
+    object_unparent(OBJECT(&bank->container));
+}
+
 static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
                           uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
         /* First unmap RAM if enabled */
-        memory_region_del_subregion(get_system_memory(),
-                                    &sdram->bank[i].container);
-        memory_region_del_subregion(&sdram->bank[i].container,
-                                    &sdram->bank[i].ram);
-        object_unparent(OBJECT(&sdram->bank[i].container));
+        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
+                                 sdram_size(sdram->bank[i].bcr));
+        sdram_bank_unmap(&sdram->bank[i]);
     }
     sdram->bank[i].bcr = bcr & 0xffe0ffc1;
     if (enabled && (bcr & 1)) {
-        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
-                           sdram_size(bcr));
-        memory_region_add_subregion(&sdram->bank[i].container, 0,
-                                    &sdram->bank[i].ram);
-        memory_region_add_subregion(get_system_memory(),
-                                    sdram_base(bcr),
-                                    &sdram->bank[i].container);
+        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
+        sdram_bank_map(&sdram->bank[i]);
     }
 }
 
-- 
2.30.4


