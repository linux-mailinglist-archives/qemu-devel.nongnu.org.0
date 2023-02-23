Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF046A1163
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRn-0002yx-Ol; Thu, 23 Feb 2023 15:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRl-0002yG-SF
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:09 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRk-0007UY-4D
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:09 -0500
Received: by mail-pl1-x644.google.com with SMTP id u14so10582589ple.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4VpqcMOXVlrjqv2u2QyFnc/vNdrKfYNKBg4oxbaB+0Q=;
 b=AeF+e/q1u6JXtK32KfD1tGeD3rTzWOTE9LnYz4oGELCJM5mBGEI71BjB61EQKWLjTu
 GhaWy0x0Bugy1WnUIv7T7ixAT/3e4biWSymK2/bkfvPn2SbIa0rFcYKOtFv9JJTHUr6j
 4MkdEkLBrZwLlEnxyV3aWx0WvofrodjuGgb8JnP8snXqf5XM9I5r2gynqw4NIOzOzj56
 T/KZ5oeLtK+0r6hSe9uuZfBGKPsYOp5GQ5W1RXKHSP1aJMOkJgBxcjm71pvgClGFihXp
 opjHUO/9Hi5x5lCDOTqXJuOCGHw0ygw3uBVr7b5/vlnpLwxhoc+eXzsugl2sMwDsn/Sx
 Efkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VpqcMOXVlrjqv2u2QyFnc/vNdrKfYNKBg4oxbaB+0Q=;
 b=wQ0tbFYeZ7BWoWv6I/8ZxbBTZTsVClw165P0X0LPvB1ALY4IbBfPvFoM1Q5kA767Ec
 KWsqNaBmzDtKk6Pqe9qI7tt+RO1zA+fImbTX26lBBVq3iVMq2yWRUsxl0IEwTvkr2UuF
 7qLCgv8+E+U5CjyXGq3fkO8L33+CYlAzrMP4gO/jBUEVpnJKFEC7X58XMRnPJkESl3pp
 TphBPkvVWAskwrJJYZlvHQPA2VkA/3KQpxFM1wzJ5JIiqtnptv6IP7iRkVFEkzVBKFQt
 GaOiMXno/vDJiaL3sw1TRbdrvZ2wOz6lGHJFq0u4yT7zXITynqQjkJisu3sD8EMCHoiV
 DisQ==
X-Gm-Message-State: AO0yUKX882xrpSOVtkeE2ZmPH0qPxAfibivzxLtvwIcBjuggvThobHKd
 HrdWuac84hbtvLD+XVEylr53T5QZ6vBs4NIKgPOdrA==
X-Google-Smtp-Source: AK7set/t/aBuZB9vcZH5dhDvSjapnVQaEZaY6pIrVjQI1paSN2L+LTZUToiXiD7ACBUEe8GZPp4c7w==
X-Received: by 2002:a05:6a20:6530:b0:cc:59a7:65ae with SMTP id
 n48-20020a056a20653000b000cc59a765aemr625929pzg.24.1677185046622; 
 Thu, 23 Feb 2023 12:44:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:44:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 12/13] target/arm: Do memory type alignment check when
 translation disabled
Date: Thu, 23 Feb 2023 10:43:41 -1000
Message-Id: <20230223204342.1093632-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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

If translation is disabled, the default memory type is Device,
which requires alignment checking.  This is more optimially done
early via the MemOp given to the TCG memory operation.

Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07d4100365..b1b664e0ad 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11867,6 +11867,37 @@ static inline bool fgt_svc(CPUARMState *env, int el)
         FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL1);
 }
 
+/*
+ * Return true if memory alignment should be enforced.
+ */
+static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    /* Check the alignment enable bit. */
+    if (sctlr & SCTLR_A) {
+        return true;
+    }
+
+    /*
+     * If translation is disabled, then the default memory type is
+     * Device(-nGnRnE) instead of Normal, which requires that alignment
+     * be enforced.  Since this affects all ram, it is most efficient
+     * to handle this during translation.
+     */
+    if (sctlr & SCTLR_M) {
+        /* Translation enabled: memory type in PTE via MAIR_ELx. */
+        return false;
+    }
+    if (el < 2 && (arm_hcr_el2_eff(env) & (HCR_DC | HCR_VM))) {
+        /* Stage 2 translation enabled: memory type in PTE. */
+        return false;
+    }
+    return true;
+#endif
+}
+
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
@@ -11936,8 +11967,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 {
     CPUARMTBFlags flags = {};
     int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
 
-    if (arm_sctlr(env, el) & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
@@ -12037,7 +12069,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     sctlr = regime_sctlr(env, stage1);
 
-    if (sctlr & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
-- 
2.34.1


