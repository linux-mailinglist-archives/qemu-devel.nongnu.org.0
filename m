Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECD35FA07A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:50:47 +0200 (CEST)
Received: from localhost ([::1]:53040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohu7C-0001Ss-ES
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtlD-0006c1-KO
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:28:03 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtlB-0005c6-I5
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:28:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso1474665wmb.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jy15vtNWJUoTZz5dOl5JPn5PUMEvXzpyspwJEl564+Y=;
 b=JH46iBzp2d2ZCI9t60RAGocROJqJyNmQZbAiTM6Y6dGz5JFm6SsB0SN8xo00Vy4qLT
 BAKHvWD8VYDVdKYoSolHASrI4W6/ueFiT/IzP5WBZ2SNlCwZ+3ng06FYyg6NVdyLSTtE
 1iN2yqIa9hPyvPQEJ/Q1UzPw2JZk/joULv50bNgL5WKRb9cBPdm1TSe+zhVNWmok6BvF
 3Ta9NKIN+8OArrUEO+E8hN1BrMgEtuMBqChAd3IPPxQltsVQFNnAeFiqfEUsicdVmmoB
 nLdp/BFgXeb+xBY403FHvrvwuK+E9PCcB0knp7mGXne+02RK2Y2xiDkmGGgQyksExyX0
 QQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jy15vtNWJUoTZz5dOl5JPn5PUMEvXzpyspwJEl564+Y=;
 b=j20uwUrodWghgrMGZ4+iqDrtJlSLvr+mbJvAaFkM3sIxwSDxBhefNQdRYnWuLb93Ud
 CB/1NFJYI04z9Cx22AfCc3xiNj2eg5azbFrl3DlAarLzl2xTDuKRizIdZE+6Lrzn1HNf
 U/73EZSOeIC4EtGOGeEjfDJ3ItKbMIGT0xq4DpEQjFZW2dYFqp5nIcUztLLZFKuRKlTx
 DqkoSh7D0m2B3QHo0ra5tD428EuPL4ppvLKn7I5BzHQ5VtAEqa+gCQCIhGzGZg470/ls
 tu4YMQc215fhhpUy0NLxNtzXo25nKbMxkCEnMIoVUwnQ09j5ZKI09jWvFQbS+lzSUTeW
 wEzA==
X-Gm-Message-State: ACrzQf0429i2BHUIzCUsOZ0lGZbr7DLFg3XCNUn6VeG/RCsImiEdHlmF
 ENlhLQF9Q+31gpQ9PWRObDwspq5asPJPYw==
X-Google-Smtp-Source: AMsMyM7Ne7FN/SMQoi4hztxXKCSuO0ucZNLwgQphw6D2GxOs5ldpSeLzl/ukhqaru2iWPPb0HqqJ5w==
X-Received: by 2002:a05:600c:a05:b0:3b9:cecc:9846 with SMTP id
 z5-20020a05600c0a0500b003b9cecc9846mr19810402wmp.3.1665412079652; 
 Mon, 10 Oct 2022 07:27:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/28] target/arm: Don't allow guest to use unimplemented
 granule sizes
Date: Mon, 10 Oct 2022 15:27:28 +0100
Message-Id: <20221010142730.502083-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Arm CPUs support some subset of the granule (page) sizes 4K, 16K and
64K.  The guest selects the one it wants using bits in the TCR_ELx
registers.  If it tries to program these registers with a value that
is either reserved or which requests a size that the CPU does not
implement, the architecture requires that the CPU behaves as if the
field was programmed to some size that has been implemented.
Currently we don't implement this, and instead let the guest use any
granule size, even if the CPU ID register fields say it isn't
present.

Make aa64_va_parameters() check against the supported granule size
and force use of a different one if it is not implemented.

(A subsequent commit will make ARMVAParameters use the new enum
rather than the current pair of using16k/using64k bools.)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221003162315.2833797-2-peter.maydell@linaro.org
---
 target/arm/cpu.h       |  33 +++++++++++++
 target/arm/internals.h |   9 ++++
 target/arm/helper.c    | 102 +++++++++++++++++++++++++++++++++++++----
 3 files changed, 136 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d541392170e..1a909a1b436 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4097,6 +4097,39 @@ static inline bool isar_feature_aa64_tgran16_2_lpa2(const ARMISARegisters *id)
     return t >= 3 || (t == 0 && isar_feature_aa64_tgran16_lpa2(id));
 }
 
+static inline bool isar_feature_aa64_tgran4(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 0;
+}
+
+static inline bool isar_feature_aa64_tgran16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 1;
+}
+
+static inline bool isar_feature_aa64_tgran64(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN64) >= 0;
+}
+
+static inline bool isar_feature_aa64_tgran4_2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4_2);
+    return t >= 2 || (t == 0 && isar_feature_aa64_tgran4(id));
+}
+
+static inline bool isar_feature_aa64_tgran16_2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16_2);
+    return t >= 2 || (t == 0 && isar_feature_aa64_tgran16(id));
+}
+
+static inline bool isar_feature_aa64_tgran64_2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN64_2);
+    return t >= 2 || (t == 0 && isar_feature_aa64_tgran64(id));
+}
+
 static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index fd17aee4599..6166ac0a98f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -998,6 +998,15 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     return valid;
 }
 
+/* Granule size (i.e. page size) */
+typedef enum ARMGranuleSize {
+    /* Same order as TG0 encoding */
+    Gran4K,
+    Gran64K,
+    Gran16K,
+    GranInvalid,
+} ARMGranuleSize;
+
 /*
  * Parameters of a given virtual address, as extracted from the
  * translation control register (TCR) for a given regime.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e1338ed6e22..d7f578f2baa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10287,20 +10287,105 @@ static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
     }
 }
 
+static ARMGranuleSize tg0_to_gran_size(int tg)
+{
+    switch (tg) {
+    case 0:
+        return Gran4K;
+    case 1:
+        return Gran64K;
+    case 2:
+        return Gran16K;
+    default:
+        return GranInvalid;
+    }
+}
+
+static ARMGranuleSize tg1_to_gran_size(int tg)
+{
+    switch (tg) {
+    case 1:
+        return Gran16K;
+    case 2:
+        return Gran4K;
+    case 3:
+        return Gran64K;
+    default:
+        return GranInvalid;
+    }
+}
+
+static inline bool have4k(ARMCPU *cpu, bool stage2)
+{
+    return stage2 ? cpu_isar_feature(aa64_tgran4_2, cpu)
+        : cpu_isar_feature(aa64_tgran4, cpu);
+}
+
+static inline bool have16k(ARMCPU *cpu, bool stage2)
+{
+    return stage2 ? cpu_isar_feature(aa64_tgran16_2, cpu)
+        : cpu_isar_feature(aa64_tgran16, cpu);
+}
+
+static inline bool have64k(ARMCPU *cpu, bool stage2)
+{
+    return stage2 ? cpu_isar_feature(aa64_tgran64_2, cpu)
+        : cpu_isar_feature(aa64_tgran64, cpu);
+}
+
+static ARMGranuleSize sanitize_gran_size(ARMCPU *cpu, ARMGranuleSize gran,
+                                         bool stage2)
+{
+    switch (gran) {
+    case Gran4K:
+        if (have4k(cpu, stage2)) {
+            return gran;
+        }
+        break;
+    case Gran16K:
+        if (have16k(cpu, stage2)) {
+            return gran;
+        }
+        break;
+    case Gran64K:
+        if (have64k(cpu, stage2)) {
+            return gran;
+        }
+        break;
+    case GranInvalid:
+        break;
+    }
+    /*
+     * If the guest selects a granule size that isn't implemented,
+     * the architecture requires that we behave as if it selected one
+     * that is (with an IMPDEF choice of which one to pick). We choose
+     * to implement the smallest supported granule size.
+     */
+    if (have4k(cpu, stage2)) {
+        return Gran4K;
+    }
+    if (have16k(cpu, stage2)) {
+        return Gran16K;
+    }
+    assert(have64k(cpu, stage2));
+    return Gran64K;
+}
+
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, using16k, using64k, tsz_oob, ds;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
+    ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
+    bool stage2 = mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
         tsz = extract32(tcr, 0, 6);
-        using64k = extract32(tcr, 14, 1);
-        using16k = extract32(tcr, 15, 1);
-        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        gran = tg0_to_gran_size(extract32(tcr, 14, 2));
+        if (stage2) {
             /* VTCR_EL2 */
             hpd = false;
         } else {
@@ -10318,16 +10403,13 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         select = extract64(va, 55, 1);
         if (!select) {
             tsz = extract32(tcr, 0, 6);
+            gran = tg0_to_gran_size(extract32(tcr, 14, 2));
             epd = extract32(tcr, 7, 1);
             sh = extract32(tcr, 12, 2);
-            using64k = extract32(tcr, 14, 1);
-            using16k = extract32(tcr, 15, 1);
             hpd = extract64(tcr, 41, 1);
         } else {
-            int tg = extract32(tcr, 30, 2);
-            using16k = tg == 1;
-            using64k = tg == 3;
             tsz = extract32(tcr, 16, 6);
+            gran = tg1_to_gran_size(extract32(tcr, 30, 2));
             epd = extract32(tcr, 23, 1);
             sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
@@ -10336,6 +10418,10 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ds = extract64(tcr, 59, 1);
     }
 
+    gran = sanitize_gran_size(cpu, gran, stage2);
+    using64k = gran == Gran64K;
+    using16k = gran == Gran16K;
+
     if (cpu_isar_feature(aa64_st, cpu)) {
         max_tsz = 48 - using64k;
     } else {
-- 
2.25.1


