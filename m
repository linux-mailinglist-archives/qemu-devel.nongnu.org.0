Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AFB51C985
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:47:59 +0200 (CEST)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhSB-0000Ad-0J
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYy-0003NN-LC; Thu, 05 May 2022 14:50:58 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:39024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYw-0004gQ-Cd; Thu, 05 May 2022 14:50:55 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-deb9295679so5095870fac.6; 
 Thu, 05 May 2022 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LBvah20Eci3anubbX1lkWP5DpEOBOGPp6xUC6Vi6VcY=;
 b=kMJqNReZ1jdUl5lLAOQtD6YIb55tm41bA+xstrxB39h9M2PknwOPatfYhWE08JCSZ4
 n/ZSU3wEIs6m8sZjHfMuozwBFJsKiqVIjOA1yDQmkUKRJFED3bi6PfyUYovRky3m3mg7
 c3pVBd+/7h5FUhGZ58xYliXJCtmZueq0Coc2tCq3VVWljDE5W3Keh5Dfg84eUVZV6qNK
 aD946r17wpCCB1gfHaBhZmHjne4aTW0lkIcT8q28VeLDI8vsEj1ftGuP5wuypHbxVNYZ
 +UpPRjSPbZVjGn7RrP1FTDA0xzAtNKtvvNm1W4RXeaKjAsC7NqBinXbMvLXvQUXPB/Sw
 SabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBvah20Eci3anubbX1lkWP5DpEOBOGPp6xUC6Vi6VcY=;
 b=ow0/jkFw2JzuAlri377vlO14Oce+6pXtyksuZvfUNhA3XRbvF8vmlVexJ8zPQeyXjW
 D0x1qi/DVOZbqlf1l0kSY587HZw6KMH3vPbkUm1b+xvIym8jwaShfkV5smg1c3sw+8vg
 76KTwpZWFpBuf5BiqBZwhL/OUI8PRbZ8STJj1dXqc/h08vUQn53Zx0L2OWjNRRyzZbiZ
 07UA52acov10ZlMbJSB2SDS8k5QOLsBoO5m+67kMX7SbUqyWCdZNexwTjbozCY0ohKy5
 pXZd5vhavEfiBk+6eYA9HyF3zOaKDPJaNmhDb/7To5eqrJkQ+HFjgHOyhJaG4FG7smPd
 zL4w==
X-Gm-Message-State: AOAM533W5cQlch69oMaCgBX6Hb4u/ckTTk0oI7ffuHonCWlqE+1iKuOv
 fcQ69tpu+XFy3URsKXiLDCmp1WFvOwc=
X-Google-Smtp-Source: ABdhPJzeQCipv83ojnzIU4DoOKTQcrGa5DBXG22nHGFCMqZ8TjvNc3NpouTTjBjNkMDuXbOsRpCnhQ==
X-Received: by 2002:a05:6870:15d0:b0:e9:8787:60c2 with SMTP id
 k16-20020a05687015d000b000e9878760c2mr2994952oad.294.1651776652807; 
 Thu, 05 May 2022 11:50:52 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 15/30] target/ppc: Remove msr_ee macro
Date: Thu,  5 May 2022 15:49:23 -0300
Message-Id: <20220505184938.351866-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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

msr_ee macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-8-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/cpu_init.c    | 15 ++++++++++-----
 target/ppc/excp_helper.c |  2 +-
 target/ppc/kvm.c         |  3 ++-
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 0d5a850794..06667c2c60 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -355,6 +355,7 @@ typedef enum {
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
 FIELD(MSR, ILE, MSR_ILE, 1)
+FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
@@ -478,7 +479,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_pow  ((env->msr >> MSR_POW)  & 1)
 #define msr_ce   ((env->msr >> MSR_CE)   & 1)
-#define msr_ee   ((env->msr >> MSR_EE)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 0c6b83406e..10e7c41bc9 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5949,7 +5949,8 @@ static bool cpu_has_work_POWER7(CPUState *cs)
         }
         return false;
     } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+        return FIELD_EX64(env->msr, MSR, EE) &&
+               (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
 
@@ -6120,7 +6121,8 @@ static bool cpu_has_work_POWER8(CPUState *cs)
         }
         return false;
     } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+        return FIELD_EX64(env->msr, MSR, EE) &&
+               (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
 
@@ -6337,7 +6339,8 @@ static bool cpu_has_work_POWER9(CPUState *cs)
         }
         return false;
     } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+        return FIELD_EX64(env->msr, MSR, EE) &&
+               (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
 
@@ -6551,7 +6554,8 @@ static bool cpu_has_work_POWER10(CPUState *cs)
         }
         return false;
     } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+        return FIELD_EX64(env->msr, MSR, EE) &&
+               (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
 
@@ -7119,7 +7123,8 @@ static bool ppc_cpu_has_work(CPUState *cs)
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
 
-    return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+    return FIELD_EX64(env->msr, MSR, EE) &&
+           (cs->interrupt_request & CPU_INTERRUPT_HARD);
 }
 
 static void ppc_cpu_reset(DeviceState *dev)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7e8e34ef06..4c206ba209 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1709,7 +1709,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
      * clear when coming out of some power management states (in order
      * for them to become a 0x100).
      */
-    async_deliver = (msr_ee != 0) || env->resume_as_sreset;
+    async_deliver = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
 
     /* Hypervisor decrementer exception */
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDECR)) {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 7a777a4d0c..db3a92869c 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1352,7 +1352,8 @@ static int kvmppc_handle_halt(PowerPCCPU *cpu)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
-    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD) && (msr_ee)) {
+    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD) &&
+        FIELD_EX64(env->msr, MSR, EE)) {
         cs->halted = 1;
         cs->exception_index = EXCP_HLT;
     }
-- 
2.32.0


