Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC766340A6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:57:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxVcm-0005Eq-3D; Tue, 22 Nov 2022 10:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oxVcj-0005EC-CM
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:55:49 -0500
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oxVcg-0003g3-I3
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:55:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8B233CE1D9E;
 Tue, 22 Nov 2022 15:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C45CC433C1;
 Tue, 22 Nov 2022 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669132524;
 bh=m0TbgjO2mIWXpTanHLlJH1+FujY30t/uZdqsk1qTqjI=;
 h=From:To:Cc:Subject:Date:From;
 b=c1t+RrGmI03de7B69ll2Pbwq7dUaWPcJMjzWCo3/OUMlbWvJZrWqkjkWKs3y8k82+
 xXem+EMDxJ25WQhKqgJZz+vEPf8rg+37tpAqqewMtDnV9piF+U5YL+7WN8VPdCNgGu
 VcifOFoNogsgn/3d43GP2leRxi3Br6gDjN1qSqD3JG//NrDghV9FAZkrSj8i9Kkc4M
 /B2Go5JLnbx0EVw2B5dmrsxIhQvYaubXvgMc+xpjn2QAKtg0jHbaMAE/rvh4ib4IrY
 Dd2DEFuZk+zUbFhd40IDTIuaqJHV64ddmZnUBAOqfnAZI2gpylTj1zvtzLE6qDYh5D
 opRoocFqBlwSQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-devel@nongnu.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] target/arm: Use signed quantity to represent VMSAv8-64
 translation level
Date: Tue, 22 Nov 2022 16:55:15 +0100
Message-Id: <20221122155515.2426188-1-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=ardb@kernel.org; helo=sin.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

The LPA2 extension implements 52-bit virtual addressing for 4k and 16k
translation granules, and for the former, this means an additional level
of translation is needed. This means we start counting at -1 instead of
0 when doing a walk, and so 'level' is now a signed quantity, and should
be typed as such. So turn it from uint32_t into int32_t.

This avoids a level of -1 getting misinterpreted as being >= 3, and
terminating a page table walk prematurely with a bogus output address.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9a6277d862fac229..1d9bb4448761ddf4 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1172,7 +1172,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     bool is_secure = ptw->in_secure;
-    uint32_t level;
+    int32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
     hwaddr descaddr, indexmask, indexmask_grainsize;
@@ -1302,7 +1302,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          */
         uint32_t sl0 = extract32(tcr, 6, 2);
         uint32_t sl2 = extract64(tcr, 33, 1);
-        uint32_t startlevel;
+        int32_t startlevel;
         bool ok;
 
         /* SL2 is RES0 unless DS=1 & 4kb granule. */
-- 
2.35.1


