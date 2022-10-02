Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FDB5F244E
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:37:55 +0200 (CEST)
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of2uY-00017V-SH
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nX-0005Si-Jk
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:43 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nV-0006Bk-Mz
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso13366461pjf.5
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8xeA2rOgse1n4eSQHAkt+kpvv0Pcr9kLnEHTHU5z+Ak=;
 b=tZjk9ECuK2UPYrCjgWWw0LHv5oQD43xAITwpk7sV/StsqlI6EfZyJJECZtc869F8Ik
 K8TaozFzcuOeAX7kMY8Ee0o+YSLFbtI5696VrayD1ikVjzZy0nuS4VisCfJjXKGTNLNX
 XLYdQeN6snkhEmeSEvepPSOhSwUkpcVb1rsbMJm+f3OYg5+kL9udHeo+0ONA4t6SCa8s
 AFp/zcivYIAf/jgEF5YFUH8UCFTd2rInXp3XSYlx/tPp6Yn9zNjp/JxvzchgBjoSKblD
 l9lwggJf/MBTTJyRD7CNe7pdlZvmTiK7Ds+erFhxswcCIhRlZbtCsZZikz3AxMKiJS8w
 /cKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8xeA2rOgse1n4eSQHAkt+kpvv0Pcr9kLnEHTHU5z+Ak=;
 b=uFpDq3SoaL3eqlckeN8YWXOeMmtohhN3Xab0Qb3d+D6mEGWkvG3jOww3l+vKHwo7p9
 QIo6o8SOa1GSrm+jiBle5536z8lEgSCBaimJdtAvArKQk5ULlEERniutVfVAuIEB4llg
 HauCkS7B+EPcMwxMiaR5OL4eSs+9Dj+Wb1YyixiYH5Bz5R9Q7H+hgramSAA2laM18SCq
 gFHhk5tqVXuM35KMObWrM5Oa3aU9b7Cd8A5JRLfjrq4f1x+6RkIZI9ZH5oLc+0Yirebq
 5kNkr9UTM9MkcoERlYsn6qUmXPKp8zIpbn/R6Ia8lVBCmMEMlDBgKQ4nEoQxVoJhijyQ
 buEg==
X-Gm-Message-State: ACrzQf3jra9KXdL5cuQhOJAqcE3mqXBL3XcKyLpZwwMIo+WTWf68bV40
 DF6TAtXveK56GMilXGfUJSr8Gvvelw0ZUw==
X-Google-Smtp-Source: AMsMyM6qgJeBxvuMZpFb4EQChgvAKf98Ah21x1FZn4OzPF9g6QgpaiQDuAE5vs/YopXQTmRPLIuQFw==
X-Received: by 2002:a17:90a:1096:b0:202:c5a9:bf1e with SMTP id
 c22-20020a17090a109600b00202c5a9bf1emr8567887pja.3.1664731835683; 
 Sun, 02 Oct 2022 10:30:35 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8002:3cad:72cd:dd96:98f6:c3cf])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62168d000000b0056025ccc3bbsm2749783pfw.146.2022.10.02.10.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 10:30:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 5/9] target/i386: Add MMU_PHYS_IDX and MMU_NESTED_IDX
Date: Sun,  2 Oct 2022 10:29:52 -0700
Message-Id: <20221002172956.265735-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002172956.265735-1-richard.henderson@linaro.org>
References: <20221002172956.265735-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These new mmu indexes will be helpful for improving
paging and code throughout the target.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu-param.h              |  2 +-
 target/i386/cpu.h                    |  3 +
 target/i386/tcg/sysemu/excp_helper.c | 82 ++++++++++++++++++----------
 target/i386/tcg/sysemu/svm_helper.c  |  3 +
 4 files changed, 60 insertions(+), 30 deletions(-)

diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index 9740bd7abd..abad52af20 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -23,6 +23,6 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS  32
 #endif
 #define TARGET_PAGE_BITS 12
-#define NB_MMU_MODES 3
+#define NB_MMU_MODES 5
 
 #endif
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b9..9a40b54ae5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2144,6 +2144,9 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 #define MMU_KSMAP_IDX   0
 #define MMU_USER_IDX    1
 #define MMU_KNOSMAP_IDX 2
+#define MMU_NESTED_IDX  3
+#define MMU_PHYS_IDX    4
+
 static inline int cpu_mmu_index(CPUX86State *env, bool ifetch)
 {
     return (env->hflags & HF_CPL_MASK) == 3 ? MMU_USER_IDX :
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 816b307547..494dc6d00c 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -448,41 +448,65 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
                                  MMUAccessType access_type, int mmu_idx,
                                  TranslateResult *out, TranslateFault *err)
 {
-    if (!(env->cr[0] & CR0_PG_MASK)) {
-        out->paddr = addr & x86_get_a20_mask(env);
+    TranslateParams in;
+    bool use_stage2 = env->hflags2 & HF2_NPT_MASK;
 
-#ifdef TARGET_X86_64
-        if (!(env->hflags & HF_LMA_MASK)) {
-            /* Without long mode we can only address 32bits in real mode */
-            out->paddr = (uint32_t)out->paddr;
-        }
-#endif
-        out->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        out->page_size = TARGET_PAGE_SIZE;
-        return true;
-    } else {
-        TranslateParams in = {
-            .addr = addr,
-            .cr3 = env->cr[3],
-            .pg_mode = get_pg_mode(env),
-            .mmu_idx = mmu_idx,
-            .access_type = access_type,
-            .use_stage2 = env->hflags2 & HF2_NPT_MASK,
-        };
+    in.addr = addr;
+    in.access_type = access_type;
 
-        if (in.pg_mode & PG_MODE_LMA) {
-            /* test virtual address sign extension */
-            int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
-            int64_t sext = (int64_t)addr >> shift;
-            if (sext != 0 && sext != -1) {
-                err->exception_index = EXCP0D_GPF;
-                err->error_code = 0;
-                err->cr2 = addr;
+    switch (mmu_idx) {
+    case MMU_PHYS_IDX:
+        break;
+
+    case MMU_NESTED_IDX:
+        if (likely(use_stage2)) {
+            in.cr3 = env->nested_cr3;
+            in.pg_mode = env->nested_pg_mode;
+            in.mmu_idx = MMU_USER_IDX;
+            in.use_stage2 = false;
+
+            if (!mmu_translate(env, &in, out, err)) {
+                err->stage2 = S2_GPA;
                 return false;
             }
+            return true;
         }
-        return mmu_translate(env, &in, out, err);
+        break;
+
+    default:
+        in.cr3 = env->cr[3];
+        in.mmu_idx = mmu_idx;
+        in.use_stage2 = use_stage2;
+        in.pg_mode = get_pg_mode(env);
+
+        if (likely(in.pg_mode)) {
+            if (in.pg_mode & PG_MODE_LMA) {
+                /* test virtual address sign extension */
+                int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
+                int64_t sext = (int64_t)addr >> shift;
+                if (sext != 0 && sext != -1) {
+                    err->exception_index = EXCP0D_GPF;
+                    err->error_code = 0;
+                    err->cr2 = addr;
+                    return false;
+                }
+            }
+            return mmu_translate(env, &in, out, err);
+        }
+        break;
     }
+
+    /* Translation disabled. */
+    out->paddr = addr & x86_get_a20_mask(env);
+#ifdef TARGET_X86_64
+    if (!(env->hflags & HF_LMA_MASK)) {
+        /* Without long mode we can only address 32bits in real mode */
+        out->paddr = (uint32_t)out->paddr;
+    }
+#endif
+    out->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    out->page_size = TARGET_PAGE_SIZE;
+    return true;
 }
 
 bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 2b6f450af9..85b7741d94 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -271,6 +271,8 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
         env->hflags2 |= HF2_NPT_MASK;
 
         env->nested_pg_mode = get_pg_mode(env) & PG_MODE_SVM_MASK;
+
+        tlb_flush_by_mmuidx(cs, 1 << MMU_NESTED_IDX);
     }
 
     /* enable intercepts */
@@ -720,6 +722,7 @@ void do_vmexit(CPUX86State *env)
                  env->vm_vmcb + offsetof(struct vmcb, control.int_state), 0);
     }
     env->hflags2 &= ~HF2_NPT_MASK;
+    tlb_flush_by_mmuidx(cs, 1 << MMU_NESTED_IDX);
 
     /* Save the VM state in the vmcb */
     svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.es),
-- 
2.34.1


