Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C07700BF8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:36:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUn0-0003Kz-NN; Fri, 12 May 2023 11:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmy-0003JW-Kh
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmw-00061T-Fz
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:36 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-307d84f5ce4so1143093f8f.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905671; x=1686497671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MfgZqZm2zk0bmdXpzgHr1vazqFZCSNBl9fC/DQYjgpo=;
 b=IhpwqVgQDrQawq4+hpgIxv0RZZ6aFU9/OfsP1vvbO/EWeaV7fNjKeiq8OJ54JYsIxm
 HXQvetb2W3Nsrqnn4jv04pdJSZ52IMPMpjUMvlPIVzMa0XU5dP63NgGnLvE826K056Jk
 WVqH536Zk9+fm8vktn2NFessH3ENZ0w9dZRqfpSLBULJJ3vVBP8ESVmLZypcpwHJy6ce
 ieh37mS2XuhyxhPzYnEiXfUOB3XArEz8AE2M29rq1MTpsb/0rsHkQbvWMHZ8Y9c2kY4R
 reVA+AxUSvlu2dicuc5xHEK/Q0NwVy4B6CQqIVXt2f61AdieUdfO2wgmkjb2j6BfWwNw
 unyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905671; x=1686497671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MfgZqZm2zk0bmdXpzgHr1vazqFZCSNBl9fC/DQYjgpo=;
 b=IXBfGflhynR9JONvQgHUvEu8yaxrfvKWkWV6kzLi3S+JKfaTFl0IOstvr8hyuh2vSd
 IDuznqUGumZdwopcp5qZyk7e8WdWnrrImSxfjjOjQ14V7a1G34aE8Ij3UrUF4W+8cy7e
 bv73arhatXxmMPq/sIe6ypYoUUrkQI2qUsexECQAJ9hHgAgOsrv5m3QeP309mDaXcJiK
 ZrNNAYaFP02OHTnKelc131dpgWyXJnUZbjvJ0hcFUU1O1dFJS5hJzQeVmFzhlMuznoRE
 7gWjUawBUyL/Pwvri0mMQdvt10RVapvDzDM4OmvPlj4as0GI53ERDpkYlvHW5cLSgeyl
 yl0w==
X-Gm-Message-State: AC+VfDybkqEfpiK3ItMnfyDxrAJRnxvKzrDSxxdr464Ykd3FY1rW2VF/
 +Ow06d9t2/2dwZlwJpt0O+nGQWJNBOCH1ZI6VJs=
X-Google-Smtp-Source: ACHHUZ6tpEtvI8oFNnGiIUaGen61laZua1LqT0qfdADS3q0+7JcIrl2wVAoTpX1g7BwV3Cq/bDPNrA==
X-Received: by 2002:adf:e3cd:0:b0:306:2bff:aad8 with SMTP id
 k13-20020adfe3cd000000b003062bffaad8mr17223383wrm.35.1683905671325; 
 Fri, 12 May 2023 08:34:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] target/arm: Correct AArch64.S2MinTxSZ 32-bit EL1 input
 size check
Date: Fri, 12 May 2023 16:34:23 +0100
Message-Id: <20230512153423.3704893-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In check_s2_mmu_setup() we have a check that is attempting to
implement the part of AArch64.S2MinTxSZ that is specific to when EL1
is AArch32:

    if !s1aarch64 then
        // EL1 is AArch32
        min_txsz = Min(min_txsz, 24);

Unfortunately we got this wrong in two ways:

(1) The minimum txsz corresponds to a maximum inputsize, but we got
the sense of the comparison wrong and were faulting for all
inputsizes less than 40 bits

(2) We try to implement this as an extra check that happens after
we've done the same txsz checks we would do for an AArch64 EL1, but
in fact the pseudocode is *loosening* the requirements, so that txsz
values that would fault for an AArch64 EL1 do not fault for AArch32
EL1, because it does Min(old_min, 24), not Max(old_min, 24).

You can see this also in the text of the Arm ARM in table D8-8, which
shows that where the implemented PA size is less than 40 bits an
AArch32 EL1 is still OK with a configured stage2 T0SZ for a 40 bit
IPA, whereas if EL1 is AArch64 then the T0SZ must be big enough to
constrain the IPA to the implemented PA size.

Because of part (2), we can't do this as a separate check, but
have to integrate it into aa64_va_parameters(). Add a new argument
to that function to indicate that EL1 is 32-bit. All the existing
callsites except the one in get_phys_addr_lpae() can pass 'false',
because they are either doing a lookup for a stage 1 regime or
else they don't care about the tsz/tsz_oob fields.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1627
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230509092059.3176487-1-peter.maydell@linaro.org
---
 target/arm/internals.h        | 12 +++++++++++-
 target/arm/gdbstub64.c        |  2 +-
 target/arm/helper.c           | 15 +++++++++++++--
 target/arm/ptw.c              | 14 ++------------
 target/arm/tcg/pauth_helper.c |  6 +++---
 5 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0df8f3b8bca..c869d18c38c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1091,8 +1091,18 @@ typedef struct ARMVAParameters {
     ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
+/**
+ * aa64_va_parameters: Return parameters for an AArch64 virtual address
+ * @env: CPU
+ * @va: virtual address to look up
+ * @mmu_idx: determines translation regime to use
+ * @data: true if this is a data access
+ * @el1_is_aa32: true if we are asking about stage 2 when EL1 is AArch32
+ *  (ignored if @mmu_idx is for a stage 1 regime; only affects tsz/tsz_oob)
+ */
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
-                                   ARMMMUIdx mmu_idx, bool data);
+                                   ARMMMUIdx mmu_idx, bool data,
+                                   bool el1_is_aa32);
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index c1f7e8c934b..d7b79a6589b 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -233,7 +233,7 @@ int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
             ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
             ARMVAParameters param;
 
-            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data);
+            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data, false);
             return gdb_get_reg64(buf, pauth_ptr_mask(param));
         }
     default:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2297626bfb3..0b7fd2e7e6c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4904,7 +4904,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     unsigned int page_size_granule, page_shift, num, scale, exponent;
     /* Extract one bit to represent the va selector in use. */
     uint64_t select = sextract64(value, 36, 1);
-    ARMVAParameters param = aa64_va_parameters(env, select, mmuidx, true);
+    ARMVAParameters param = aa64_va_parameters(env, select, mmuidx, true, false);
     TLBIRange ret = { };
     ARMGranuleSize gran;
 
@@ -11193,7 +11193,8 @@ static ARMGranuleSize sanitize_gran_size(ARMCPU *cpu, ARMGranuleSize gran,
 }
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
-                                   ARMMMUIdx mmu_idx, bool data)
+                                   ARMMMUIdx mmu_idx, bool data,
+                                   bool el1_is_aa32)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, tsz_oob, ds, ha, hd;
@@ -11289,6 +11290,16 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         }
     }
 
+    if (stage2 && el1_is_aa32) {
+        /*
+         * For AArch32 EL1 the min txsz (and thus max IPA size) requirements
+         * are loosened: a configured IPA of 40 bits is permitted even if
+         * the implemented PA is less than that (and so a 40 bit IPA would
+         * fault for an AArch64 EL1). See R_DTLMN.
+         */
+        min_tsz = MIN(min_tsz, 24);
+    }
+
     if (tsz > max_tsz) {
         tsz = max_tsz;
         tsz_oob = true;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a89aa70b8b2..69c05cd9dad 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1134,17 +1134,6 @@ static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
 
     sl0 = extract32(tcr, 6, 2);
     if (is_aa64) {
-        /*
-         * AArch64.S2InvalidTxSZ: While we checked tsz_oob near the top of
-         * get_phys_addr_lpae, that used aa64_va_parameters which apply
-         * to aarch64.  If Stage1 is aarch32, the min_txsz is larger.
-         * See AArch64.S2MinTxSZ, where min_tsz is 24, translated to
-         * inputsize is 64 - 24 = 40.
-         */
-        if (iasize < 40 && !arm_el_is_aa64(&cpu->env, 1)) {
-            goto fail;
-        }
-
         /*
          * AArch64.S2InvalidSL: Interpretation of SL depends on the page size,
          * so interleave AArch64.S2StartLevel.
@@ -1284,7 +1273,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         int ps;
 
         param = aa64_va_parameters(env, address, mmu_idx,
-                                   access_type != MMU_INST_FETCH);
+                                   access_type != MMU_INST_FETCH,
+                                   !arm_el_is_aa64(env, 1));
         level = 0;
 
         /*
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index de067fa7168..62af5693419 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -293,7 +293,7 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                              ARMPACKey *key, bool data)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data, false);
     uint64_t pac, ext_ptr, ext, test;
     int bot_bit, top_bit;
 
@@ -355,7 +355,7 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data, false);
     int bot_bit, top_bit;
     uint64_t pac, orig_ptr, test;
 
@@ -379,7 +379,7 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
 static uint64_t pauth_strip(CPUARMState *env, uint64_t ptr, bool data)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data, false);
 
     return pauth_original_ptr(ptr, param);
 }
-- 
2.34.1


