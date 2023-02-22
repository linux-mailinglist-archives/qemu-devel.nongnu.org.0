Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1597469ECEA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:37:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexP-0007Wd-57; Tue, 21 Feb 2023 21:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex4-0007Ji-QE
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:55 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex3-0001az-98
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:50 -0500
Received: by mail-pj1-x1032.google.com with SMTP id g14so7277439pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKaBXNzHKh4bdHhJlKN/7Fy/mzP8VfMexwZIdNSvfng=;
 b=yncxQCT4inSEoDthgyE/SBkvxB32BvDmaE7dIfJPgEpiebJ25Y0xQggyDCtm0OGpDT
 FV0GQqtM9QB3YefHWbC/hWm2N0YetDG1ISMHYxYLgSKuwCUNpB0CeTd0DSqP+dFS/IPP
 ZbbsGwDfSOMPM5/f6QYOQYU3xY2M7GhgM5wAqZ7kt+Kv98WQ7LQA8YelMMJwTV5Ygn98
 eQcCBO7GNm8NhUMtxOSe+32qKGv7m/Xay0xE/zbpNHr/1l7yAp1gXKG4h31SWZklBiOE
 G2F2G1kJrDB5b8PJOcbhhXgBYycjmXW6sU7jxiCgczELQK41MhLPDzbqD0wSVNwyQjlV
 JiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKaBXNzHKh4bdHhJlKN/7Fy/mzP8VfMexwZIdNSvfng=;
 b=5hSHdSdtUtegaiNVchZBHVD+D2f2M0fUtaurLo+KHWtfu6AmTmY/KuDTV5RKBnXcQ1
 1WOt+ijjVsem/IRHfip2iXV7LWuAOEPTEg7h03M6YVJ20+vKD3+9XGvdO6AmvTtKw7Xd
 HSYc547tD5Dk4tpaF8VXPkwcWN0H2CHxnG6teq9bFQz8tzegVoJ7zTP7iI1fNYcWhfYv
 dmTK2uqM4rzoPeL3oGQrGpq9Tr2ZvVe81c1rfiTZh7sMUVISbJkW3OSnKn+E0ckxfKmU
 VD7hkrcrFLZgG3ibTHRP+WIC4bmtIR5fIHu+P/MHrTnv2Qt5PonSD+V3UtDKEUP2Ryoi
 IMbw==
X-Gm-Message-State: AO0yUKXJtTwHRwQdklw3qjhfCA/y/72TdDeW94odVMJvbZFkKyj1oDwO
 X86GJHK8+QU7XrO+dyNPPPuoyBz+dBxBkAdT7JA=
X-Google-Smtp-Source: AK7set8VXDB1CiwBp1SY6C9xJO5wgQ9WtdbFTnlTaljeyJ3tCFbwQ7a6NIOmTdfYj95pyM2c99boHw==
X-Received: by 2002:a17:902:d481:b0:19a:a701:693f with SMTP id
 c1-20020a170902d48100b0019aa701693fmr9485203plg.9.1677033227966; 
 Tue, 21 Feb 2023 18:33:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 06/25] target/arm: Update SCR and HCR for RME
Date: Tue, 21 Feb 2023 16:33:17 -1000
Message-Id: <20230222023336.915045-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Define the missing SCR and HCR bits, allow SCR_NSE and {SCR,HCR}_GPF
to be set, and invalidate TLBs when NSE changes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  5 +++--
 target/arm/helper.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b046f96e4e..230241cf93 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1650,7 +1650,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_TERR      (1ULL << 36)
 #define HCR_TEA       (1ULL << 37)
 #define HCR_MIOCNCE   (1ULL << 38)
-/* RES0 bit 39 */
+#define HCR_TME       (1ULL << 39)
 #define HCR_APK       (1ULL << 40)
 #define HCR_API       (1ULL << 41)
 #define HCR_NV        (1ULL << 42)
@@ -1659,7 +1659,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_NV2       (1ULL << 45)
 #define HCR_FWB       (1ULL << 46)
 #define HCR_FIEN      (1ULL << 47)
-/* RES0 bit 48 */
+#define HCR_GPF       (1ULL << 48)
 #define HCR_TID4      (1ULL << 49)
 #define HCR_TICAB     (1ULL << 50)
 #define HCR_AMVOFFEN  (1ULL << 51)
@@ -1724,6 +1724,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_NSE               (1ULL << 62)
 
 #define HSTR_TTEE (1 << 16)
 #define HSTR_TJDBX (1 << 17)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37d9267fb4..3650234c73 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1875,6 +1875,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_fgt, cpu)) {
             valid_mask |= SCR_FGTEN;
         }
+        if (cpu_isar_feature(aa64_rme, cpu)) {
+            valid_mask |= SCR_NSE | SCR_GPF;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -1904,10 +1907,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     env->cp15.scr_el3 = value;
 
     /*
-     * If SCR_EL3.NS changes, i.e. arm_is_secure_below_el3, then
+     * If SCR_EL3.{NS,NSE} changes, i.e. change of security state,
      * we must invalidate all TLBs below EL3.
      */
-    if (changed & SCR_NS) {
+    if (changed & (SCR_NS | SCR_NSE)) {
         tlb_flush_by_mmuidx(env_cpu(env), (ARMMMUIdxBit_E10_0 |
                                            ARMMMUIdxBit_E20_0 |
                                            ARMMMUIdxBit_E10_1 |
@@ -5655,6 +5658,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_fwb, cpu)) {
             valid_mask |= HCR_FWB;
         }
+        if (cpu_isar_feature(aa64_rme, cpu)) {
+            valid_mask |= HCR_GPF;
+        }
     }
 
     if (cpu_isar_feature(any_evt, cpu)) {
-- 
2.34.1


