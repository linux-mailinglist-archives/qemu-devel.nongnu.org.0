Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDC4DBE2E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:23:32 +0100 (CET)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUibj-00054V-5D
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:23:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKu-0001KQ-13
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:09 -0400
Received: from [2607:f8b0:4864:20::1030] (port=46897
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKr-0002HG-Tj
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:07 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso362972pjb.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EnAEYpcIY00+k1hPlmrXoRht11ltOEwUcRv8uGR7V3g=;
 b=RJzjZBB+Yj8UZxHdi1xxNdn5hD1i5MgnCw2ImHyf+JPjIwO3NRg0odjKKjkIU+u0lo
 +ZGdIYaGDt3/snHlCGZQa6PsFD1Xt7m/582TmHJO9QEVdlUpIZ8Cv6R85ZTmdbPhIDJV
 R4Xq8qm0d064T5Sdbbvc0x55Rcx0CaGpjkjjBP6CdVc7V17sYkKZy3z1Ml+ILElCUcHg
 llCT5EkToSRfXynS814bfiQQXjBwgoagsRane411K1O/CBSydjsUP4kpVoCTGvE4qJeN
 yi91CqE+vX5UQg1XTOPaArqNx681hl5QXYsTrZxUpZM0GWbhsISxqyv/ZALk40aRs9e9
 LVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EnAEYpcIY00+k1hPlmrXoRht11ltOEwUcRv8uGR7V3g=;
 b=1CqUUpVa978Iic1kPeUKgBVw7H3/TQ6RxGafx9hQNOSC0ZVhXBGERxwXCpshW4v6KG
 cI4oj2wR5+enfb+HBXPLngMiWDWsjrQ/ItlYlHXHxWqbJWrCkTOlqRCE7v5xaoAB9nnW
 ALnXvG4LlgCNHV8xY4n+TpCej+LHcS5+ekP5oIpz+RESp5EXsGQIJKCDmUGa13XOi8ya
 hpPKGFoiTeHaxO10mGmI7XSe+MMFe02wx5AXpftnWrvgH8E7zN+TNZME2+Ewru3PZOic
 JRBlMxQg3jSd/EzFaYcTcn72QICMMpmEeI/3eSCNwb6IoF2q6k77be2sama9uHHCedh+
 bLqQ==
X-Gm-Message-State: AOAM533K2EqPO3+OmvZSyaD09G1kp/LBjBwl1sFUc1Oc+6ghtB6Qc6s3
 iIpMtAR/o/0Anxxrr7YxseWlLB3ft8m1Lw==
X-Google-Smtp-Source: ABdhPJw4xISSsCfbLC1Y85IUPMAt37rA6oYZhmN6FTCm6/4pY251imxQVqu3w+ZzGyYoMzeV4J7+/A==
X-Received: by 2002:a17:902:6a88:b0:151:f21d:b03e with SMTP id
 n8-20020a1709026a8800b00151f21db03emr3381346plk.33.1647493564591; 
 Wed, 16 Mar 2022 22:06:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 25/51] target/nios2: Clean up handling of tlbmisc
 in do_exception
Date: Wed, 16 Mar 2022 22:05:12 -0700
Message-Id: <20220317050538.924111-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 4 lower bits, D, PERM, BAD, DBL, are unconditionally set on any
exception with EH=0, or so says Table 42 (Processor Status After
Taking Exception).

We currently do not set PERM or BAD at all, and only set/clear
DBL for tlb miss, and do not clear DBL for any other exception.

It is a bit confusing to set D in tlb_fill and the rest during
do_interrupt, so move the setting of D to do_interrupt as well.
To do this, split EXP_TLBD into two cases, EXCP_TLB_X and EXCP_TLB_D,
which allows us to distinguish them during do_interrupt.  Choose
a value for EXCP_TLB_D such that when truncated it produces the
correct value for exception.CAUSE.

Rename EXCP_TLB[RWX] to EXCP_PERM_[RWX], to emphasize that the
exception is permissions related.  Rename EXCP_SUPER[AD] to
EXCP_SUPERA_[DX] to emphasize that they are both "supervisor
address" exceptions, data and execute.

Retain the setting of tlbmisc.WE for the fast-tlb-miss path, as it
is being relied upon, but remove it from the permission path.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    |  13 +++---
 target/nios2/helper.c | 102 +++++++++++++++++++++++++++++-------------
 2 files changed, 77 insertions(+), 38 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index d003af5afc..c925cdd8e3 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -166,13 +166,14 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_UNALIGN  6
 #define EXCP_UNALIGND 7
 #define EXCP_DIV      8
-#define EXCP_SUPERA   9
+#define EXCP_SUPERA_X 9
 #define EXCP_SUPERI   10
-#define EXCP_SUPERD   11
-#define EXCP_TLBD     12
-#define EXCP_TLBX     13
-#define EXCP_TLBR     14
-#define EXCP_TLBW     15
+#define EXCP_SUPERA_D 11
+#define EXCP_TLB_X    12
+#define EXCP_TLB_D    (0x1000 | EXCP_TLB_X)
+#define EXCP_PERM_X   13
+#define EXCP_PERM_R   14
+#define EXCP_PERM_W   15
 #define EXCP_MPUI     16
 #define EXCP_MPUD     17
 
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index afbafd1fdc..8b69918ba3 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -49,7 +49,8 @@ void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
 
 #else /* !CONFIG_USER_ONLY */
 
-static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
+static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
+                         uint32_t tlbmisc_set, bool is_break)
 {
     CPUNios2State *env = &cpu->env;
     CPUState *cs = CPU(cpu);
@@ -68,6 +69,16 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
 
         if (cpu->mmu_present) {
             new_status |= CR_STATUS_EH;
+
+            /*
+             * There are 4 bits that are always written.
+             * Explicitly clear them, to be set via the argument.
+             */
+            env->ctrl[CR_TLBMISC] &= ~(CR_TLBMISC_D |
+                                       CR_TLBMISC_PERM |
+                                       CR_TLBMISC_BAD |
+                                       CR_TLBMISC_DBL);
+            env->ctrl[CR_TLBMISC] |= tlbmisc_set;
         }
     }
 
@@ -83,13 +94,14 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
 
 static void do_iic_irq(Nios2CPU *cpu)
 {
-    do_exception(cpu, cpu->exception_addr, false);
+    do_exception(cpu, cpu->exception_addr, 0, false);
 }
 
 void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
+    uint32_t tlbmisc_set = 0;
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         const char *name = NULL;
@@ -98,20 +110,21 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         case EXCP_IRQ:
             name = "interrupt";
             break;
-        case EXCP_TLBD:
+        case EXCP_TLB_X:
+        case EXCP_TLB_D:
             if (env->ctrl[CR_STATUS] & CR_STATUS_EH) {
                 name = "TLB MISS (double)";
             } else {
                 name = "TLB MISS (fast)";
             }
             break;
-        case EXCP_TLBR:
-        case EXCP_TLBW:
-        case EXCP_TLBX:
+        case EXCP_PERM_R:
+        case EXCP_PERM_W:
+        case EXCP_PERM_X:
             name = "TLB PERM";
             break;
-        case EXCP_SUPERA:
-        case EXCP_SUPERD:
+        case EXCP_SUPERA_X:
+        case EXCP_SUPERA_D:
             name = "SUPERVISOR (address)";
             break;
         case EXCP_SUPERI:
@@ -149,38 +162,60 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         do_iic_irq(cpu);
         break;
 
-    case EXCP_TLBD:
-        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
-            do_exception(cpu, cpu->fast_tlb_miss_addr, false);
+    case EXCP_TLB_D:
+        tlbmisc_set = CR_TLBMISC_D;
+        /* fall through */
+    case EXCP_TLB_X:
+        if (env->ctrl[CR_STATUS] & CR_STATUS_EH) {
+            tlbmisc_set |= CR_TLBMISC_DBL;
+            /*
+             * Normally, we don't write to tlbmisc unless !EH,
+             * so do it manually for the double-tlb miss exception.
+             */
+            env->ctrl[CR_TLBMISC] &= ~(CR_TLBMISC_D |
+                                       CR_TLBMISC_PERM |
+                                       CR_TLBMISC_BAD);
+            env->ctrl[CR_TLBMISC] |= tlbmisc_set;
+            do_exception(cpu, cpu->exception_addr, 0, false);
         } else {
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
-            do_exception(cpu, cpu->exception_addr, false);
+            /*
+             * ??? Implicitly setting tlbmisc.WE for the fast-tlb-miss
+             * handler appears to be out of spec.  But, the linux kernel
+             * handler relies on it, writing to tlbacc without first
+             * setting tlbmisc.WE.
+             */
+            tlbmisc_set |= CR_TLBMISC_WE;
+            do_exception(cpu, cpu->fast_tlb_miss_addr, tlbmisc_set, false);
         }
         break;
 
-    case EXCP_TLBR:
-    case EXCP_TLBW:
-    case EXCP_TLBX:
-        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
-        }
-        do_exception(cpu, cpu->exception_addr, false);
+    case EXCP_PERM_R:
+    case EXCP_PERM_W:
+        tlbmisc_set = CR_TLBMISC_D;
+        /* fall through */
+    case EXCP_PERM_X:
+        tlbmisc_set |= CR_TLBMISC_PERM;
+        do_exception(cpu, cpu->exception_addr, tlbmisc_set, false);
+        break;
+
+    case EXCP_SUPERA_D:
+    case EXCP_UNALIGN:
+        tlbmisc_set = CR_TLBMISC_D;
+        /* fall through */
+    case EXCP_SUPERA_X:
+    case EXCP_UNALIGND:
+        tlbmisc_set |= CR_TLBMISC_BAD;
+        do_exception(cpu, cpu->exception_addr, tlbmisc_set, false);
         break;
 
-    case EXCP_SUPERA:
     case EXCP_SUPERI:
-    case EXCP_SUPERD:
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
-    case EXCP_UNALIGN:
-    case EXCP_UNALIGND:
-        do_exception(cpu, cpu->exception_addr, false);
+        do_exception(cpu, cpu->exception_addr, 0, false);
         break;
 
     case EXCP_BREAK:
-        do_exception(cpu, cpu->exception_addr, true);
+        do_exception(cpu, cpu->exception_addr, 0, true);
         break;
 
     case EXCP_SEMIHOST:
@@ -235,7 +270,7 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
-    unsigned int excp = EXCP_TLBD;
+    unsigned int excp;
     target_ulong vaddr, paddr;
     Nios2MMULookup lu;
     unsigned int hit;
@@ -262,7 +297,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             if (probe) {
                 return false;
             }
-            cs->exception_index = EXCP_SUPERA;
+            cs->exception_index = (access_type == MMU_INST_FETCH
+                                   ? EXCP_SUPERA_X : EXCP_SUPERA_D);
             env->ctrl[CR_BADADDR] = address;
             cpu_loop_exit_restore(cs, retaddr);
         }
@@ -283,8 +319,10 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         }
 
         /* Permission violation */
-        excp = (access_type == MMU_DATA_LOAD ? EXCP_TLBR :
-                access_type == MMU_DATA_STORE ? EXCP_TLBW : EXCP_TLBX);
+        excp = (access_type == MMU_DATA_LOAD ? EXCP_PERM_R :
+                access_type == MMU_DATA_STORE ? EXCP_PERM_W : EXCP_PERM_X);
+    } else {
+        excp = (access_type == MMU_INST_FETCH ? EXCP_TLB_X: EXCP_TLB_D);
     }
 
     if (probe) {
-- 
2.25.1


