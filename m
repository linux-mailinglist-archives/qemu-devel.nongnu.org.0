Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5E05B79FD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 20:47:33 +0200 (CEST)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYAwW-0003YJ-8g
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 14:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYAZ3-0006TM-1D; Tue, 13 Sep 2022 14:23:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:15216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYAZ0-0007dD-9q; Tue, 13 Sep 2022 14:23:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3E699747DF7;
 Tue, 13 Sep 2022 20:23:10 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1A253747644; Tue, 13 Sep 2022 20:23:10 +0200 (CEST)
Message-Id: <4229345309c2320430c0649be5b02c8194d207f6.1663092335.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663092335.git.balaton@eik.bme.hu>
References: <cover.1663092335.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 09/18] ppc440_sdram: Split off map/unmap of sdram banks for
 later reuse
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Sep 2022 20:23:10 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
---
 hw/ppc/ppc440_uc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 5db59d1190..01184e717b 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -561,26 +561,33 @@ static uint64_t sdram_size(uint32_t bcr)
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
+        sdram_bank_unmap(&sdram->bank[i]);
     }
     sdram->bank[i].bcr = bcr & 0xffe0ffc1;
+    sdram->bank[i].base = sdram_base(bcr);
+    sdram->bank[i].size = sdram_size(bcr);
     if (enabled && (bcr & 1)) {
-        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
-                           sdram_size(bcr));
-        memory_region_add_subregion(&sdram->bank[i].container, 0,
-                                    &sdram->bank[i].ram);
-        memory_region_add_subregion(get_system_memory(),
-                                    sdram_base(bcr),
-                                    &sdram->bank[i].container);
+        sdram_bank_map(&sdram->bank[i]);
     }
 }
 
-- 
2.30.4


