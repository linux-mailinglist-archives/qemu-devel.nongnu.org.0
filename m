Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320E2578916
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:59:34 +0200 (CEST)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDV1p-00064H-9e
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSy-0008Uk-HQ; Mon, 18 Jul 2022 13:23:37 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:36849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSv-0001wL-Cn; Mon, 18 Jul 2022 13:23:31 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10bf634bc50so25537126fac.3; 
 Mon, 18 Jul 2022 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CVZsAAdtYcsgWFrSALuPq9KJRP+za2YV6sjUCR9hDVc=;
 b=fGLuLdzU9A7JdTaGuWrLhujRMw/D4WS5I2b8WmD/y4ARUMjCcZ9dQA3viNi56Way0w
 T+/PyjSntO8pNjjiwoCAtREnPphhQhnECV8I9q+XSEnPNlK8Zfx42TutB7UEIteHGpKP
 YU4YJkxq7eyXZPjTaJjbB+jTW2eN0ERA4mAtjjU63Rzj4gpqIhfOxMKhaoIt64JOXrGm
 cQJBgzdmPG6eCKQQzD2deAzJGMsm7OqMf/Hw1YUjoCvICIiibUebHbDVC5jZhb1iOBqF
 uuRoPfEOqsp4AbCWmRK1/7f1DaWWFkozMt+x4pkEgvfiAo5PwpCkVGCabQUT4LTRL3GU
 St+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CVZsAAdtYcsgWFrSALuPq9KJRP+za2YV6sjUCR9hDVc=;
 b=rz6p+9Hc5fri4prMT1EaEUIdrPEnlEx878TUfRfsNOcZ90syTyMTGmYoKnuqgo4dkv
 jAJAkCoA8zz4zstkoVMI1cS++qOd3pMeatXTwvljrCZXyrLq1EELy+k3DWQzhGRUt3IG
 xXsaPvfN2iZhSb7LDP7qf633BJmN9I0c9rxUnsKsLt0Tq/AEgRykZcAjMwao5YC/zDok
 7W5kaC2O/fqA6AUCUT92Hk0Ym0MDnAOlRxDsAnQz3NJbLrRrNvcvfMUXwss5lMw8VFiH
 zm9/vxCazATUbMi7WHFzeX33Rp8/lnPMnX0xL4ZFhx7IlPU6SmiAy4FCPRIEn2yEExmz
 pBhw==
X-Gm-Message-State: AJIora+XdJxOi/UKPpceYYZtO/tGU/kYk7Ttt8rIPPxG5I3sD6Vw2ZPh
 FCPMF1eZZCQaaCb0KW6auHY6ZcOd2+w=
X-Google-Smtp-Source: AGRyM1u+LBs0rW55JICThUiFCAb4D99bDakx7wiVkruW5NgKYQ22KqJbwrz1AW3gvDLig1aXvKZT6A==
X-Received: by 2002:a05:6870:e615:b0:100:bbc4:ac92 with SMTP id
 q21-20020a056870e61500b00100bbc4ac92mr17573156oag.211.1658165007987; 
 Mon, 18 Jul 2022 10:23:27 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 30/30] target/ppc: Check page dir/table base alignment
Date: Mon, 18 Jul 2022 14:22:08 -0300
Message-Id: <20220718172208.1247624-31-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

According to PowerISA 3.1B, Book III 6.7.6 programming note, the
page directory base addresses are expected to be aligned to their
size. Real hardware seems to rely on that and will access the
wrong address if they are misaligned. This results in a
translation failure even if the page tables seem to be properly
populated.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220628133959.15131-4-leandro.lupori@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/mmu-radix64.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 705bff76be..00f2e9fa2e 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -265,7 +265,7 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
                                   uint64_t *pte_addr, uint64_t *nls,
                                   int *psize, uint64_t *pte, int *fault_cause)
 {
-    uint64_t index, pde;
+    uint64_t index, mask, nlb, pde;
 
     /* Read page <directory/table> entry from guest address space */
     pde = ldq_phys(as, *pte_addr);
@@ -280,7 +280,17 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
         *nls = pde & R_PDE_NLS;
         index = eaddr >> (*psize - *nls);       /* Shift */
         index &= ((1UL << *nls) - 1);           /* Mask */
-        *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));
+        nlb = pde & R_PDE_NLB;
+        mask = MAKE_64BIT_MASK(0, *nls + 3);
+
+        if (nlb & mask) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: misaligned page dir/table base: 0x"TARGET_FMT_lx
+                " page dir size: 0x"TARGET_FMT_lx"\n",
+                __func__, nlb, mask + 1);
+            nlb &= ~mask;
+        }
+        *pte_addr = nlb + index * sizeof(pde);
     }
     return 0;
 }
@@ -294,8 +304,18 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
     int level = 0;
 
     index = eaddr >> (*psize - nls);    /* Shift */
-    index &= ((1UL << nls) - 1);       /* Mask */
-    *pte_addr = base_addr + (index * sizeof(pde));
+    index &= ((1UL << nls) - 1);        /* Mask */
+    mask = MAKE_64BIT_MASK(0, nls + 3);
+
+    if (base_addr & mask) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: misaligned page dir base: 0x"TARGET_FMT_lx
+            " page dir size: 0x"TARGET_FMT_lx"\n",
+            __func__, base_addr, mask + 1);
+        base_addr &= ~mask;
+    }
+    *pte_addr = base_addr + index * sizeof(pde);
+
     do {
         int ret;
 
-- 
2.36.1


