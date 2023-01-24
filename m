Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684CF678C8B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:06:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kT-0000Un-Qv; Mon, 23 Jan 2023 19:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kQ-0000Rt-NL
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:10 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kO-0001td-50
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:10 -0500
Received: by mail-pg1-x535.google.com with SMTP id d10so10220489pgm.13
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUf95rwr1zmpxbrt8VlVK1sP2Ifcp9yoQEapeTzLdPY=;
 b=eX/lxgo3zg6dhSxlEM6WNjB9u3GhW1AB6yXByxuWPTTc3kCMCR+eEecJRy/zq1JAyl
 noPtNqdW67wExKtPo/Cq6beVXxCVrhI/w1rQ5e6bFDWr/uz8pA6w46UQN1yFuUOhRIB8
 qFDfz4Oc5l6HsJscHHTOwwAnp1SXRRiiT5767Jc8j3BIOmOd2ZMnUV+RW/F1Z4yT34T/
 XeyMt+a1xglwsQvAKDGlrkVNsUgQzwQg2Md488L8EhV+wwfzliqMlb2HIJPQdO3nTNXk
 9cWOB9WSIUjZj4ED5prU1qIVRgnV4xiUiIhu6Dy6RIz4272xNl7hoMBXJZFrCWfHBika
 KBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUf95rwr1zmpxbrt8VlVK1sP2Ifcp9yoQEapeTzLdPY=;
 b=eWM4Hf+fDVzuZPW0TSuP6LKgUvli3eyBxHmjZHa/kUEEAaGwJgZFPGp8j1UuoUf104
 CN7OZAtCdWBmtjfjLCO3+ktq0twugbConzjIYsrMbVZA8cDUfp0le13t5j64bKvd9JKx
 IH6oQaTDQJDRoqo817Jk24OQ7GZEhyJMp3qe6b0i9YoxIgg+1yEEtOecNLa4Cs7MqWmg
 uzFxXrhgssYuJtLtkempbW6i8TkIA4KYveAWVxprIzIJnEZA0SQmm2+BSyYegBDLneWj
 9iYZszjlEJDtajk9jtz+CKIjpOmDvvK5qJsyjFIT+le5ab/6YmsPbeZuoiiBGF2HWrUA
 QZ+w==
X-Gm-Message-State: AFqh2kps6b1omQEhoUIOdsRgARTaNfoLPO7pc1TZNTBDXAkfu1+A96sk
 L7suGKtpo3Ir0kAK/Joe3Ft5mkJ7QDrrAU8U
X-Google-Smtp-Source: AMrXdXuzsCnscctoTnzdxaear32uQTIHwDKzFEFF77LusWV6o7BO4EMCEbrIcwO6yQRdkp8xxGOB0Q==
X-Received: by 2002:a62:148d:0:b0:58b:ca43:9c05 with SMTP id
 135-20020a62148d000000b0058bca439c05mr23674453pfu.16.1674518467325; 
 Mon, 23 Jan 2023 16:01:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 12/22] target/arm: NSTable is RES0 for the RME EL3 regime
Date: Mon, 23 Jan 2023 14:00:17 -1000
Message-Id: <20230124000027.3565716-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Test in_space instead of in_secure so that we don't switch
out of Root space.  Handle the output space change immediately,
rather than try and combine the NSTable and NS bits later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c1b0b8e610..ddafb1f329 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1240,7 +1240,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 {
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = ptw->in_secure;
     int32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1256,7 +1255,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
-    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1417,29 +1415,29 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddrmask = MAKE_64BIT_MASK(0, 40);
     }
     descaddrmask &= ~indexmask_grainsize;
-
-    /*
-     * Secure accesses start with the page table in secure memory and
-     * can be downgraded to non-secure at any step. Non-secure accesses
-     * remain non-secure. We implement this by just ORing in the NSTable/NS
-     * bits at each step.
-     */
-    tableattrs = is_secure ? 0 : (1 << 4);
+    tableattrs = 0;
 
  next_level:
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
-    nstable = extract32(tableattrs, 4, 1);
-    if (nstable && ptw->in_secure) {
-        /*
-         * Stage2_S -> Stage2 or Phys_S -> Phys_NS
-         * Assert that the non-secure idx are even, and relative order.
-         */
+
+    /*
+     * Process the NSTable bit from the previous level.  This changes
+     * the table address space and the output space from Secure to
+     * NonSecure.  With RME, the EL3 translation regime does not change
+     * from Root to NonSecure.
+     */
+    if (extract32(tableattrs, 4, 1) && ptw->in_space == ARMSS_Secure) {
+        /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
         ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
+        ptw->in_space = ARMSS_NonSecure;
+        result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
+
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
         goto do_fault;
     }
@@ -1542,7 +1540,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
     if (!regime_is_stage2(mmu_idx)) {
-        attrs |= nstable << 5; /* NS */
         if (!param.hpd) {
             attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
             /*
-- 
2.34.1


