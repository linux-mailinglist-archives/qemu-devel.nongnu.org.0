Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED0483642
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:37:57 +0100 (CET)
Received: from localhost ([::1]:56226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4RHQ-0002yO-2Z
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:37:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RDC-0004dc-CR
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:34 -0500
Received: from [2607:f8b0:4864:20::1034] (port=45712
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RD8-000896-Vk
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:33 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso416070pjg.4
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V/XmR5r7vnfDEx+x3RwUHAJeWLeuzJf+sIncQbFpqFc=;
 b=AHOwLVXmIL0uKlnSjw5bRtkN4iYdnLoU3Ibs0TO8B+EeCLGhbOSsIe7hu1iBQTljBC
 w4fn/Ybtclpjwkamku8Bx47piEv817gOUfh9QiIqbAnRdKW6iQL2d46kXeH6LxiOZ7Xe
 qkqhK/8mpZucsgykVA3XpwUjByNKuZ5KoHHIUa8nC6xaqMrx9oKkSKqklBSrtXs6y752
 xDNzBYV+dikmfh1QCv7UzisyDfrMl7E1EXYcJIJRn/1q8Mx+/VPrCMS9iKh2RIBG0P3V
 p8zQCNDi34Rh2201SOJiRs68k/SuVqIydno4ad4kcQKJe820JvMOF5/a45d/3LWyKuJx
 Vrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V/XmR5r7vnfDEx+x3RwUHAJeWLeuzJf+sIncQbFpqFc=;
 b=eL3+jdqJojiwvZZCx43uaYOrho/jy43DYm7N6Qpr2qBSZWZkv3beF/gzOvursJdXye
 GtKIjh9IiIKWGdDoXHBCI+C5e0zTOHSRzKQDfJSqM9eOAR+cgognRazpxzkVmrpaTyBI
 o4N1IR6B7HGrUc08hoJo4mKcKqaX/eCrT4dXseSGDA6wigfG8cyVCzUq7MlnQ0kug9MB
 3+a/PyIdgMraUHLDywrP3aW3u06rW1sofHb53M76R1JVZfrYsLw2zF8hTCaPPzsFyffl
 m0S57xBJxBTHD91QuswH0tL0UNkdm2v6ju3f3vAIHVvnn7GJHbzqiaBcrfIlEXX2+1RG
 V04w==
X-Gm-Message-State: AOAM5313Wo8RKD/DJlP/qKT6NSiFH1p7KlzuYZ11jIrVf0u7NBakmqUv
 kxJ0b8Ck8w5rXC3SPJvc8l+cYhGznYIcXA==
X-Google-Smtp-Source: ABdhPJyQjVj2FH+ys2NcjMcyjukZxA/tClTy3wSbFKXexboTvbc9sbJ7Yayc9OQX6+Ig95cZnSkh+g==
X-Received: by 2002:a17:902:aa43:b0:142:6919:73da with SMTP id
 c3-20020a170902aa4300b00142691973damr46302920plr.39.1641231209741; 
 Mon, 03 Jan 2022 09:33:29 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s14sm39348564pfk.171.2022.01.03.09.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:33:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] target/hppa: Fix atomic_store_3 for STBY
Date: Mon,  3 Jan 2022 09:33:25 -0800
Message-Id: <20220103173326.257152-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103173326.257152-1-richard.henderson@linaro.org>
References: <20220103173326.257152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The parallel version of STBY did not take host endianness into
account, and also computed the incorrect address for STBY_E.

Bswap twice to handle the merge and store.  Compute mask inside
the function rather than as a parameter.  Force align the address,
rather than subtracting one.

Generalize the function to system mode by using probe_access().

Cc: qemu-stable@nongnu.org
Tested-by: Helge Deller <deller@gmx.de>
Reported-by: Helge Deller <deller@gmx.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/op_helper.c        | 27 ++++++-----
 tests/tcg/hppa/stby.c          | 87 ++++++++++++++++++++++++++++++++++
 tests/tcg/hppa/Makefile.target |  5 ++
 3 files changed, 107 insertions(+), 12 deletions(-)
 create mode 100644 tests/tcg/hppa/stby.c

diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 96d9391c39..1b86557d5d 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -57,26 +57,29 @@ void HELPER(tcond)(CPUHPPAState *env, target_ureg cond)
     }
 }
 
-static void atomic_store_3(CPUHPPAState *env, target_ulong addr, uint32_t val,
-                           uint32_t mask, uintptr_t ra)
+static void atomic_store_3(CPUHPPAState *env, target_ulong addr,
+                           uint32_t val, uintptr_t ra)
 {
-#ifdef CONFIG_USER_ONLY
-    uint32_t old, new, cmp;
+    int mmu_idx = cpu_mmu_index(env, 0);
+    uint32_t old, new, cmp, mask, *haddr;
+    void *vaddr;
+
+    vaddr = probe_access(env, addr, 3, MMU_DATA_STORE, mmu_idx, ra);
+    if (vaddr == NULL) {
+        cpu_loop_exit_atomic(env_cpu(env), ra);
+    }
+    haddr = (uint32_t *)((uintptr_t)vaddr & -4);
+    mask = addr & 1 ? 0x00ffffffu : 0xffffff00u;
 
-    uint32_t *haddr = g2h(env_cpu(env), addr - 1);
     old = *haddr;
     while (1) {
-        new = (old & ~mask) | (val & mask);
+        new = be32_to_cpu((cpu_to_be32(old) & ~mask) | (val & mask));
         cmp = qatomic_cmpxchg(haddr, old, new);
         if (cmp == old) {
             return;
         }
         old = cmp;
     }
-#else
-    /* FIXME -- we can do better.  */
-    cpu_loop_exit_atomic(env_cpu(env), ra);
-#endif
 }
 
 static void do_stby_b(CPUHPPAState *env, target_ulong addr, target_ureg val,
@@ -92,7 +95,7 @@ static void do_stby_b(CPUHPPAState *env, target_ulong addr, target_ureg val,
     case 1:
         /* The 3 byte store must appear atomic.  */
         if (parallel) {
-            atomic_store_3(env, addr, val, 0x00ffffffu, ra);
+            atomic_store_3(env, addr, val, ra);
         } else {
             cpu_stb_data_ra(env, addr, val >> 16, ra);
             cpu_stw_data_ra(env, addr + 1, val, ra);
@@ -122,7 +125,7 @@ static void do_stby_e(CPUHPPAState *env, target_ulong addr, target_ureg val,
     case 3:
         /* The 3 byte store must appear atomic.  */
         if (parallel) {
-            atomic_store_3(env, addr - 3, val, 0xffffff00u, ra);
+            atomic_store_3(env, addr - 3, val, ra);
         } else {
             cpu_stw_data_ra(env, addr - 3, val >> 16, ra);
             cpu_stb_data_ra(env, addr - 1, val >> 8, ra);
diff --git a/tests/tcg/hppa/stby.c b/tests/tcg/hppa/stby.c
new file mode 100644
index 0000000000..36bd5f723c
--- /dev/null
+++ b/tests/tcg/hppa/stby.c
@@ -0,0 +1,87 @@
+/* Test STBY */
+
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+
+struct S {
+    unsigned a;
+    unsigned b;
+    unsigned c;
+};
+
+static void check(const struct S *s, unsigned e,
+                  const char *which, const char *insn, int ofs)
+{
+    int err = 0;
+
+    if (s->a != 0) {
+        fprintf(stderr, "%s %s %d: garbage before word 0x%08x\n",
+                which, insn, ofs, s->a);
+        err = 1;
+    }
+    if (s->c != 0) {
+        fprintf(stderr, "%s %s %d: garbage after word 0x%08x\n",
+                which, insn, ofs, s->c);
+        err = 1;
+    }
+    if (s->b != e) {
+        fprintf(stderr, "%s %s %d: 0x%08x != 0x%08x\n",
+                which, insn, ofs, s->b, e);
+        err = 1;
+    }
+
+    if (err) {
+        exit(1);
+    }
+}
+
+#define TEST(INSN, OFS, E)                                         \
+    do {                                                           \
+        s.b = 0;                                                   \
+        asm volatile(INSN " %1, " #OFS "(%0)"                      \
+                     : : "r"(&s.b), "r" (0x11223344) : "memory");  \
+        check(&s, E, which, INSN, OFS);                            \
+    } while (0)
+
+static void test(const char *which)
+{
+    struct S s = { };
+
+    TEST("stby,b", 0, 0x11223344);
+    TEST("stby,b", 1, 0x00223344);
+    TEST("stby,b", 2, 0x00003344);
+    TEST("stby,b", 3, 0x00000044);
+
+    TEST("stby,e", 0, 0x00000000);
+    TEST("stby,e", 1, 0x11000000);
+    TEST("stby,e", 2, 0x11220000);
+    TEST("stby,e", 3, 0x11223300);
+}
+
+static void *child(void *x)
+{
+    return NULL;
+}
+
+int main()
+{
+    int err;
+    pthread_t thr;
+
+    /* Run test in serial mode */
+    test("serial");
+
+    /* Create a dummy thread to start parallel mode. */
+    err = pthread_create(&thr, NULL, child, NULL);
+    if (err != 0) {
+        fprintf(stderr, "pthread_create: %s\n", strerror(err));
+        return 2;
+    }
+
+    /* Run test in parallel mode */
+    test("parallel");
+    return 0;
+}
diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.target
index d0d5e0e257..b78e6b4849 100644
--- a/tests/tcg/hppa/Makefile.target
+++ b/tests/tcg/hppa/Makefile.target
@@ -12,3 +12,8 @@ run-signals: signals
 	$(call skip-test, $<, "BROKEN awaiting vdso support")
 run-plugin-signals-with-%:
 	$(call skip-test, $<, "BROKEN awaiting vdso support")
+
+VPATH += $(SRC_PATH)/tests/tcg/hppa
+TESTS += stby
+
+stby: CFLAGS += -pthread
-- 
2.25.1


