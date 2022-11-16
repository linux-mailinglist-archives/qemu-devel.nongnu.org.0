Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF79362C5E2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 18:06:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovLpJ-0003mZ-QD; Wed, 16 Nov 2022 12:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1ovLpC-0003jA-SM
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:03:51 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1ovLp9-0007OH-Dq
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:03:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1565561E11;
 Wed, 16 Nov 2022 17:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43822C433C1;
 Wed, 16 Nov 2022 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668618210;
 bh=0njxYQX6oTI0Ho0U6LXMXcTuakZnU6K2W8D0spjq1Ew=;
 h=From:To:Cc:Subject:Date:From;
 b=bT4iQ6bjyQq7W0yTn6OnuKk1Rl3OEgdTRpcp1DHCXEPf5NHEm8h0Ez6z234UcHffb
 byHJVRQUHZD7G/R0GzrlmKU7UzMjulAnTvaypbHIF/Lj2y6pCzm1CKdJodWMMsMgnE
 xNlaZlgRVMq+K7maAMBAwp5hSmrjqMpAUKtUHyEonUlIdz5jcxYWSrKwLAn+feBdt7
 5mtqlk2EJFba7s0727lldeEmg7XjS21UfpsPvg3WSURkQ+jV1gEoqkpnGAiB7+/Cnd
 eW5Oqn4gxEy7aOIJhSALkLdLRO/tKzPFodyWZLXfx2wAAHvIXN2EMDbLBgyvqzCkjP
 Vsc2fwkGd2a9Q==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-devel@nongnu.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Limit LPA2 effective output address when TCR.DS
 == 0
Date: Wed, 16 Nov 2022 18:03:16 +0100
Message-Id: <20221116170316.259695-1-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ardb@kernel.org; helo=dfw.source.kernel.org
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

With LPA2, the effective output address size is at most 48 bits when
TCR.DS == 0. This case is currently unhandled in the page table walker,
where we happily assume LVA/64k granule when outputsize > 48 and
param.ds == 0, resulting in the wrong conversion to be used from a
page table descriptor to a physical address.

    if (outputsize > 48) {
        if (param.ds) {
            descaddr |= extract64(descriptor, 8, 2) << 50;
        } else {
            descaddr |= extract64(descriptor, 12, 4) << 48;
        }

So cap the outputsize to 48 when TCR.DS is cleared, as per the
architecture.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 target/arm/ptw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3745ac9723474332..9a6277d862fac229 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1222,6 +1222,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         ps = MIN(ps, param.ps);
         assert(ps < ARRAY_SIZE(pamax_map));
         outputsize = pamax_map[ps];
+
+        /*
+         * With LPA2, the effective output address (OA) size is at most 48 bits
+         * unless TCR.DS == 1
+         */
+        if (!param.ds && param.gran != Gran64K) {
+            outputsize = MIN(outputsize, 48);
+        }
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
-- 
2.35.1


