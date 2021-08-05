Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700553E1D91
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 22:50:22 +0200 (CEST)
Received: from localhost ([::1]:49444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBkJp-0007E0-9u
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 16:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBkIK-0006Wd-IJ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 16:48:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBkIH-0002l7-Cf
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 16:48:48 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175KcVxo045775; Thu, 5 Aug 2021 16:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=wEHfxzPyHHcAd4W5pI3tWewkzyFayshsBRJySFEdvDQ=;
 b=nGtZCMfOC2dJ56x73MV91z6jP6Ej/R7pwgoPhtRIyRSJya7Ec60k6ASDsHQfVbvZrgxD
 /AOo7fu94LWeFD+P5lVmanW6QnB6ftO/jfkIN6BWMH99L+psNmnPtTyWJtigzDolZJGv
 GM6jfxWakngvxBeCbOtZ8972/Rh3o8YXfqA3S4UHhXlIBD5x/l6n3GrNy8orxebov6CM
 y71TF66M8H4OPGO93i4/20ejq3MfqCnEG0Kj7IPXLzW3BW/T6K72Ffu0aujxIJPPmOJj
 RarWDnMiL5n5BugQZxJkSDfwEfVGFIVfpEIMvzsk+feGbMVp+b957JowqBVW7SJu2Jrp iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8m9u4fvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 16:48:43 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175Kd5nO048189;
 Thu, 5 Aug 2021 16:48:43 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8m9u4ftb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 16:48:43 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175KftAb000962;
 Thu, 5 Aug 2021 20:48:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3a4x58jnh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 20:48:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 175Kjcvi60948802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 20:45:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20E2252057;
 Thu,  5 Aug 2021 20:48:37 +0000 (GMT)
Received: from vm.lan (unknown [9.145.77.113])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9871F5204F;
 Thu,  5 Aug 2021 20:48:36 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3] accel/tcg: Clear PAGE_WRITE before translation
Date: Thu,  5 Aug 2021 22:48:35 +0200
Message-Id: <20210805204835.158918-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FfkCqrld9kd1Bf55nRfbsN4e7NuT7ZCg
X-Proofpoint-ORIG-GUID: WcacsHo9R8PJMiRFWgKpzxmCzgL7s-tl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_10:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050121
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

translate_insn() implementations fetch instruction bytes piecemeal,
which can cause qemu-user to generate inconsistent translations if
another thread modifies them concurrently [1].

Fix by making pages containing translated instruction non-writable
right before loading instruction bytes from them.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00644.html

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---

v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00819.html
v2 -> v3: Move translator_ld*_swap() functions from translator.h into
          translator.c for a better size trade-off (Richard).

 accel/tcg/translate-all.c                 | 59 +++++++++++++----------
 accel/tcg/translator.c                    | 30 ++++++++++++
 include/exec/translate-all.h              |  1 +
 include/exec/translator.h                 | 52 +++++++++++++-------
 target/alpha/translate.c                  |  2 +-
 target/arm/arm_ldst.h                     | 12 ++---
 target/arm/translate-a64.c                |  2 +-
 target/arm/translate.c                    |  9 ++--
 target/hexagon/translate.c                |  3 +-
 target/hppa/translate.c                   |  2 +-
 target/i386/tcg/translate.c               | 10 ++--
 target/m68k/translate.c                   |  2 +-
 target/mips/tcg/micromips_translate.c.inc |  2 +-
 target/mips/tcg/mips16e_translate.c.inc   |  4 +-
 target/mips/tcg/nanomips_translate.c.inc  |  4 +-
 target/mips/tcg/translate.c               |  8 +--
 target/openrisc/translate.c               |  2 +-
 target/ppc/translate.c                    |  5 +-
 target/riscv/translate.c                  |  5 +-
 target/s390x/tcg/translate.c              | 16 +++---
 target/sh4/translate.c                    |  4 +-
 target/sparc/translate.c                  |  2 +-
 target/xtensa/translate.c                 |  5 +-
 23 files changed, 153 insertions(+), 88 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bbfcfb698c..fb9ebfad9e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1297,31 +1297,8 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
     invalidate_page_bitmap(p);
 
 #if defined(CONFIG_USER_ONLY)
-    if (p->flags & PAGE_WRITE) {
-        target_ulong addr;
-        PageDesc *p2;
-        int prot;
-
-        /* force the host page as non writable (writes will have a
-           page fault + mprotect overhead) */
-        page_addr &= qemu_host_page_mask;
-        prot = 0;
-        for (addr = page_addr; addr < page_addr + qemu_host_page_size;
-            addr += TARGET_PAGE_SIZE) {
-
-            p2 = page_find(addr >> TARGET_PAGE_BITS);
-            if (!p2) {
-                continue;
-            }
-            prot |= p2->flags;
-            p2->flags &= ~PAGE_WRITE;
-          }
-        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
-                 (prot & PAGE_BITS) & ~PAGE_WRITE);
-        if (DEBUG_TB_INVALIDATE_GATE) {
-            printf("protecting code page: 0x" TB_PAGE_ADDR_FMT "\n", page_addr);
-        }
-    }
+    /* translator_loop() must have made all TB pages non-writable */
+    assert(!(p->flags & PAGE_WRITE));
 #else
     /* if some code is already present, then the pages are already
        protected. So we handle the case where only the first TB is
@@ -2394,6 +2371,38 @@ int page_check_range(target_ulong start, target_ulong len, int flags)
     return 0;
 }
 
+void page_protect(tb_page_addr_t page_addr)
+{
+    target_ulong addr;
+    PageDesc *p;
+    int prot;
+
+    p = page_find(page_addr >> TARGET_PAGE_BITS);
+    if (p && (p->flags & PAGE_WRITE)) {
+        /*
+         * Force the host page as non writable (writes will have a page fault +
+         * mprotect overhead).
+         */
+        page_addr &= qemu_host_page_mask;
+        prot = 0;
+        for (addr = page_addr; addr < page_addr + qemu_host_page_size;
+             addr += TARGET_PAGE_SIZE) {
+
+            p = page_find(addr >> TARGET_PAGE_BITS);
+            if (!p) {
+                continue;
+            }
+            prot |= p->flags;
+            p->flags &= ~PAGE_WRITE;
+        }
+        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
+                 (prot & PAGE_BITS) & ~PAGE_WRITE);
+        if (DEBUG_TB_INVALIDATE_GATE) {
+            printf("protecting code page: 0x" TB_PAGE_ADDR_FMT "\n", page_addr);
+        }
+    }
+}
+
 /* called from signal handler: invalidate the code and unprotect the
  * page. Return 0 if the fault was not handled, 1 if it was handled,
  * and 2 if it was handled but the caller must cause the TB to be
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index c53a7f8e44..93423949e7 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -56,6 +56,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     db->num_insns = 0;
     db->max_insns = max_insns;
     db->singlestep_enabled = cflags & CF_SINGLE_STEP;
+    translator_page_protect(db, db->pc_next);
 
     ops->init_disas_context(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
@@ -137,3 +138,32 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     }
 #endif
 }
+
+static inline void translator_maybe_page_protect(DisasContextBase *dcbase,
+                                                 target_ulong pc, size_t len)
+{
+#ifdef CONFIG_USER_ONLY
+    target_ulong end = pc + len - 1;
+
+    if (end > dcbase->page_protect_end) {
+        translator_page_protect(dcbase, end);
+    }
+#endif
+}
+
+#define GEN_TRANSLATOR_LD(fullname, type, load_fn, swap_fn)             \
+    type fullname ## _swap(CPUArchState *env, DisasContextBase *dcbase, \
+                           abi_ptr pc, bool do_swap)                    \
+    {                                                                   \
+        translator_maybe_page_protect(dcbase, pc, sizeof(type));        \
+        type ret = load_fn(env, pc);                                    \
+        if (do_swap) {                                                  \
+            ret = swap_fn(ret);                                         \
+        }                                                               \
+        plugin_insn_append(&ret, sizeof(ret));                          \
+        return ret;                                                     \
+    }
+
+FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
+
+#undef GEN_TRANSLATOR_LD
diff --git a/include/exec/translate-all.h b/include/exec/translate-all.h
index a557b4e2bb..9f646389af 100644
--- a/include/exec/translate-all.h
+++ b/include/exec/translate-all.h
@@ -33,6 +33,7 @@ void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr);
 
 #ifdef CONFIG_USER_ONLY
+void page_protect(tb_page_addr_t page_addr);
 int page_unprotect(target_ulong address, uintptr_t pc);
 #endif
 
diff --git a/include/exec/translator.h b/include/exec/translator.h
index d318803267..a7cfa9cba0 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/plugin-gen.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg.h"
 
 
@@ -74,6 +75,17 @@ typedef struct DisasContextBase {
     int num_insns;
     int max_insns;
     bool singlestep_enabled;
+#ifdef CONFIG_USER_ONLY
+    /*
+     * Guest address of the last byte of the last protected page.
+     *
+     * Pages containing the translated instructions are made non-writable in
+     * order to achieve consistency in case another thread is modifying the
+     * code while translate_insn() fetches the instruction bytes piecemeal.
+     * Such writer threads are blocked on mmap_lock() in page_unprotect().
+     */
+    target_ulong page_protect_end;
+#endif
 } DisasContextBase;
 
 /**
@@ -156,27 +168,33 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
  */
 
 #define GEN_TRANSLATOR_LD(fullname, type, load_fn, swap_fn)             \
-    static inline type                                                  \
-    fullname ## _swap(CPUArchState *env, abi_ptr pc, bool do_swap)      \
-    {                                                                   \
-        type ret = load_fn(env, pc);                                    \
-        if (do_swap) {                                                  \
-            ret = swap_fn(ret);                                         \
-        }                                                               \
-        plugin_insn_append(&ret, sizeof(ret));                          \
-        return ret;                                                     \
-    }                                                                   \
+    type fullname ## _swap(CPUArchState *env, DisasContextBase *dcbase, \
+                           abi_ptr pc, bool do_swap);                   \
                                                                         \
-    static inline type fullname(CPUArchState *env, abi_ptr pc)          \
+    static inline type fullname(CPUArchState *env,                      \
+                                DisasContextBase *dcbase, abi_ptr pc)   \
     {                                                                   \
-        return fullname ## _swap(env, pc, false);                       \
+        return fullname ## _swap(env, dcbase, pc, false);               \
     }
 
-GEN_TRANSLATOR_LD(translator_ldub, uint8_t, cpu_ldub_code, /* no swap */)
-GEN_TRANSLATOR_LD(translator_ldsw, int16_t, cpu_ldsw_code, bswap16)
-GEN_TRANSLATOR_LD(translator_lduw, uint16_t, cpu_lduw_code, bswap16)
-GEN_TRANSLATOR_LD(translator_ldl, uint32_t, cpu_ldl_code, bswap32)
-GEN_TRANSLATOR_LD(translator_ldq, uint64_t, cpu_ldq_code, bswap64)
+#define FOR_EACH_TRANSLATOR_LD(F)                                       \
+    F(translator_ldub, uint8_t, cpu_ldub_code, /* no swap */)           \
+    F(translator_ldsw, int16_t, cpu_ldsw_code, bswap16)                 \
+    F(translator_lduw, uint16_t, cpu_lduw_code, bswap16)                \
+    F(translator_ldl, uint32_t, cpu_ldl_code, bswap32)                  \
+    F(translator_ldq, uint64_t, cpu_ldq_code, bswap64)
+
+FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
+
 #undef GEN_TRANSLATOR_LD
 
+static inline void translator_page_protect(DisasContextBase *dcbase,
+                                           target_ulong pc)
+{
+#ifdef CONFIG_USER_ONLY
+    dcbase->page_protect_end = pc | ~TARGET_PAGE_MASK;
+    page_protect(pc);
+#endif
+}
+
 #endif  /* EXEC__TRANSLATOR_H */
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index de6c0a8439..b034206688 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2971,7 +2971,7 @@ static void alpha_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUAlphaState *env = cpu->env_ptr;
-    uint32_t insn = translator_ldl(env, ctx->base.pc_next);
+    uint32_t insn = translator_ldl(env, &ctx->base, ctx->base.pc_next);
 
     ctx->base.pc_next += 4;
     ctx->base.is_jmp = translate_one(ctx, insn);
diff --git a/target/arm/arm_ldst.h b/target/arm/arm_ldst.h
index 057160e8da..cee0548a1c 100644
--- a/target/arm/arm_ldst.h
+++ b/target/arm/arm_ldst.h
@@ -24,15 +24,15 @@
 #include "qemu/bswap.h"
 
 /* Load an instruction and return it in the standard little-endian order */
-static inline uint32_t arm_ldl_code(CPUARMState *env, target_ulong addr,
-                                    bool sctlr_b)
+static inline uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
+                                    target_ulong addr, bool sctlr_b)
 {
-    return translator_ldl_swap(env, addr, bswap_code(sctlr_b));
+    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
 }
 
 /* Ditto, for a halfword (Thumb) instruction */
-static inline uint16_t arm_lduw_code(CPUARMState *env, target_ulong addr,
-                                     bool sctlr_b)
+static inline uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
+                                     target_ulong addr, bool sctlr_b)
 {
 #ifndef CONFIG_USER_ONLY
     /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
@@ -41,7 +41,7 @@ static inline uint16_t arm_lduw_code(CPUARMState *env, target_ulong addr,
         addr ^= 2;
     }
 #endif
-    return translator_lduw_swap(env, addr, bswap_code(sctlr_b));
+    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
 }
 
 #endif
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 422e2ac0c9..a52949b1f3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14655,7 +14655,7 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     uint32_t insn;
 
     s->pc_curr = s->base.pc_next;
-    insn = arm_ldl_code(env, s->base.pc_next, s->sctlr_b);
+    insn = arm_ldl_code(env, &s->base, s->base.pc_next, s->sctlr_b);
     s->insn = insn;
     s->base.pc_next += 4;
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 80c282669f..9d5e3ef4c0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9257,7 +9257,7 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
      * boundary, so we cross the page if the first 16 bits indicate
      * that this is a 32 bit insn.
      */
-    uint16_t insn = arm_lduw_code(env, s->base.pc_next, s->sctlr_b);
+    uint16_t insn = arm_lduw_code(env, &s->base, s->base.pc_next, s->sctlr_b);
 
     return !thumb_insn_is_16bit(s, s->base.pc_next, insn);
 }
@@ -9495,7 +9495,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     dc->pc_curr = dc->base.pc_next;
-    insn = arm_ldl_code(env, dc->base.pc_next, dc->sctlr_b);
+    insn = arm_ldl_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
     dc->insn = insn;
     dc->base.pc_next += 4;
     disas_arm_insn(dc, insn);
@@ -9565,11 +9565,12 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     dc->pc_curr = dc->base.pc_next;
-    insn = arm_lduw_code(env, dc->base.pc_next, dc->sctlr_b);
+    insn = arm_lduw_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
     is_16bit = thumb_insn_is_16bit(dc, dc->base.pc_next, insn);
     dc->base.pc_next += 2;
     if (!is_16bit) {
-        uint32_t insn2 = arm_lduw_code(env, dc->base.pc_next, dc->sctlr_b);
+        uint32_t insn2 = arm_lduw_code(env, &dc->base, dc->base.pc_next,
+                                       dc->sctlr_b);
 
         insn = insn << 16 | insn2;
         dc->base.pc_next += 2;
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 54fdcaa5e8..6fb4e6853c 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -112,7 +112,8 @@ static int read_packet_words(CPUHexagonState *env, DisasContext *ctx,
     memset(words, 0, PACKET_WORDS_MAX * sizeof(uint32_t));
     for (nwords = 0; !found_end && nwords < PACKET_WORDS_MAX; nwords++) {
         words[nwords] =
-            translator_ldl(env, ctx->base.pc_next + nwords * sizeof(uint32_t));
+            translator_ldl(env, &ctx->base,
+                           ctx->base.pc_next + nwords * sizeof(uint32_t));
         found_end = is_packet_end(words[nwords]);
     }
     if (!found_end) {
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index b18150ef8d..3ce22cdd09 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4177,7 +4177,7 @@ static void hppa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     {
         /* Always fetch the insn, even if nullified, so that we check
            the page permissions for execute.  */
-        uint32_t insn = translator_ldl(env, ctx->base.pc_next);
+        uint32_t insn = translator_ldl(env, &ctx->base, ctx->base.pc_next);
 
         /* Set up the IA queue for the next insn.
            This will be overwritten by a branch.  */
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index aacb605eee..a46be75b00 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2028,28 +2028,28 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
 
 static inline uint8_t x86_ldub_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldub(env, advance_pc(env, s, 1));
+    return translator_ldub(env, &s->base, advance_pc(env, s, 1));
 }
 
 static inline int16_t x86_ldsw_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldsw(env, advance_pc(env, s, 2));
+    return translator_ldsw(env, &s->base, advance_pc(env, s, 2));
 }
 
 static inline uint16_t x86_lduw_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_lduw(env, advance_pc(env, s, 2));
+    return translator_lduw(env, &s->base, advance_pc(env, s, 2));
 }
 
 static inline uint32_t x86_ldl_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldl(env, advance_pc(env, s, 4));
+    return translator_ldl(env, &s->base, advance_pc(env, s, 4));
 }
 
 #ifdef TARGET_X86_64
 static inline uint64_t x86_ldq_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldq(env, advance_pc(env, s, 8));
+    return translator_ldq(env, &s->base, advance_pc(env, s, 8));
 }
 #endif
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index c34d9aed61..50a55f949c 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -415,7 +415,7 @@ static TCGv gen_ldst(DisasContext *s, int opsize, TCGv addr, TCGv val,
 static inline uint16_t read_im16(CPUM68KState *env, DisasContext *s)
 {
     uint16_t im;
-    im = translator_lduw(env, s->pc);
+    im = translator_lduw(env, &s->base, s->pc);
     s->pc += 2;
     return im;
 }
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 5e95f47854..0da4c802a3 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -1627,7 +1627,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
     uint32_t op, minor, minor2, mips32_op;
     uint32_t cond, fmt, cc;
 
-    insn = translator_lduw(env, ctx->base.pc_next + 2);
+    insn = translator_lduw(env, &ctx->base, ctx->base.pc_next + 2);
     ctx->opcode = (ctx->opcode << 16) | insn;
 
     rt = (ctx->opcode >> 21) & 0x1f;
diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 54071813f1..84d816603a 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -455,7 +455,7 @@ static void decode_i64_mips16(DisasContext *ctx,
 
 static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
 {
-    int extend = translator_lduw(env, ctx->base.pc_next + 2);
+    int extend = translator_lduw(env, &ctx->base, ctx->base.pc_next + 2);
     int op, rx, ry, funct, sa;
     int16_t imm, offset;
 
@@ -688,7 +688,7 @@ static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
         /* No delay slot, so just process as a normal instruction */
         break;
     case M16_OPC_JAL:
-        offset = translator_lduw(env, ctx->base.pc_next + 2);
+        offset = translator_lduw(env, &ctx->base, ctx->base.pc_next + 2);
         offset = (((ctx->opcode & 0x1f) << 21)
                   | ((ctx->opcode >> 5) & 0x1f) << 16
                   | offset) << 2;
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 09e64a6948..c5b1223b82 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -3656,7 +3656,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
     int offset;
     int imm;
 
-    insn = translator_lduw(env, ctx->base.pc_next + 2);
+    insn = translator_lduw(env, &ctx->base, ctx->base.pc_next + 2);
     ctx->opcode = (ctx->opcode << 16) | insn;
 
     rt = extract32(ctx->opcode, 21, 5);
@@ -3775,7 +3775,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     case NM_P48I:
         {
-            insn = translator_lduw(env, ctx->base.pc_next + 4);
+            insn = translator_lduw(env, &ctx->base, ctx->base.pc_next + 4);
             target_long addr_off = extract32(ctx->opcode, 0, 16) | insn << 16;
             switch (extract32(ctx->opcode, 16, 5)) {
             case NM_LI48:
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5b03545f09..c6382e19d0 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16187,17 +16187,17 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     is_slot = ctx->hflags & MIPS_HFLAG_BMASK;
     if (ctx->insn_flags & ISA_NANOMIPS32) {
-        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, &ctx->base, ctx->base.pc_next);
         insn_bytes = decode_isa_nanomips(env, ctx);
     } else if (!(ctx->hflags & MIPS_HFLAG_M16)) {
-        ctx->opcode = translator_ldl(env, ctx->base.pc_next);
+        ctx->opcode = translator_ldl(env, &ctx->base, ctx->base.pc_next);
         insn_bytes = 4;
         decode_opc(env, ctx);
     } else if (ctx->insn_flags & ASE_MICROMIPS) {
-        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, &ctx->base, ctx->base.pc_next);
         insn_bytes = decode_isa_micromips(env, ctx);
     } else if (ctx->insn_flags & ASE_MIPS16) {
-        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, &ctx->base, ctx->base.pc_next);
         insn_bytes = decode_ase_mips16e(env, ctx);
     } else {
         gen_reserved_instruction(ctx);
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index d6ea536744..5f3d430245 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1613,7 +1613,7 @@ static void openrisc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    uint32_t insn = translator_ldl(&cpu->env, dc->base.pc_next);
+    uint32_t insn = translator_ldl(&cpu->env, &dc->base, dc->base.pc_next);
 
     if (!decode(dc, insn)) {
         gen_illegal_exception(dc);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 171b216e17..5d8b06bd80 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8585,7 +8585,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
     ctx->cia = pc = ctx->base.pc_next;
-    insn = translator_ldl_swap(env, pc, need_byteswap(ctx));
+    insn = translator_ldl_swap(env, dcbase, pc, need_byteswap(ctx));
     ctx->base.pc_next = pc += 4;
 
     if (!is_prefix_insn(ctx, insn)) {
@@ -8600,7 +8600,8 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         gen_exception_err(ctx, POWERPC_EXCP_ALIGN, POWERPC_EXCP_ALIGN_INSN);
         ok = true;
     } else {
-        uint32_t insn2 = translator_ldl_swap(env, pc, need_byteswap(ctx));
+        uint32_t insn2 = translator_ldl_swap(env, dcbase, pc,
+                                             need_byteswap(ctx));
         ctx->base.pc_next = pc += 4;
         ok = decode_insn64(ctx, deposit64(insn2, 32, 32, insn));
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6983be5723..8abb759a32 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -909,7 +909,8 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
     } else {
         uint32_t opcode32 = opcode;
         opcode32 = deposit32(opcode32, 16, 16,
-                             translator_lduw(env, ctx->base.pc_next + 2));
+                             translator_lduw(env, &ctx->base,
+                                             ctx->base.pc_next + 2));
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
         if (!decode_insn32(ctx, opcode32)) {
             gen_exception_illegal(ctx);
@@ -965,7 +966,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
-    uint16_t opcode16 = translator_lduw(env, ctx->base.pc_next);
+    uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
 
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 0632b0374b..f284870cd2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -388,14 +388,16 @@ static void update_cc_op(DisasContext *s)
     }
 }
 
-static inline uint64_t ld_code2(CPUS390XState *env, uint64_t pc)
+static inline uint64_t ld_code2(CPUS390XState *env, DisasContext *s,
+                                uint64_t pc)
 {
-    return (uint64_t)cpu_lduw_code(env, pc);
+    return (uint64_t)translator_lduw(env, &s->base, pc);
 }
 
-static inline uint64_t ld_code4(CPUS390XState *env, uint64_t pc)
+static inline uint64_t ld_code4(CPUS390XState *env, DisasContext *s,
+                                uint64_t pc)
 {
-    return (uint64_t)(uint32_t)cpu_ldl_code(env, pc);
+    return (uint64_t)(uint32_t)translator_ldl(env, &s->base, pc);
 }
 
 static int get_mem_index(DisasContext *s)
@@ -6273,7 +6275,7 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
         ilen = s->ex_value & 0xf;
         op = insn >> 56;
     } else {
-        insn = ld_code2(env, pc);
+        insn = ld_code2(env, s, pc);
         op = (insn >> 8) & 0xff;
         ilen = get_ilen(op);
         switch (ilen) {
@@ -6281,10 +6283,10 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
             insn = insn << 48;
             break;
         case 4:
-            insn = ld_code4(env, pc) << 32;
+            insn = ld_code4(env, s, pc) << 32;
             break;
         case 6:
-            insn = (insn << 48) | (ld_code4(env, pc + 2) << 16);
+            insn = (insn << 48) | (ld_code4(env, s, pc + 2) << 16);
             break;
         default:
             g_assert_not_reached();
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 8704fea1ca..cf5fe9243d 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1907,7 +1907,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
 
     /* Read all of the insns for the region.  */
     for (i = 0; i < max_insns; ++i) {
-        insns[i] = translator_lduw(env, pc + i * 2);
+        insns[i] = translator_lduw(env, &ctx->base, pc + i * 2);
     }
 
     ld_adr = ld_dst = ld_mop = -1;
@@ -2307,7 +2307,7 @@ static void sh4_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     }
 #endif
 
-    ctx->opcode = translator_lduw(env, ctx->base.pc_next);
+    ctx->opcode = translator_lduw(env, &ctx->base, ctx->base.pc_next);
     decode_opc(ctx);
     ctx->base.pc_next += 2;
 }
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 11de5a4963..6ca38c843a 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5860,7 +5860,7 @@ static void sparc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     CPUSPARCState *env = cs->env_ptr;
     unsigned int insn;
 
-    insn = translator_ldl(env, dc->pc);
+    insn = translator_ldl(env, &dc->base, dc->pc);
     dc->base.pc_next += 4;
     disas_sparc_insn(dc, insn);
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 20399d6a04..dcf6b500ef 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -882,7 +882,8 @@ static int arg_copy_compare(const void *a, const void *b)
 static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 {
     xtensa_isa isa = dc->config->isa;
-    unsigned char b[MAX_INSN_LENGTH] = {translator_ldub(env, dc->pc)};
+    unsigned char b[MAX_INSN_LENGTH] = {translator_ldub(env, &dc->base,
+                                                        dc->pc)};
     unsigned len = xtensa_op0_insn_len(dc, b[0]);
     xtensa_format fmt;
     int slot, slots;
@@ -907,7 +908,7 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 
     dc->base.pc_next = dc->pc + len;
     for (i = 1; i < len; ++i) {
-        b[i] = translator_ldub(env, dc->pc + i);
+        b[i] = translator_ldub(env, &dc->base, dc->pc + i);
     }
     xtensa_insnbuf_from_chars(isa, dc->insnbuf, b, len);
     fmt = xtensa_format_decode(isa, dc->insnbuf);
-- 
2.31.1


