Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22844C1EC9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:43:50 +0100 (CET)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0MP-0001um-R5
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:43:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Aq-0006kx-IS
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:52 -0500
Received: from [2607:f8b0:4864:20::431] (port=35511
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Ao-0001Df-I3
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:52 -0500
Received: by mail-pf1-x431.google.com with SMTP id l19so217138pfu.2
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
 b=qci+ATQTMvD+ZRQvRNzNY3SFlHbue3ZUY+cebS/Zwj2QLeycJ7oqNnHFZCnw/zGNXd
 FbvUOd+hMLUOjiR6yCB5RkV64k/+ZCikHlYqti+f/1dElrrA7sqH0rHbeBZtD6UFFUQd
 2mxHpKOmSXsHZHUf0qf8irBBXkQGyWhrTlvDiFMN5nz3SkROpxmawZXlazUrHykhs9/7
 Inu007DSVGGvpvT47d1+i4KkcFYbZTj+dkjnfdCcEMmdKaJOlfWPhfoqw6Q2Im1wFeoI
 0qjv57FvReuByNfWOrdKPriy2dy8Oftw1nCq7aUfx/7QFD7AEyx/X6LsZA0PRfJDBSzV
 jlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
 b=ZeIKGJOgmC4HjooSFv3Fw6+ASt3rrmJQKcM6o4v+A5UgbtY5tJuRjElvVsPzRnG9Yu
 K2dWyinZKqvxKUBgIZ/wn08GeRpHDG/0paXxT1wJUvEtY4Rh0D77cCkE7gcNEm1qM8zL
 1BQhybmUCqDYzEE5vkUiddpeyHrhP5EyF5YAbiRkwOaZnHwJfsTm8MI3HEDUPA+ihzhs
 lRb/yFA095Sl7Si80tYqNrf6lNn3OdM7btntDOnpMzXuy3LOBksWtXSI7PpiJNtEBCvk
 JNHTFZWmIkgjFJzqinS7EiQFpChqn9ujV7UNv8EvjTlA22XtimVHeBquyQLYrLUofHB2
 yfdA==
X-Gm-Message-State: AOAM530W9AJYO7nIMx5Q3cs3FvxZbUas8/TWj4vaRnRmP6rkbT+FRc0a
 X1kd7Cj19zDI0ipeEIefJ/DmCn/xdn22Mg==
X-Google-Smtp-Source: ABdhPJzZpRVUKB8Qvw74AY10KTm/w6s9Yol5I1U+o4fTP7/bicFk5Jq7do8bpt3ye80gxX2xH7YD0A==
X-Received: by 2002:a63:575d:0:b0:373:a27e:7c67 with SMTP id
 h29-20020a63575d000000b00373a27e7c67mr1412931pgm.558.1645655509245; 
 Wed, 23 Feb 2022 14:31:49 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/17] target/arm: Pass outputsize down to
 check_s2_mmu_setup
Date: Wed, 23 Feb 2022 12:31:25 -1000
Message-Id: <20220223223137.114264-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass down the width of the output address from translation.
For now this is still just PAMax, but a subsequent patch will
compute the correct value from TCR_ELx.{I}PS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 71e575f352..431b0c1405 100644
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


