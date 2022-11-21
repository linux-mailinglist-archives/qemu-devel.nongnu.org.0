Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2533C632B56
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 18:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxApl-0004nO-DS; Mon, 21 Nov 2022 12:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oxApi-0004n7-Hp
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 12:43:50 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oxApg-0007pR-Si
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 12:43:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7BED61375;
 Mon, 21 Nov 2022 17:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AA1C433D6;
 Mon, 21 Nov 2022 17:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669052619;
 bh=/cTDRvEbjsT+vaGgddOYbYT0S96NF0MFiV4tk8uATsI=;
 h=From:To:Cc:Subject:Date:From;
 b=E+8tRVgEerLteq1VqONVzrBFOoLA9to2M6W/5KjDA9CdRcvUZKErbxqjb+ZOcTwNA
 +nZrDB1Jqzo4kwzFFHkpxCRFh3He1liPSixLTuNcY6+8KIgyCNyg3owjGinmRwiegV
 uaoc4CjWp+5Vf+ODKiu1EJ7XoHxn+abNTLk3FoKuHEM2Fc8fCGgmaRP5B4YtU9MFAe
 3heyT22zOCjyS2X2rXCp/w9nVnq5qHcQTd/P89Z2kSXC/n03AdHvBPrYmHMfKIQTU0
 A7a7O+5leiW/q530SOLIZaboRT5ldu/sYBzUEC0LkSYc4t0u2LAJ/Uvcr1Ev8Pf2T7
 +UPzRssO+NOPQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-devel@nongnu.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Use signed quantity to represent VMSAv8-64
 translation level
Date: Mon, 21 Nov 2022 18:43:26 +0100
Message-Id: <20221121174326.68520-1-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
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

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3745ac9723..6d6992580a 100644
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
-- 
2.35.1


