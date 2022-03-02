Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A04F4CB108
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:13:44 +0100 (CET)
Received: from localhost ([::1]:54542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWI3-0005gU-1h
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:13:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxm-0005qO-BE
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:47 -0500
Received: from [2a00:1450:4864:20::432] (port=35384
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxk-00088m-Li
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:46 -0500
Received: by mail-wr1-x432.google.com with SMTP id b5so4701407wrr.2
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+cFrQ0gYtD+BMJbyD47IQWGJju9cN+yG8odvU6RxmJ4=;
 b=boiE02vl76suB0S5OASrWRrGbYJc22XpqunH60k+nh+wls5jS4Rr3zft7IteLSXFhJ
 JFfuhTZ60iRzwyWagtgjp6xN9YGq/SXaGGm6PMK0lL+cZa4TQP5hnfDHVNvxNGbL/bDv
 +bBGIcY3K0eqLDRiMafci1DVx2IUTSSL7XXK9gSYvF/tHPlYa1i4CKmunZi4Li/LbyHb
 WDNGGSWmWQiepO2fStdRigQ+0lTJK6dirbKtR96/P6B6aBD7DwAvZcFjl8uBUTQtc7HY
 mswhzLX1xZUHzZxsoIhh2XRj03NXpW4NZYmIu1V6uslOZC42oaTaqF3gGNIdl3ntTYCr
 sJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+cFrQ0gYtD+BMJbyD47IQWGJju9cN+yG8odvU6RxmJ4=;
 b=bWNXbnRal4vEf6lasTB2j4fu/U5Xhh0TmfxSYW0LHn0zNhufx9jmmURxP8GEb1tlqJ
 lA7UHNJ6cDcaaerVsNKzaj7WHY5TL6amV/m57pAq8R0eQSsN6ixLSxuvPQhIBlppROi9
 +6oz9o9mdudh1NVgmxF3XCpCqBhVhNmkhULveFRF+qIKrUti1CA4VCJwvZzJ45TzkgCz
 tj2sqQxLqmzD4vtlcldwvBx7xCR6q/3t13gUzK09qhz6ExNj35HyBq71u9DQs16bZ/TF
 UpPZmT6tqLgmRG5e5N9WMn899anGgboE+fKA95UTqoCzG9gXPzh/mLdb6s8PaFgUaWF/
 kFYg==
X-Gm-Message-State: AOAM532jB7ZUhKaSllhz5TiMMncO6wIwgxE8TFGJcQ8eobH+xU5eLzQ2
 ho+o2uxS5hoQS09QeUhvzeWu+fz9OQ2Quw==
X-Google-Smtp-Source: ABdhPJy/hJ1be/cPtc1VlDmsOZeeKvvkgEdCH1hqmqz2Pe7pSEHCj21ukkNBM8WNCHDYR9NH+XZ0Pw==
X-Received: by 2002:a5d:534a:0:b0:1f0:48f2:5f7c with SMTP id
 t10-20020a5d534a000000b001f048f25f7cmr1501899wrv.138.1646254363192; 
 Wed, 02 Mar 2022 12:52:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/26] target/arm: Pass outputsize down to check_s2_mmu_setup
Date: Wed,  2 Mar 2022 20:52:16 +0000
Message-Id: <20220302205230.2122390-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Pass down the width of the output address from translation.
For now this is still just PAMax, but a subsequent patch will
compute the correct value from TCR_ELx.{I}PS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 71e575f352e..431b0c14052 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11065,7 +11065,7 @@ do_fault:
  * false otherwise.
  */
 static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                               int inputsize, int stride)
+                               int inputsize, int stride, int outputsize)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -11081,22 +11081,19 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
-        CPUARMState *env = &cpu->env;
-        unsigned int pamax = arm_pamax(cpu);
-
         switch (stride) {
         case 13: /* 64KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 42)) {
+            if (level == 0 || (level == 1 && outputsize <= 42)) {
                 return false;
             }
             break;
         case 11: /* 16KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 40)) {
+            if (level == 0 || (level == 1 && outputsize <= 40)) {
                 return false;
             }
             break;
         case 9: /* 4KB Pages.  */
-            if (level == 0 && pamax <= 42) {
+            if (level == 0 && outputsize <= 42) {
                 return false;
             }
             break;
@@ -11105,8 +11102,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         }
 
         /* Inputsize checks.  */
-        if (inputsize > pamax &&
-            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
+        if (inputsize > outputsize &&
+            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
         }
@@ -11392,7 +11389,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     target_ulong page_size;
     uint32_t attrs;
     int32_t stride;
-    int addrsize, inputsize;
+    int addrsize, inputsize, outputsize;
     TCR *tcr = regime_tcr(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
@@ -11422,11 +11419,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
+        outputsize = arm_pamax(cpu);
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
         addrsize = (mmu_idx == ARMMMUIdx_Stage2 ? 40 : 32);
         inputsize = addrsize - param.tsz;
+        outputsize = 40;
     }
 
     /*
@@ -11511,7 +11510,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         /* Check that the starting level is valid. */
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
-                                inputsize, stride);
+                                inputsize, stride, outputsize);
         if (!ok) {
             fault_type = ARMFault_Translation;
             goto do_fault;
-- 
2.25.1


