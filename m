Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBED651C9E7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 22:05:21 +0200 (CEST)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhiy-00052t-94
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 16:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZb-0003xM-IY; Thu, 05 May 2022 14:51:38 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:35943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZY-0004sT-8U; Thu, 05 May 2022 14:51:35 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-edeb6c3642so5109680fac.3; 
 Thu, 05 May 2022 11:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Chk0RINyrs3VC8UL+UPYQkDpM9x5xllD+vsKhxm4sfM=;
 b=e7au+DnA80YcxCewrvqIIhtYpxiwN6ib+SpfbB5IB02b/KozZ/YLLQxozDjy6dJ5Vn
 Se1qG9hYt4ZqSSZNh4HSi+/9RCe8GEIWzS3rMn9l2vuOxYMR2TVW2S+Vy0YmEmOishoa
 ps/1y9+l2h1VdqQfhjm7pwxFvTyZd2b9ueaHi11+CrzXNJiigfvjr4eDqljKUf2r75Zi
 Dv9MjuIrvC/H7SR5ypN6dXLSsvrHOTgFk7Un/hBfhZa5riZCv1rn9Ry2srNAlQ7OwyQW
 E8FQC5c3PEZABo3tB0+t/3spevY7JNbFowoKNm3DmbGx/kwNN4V6NZPX8lmkfxka4ytq
 uNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Chk0RINyrs3VC8UL+UPYQkDpM9x5xllD+vsKhxm4sfM=;
 b=EZSd5jTlAeaIn/tqbN7Xi7CdTxgYXymNfVk30CJyt9bMuz7tdpv6XPy3lFyhn+Xs8S
 uQaKQu/Xhh8u+KAiWucJHynE+JzNcS/D30XP7CB55XXJLm7gq+EwtR+UVncU6tATGFPS
 0TrIsZNCejhmjKWZC9bEw0bcCFknd4MeoE+Tu/Xv1Cp7mxWeA8muUFUTeoYev8ZQWDJQ
 WdlaMRfc4Biz+TGf0S5+v9Pdss8RUSsFBFkrcPG8yFk1ha81pOjx12TLNk5O89WJV++R
 kuZ6uVlcm96PCfOyYNU2KhjKxUvLhtoLxadHwlJCcdr27Cjhq1fcHee7sYl1wvMFqapV
 xU5Q==
X-Gm-Message-State: AOAM5322B4VTpiiwNx7KdrpirgeoFk1z0ZnYdZjjZ5ZRgl1l94znnsVd
 L27/h9Kma8xbbmXmeBzyhmBaWOXzMuY=
X-Google-Smtp-Source: ABdhPJzVCMq6/DLstsnOIggEL49GYxd80kaeytsJAtaY00JF02ldYf+piuQNTEIILFPo+BrZWw1LIQ==
X-Received: by 2002:a05:6870:f728:b0:ed:9d92:7ba3 with SMTP id
 ej40-20020a056870f72800b000ed9d927ba3mr2950371oab.177.1651776690528; 
 Thu, 05 May 2022 11:51:30 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 27/30] target/ppc: Remove msr_hv macro
Date: Thu,  5 May 2022 15:49:35 -0300
Message-Id: <20220505184938.351866-28-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

msr_hv macro hides the usage of env->msr, which is a bad
behavior. Substitute it with FIELD_EX64 calls that explicitly use
env->msr as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-20-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         | 11 ++++++-----
 target/ppc/cpu_init.c    |  6 ++++--
 target/ppc/excp_helper.c |  8 ++++----
 target/ppc/mem_helper.c  |  4 ++--
 target/ppc/misc_helper.c |  2 +-
 target/ppc/mmu-radix64.c |  6 +++---
 6 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5ac7d7d68f..9f19b3c0a8 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,12 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+#if defined(TARGET_PPC64)
+FIELD(MSR, HV, MSR_HV, 1)
+#define FIELD_EX64_HV(storage) FIELD_EX64(storage, MSR, HV)
+#else
+#define FIELD_EX64_HV(storage) 0
+#endif
 FIELD(MSR, TS, MSR_TS0, 2)
 FIELD(MSR, CM, MSR_CM, 1)
 FIELD(MSR, GS, MSR_GS, 1)
@@ -489,11 +495,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define HFSCR_MSGP     PPC_BIT(53) /* Privileged Message Send Facilities */
 #define HFSCR_IC_MSGP  0xA
 
-#if defined(TARGET_PPC64)
-#define msr_hv   ((env->msr >> MSR_HV)   & 1)
-#else
-#define msr_hv   (0)
-#endif
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 10e7c41bc9..d4c7813de5 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6305,7 +6305,8 @@ static bool cpu_has_work_POWER9(CPUState *cs)
         if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !msr_hv || FIELD_EX64(env->msr, MSR, PR)) {
+            if (!heic || !FIELD_EX64_HV(env->msr) ||
+                FIELD_EX64(env->msr, MSR, PR)) {
                 return true;
             }
         }
@@ -6520,7 +6521,8 @@ static bool cpu_has_work_POWER10(CPUState *cs)
         if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !msr_hv || FIELD_EX64(env->msr, MSR, PR)) {
+            if (!heic || !FIELD_EX64_HV(env->msr) ||
+                FIELD_EX64(env->msr, MSR, PR)) {
                 return true;
             }
         }
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index aa201c63c6..cb752b184a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1715,7 +1715,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDECR)) {
         /* LPCR will be clear when not supported so this will work */
         bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
-        if ((async_deliver || msr_hv == 0) && hdice) {
+        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
             /* HDEC clears on delivery */
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDECR);
             powerpc_excp(cpu, POWERPC_EXCP_HDECR);
@@ -1727,7 +1727,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_HVIRT)) {
         /* LPCR will be clear when not supported so this will work */
         bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
-        if ((async_deliver || msr_hv == 0) && hvice) {
+        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
             powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
             return;
         }
@@ -1738,9 +1738,9 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
         bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
         /* HEIC blocks delivery to the hypervisor */
-        if ((async_deliver && !(heic && msr_hv &&
+        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
             !FIELD_EX64(env->msr, MSR, PR))) ||
-            (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
+            (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
             if (books_vhyp_promotes_external_to_hvirt(cpu)) {
                 powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
             } else {
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 9af135e88e..d1163f316c 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -612,11 +612,11 @@ void helper_tbegin(CPUPPCState *env)
     env->spr[SPR_TEXASR] =
         (1ULL << TEXASR_FAILURE_PERSISTENT) |
         (1ULL << TEXASR_NESTING_OVERFLOW) |
-        (msr_hv << TEXASR_PRIVILEGE_HV) |
+        (FIELD_EX64_HV(env->msr) << TEXASR_PRIVILEGE_HV) |
         (FIELD_EX64(env->msr, MSR, PR) << TEXASR_PRIVILEGE_PR) |
         (1ULL << TEXASR_FAILURE_SUMMARY) |
         (1ULL << TEXASR_TFIAR_EXACT);
-    env->spr[SPR_TFIAR] = env->nip | (msr_hv << 1) |
+    env->spr[SPR_TFIAR] = env->nip | (FIELD_EX64_HV(env->msr) << 1) |
                           FIELD_EX64(env->msr, MSR, PR);
     env->spr[SPR_TFHAR] = env->nip + 4;
     env->crf[0] = 0xB; /* 0b1010 = transaction failure */
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 06aa716cab..b0a5e7ce76 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -73,7 +73,7 @@ void helper_hfscr_facility_check(CPUPPCState *env, uint32_t bit,
                                  const char *caller, uint32_t cause)
 {
 #ifdef TARGET_PPC64
-    if ((env->msr_mask & MSR_HVB) && !msr_hv &&
+    if ((env->msr_mask & MSR_HVB) && !FIELD_EX64(env->msr, MSR, HV) &&
                                      !(env->spr[SPR_HFSCR] & (1UL << bit))) {
         raise_hv_fu_exception(env, bit, caller, cause, GETPC());
     }
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index e88f51fd34..21ac958e48 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -37,7 +37,7 @@ static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState *env,
         return false;
     }
 
-    if (msr_hv) { /* MSR[HV] -> Hypervisor/bare metal */
+    if (FIELD_EX64(env->msr, MSR, HV)) { /* MSR[HV] -> Hypervisor/bare metal */
         switch (eaddr & R_EADDR_QUADRANT) {
         case R_EADDR_QUADRANT0:
             *lpid = 0;
@@ -306,7 +306,7 @@ static bool validate_pate(PowerPCCPU *cpu, uint64_t lpid, ppc_v3_pate_t *pate)
     if (!(pate->dw0 & PATE0_HR)) {
         return false;
     }
-    if (lpid == 0 && !msr_hv) {
+    if (lpid == 0 && !FIELD_EX64(env->msr, MSR, HV)) {
         return false;
     }
     if ((pate->dw0 & PATE1_R_PRTS) < 5) {
@@ -431,7 +431,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
     *g_page_size = PRTBE_R_GET_RTS(prtbe0);
     base_addr = prtbe0 & PRTBE_R_RPDB;
     nls = prtbe0 & PRTBE_R_RPDS;
-    if (msr_hv || vhyp_flat_addressing(cpu)) {
+    if (FIELD_EX64(env->msr, MSR, HV) || vhyp_flat_addressing(cpu)) {
         /*
          * Can treat process table addresses as real addresses
          */
-- 
2.32.0


