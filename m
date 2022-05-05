Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596D51C984
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:47:32 +0200 (CEST)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhRj-0007iw-7M
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZ3-0003OK-Nq; Thu, 05 May 2022 14:51:04 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:44105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZ1-0004Td-QU; Thu, 05 May 2022 14:51:01 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-ed9a75c453so5073268fac.11; 
 Thu, 05 May 2022 11:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=riZC2yH/14+rTa+pwyH/u67cIa6TS27zS9H9xOSroEk=;
 b=c59FyNOvVVs482+pFkFFBvi7dc+KyRMbUw181GgEqN2vzwrAJoHMlye/7TTehffxi8
 JeUfk9U6B94un3rUjiUjX04OlD8OZ7nue3dAUmYLWvuOsAeckA3A3IYoqks9zThMCaTx
 a3mQuJKL0Q02f6nLIFkDHI2IjCvKeu2cjftIQgYAfsce34HRm4cE1BZ41mQPfIumhd9R
 VGca9HALl1fgtOLnb9oWeXdMQC8CmOZSP84/8un+AvFDXUY7p+n/H4m/nwAG5/OF1tJ3
 xhXd+Rn0KUKWB7ulJxrquc/E4udSTE9kjBW58WICTl9s+O05yzF3+nkEtaor2bqnvaI0
 xWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=riZC2yH/14+rTa+pwyH/u67cIa6TS27zS9H9xOSroEk=;
 b=lb5Kk1sjoJJe1UTeZBkapKrQ2Q4kdaFbCtale5eKSSlnHIDhb4jvknroPPRGvyTqq3
 /LOTHNEKxmbg9WxruLxC7XS0c6M9eLJ7iN/loPrdrfzzoqIEp8fATQm0rl0pFgww8RWJ
 42ByeRRCDwvTCkqEebeDLNNoKKP7Rwf/mRw1/qozcm2fXfY2QctRfBtxUpV9I2BbBsov
 1KgoUl/yGJt5U1ZtuPyQvl6UEcwZNaVQoLZmGaJBjKzSxdlQ+Gde6xXhIAl4K8KsG1Pp
 j/g58MZ+GW5Tr/lzdrIJfJ3MENNs9V3dUeG3JKNSI12dmW/JcdWUazAiWhA5pMziByol
 IAYQ==
X-Gm-Message-State: AOAM530OPqeI3ev/1Lv6BGHgT8H2AFr+aMCe+V4khHrS9e1+ah+4ecJ8
 6BJphDm7CgKnxowAIDmEVMv5iMaQVPQ=
X-Google-Smtp-Source: ABdhPJx8jKKEL1LZ8okSYtty3RtXy3Mw23PydvNVhu8bHOy+HoDdforea+hcZqSt0NjXfXDnh0swOA==
X-Received: by 2002:a05:6870:f728:b0:ed:9d92:7ba3 with SMTP id
 ej40-20020a056870f72800b000ed9d927ba3mr2949499oab.177.1651776658741; 
 Thu, 05 May 2022 11:50:58 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 17/30] target/ppc: Remove msr_pow macro
Date: Thu,  5 May 2022 15:49:25 -0300
Message-Id: <20220505184938.351866-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

msr_pow macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-10-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/excp_helper.c | 12 ++++++------
 target/ppc/helper_regs.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b1883b23e2..5a83c4b028 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, POW, MSR_POW, 1)
 FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
 FIELD(MSR, EE, MSR_EE, 1)
@@ -478,7 +479,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #endif
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
-#define msr_pow  ((env->msr >> MSR_POW)  & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index ca80c1ed63..ee63641dd0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -661,7 +661,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
                       "exception %d with no HV support\n", excp);
         }
@@ -853,7 +853,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
                       "exception %d with no HV support\n", excp);
         }
@@ -1038,7 +1038,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
                       "exception %d with no HV support\n", excp);
         }
@@ -1248,7 +1248,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
         env->spr[SPR_BOOKE_ESR] = ESR_SPV;
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
                       "exception %d with no HV support\n", excp);
         }
@@ -1507,7 +1507,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
         /* A power-saving exception sets ME, otherwise it is unchanged */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             /* indicate that we resumed from power save mode */
             msr |= 0x10000;
             new_msr |= ((target_ulong)1 << MSR_ME);
@@ -1519,7 +1519,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
              */
             new_msr |= (target_ulong)MSR_HVB;
         } else {
-            if (msr_pow) {
+            if (FIELD_EX64(env->msr, MSR, POW)) {
                 cpu_abort(cs, "Trying to deliver power-saving system reset "
                           "exception %d with no HV support\n", excp);
             }
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 77bc57415c..79c0143a7a 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -261,7 +261,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
     env->msr = value;
     hreg_compute_hflags(env);
 #if !defined(CONFIG_USER_ONLY)
-    if (unlikely(msr_pow == 1)) {
+    if (unlikely(FIELD_EX64(env->msr, MSR, POW))) {
         if (!env->pending_interrupts && (*env->check_pow)(env)) {
             cs->halted = 1;
             excp = EXCP_HALTED;
-- 
2.32.0


