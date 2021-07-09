Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC73C1EF8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:35:27 +0200 (CEST)
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jAc-0002ym-OX
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1ith-00016T-6S; Fri, 09 Jul 2021 01:17:57 -0400
Received: from ozlabs.org ([203.11.71.1]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itf-0001yf-AN; Fri, 09 Jul 2021 01:17:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd5Ltxz9ssD; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=/MjHtqGSB4Q/DmQu+dP0YOXEQ18HZGJxu+t5gCrxzks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ivJNesiNisrwDEuDwm0jc9PmO7a8gmnDWHPiOLUmKPjzr6qttptiBlNJWI2qBeYGx
 M5UGlXa0wLE7GHXiOCVIYU/4tqlcwGdShw4I82Xhl9feajQjgH99dDYDVNEbC1+JHk
 kMxoDLf1yXC1adFidtMtGoluu3Qpzh4tiRKyxs7s=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 13/33] target/ppc: Fix compilation with DUMP_PAGE_TABLES debug
 option
Date: Fri,  9 Jul 2021 15:17:08 +1000
Message-Id: <20210709051728.170203-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aik@ozlabs.ru, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

../target/ppc/mmu_helper.c: In function 'get_segment_6xx_tlb':
../target/ppc/mmu_helper.c:514:46: error: passing argument 1 of
'ppc_hash32_hpt_mask' from incompatible pointer type [-Werror=incompatible-pointer-types]

  514 |                          ppc_hash32_hpt_mask(env) + 0x80);
      |                                              ^~~
      |                                              |
      |                                              CPUPPCState *

Fixes: 36778660d7 ("target/ppc: Eliminate htab_base and htab_mask variables")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210702215235.1941771-2-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index ba1952c77d..4c534b534b 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -511,7 +511,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
 
                 qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
                          "\n", ppc_hash32_hpt_base(cpu),
-                         ppc_hash32_hpt_mask(env) + 0x80);
+                         ppc_hash32_hpt_mask(cpu) + 0x80);
                 for (curaddr = ppc_hash32_hpt_base(cpu);
                      curaddr < (ppc_hash32_hpt_base(cpu)
                                 + ppc_hash32_hpt_mask(cpu) + 0x80);
-- 
2.31.1


