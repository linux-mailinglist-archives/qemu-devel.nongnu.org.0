Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145396A4F66
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:03:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmUw-0007Ps-Jn; Mon, 27 Feb 2023 18:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUu-0007IG-A1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:32 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUs-0000xi-An
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:32 -0500
Received: by mail-pl1-x632.google.com with SMTP id h8so5194762plf.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJ0GNl2EuoPc8lssfALIIXAAXNHi+1GQhJLbNmOQ6Es=;
 b=wGlEKdk6VT65KfZqfUqKYsm07b8/f0PGyANtYrDLCSwRJGH5d1ViXdN/ivCa2wtXpJ
 f9pMnJE4RHZFiNnQgCEb9b4CUuK78rmbN/Xy/NhYDgTXMrcx3utOP9gEXoOHyzEbZZT8
 wCafZsvKkQjicMnqtD0yC28GmLDUFbnh0BlJh/hOmd8zN3am3jveWJQXNiJ/ArsmEu1S
 4V/UFYk5keqM6IfgRw4czvrhXN6pusBR+OdKOSVmFbhNDAIn/VrTfpUBRLcdEI/FlD+/
 VD1nwQGLimkgdE8cc8YxKFmZ23j6Cyh+94ebR346/DDFsden7HDoNSWaksF/XZRu4Weu
 BIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJ0GNl2EuoPc8lssfALIIXAAXNHi+1GQhJLbNmOQ6Es=;
 b=5RDL++zHio7By/ukyY/XbmBQDpgOCYA90onF+GhUJ3Zl/3pOSYDLC87U2+Ry+HEbJZ
 9vwbU8SgpG+/IW2Cj1U8IX2EDebrOt7eAhf9ywdNV0Vl2Wrxmr7/3Y77cQqtramE73Nd
 CQowbyf8rcqOs51HSVICqwROvRjyswGIaraYthpPvYIz+YJrQspvaS5wjqHv5svoJvNq
 4NyhkPzWOQrffmVpT+Hle0C1nctO6yOLN5/ebM2U94wG+6tj4F4RjW9mtkVwKrhnMkim
 VEytHyy1uubTUCJT/RrLzqTJVT6E+p+kV+Hx0UY9cl6aXf6vyHVuo8wSNQfST/TyFLDS
 b9QQ==
X-Gm-Message-State: AO0yUKUi6TBilolpmN1+xkY8ftiGckJZha2p+BhDDpt9f8MQMoKatgdB
 awo3Uc8TbG9l0uC1tXhqiUpJbfcdQApUbeD2XA8=
X-Google-Smtp-Source: AK7set8bQOFo2nxEysG2wwVe/9Ji8fxJM9wB6SMkPOoheMhbEms7yf9UI7G/zXH0GjoCqxwaB8tIOw==
X-Received: by 2002:a05:6a20:4322:b0:cc:692d:92de with SMTP id
 h34-20020a056a20432200b000cc692d92demr1286760pzk.44.1677538888967; 
 Mon, 27 Feb 2023 15:01:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 02/21] target/arm: Update SCR and HCR for RME
Date: Mon, 27 Feb 2023 13:01:03 -1000
Message-Id: <20230227230122.816702-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
index bd12efd392..66c578c360 100644
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


