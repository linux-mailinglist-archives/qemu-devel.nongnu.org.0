Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589996A1168
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:45:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRp-00031r-U5; Thu, 23 Feb 2023 15:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRn-0002yu-8H
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:11 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRl-0007Ut-Cd
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:10 -0500
Received: by mail-pl1-x642.google.com with SMTP id z2so14645700plf.12
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DYpXgLa7aKwNkf25RMtvRP9iUFACK26xYqqO1SJ46k=;
 b=J9edVt+DQkk4SsCK7WGgpyl7038DZpsJFyk0xkT17XAmYJemHoRyEHJBKrxcZRRtyu
 K6OsRxo+BnPP0vmWA9tnjJl9myTqinuYiPowQl4pfYf5UDr8cfLzURiVIcQNzRZzDZQ4
 FoUMZn6ejtr6B40MdhvWmKFSv5S6H4C3QS7FGu231cNA4lLbouZ+qyVx3+Gzn0diT3VS
 Z77lXRHFp2/SyoF0XeMQVcw0tXkjYeCu0A98ffqHnAkKGmPP6DP79DmR8I9qdu/At6nd
 nb9BpJhHFlQj3Nk1HW++Ta8aXXGeS23YuqX4FN8Q5tU7HK9ewKkZO5g6pNXJOhLeC2IU
 h8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DYpXgLa7aKwNkf25RMtvRP9iUFACK26xYqqO1SJ46k=;
 b=MXmtmSd9bo7De5H8m8HJx4HTRh0Dm4ktqUUTFwtyqAJlSErBmDrL47/bEf8rQaGMLs
 ksrmm6defcv6M2Pqk63wT3gkutJDG25dv5MDwUpeBtqVVTOse4YVgmRMqe53C4F/tVWt
 Q1KeXEggNRhHXXd4NkIaweYX3uaBjJ8gxKweBuSr9Kv1tHbhbRTXs3PPRjNZuRdwDCM6
 FEe2WS1Yck2VoX+H+aDWCBHz32faCADQi6S3J70x1TgPEhfN8HjVDkH7FKxr9MnqxIjf
 QaIjllbNadETo3u5iCeVEiQskX8rdKIM9/CpuJQY3Dqzxvb0/41Fh0sILzsUniLfDU+7
 gYeA==
X-Gm-Message-State: AO0yUKU0vPN62xh00QOIIUFN4ZJpHKJT2Lb82eIrf02JGSJrJQWm9cZt
 LJt7qk9TO3DDHqv0VUiRMFE81bRvm5vPuG8ZkI2DZA==
X-Google-Smtp-Source: AK7set92joUnqdkkpELTPAfC/+JW1kDzlJlmb6sBIw1zBSRRkTr6UjYD3OiUXu86p+znmykJ3K0H8A==
X-Received: by 2002:a17:90b:4c50:b0:233:ce0b:8655 with SMTP id
 np16-20020a17090b4c5000b00233ce0b8655mr13021290pjb.28.1677185048034; 
 Thu, 23 Feb 2023 12:44:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:44:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/13] target/arm: Do memory type alignment check when
 translation enabled
Date: Thu, 23 Feb 2023 10:43:42 -1000
Message-Id: <20230223204342.1093632-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If translation is enabled, and the PTE memory type is Device,
enable checking alignment via TLB_CHECK_ALIGNMENT.  While the
check is done later than it should be per the ARM, it's better
than not performing the check at all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2b125fff44..19afeb9135 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -194,6 +194,16 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
+static bool S1_attrs_are_device(uint8_t attrs)
+{
+    /*
+     * This slightly under-decodes the MAIR_ELx field:
+     * 0b0000dd01 is Device with FEAT_XS, otherwise UNPREDICTABLE;
+     * 0b0000dd1x is UNPREDICTABLE.
+     */
+    return (attrs & 0xf0) == 0;
+}
+
 static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 {
     /*
@@ -1188,6 +1198,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
     bool nstable;
+    bool device;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1568,6 +1579,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
         result->cacheattrs.attrs = extract32(attrs, 2, 4);
+        device = S2_attrs_are_device(arm_hcr_el2_eff_secstate(env, is_secure),
+                                     result->cacheattrs.attrs);
     } else {
         /* Index into MAIR registers for cache attributes */
         uint8_t attrindx = extract32(attrs, 2, 3);
@@ -1575,6 +1588,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         assert(attrindx <= 7);
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+        device = S1_attrs_are_device(result->cacheattrs.attrs);
+    }
+
+    /*
+     * Enable alignment checks on Device memory.
+     *
+     * Per R_XCHFJ, this check is mis-ordered, in that this alignment check
+     * should have priority 30, while the permission check should be next at
+     * priority 31 and stage2 translation faults come after that.
+     * Due to the way the TCG softmmu TLB operates, we will have implicitly
+     * done the permission check and the stage2 lookup in finding the TLB
+     * entry, so the alignment check cannot be done sooner.
+     */
+    if (device) {
+        result->f.tlb_fill_flags |= TLB_CHECK_ALIGNED;
     }
 
     /*
-- 
2.34.1


