Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD4574F29
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:30:42 +0200 (CEST)
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByvR-0000Ct-2i
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoA-0002BZ-OE
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByo9-0004oK-5b
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id r14so2575997wrg.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7fzrSUgKfikFHeNFkh9/TCh+g92276JL8XDKKltgm70=;
 b=fkbNBOPc7mP/VK9xdZU8F3BO+d1w6JTnZoYVjmgahER7FgebSBBX/wMsiJ0VyK5g/u
 aJ4F8HdZ7jFPW73PMRb0TvzCC+pWSDlFf1C10itfaFs3xtvLP86W6Wtzhr9NbBo4cvLt
 vpGAf/NFYyopFed7HEdFG/kxQq++MbtHN3GjvCNYEmzfy7An7ApyRySuy5sFZxtaZER5
 Cn9eDOjPU/ilgI6gfvFWC6BVnxOa3k8dru77KNHjui8KW/O7ZUL5EBbLEbUcQaJHk8wp
 5GwDz6+AbDxdV9j5xlDc3HE47aS2m1XHns/Crwvr3EEDFBrJ918X84Cxci63fjed9L7A
 g9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7fzrSUgKfikFHeNFkh9/TCh+g92276JL8XDKKltgm70=;
 b=1gzWz876dlxGM7tVq4GzJ+QEn2jvsOGgmKFDSy16+X3u53PH5UKNk85WggW3T5NYXv
 DpCt4X+7BmjQrsAwK2cIKUK2iWTolyyLZdambbu7Z0+tyCKaj0STyV4cT21aOkwMs2Ml
 ZIeCJVWUnaZ133AOAt+Sx4R86owtQKOjDD05E1czETdFausuXupb4ktjGeX/yTD+aGJn
 aj8/2yHVXV34SreametQeuh8KwJpmFIkLIo/N7J/U3wLRUnspIARu7dxiWG/ebntvHLw
 334molgwl7m3hF5N2MskXrEa5bGF16dDpA5DiZwdxjhiO4afyrtFbSKFNhOVEE6yytoa
 kfMA==
X-Gm-Message-State: AJIora8svNBTLjdgExys8xx+Zx+MZdfBtpULKdBbScCfuooKdmnRw8tj
 v62Y7pfrGc2q9xVgfvsH/75oAkRcC1mFDg==
X-Google-Smtp-Source: AGRyM1vIWM5uQL+qwRzMmzF7OqpsJHg9Rf+/FcAaxio2QeGVrRN3EQfm22zyVq1it3MO/FFo37H9aw==
X-Received: by 2002:a05:6000:885:b0:21b:a423:172c with SMTP id
 ca5-20020a056000088500b0021ba423172cmr8323973wrb.98.1657804987582; 
 Thu, 14 Jul 2022 06:23:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b0039c5cecf206sm1925079wmi.4.2022.07.14.06.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:23:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 2/7] target/arm: Calculate mask/base_mask in
 get_level1_table_address()
Date: Thu, 14 Jul 2022 14:22:58 +0100
Message-Id: <20220714132303.1287193-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714132303.1287193-1-peter.maydell@linaro.org>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In get_level1_table_address(), instead of using precalculated values
of mask and base_mask from the TCR struct, calculate them directly
(in the same way we currently do in vmsa_ttbcr_raw_write() to
populate the TCR struct fields).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0d7e8ffa41b..16226d14233 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -315,20 +315,24 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                                      uint32_t *table, uint32_t address)
 {
     /* Note that we can only get here for an AArch32 PL0/PL1 lookup */
-    TCR *tcr = regime_tcr(env, mmu_idx);
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
+    int maskshift = extract32(tcr, 0, 3);
+    uint32_t mask = ~(((uint32_t)0xffffffffu) >> maskshift);
+    uint32_t base_mask;
 
-    if (address & tcr->mask) {
-        if (tcr->raw_tcr & TTBCR_PD1) {
+    if (address & mask) {
+        if (tcr & TTBCR_PD1) {
             /* Translation table walk disabled for TTBR1 */
             return false;
         }
         *table = regime_ttbr(env, mmu_idx, 1) & 0xffffc000;
     } else {
-        if (tcr->raw_tcr & TTBCR_PD0) {
+        if (tcr & TTBCR_PD0) {
             /* Translation table walk disabled for TTBR0 */
             return false;
         }
-        *table = regime_ttbr(env, mmu_idx, 0) & tcr->base_mask;
+        base_mask = ~((uint32_t)0x3fffu >> maskshift);
+        *table = regime_ttbr(env, mmu_idx, 0) & base_mask;
     }
     *table |= (address >> 18) & 0x3ffc;
     return true;
-- 
2.25.1


