Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82782544803
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:52:59 +0200 (CEST)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEqY-00050l-Hz
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7H-0001YQ-Mc
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE78-0005y0-UB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:08 -0400
Received: by mail-wr1-x435.google.com with SMTP id a15so22952820wrh.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O5ejk88Q4maSJEwIoy6uu9RtbcDZwf0hyA9JefrZq5A=;
 b=P5T+JMDEt812vzh29gjMGZgKP5V6fbpIGzbDbJ3CGwk2h2aag7FJtFQBVJhIDOoSPs
 kX/ovRFgvMndp/XMIf9msmRtL11sQhXv3EKD+HqWrwxXrE9WlSZaRig9uxDfDWnfjaUY
 f3RCWg0Y3ri8BFUUINucz9Ejtr7NKugxAEn6vFiOiB1wp0yY6impFIAIq9h+/vOEjY4R
 AizkBkhG8GoWVTw2H+u603/cUMWgFL8qwUgZzQc3wIaVmY1HDHrzZx5LJt+lx/Gp7bN6
 oiulz4Ak6/JhzHj05fuXfCEW4Bm6XMQrD3ClX9tQyM6TdTtKs4hr0Vxn4Gm0DB2HTjHG
 ukbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5ejk88Q4maSJEwIoy6uu9RtbcDZwf0hyA9JefrZq5A=;
 b=RVbKphj8mJPPNaWRz/KSuktFO7Va/cQ4++Z9gYNUvMYFJDa5OF33qfJzO253Rl4Sn5
 Ea0lYn43dJr9LiwJkDoOT9+etXVTOAZtYtxYTFC0xEZ2REuEBjDa5S/5wp7O03IV5DPp
 lTVUws3c/KtrZ8xWh0vRcyiOW9p1ADrg7z5dQxb+IrGz8zh5DgwHyvvPgBQsikXZA942
 cAbLYIgxG0zWCxJjJSqJK53mG5GXnR0xtSEToDsO4JuawGIniC1ZURnmKhCq5ZCJowmk
 +MTdWX1itaSt7P20r6GR+yQDdF/Pner/cWLP+oocMS1T4IuqEhXV6OBYDW6OPeO0047I
 Vq0g==
X-Gm-Message-State: AOAM533xDDnev0VQk4MYEF4RYTs4pJK/R1KagOcYG0dhnkr3J2m5JWJq
 uBYDEw7bCTSTQ0KDCOIWt6NfzAL956UIjQ==
X-Google-Smtp-Source: ABdhPJz/bKbQ1AVJ3k99XYZ4d1pmi1jlnU4oYVY2jsH98PbuuHPn33Djy6Uru13C/Q7qp/nnfGtq3Q==
X-Received: by 2002:a5d:58ed:0:b0:217:dd5:7508 with SMTP id
 f13-20020a5d58ed000000b002170dd57508mr24329097wrd.606.1654765561753; 
 Thu, 09 Jun 2022 02:06:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/55] target/arm: Move m_is_{ppb,system}_region to ptw.c
Date: Thu,  9 Jun 2022 10:05:01 +0100
Message-Id: <20220609090537.1971756-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-13-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  3 ---
 target/arm/helper.c | 15 ---------------
 target/arm/ptw.c    | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index d2d27119082..6c47a575991 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -33,9 +33,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-bool m_is_ppb_region(CPUARMState *env, uint32_t address);
-bool m_is_system_region(CPUARMState *env, uint32_t address);
-
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
                         bool s1_is_el0,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d6a749ad0ed..d2ef12346b6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11677,21 +11677,6 @@ do_fault:
     return true;
 }
 
-bool m_is_ppb_region(CPUARMState *env, uint32_t address)
-{
-    /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
-    return arm_feature(env, ARM_FEATURE_M) &&
-        extract32(address, 20, 12) == 0xe00;
-}
-
-bool m_is_system_region(CPUARMState *env, uint32_t address)
-{
-    /* True if address is in the M profile system region
-     * 0xe0000000 - 0xffffffff
-     */
-    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c15fba43c31..32ba2e5e8bf 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -416,6 +416,22 @@ static void get_phys_addr_pmsav7_default(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
+static bool m_is_ppb_region(CPUARMState *env, uint32_t address)
+{
+    /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
+    return arm_feature(env, ARM_FEATURE_M) &&
+        extract32(address, 20, 12) == 0xe00;
+}
+
+static bool m_is_system_region(CPUARMState *env, uint32_t address)
+{
+    /*
+     * True if address is in the M profile system region
+     * 0xe0000000 - 0xffffffff
+     */
+    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
+}
+
 static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
                                          bool is_user)
 {
-- 
2.25.1


