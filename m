Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD057857E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:33:20 +0200 (CEST)
Received: from localhost ([::1]:54126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRoF-00088I-Sq
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHb-00027g-TL
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHW-0003AV-2I
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:34 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso7397796wms.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xMitL12ZlGpIhoJpUfgkcxUiDFlIMjfw25ZQQiFUOWg=;
 b=xWSUP0WISETDYST6Q8ZHYGhYUmF4hsbrNNWwQ5ndmeULWOKWINiv6JeLpmGZjpRrm7
 nlAtvNMkslhryVzMh7Gn6fPJNUKrm3Sm3ZJjLzBGTjUbqunENdGK7Y3jpotiC90MtJNZ
 nZel2ENtxfnq2FX5NhHOIHvUuCFIVCBbcr/lyIgWu1GiTi69Gi60aZI3MsoemIWYUAa7
 92wLJUAErb9mVi5JoYjFrp8aWqu14aNo5OBhJnd2nfmXmLzfkpJUEwpu2dfzq26LFbih
 fjGFE/hxkM1Oq9cEGupbf3aJ3etlnT4D6Fq1DJfMzebvAOAyCvulZbdpe30osK7yYQm9
 FxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xMitL12ZlGpIhoJpUfgkcxUiDFlIMjfw25ZQQiFUOWg=;
 b=YGEl2eThsHgw9sKroicOH0Dg6u3qiVbt5QnnHsn8XYgvXna8eRaakeAbRLQKlFBgZl
 lceCA64GeZ4rfnwP5qbcPZUWqy23tR2qpcVnwv7DofxiGGvWpK7c+gYjTk9+uNt00Wsh
 fPKsMOvJdBuIqY4YSH19rbRP7kAxZcHpgiyb1VlzTC6QusYJNQy4MMky31H6cd2PQXR4
 F5ulhLV+2fqjEbnr7nQFjb2Fw0GXkvax3D3vYVGn7b7sM5xAbku8WHgUZAUxb9U37RwX
 lQHMrbGqzFhRZYYqijCH4UVG5Gkti39b+gjwuOh3oh/KqgvzmG3DEHgrXrxYisiu2ez0
 57qw==
X-Gm-Message-State: AJIora/c+3yZ7P4sVJ3AbG6kLH+4uZxf2ZFN4ogG4xBAGZBHva/8zFKD
 ltAH3hAbvG0iAkBkqPMo2YGJuhDnj7SK4Q==
X-Google-Smtp-Source: AGRyM1uGDiBrDHD5B7fwP1qXgmcv7wL7SVLpBI5waHunayzaXOP5MVYBlHFlsCNqrHh29ARjY/Y/PQ==
X-Received: by 2002:a05:600c:3b1d:b0:3a3:1fda:efcf with SMTP id
 m29-20020a05600c3b1d00b003a31fdaefcfmr1811505wms.49.1658152768376; 
 Mon, 18 Jul 2022 06:59:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] target/arm: Calculate mask/base_mask in
 get_level1_table_address()
Date: Mon, 18 Jul 2022 14:59:11 +0100
Message-Id: <20220718135920.13667-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

In get_level1_table_address(), instead of using precalculated values
of mask and base_mask from the TCR struct, calculate them directly
(in the same way we currently do in vmsa_ttbcr_raw_write() to
populate the TCR struct fields).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220714132303.1287193-3-peter.maydell@linaro.org
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


