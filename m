Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997935E69CC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:42:33 +0200 (CEST)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQDY-0001D8-O7
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB0-0002Ax-Eu
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAy-0005Pe-JZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id n10so16377656wrw.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=u3T0zAgMbu0p/+YyGjLWBqhH/EbkbWQ0NkCK9u4fEiQ=;
 b=sXjcJ5No6QiXM2ybWl2cRGICt5mla64tW3I+eEw24ZaHWEIjNidQOkepQNqNXCR+qk
 Nw++BlqPRkMLEg00lIx9F1rZVCwR84EH8J+3AU97LmdlSqySc3SR8U/MVI/QXRyKBzEw
 59Ny0kFl7Ln70CF/BZsbNCH9VSXPtPv1rmnMD5ld66U80RafrTQmsKXgiCWRL2fgLTVl
 Ib+uuu/F8+DQC05ShIgeewJFRL6+WysM6EF7jTEnjTxrzEB+ObIntViQ4c998vuDC9t1
 IfZixVGt+Rl+Yz7K3TW+CeagfaPWy4LWxizROw0SlsBkZaFc8BEeahk9atc5EfkZ93pV
 7diQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=u3T0zAgMbu0p/+YyGjLWBqhH/EbkbWQ0NkCK9u4fEiQ=;
 b=JBrB0iCyPsPbjK++QNz6c/+mHJcV1zP1Z1UwsECTn5kT4auESskuH4QwhvIHkLpmYC
 Qcs1FTbmEJrtlu9AX35oCsv21PcigkTzq8tpyvzMz16BZ117BSL19PIvvwCmAhRDNLN/
 AVeUhZKJvKb4/S/9WNIfh77ltW1suYxpM/uSQp3ukSfbaTMKBzzHScNjEMyZnYxbbRP/
 7Sx5P6cuPXFq0CPEe2L+Juz5JWKl4Thz8ye5jk6B1X5F3j1TwRihmYT9EOfWj1SnnOmw
 6OscKwuEf1DSOQhg+mx+RT1Fd1batd9g+Y5GmULxWwiipLNvJhD777ETHs6T1J4Xknvx
 LmnA==
X-Gm-Message-State: ACrzQf1LoT2W4UaUCtgBDMW6g3op5xjYDRWOz3XOi8B2XQGTIYd2SSxb
 3GHOJc+VBFEBoTiRb9fx+qaJ6v5j4Uosvg==
X-Google-Smtp-Source: AMsMyM7h7YGRfN8Hd2eLZRLeDccN+EwddDgPId+4yX6C4+op6xDxv4Hso23+EyyCmahUHmwCSzigcA==
X-Received: by 2002:a05:6000:887:b0:21e:24a0:f302 with SMTP id
 ca7-20020a056000088700b0021e24a0f302mr2537644wrb.466.1663864546969; 
 Thu, 22 Sep 2022 09:35:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/39] target/arm: Add is_secure parameter to
 v8m_security_lookup
Date: Thu, 22 Sep 2022 17:35:09 +0100
Message-Id: <20220922163536.1096175-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Remove the use of regime_is_secure from v8m_security_lookup,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-12-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/m_helper.c  | 9 ++++++---
 target/arm/ptw.c       | 9 +++++----
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f8b22d3ab0b..e97f5c3d47e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1123,7 +1123,7 @@ typedef struct V8M_SAttributes {
 
 void v8m_security_lookup(CPUARMState *env, uint32_t address,
                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                         V8M_SAttributes *sattrs);
+                         bool secure, V8M_SAttributes *sattrs);
 
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 01263990dc3..45fbf195590 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -689,7 +689,8 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         V8M_SAttributes sattrs = {};
 
-        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
+        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+                            targets_secure, &sattrs);
         if (sattrs.ns) {
             attrs.secure = false;
         } else if (!targets_secure) {
@@ -2002,7 +2003,8 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     ARMMMUFaultInfo fi = {};
     MemTxResult txres;
 
-    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx, &sattrs);
+    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx,
+                        regime_is_secure(env, mmu_idx), &sattrs);
     if (!sattrs.nsc || sattrs.ns) {
         /*
          * This must be the second half of the insn, and it straddles a
@@ -2826,7 +2828,8 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     }
 
     if (env->v7m.secure) {
-        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
+        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+                            targetsec, &sattrs);
         nsr = sattrs.ns && r;
         nsrw = sattrs.ns && rw;
     } else {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bb3c709f8f5..74d2f63359f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1857,8 +1857,8 @@ static bool v8m_is_sau_exempt(CPUARMState *env,
 }
 
 void v8m_security_lookup(CPUARMState *env, uint32_t address,
-                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                V8M_SAttributes *sattrs)
+                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                         bool is_secure, V8M_SAttributes *sattrs)
 {
     /*
      * Look up the security attributes for this address. Compare the
@@ -1886,7 +1886,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
     }
 
     if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
-        sattrs->ns = !regime_is_secure(env, mmu_idx);
+        sattrs->ns = !is_secure;
         return;
     }
 
@@ -1975,7 +1975,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     bool ret;
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
+        v8m_security_lookup(env, address, access_type, mmu_idx,
+                            secure, &sattrs);
         if (access_type == MMU_INST_FETCH) {
             /*
              * Instruction fetches always use the MMU bank and the
-- 
2.25.1


