Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF540A1CD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:18:30 +0200 (CEST)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPw9d-0004ZD-An
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6M-0001ep-6G
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:06 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6I-0007Yf-13
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:05 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso1355716pjq.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLHG44jCWPrfG7hZcGkKiwrmgjxf0GnrOvDF2kTb5Z0=;
 b=kjY8dn4l+Mi0JuHVOJ2i5TXwalnVw/800nYo6pvrE2tBS6/ueV8LW4SJm11uRwCZMW
 CLOenTrXLTZLyWclDhOXJvqQX9k79Tll1O3l06NUFt2sdEAI9j8WE/LxBF0pGvirP7Q6
 tlqp0yfl/sY7Galxztjlhp9TXcEBaFW2mpvYWLrdnXRQnOJEnkqSwjt2H1mHc+Symg75
 JrtwiBcbWskJ2HCVBf6EEilj8sosBUMMgyjxTiC2hQFILRGNSB6c8xopT3sl95+2bz5g
 Uxo5P6cl56SfVrwui4apWd7SeA3Kg/tLJYfTh5AUAY7cm25ZpyXM9IaIys43Jpfc1JPW
 OXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLHG44jCWPrfG7hZcGkKiwrmgjxf0GnrOvDF2kTb5Z0=;
 b=bk5n/xLzkBMIxFmvAe4eeInTplMc11K+GOOgfgtX1eUbPDgPyLK0oxglk5PKZ0QSdU
 xO0XhpZZftzieD8kLQolyIji3bGWBMZky4BbSdSbzFDwkA/e/NJ2zPfpWRNb7yibS4Rw
 qWiuWJWKvon0FH7A4PgyOXPPIp1VkPutkl43gF754Azh5foK+NgEnoMkUFTweRuTZURe
 ScVr7p1+19YTajMkFU6ZuyR7pBOutQKXYHNHkzq7RIP1+3pwhsTuqiGwJBhuoEaBJqQ0
 i+og7jdhR3nh7WnBpYsGy/GHVqO1sTqBIPKiwW+HENCanOxcohf2sAx2HY8yGbTkmZ+Q
 fX8Q==
X-Gm-Message-State: AOAM530p4esdus+Dblm+jWy1LbdQMeJTO3r0/gL7N8zuRvEdE23RK7DV
 /cEj7gKcMROBZPUFtEw3/JvH2tCFiMqIGQ==
X-Google-Smtp-Source: ABdhPJx2kXvcsyiO9yn1N0UMRpRjHBo/JnlzUwAc1nrMP7K5Fz2WQtgODD2uEdaruznUlHKcpJeWyQ==
X-Received: by 2002:a17:90a:f18f:: with SMTP id
 bv15mr1544493pjb.93.1631578499631; 
 Mon, 13 Sep 2021 17:14:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:14:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/44] accel/tcg: Clear PAGE_WRITE before translation
Date: Mon, 13 Sep 2021 17:14:14 -0700
Message-Id: <20210914001456.793490-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

translate_insn() implementations fetch instruction bytes piecemeal,
which can cause qemu-user to generate inconsistent translations if
another thread modifies them concurrently [1].

Fix by making pages containing translated instruction non-writable
right before loading instruction bytes from them.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00644.html

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20210805204835.158918-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translate-all.h |  1 +
 include/exec/translator.h    | 39 ++++++++++++++----------
 accel/tcg/translate-all.c    | 59 +++++++++++++++++++++---------------
 accel/tcg/translator.c       | 39 ++++++++++++++++++++++++
 4 files changed, 97 insertions(+), 41 deletions(-)

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
index 6c054e8d05..9bc46eda59 100644
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
@@ -156,28 +168,23 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
  */
 
 #define GEN_TRANSLATOR_LD(fullname, type, load_fn, swap_fn)             \
-    static inline type                                                  \
-    fullname ## _swap(CPUArchState *env, DisasContextBase *dcbase,      \
-                      abi_ptr pc, bool do_swap)                         \
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
     static inline type fullname(CPUArchState *env,                      \
                                 DisasContextBase *dcbase, abi_ptr pc)   \
     {                                                                   \
         return fullname ## _swap(env, dcbase, pc, false);               \
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
 
 #endif  /* EXEC__TRANSLATOR_H */
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
index c53a7f8e44..390bd9db0a 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -42,6 +42,15 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
     return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
 }
 
+static inline void translator_page_protect(DisasContextBase *dcbase,
+                                           target_ulong pc)
+{
+#ifdef CONFIG_USER_ONLY
+    dcbase->page_protect_end = pc | ~TARGET_PAGE_MASK;
+    page_protect(pc);
+#endif
+}
+
 void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
@@ -56,6 +65,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     db->num_insns = 0;
     db->max_insns = max_insns;
     db->singlestep_enabled = cflags & CF_SINGLE_STEP;
+    translator_page_protect(db, db->pc_next);
 
     ops->init_disas_context(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
@@ -137,3 +147,32 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
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
-- 
2.25.1


