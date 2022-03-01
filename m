Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF64C9821
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:05:09 +0100 (CET)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAcG-0006qw-82
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:05:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXY-0001HF-KU
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:16 -0500
Received: from [2607:f8b0:4864:20::435] (port=36659
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXV-0004wr-3c
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:16 -0500
Received: by mail-pf1-x435.google.com with SMTP id z16so77534pfh.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
 b=lx/zx7CQmy7S+laRnK1Ai9SXcDDOkBCpkt2dczgZncBdqZ8lXGbfpdGWs31V1X8yhG
 HclFvpk0Ug62EJjCY0ghcLZjHEhn6BXaNy8/kvFnsueZANzfl3nSXkPvA68mwGWrerQz
 ktk6iw5s7bn83YEOC0y8LK6wljjLWdFcr2X4SgkSnmBjH3zdVJLqdL0Eda8hnJ4fXkia
 gaEbT/+jERDSi0nEKZSaCLb2ZADCDgNYNnNfRsBzufQiDRduaHrfJkEdeVt8ajfUKmOg
 dWm3Tbyfp4xgU6Q89PT+L92eD57PnpWdpk/hXKuRpOeM/P7j6ATwF7TIktxUQ+gzKZDm
 Ef3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
 b=C0vgEFtyMJhEzU/vzrCr2nCBhoGFKwym64+rixRwjR5vc6rtmO9yUvItKWHx120fwn
 gm2wxbrF5pirFshCo1KJxXc7dd/qglsYifg0MRGNkS5UNwzaVhSRD+95tMCe/iti8KtU
 St4EGOGYa09abh7bXUQRMeIiVxoXXLNyapX84immnJ1liQwtZ+Dx4RLs/ZMzdaBCu3DW
 7lNgAb8aX00N+kLSfe1fxAuTUnIdEH2+aUWKXOFgu1v9lpxSdMjUaRaSGkXKZJ7EVY7j
 zyfctsxGXjVSkBTURqnm1bRf/Vsr+cQayO1d4FkiWywZbk30CHdec+kOig9WTQU0eIJD
 G1RQ==
X-Gm-Message-State: AOAM5338CH1jH3FXYItt/Mq9zW9Uzz32BnBC3d0iI667+hlzmIPmejyT
 46KKhiBmjzZmrXiHKwMjxPn+AC79npYRMA==
X-Google-Smtp-Source: ABdhPJwK0vGv5f4s3xA2uSrWs43eUyFt+yvSf7JTEiAnizyYMy9tCvouJHferqBSVV1X978KmdJePg==
X-Received: by 2002:a65:6d0a:0:b0:373:9242:3a13 with SMTP id
 bf10-20020a656d0a000000b0037392423a13mr23744681pgb.452.1646172011103; 
 Tue, 01 Mar 2022 14:00:11 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/18] target/arm: Pass outputsize down to
 check_s2_mmu_setup
Date: Tue,  1 Mar 2022 11:59:45 -1000
Message-Id: <20220301215958.157011-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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


