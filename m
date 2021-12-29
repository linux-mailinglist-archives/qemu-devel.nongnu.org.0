Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB04481744
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 23:31:11 +0100 (CET)
Received: from localhost ([::1]:35710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2hTS-0000GH-CZ
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 17:31:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n2hRu-00080R-SO
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:29:34 -0500
Received: from [2607:f8b0:4864:20::1033] (port=50894
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n2hRr-0008Lq-Je
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:29:34 -0500
Received: by mail-pj1-x1033.google.com with SMTP id gj24so19652162pjb.0
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 14:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJqMtCo8zGuTg/OrvJdc4Fwc1hpMDqYQUWPbqa+QT4w=;
 b=wo0CY8mvXFvr8/Fw+BFm7ogFqF6CpUVKWUl7JcLwrI6gep/8UpMju4hBegDN2PJLNu
 UFUpvCTa2aDB/hkd3o++USbISnhuQjGWNkjWtUg87+qGQgw+XMw93AvXMKyWLuKgSYXP
 aOTU80y5UBJAoG3cGv7hWhKAxu7E2dE19IPPG1UATcg9KUgUkR0WVXiW0CHmgp4bULOl
 8Q9jkfXtc3mpyQb02kLLvuJIrzR9SHpVgjPcHZBiCkPcpE31vVH4n6RZAEBcrkDH5tS1
 j3K5F3hyC9ykv/CZi9tHDibgLrouUkpJcQprgtfxVtv94LKYWPV6R4QbwRJ6ijZn18hi
 Lk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJqMtCo8zGuTg/OrvJdc4Fwc1hpMDqYQUWPbqa+QT4w=;
 b=dsICGuZxQNc9ZSeWYA97wwO3nqDKa3MoJtIUfbEcrqUbMNS7QtIcdW1Lq6JY+3Fs/W
 7D3WTOUDfjqQm3v9O2fGFNmxgDzDc6vOGTwGzz2xKhW+SCMkSxk3tVfGQJE0mk+HCn1s
 h5YN48lZtMgqPnYSTWv/mE6pfQpoOotgVXRsEUIPJ30CaL+XzTykwu1+ETDtjMepo3t7
 hKyw+n7dgsrQ7X2RlelBxDjxkl3Px6cEY77VE9/tAxzUZisStv1a5U6+mwR0NslLtDIo
 kg18vRAbo2HHC4BvAtkOsE7r2JEGjnZLWLer555vh6P7roRoqjXbI9arZhVTDL3B23di
 deuw==
X-Gm-Message-State: AOAM530toFzQ/b98LM0b4FY2BYZQ/ryPLJenTrs55GeLb1VWrp/YSHHX
 Ktm/Idso4EiZjXwt0rm0DOgEVYIh0pDUYg==
X-Google-Smtp-Source: ABdhPJx7kioHUBABjAOb+lYNAh14LojYavJQx+4/8k1wacxF8boUno6Te9ZsAnKPDbYwOIRMJl+5cw==
X-Received: by 2002:a17:90b:517:: with SMTP id
 r23mr35004622pjz.152.1640816968315; 
 Wed, 29 Dec 2021 14:29:28 -0800 (PST)
Received: from localhost.localdomain (76-14-210-194.or.wavecable.com.
 [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id t7sm6965213pfj.168.2021.12.29.14.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:29:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/hppa: Fix atomic_store_3 for STBY
Date: Wed, 29 Dec 2021 14:29:26 -0800
Message-Id: <20211229222926.152109-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Helge Deller <deller@gmx.de>, dave.anglin@bell.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The parallel version of STBY did not take host endianness into
account, and also computed the incorrect address for STBY_E.

Bswap twice to handle the merge and store.  Compute mask inside
the function rather than as a parameter.  Force align the address,
rather than subtracting one.

Generalize the function to system mode by using probe_access().

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


