Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A11678C64
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:01:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kL-0008Tf-0j; Mon, 23 Jan 2023 19:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kF-0008BW-PR
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:01 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kA-0001jO-Uj
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:59 -0500
Received: by mail-pf1-x434.google.com with SMTP id a184so10096355pfa.9
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KPCpSfOS3MJgxEieajg71yzTiyoHQkyPgf80iICoXk=;
 b=PQ15xiPemBcAFX7MBj1LRvs+4eHEz4bC9dqtgCa4H9FMD8CNyZff0+jn7G3RYoYrNS
 GJUTsrjedkyyygRoGSb4TudSqaYOPM2uH879/W2VYmINlMBwELjsEvYg4KyfLAjEQ2YN
 H4QjLlmxrAzlxZzEvdckLVZ0lsy5hwLvmNEuEWs2HnzbsUcOPKFgokT6qLF4tez+327n
 x8OxOXKFitlDGmJVI2hSHAziupH+6JF/PQywPDw0zZTxkhQ0/IrAOT3E2FfeS+95B62R
 0rCoKdb6dy0ggHCcwLmU3SxHntV2pfFPLPXoeInNRXj+I6LCSi9kM/dO7E1TZiV+29oV
 e5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KPCpSfOS3MJgxEieajg71yzTiyoHQkyPgf80iICoXk=;
 b=pdyD02o7bWWXJEXGAFeH7h75VuD3+wisnOiDIaE9YE6PDwCMVu2lt2imUXwGMYWrRT
 96yqQWBid5MJT+Cg7sUzJPsRgU0XflI5h+7HW8rxz0SBn89TMnOOj9it8yiIl9txo+Jf
 TfQUohs2cN510fibvuGG+hn1lezds1+WI/wrmJfa73gbcRAiaJ0pgeKk2/mBXOVDLZia
 i9oUq1qoKPz9OSKUHy6wtHWPJjl9OuvROnUZP2DrA4xnWB2p8sWzoynx1eRR+/XlYPNM
 bFImEh8I1MXxcP8r5PaWOWtRCurJamz73hEDxAOjk2WEqFZVLFkdzJatRDMnpBXquEw8
 SAwQ==
X-Gm-Message-State: AFqh2kqhsdfcxr/edLuAXWtgEs6Hlw/g7Otym0x7lUplgDdvbbO4j4AH
 LZcGBlM3SLrlrnw3FrvEuu6KRUrI9tR6AI9D
X-Google-Smtp-Source: AMrXdXtbLoZ4YrFrdoUs3WMR/2YqC652jvQiGKyW2tA3Ilwn85/MB5Y9uh117CKqmmCAfdZ4Hr3waA==
X-Received: by 2002:a05:6a00:430a:b0:574:35fd:379e with SMTP id
 cb10-20020a056a00430a00b0057435fd379emr25538922pfb.2.1674518453705; 
 Mon, 23 Jan 2023 16:00:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 04/22] target/arm: Update SCR and HCR for RME
Date: Mon, 23 Jan 2023 14:00:09 -1000
Message-Id: <20230124000027.3565716-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  5 +++--
 target/arm/helper.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 81d5a51b62..9d1a6b346d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1638,7 +1638,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_TERR      (1ULL << 36)
 #define HCR_TEA       (1ULL << 37)
 #define HCR_MIOCNCE   (1ULL << 38)
-/* RES0 bit 39 */
+#define HCR_TME       (1ULL << 39)
 #define HCR_APK       (1ULL << 40)
 #define HCR_API       (1ULL << 41)
 #define HCR_NV        (1ULL << 42)
@@ -1647,7 +1647,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_NV2       (1ULL << 45)
 #define HCR_FWB       (1ULL << 46)
 #define HCR_FIEN      (1ULL << 47)
-/* RES0 bit 48 */
+#define HCR_GPF       (1ULL << 48)
 #define HCR_TID4      (1ULL << 49)
 #define HCR_TICAB     (1ULL << 50)
 #define HCR_AMVOFFEN  (1ULL << 51)
@@ -1712,6 +1712,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_NSE               (1ULL << 62)
 
 #define HSTR_TTEE (1 << 16)
 #define HSTR_TJDBX (1 << 17)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf1..293f8eda8c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1869,6 +1869,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_hcx, cpu)) {
             valid_mask |= SCR_HXEN;
         }
+        if (cpu_isar_feature(aa64_rme, cpu)) {
+            valid_mask |= SCR_NSE | SCR_GPF;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -1898,10 +1901,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
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
@@ -5578,6 +5581,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
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


