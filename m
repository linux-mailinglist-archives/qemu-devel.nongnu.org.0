Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C7E6A4F76
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:04:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVU-00009n-KA; Mon, 27 Feb 2023 18:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV9-0007tr-Q2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:55 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV6-00013D-Oo
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:47 -0500
Received: by mail-pl1-x631.google.com with SMTP id c1so8515417plg.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PP4E13jT/Sv96Ax+VfQqfeV0Z6Vd+p408nT+Z3wCuJQ=;
 b=uInLixzRQQtO0QsfPkZ79882CFSX6TYtQIKw/HkxQ3NVEtuHbRxS++K5clg+7Eg0pG
 akqGN4ujRdtHP8v0HnIMy/HZuFKIxatqNry0JrHbJipjh8BQjQsSQf8tqczJgyxUDtKi
 tNdkLzmzYPi5AXdFWNJO9Y3YLOjG8VaFFWBSvthN+hSU+0fo9gPGFm/MU9OVOyOl+YWC
 5NDPyO4IbdietvTGxrDSrX2rux8xJSoTHmQ11vkknk0zC9dB1CkANXB7hFsxmmxTc+hV
 KtUIVgX6JO7WzWgq+EJGJ18zavF2TasbdxAvsuL7DefTttAATHrPH9MEOHH2Qc7Eaxmt
 zSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PP4E13jT/Sv96Ax+VfQqfeV0Z6Vd+p408nT+Z3wCuJQ=;
 b=JCoMsXdx/+R3iHUGI86Dqa0hE1KISPhtbQ6VWCCWhoTFRUjpVXEWjSqcNSzXcsEUJo
 bsQx7EkNNVHi2tLYR56Qb6Ezzyzs9uu+BrqanaY/Do0MQBNySLkYcyVfSK7N9MtFQUwY
 Y9UeNj3926DjitqSfiYW860tYMG3fQQRgkIznT/yiT/8QX16Exl1+aQT+W+XivVV9rJG
 OgVdxsgyOY0oGMn7EixwURGpWWHueTV6yYSjYggk30kbLjz/lmoxiJYQSixWCc+9IzJ+
 LZgs7Ljm8hzPqBv1dYxAr/JGkP+2RDkRjl7xyNFUuCDPPvV3r8P1bOHRJqcLRwSn3k6b
 Swpw==
X-Gm-Message-State: AO0yUKWmjk7wgSbIKbY1Wweal4x0xF81l/pGcq0ySjiDfe6UQGD9gT+n
 YcBPZW48dJRESGrIrKHH4J08XWVEdkBaU2l3wrk=
X-Google-Smtp-Source: AK7set8LcO/Qy2VmaEcARFKk0TedwjDqU2t42f2CEZpuLppWhwrOxTfg27g3lEfvVsdLAJ0rkwbPZA==
X-Received: by 2002:a05:6a20:6915:b0:cb:cb17:eac6 with SMTP id
 q21-20020a056a20691500b000cbcb17eac6mr999586pzj.32.1677538903324; 
 Mon, 27 Feb 2023 15:01:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 11/21] target/arm: NSTable is RES0 for the RME EL3
 regime
Date: Mon, 27 Feb 2023 13:01:12 -1000
Message-Id: <20230227230122.816702-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 75f276b520..0c07e5e24f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1242,7 +1242,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 {
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = ptw->in_secure;
     int32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1258,7 +1257,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
-    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1419,20 +1417,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
+
+    /*
+     * Process the NSTable bit from the previous level.  This changes
+     * the table address space and the output space from Secure to
+     * NonSecure.  With RME, the EL3 translation regime does not change
+     * from Root to NonSecure.
+     */
+    if (extract32(tableattrs, 4, 1) && ptw->in_space == ARMSS_Secure) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
          * Assert the relative order of the secure/non-secure indexes.
@@ -1441,7 +1438,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
@@ -1544,7 +1545,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
     if (!regime_is_stage2(mmu_idx)) {
-        attrs |= nstable << 5; /* NS */
+        attrs |= !ptw->in_secure << 5; /* NS */
         if (!param.hpd) {
             attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
             /*
-- 
2.34.1


