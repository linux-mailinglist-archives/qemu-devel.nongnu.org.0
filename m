Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7554C50A55C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:26:26 +0200 (CEST)
Received: from localhost ([::1]:46368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZdR-0000iu-Hy
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZr-0008Ve-2n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:39 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZn-0006NL-1q
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so8006346pjb.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S1AFcJlIUz3dV3PPNVPDmWmaZjsjbpbvIVwTRgZm7jI=;
 b=oFH4rSy1Nb1H8xIj08Fy48VrocEp7rjbJBq+6zD+XqVWEO9N9sjS/GdNXyW0Rk+5m6
 6KDlsex1vunTBRDtnvGBT0kKEaaP5/wREBcNV6Reu1UQhLDs0IW89FvKzRujphEyx4gm
 hu7r/0ivihZxVDX9tcZ1ClSLMwRyPCSuNZ9gw2hYYZ56yUwl6Ft6Jav0dWZpqrr5r+PS
 eoj2J4PwluHn/Bx5cl+AC5FrASkujWjWqBTcv3SpmiocnvnIihhleKFrrG6zUe0/uydQ
 FZLd5B+UDBJadx61tKw5cZOsiHF7GVXPZIB8fQBhG3X2psNiDu8WsoXYwNlx6r7FVOap
 QF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S1AFcJlIUz3dV3PPNVPDmWmaZjsjbpbvIVwTRgZm7jI=;
 b=iFp94cvyybXKhx7IZLsTZZa8VDzrSAKToD7kxBNCxtthSJHAjvI0IJp1rJLjuO2oy2
 fFTdd9kjZYSEnWmGcHcf2DhjGdrWkCOvu31t0uDccNJJ3Y3y2CyGR2bVIfeDXamcwwED
 YBkd5/ongrlErhRzvpTm0nXIjJdJgHft9tiQzicPCYTK8xPbURImmW5aMKe7wEbKCJpq
 KMrzufEZgxL6vAnesXYrjipH4CbdSoereiasEl9uOiZ0hEJ7mTc1gpbsErbfCBFT7Gh5
 6rrNhcn0BCaUmGQU+swfIIIn4ZfrWspEeVEt4iTQk3wUf99h3cR28hpN50KqORd1ADqE
 gHVA==
X-Gm-Message-State: AOAM532W8UqULqwwl5MCYy785JeVquXT3kK4eDXIX6kBCcMGLpzYCI3M
 iDSuPMvDnuWh++olhQ2MRSF2uxOlN7Qmgg==
X-Google-Smtp-Source: ABdhPJwAHrDCJ4ZRomOfvpt3YULIrymUPB3/WI8PuFRLpdUmeBst5rEN3QH9w2B8nmIYPB2RaCmO0w==
X-Received: by 2002:a17:90b:4f82:b0:1d1:b8fd:7e36 with SMTP id
 qe2-20020a17090b4f8200b001d1b8fd7e36mr11024827pjb.194.1650554313788; 
 Thu, 21 Apr 2022 08:18:33 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 36/64] target/nios2: Clean up handling of tlbmisc in
 do_exception
Date: Thu, 21 Apr 2022 08:17:07 -0700
Message-Id: <20220421151735.31996-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    | 13 +++---
 target/nios2/helper.c | 97 +++++++++++++++++++++++++++++--------------
 2 files changed, 73 insertions(+), 37 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 9e82100a1f..7189f9a45f 100644
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
index 3d9869453b..4d9085f22f 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -29,7 +29,8 @@
 #include "semihosting/semihost.h"
 
 
-static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
+static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
+                         uint32_t tlbmisc_set, bool is_break)
 {
     CPUNios2State *env = &cpu->env;
     CPUState *cs = CPU(cpu);
@@ -48,6 +49,16 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
 
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
 
@@ -63,13 +74,14 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
 
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
@@ -78,20 +90,21 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
@@ -129,38 +142,57 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
+            tlbmisc_set |= CR_TLBMISC_WE;
+            do_exception(cpu, cpu->fast_tlb_miss_addr, tlbmisc_set, false);
         }
         break;
 
-    case EXCP_TLBR:
-    case EXCP_TLBW:
-    case EXCP_TLBX:
-        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
+    case EXCP_PERM_R:
+    case EXCP_PERM_W:
+        tlbmisc_set = CR_TLBMISC_D;
+        /* fall through */
+    case EXCP_PERM_X:
+        tlbmisc_set |= CR_TLBMISC_PERM;
+        if (!(env->ctrl[CR_STATUS] & CR_STATUS_EH)) {
+            tlbmisc_set |= CR_TLBMISC_WE;
         }
-        do_exception(cpu, cpu->exception_addr, false);
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
@@ -215,7 +247,7 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
-    unsigned int excp = EXCP_TLBD;
+    unsigned int excp;
     target_ulong vaddr, paddr;
     Nios2MMULookup lu;
     unsigned int hit;
@@ -242,7 +274,8 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             if (probe) {
                 return false;
             }
-            cs->exception_index = EXCP_SUPERA;
+            cs->exception_index = (access_type == MMU_INST_FETCH
+                                   ? EXCP_SUPERA_X : EXCP_SUPERA_D);
             env->ctrl[CR_BADADDR] = address;
             cpu_loop_exit_restore(cs, retaddr);
         }
@@ -263,8 +296,10 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
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
2.34.1


