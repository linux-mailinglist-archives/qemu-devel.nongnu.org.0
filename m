Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5374B044C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:13:53 +0100 (CET)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0q8-000671-6a
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:13:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hN-0003x8-Il
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:49 -0500
Received: from [2607:f8b0:4864:20::1032] (port=44565
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hM-00047j-3l
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:49 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so4307810pjh.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kEVSOi5UkE1IrF02F4h1WkWrzoUBduclFFK91bx08AU=;
 b=YX6jH+v1OiS9An+7cc4yPISzo8OqdUTatWfsi9E9wwTMXef/fjm6nqNYZMeOKO5u1R
 nps0he/dQbeJ+DUKL6yHNrsHtfs4BdBHcsvwWB8XPuAjHBA0SVnBbdhOkiB/9Ecgz/RL
 fHt1NnRd8TgosGqW7I1tDM4xwbqcncO4iB9lXzaib9XIf7YDAjnM9f2G4NDkd1ixRheq
 YDUAgAu74laFveDoy3Mcsmghw0Rkqg4R6NPBchPocQzcHQHqHONUkG5gsJtIUB1g2tv9
 okmKN6c31101m+W7T7WQaRyS1wsp+M8z64Ym4TFdJIzMudGEC9D+kQ7PzJzLmJ1UnkGl
 3k5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kEVSOi5UkE1IrF02F4h1WkWrzoUBduclFFK91bx08AU=;
 b=iyqYGEqyo0aFunqvYUW59z4SqEUzOhym45e8ArAN9xO/fZWw4B/dBF8SFT/sK1v6ff
 QlRiukVTHM77uy/eMuwavY/KeiTlHDZVRjSwnpiNrJlj+NA/0Xs0qurB4aUqyjSEPzwQ
 jH7Rg5mLvE/kmaDTrNgedSU0/tfq47qS9Dh9cWj+02e4Obbg4aXfqZFNF6DBL5LVF/4A
 ucY2w6TUkHnoRlpmounGnS/3Ua12cxf7+hnpVSHRXjG+EFDVyMB+6BYH5YlL9wgbWUhN
 DhdS5nb7OjkpJ56kxH4++AY2f9G2FbuhA6Okeq9/EIZcqdMsM762BCdrw3BuyrcQ6AY5
 qa9A==
X-Gm-Message-State: AOAM530n0nJgzLCEQtF80lP9eTyzsG+M3T/mbDxmt2+l06KfT0pBa11o
 +psTjpSa17c6avn3h6OrrgbEK0QAU/4u4ms3
X-Google-Smtp-Source: ABdhPJz8Jn0JRUw6x62G0VbPLQZI80t/slSfi1HWgl0CHrOexz6N1gsWz3uVpYOUn8yWWJ9Dx3i75A==
X-Received: by 2002:a17:902:e74d:: with SMTP id
 p13mr5566798plf.42.1644465886866; 
 Wed, 09 Feb 2022 20:04:46 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:04:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/15] target/arm: Pass outputsize down to
 check_s2_mmu_setup
Date: Thu, 10 Feb 2022 15:04:13 +1100
Message-Id: <20220210040423.95120-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fa0824e12c..cf38ebd816 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11063,7 +11063,7 @@ do_fault:
  * false otherwise.
  */
 static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                               int inputsize, int stride)
+                               int inputsize, int stride, int outputsize)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -11079,22 +11079,19 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
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
@@ -11103,8 +11100,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         }
 
         /* Inputsize checks.  */
-        if (inputsize > pamax &&
-            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
+        if (inputsize > outputsize &&
+            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
         }
@@ -11390,7 +11387,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     target_ulong page_size;
     uint32_t attrs;
     int32_t stride;
-    int addrsize, inputsize;
+    int addrsize, inputsize, outputsize;
     TCR *tcr = regime_tcr(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
@@ -11420,11 +11417,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
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
@@ -11509,7 +11508,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         /* Check that the starting level is valid. */
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
-                                inputsize, stride);
+                                inputsize, stride, outputsize);
         if (!ok) {
             fault_type = ARMFault_Translation;
             goto do_fault;
-- 
2.25.1


