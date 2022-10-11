Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB15FAB5E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:45:34 +0200 (CEST)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi6Cz-0001lR-HD
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oF-0002yw-GR
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:59 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oD-00032t-Tv
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:59 -0400
Received: by mail-pf1-x429.google.com with SMTP id f140so12378175pfa.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLLkCOK7bzChQB4VCn3LE0QgfibyZ4Lat7LyMKKGuQg=;
 b=bsWsWIg+qvdmH6FWPNsiw35tXhii6WawZXObtX4Y9u38J9yJqYVoYz+gzgdc4uiOX3
 lYkmgMIV+ah86H0FDuqZA0NraW+B1ZlBYNsyC5BuFpUzG9d+hyr4ok3VQViczYeyoSpA
 lVoApaw6T7Uwsa0AnkItZ191LCNsr17FgFZ4FU/KI4mBMwv+ndU7DfGd+oK/6uBje8/G
 YGu9jZR5g38NPfnMey+xBXk35EqBpZ7jASQgI1Op8iLfekFghhXklDurGbnNbptbKAIg
 GMXzsbNG9X4HJkkQ3tZPlVB7GgUx2Xq3vIIeVggl2r39xMnINnqfRuht46ADS5MDDKgo
 nsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLLkCOK7bzChQB4VCn3LE0QgfibyZ4Lat7LyMKKGuQg=;
 b=IftsFbX/GmL95Oful3yIYWnWLmwU39uhQnGgcwFf8ccK0LZoSLyBtgyp+XfOEOxcfB
 n0Kku67HU4ovYnHibd2/T/BwEJGysNRuKVgN7zm5MCfzL+4nH7gwYY83F++05y377Zjm
 YzEG4AI3Apu1LXHbtjrKTE46aluqMThG9a8X8PddHdZuXTdZN2pQn7sQu4Qc135PSFgp
 Xx0/O/nRUZ7o9OieXhrGUHXxvakHXZLE9lRljvH6folLpZOvEz9tE7vQfQVb0hysZsCN
 JjY3tymvljWo+92cYJga1b5DVS55YrXLtVBcRq7Zgj/uia0xdDLkcWf2U5Pqqpl/0gOm
 bHkg==
X-Gm-Message-State: ACrzQf3byFFt88Y11TOZvEuQpu6ySYLUXtKuQUA6vONcU2MR9vV6qfnN
 EMCc6rKC1ddVAlkBQ/lp6srC16UnlT3biQ==
X-Google-Smtp-Source: AMsMyM4t+28jGrmnxXAwzV0AHc7KA5ge1GZPj63ykKWzwTEAHaFYha/htaPQN3vedTykIiTvON/Jlw==
X-Received: by 2002:a62:144b:0:b0:562:38de:9a0e with SMTP id
 72-20020a62144b000000b0056238de9a0emr22981955pfu.78.1665458397156; 
 Mon, 10 Oct 2022 20:19:57 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 21/24] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Mon, 10 Oct 2022 20:19:08 -0700
Message-Id: <20221011031911.2408754-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2227d2a2fd..8db635ca98 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1079,7 +1079,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     uint64_t descriptor;
     bool nstable;
 
@@ -1338,7 +1337,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1346,7 +1345,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1399,7 +1397,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-- 
2.34.1


