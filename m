Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184F13AA5DA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:01:39 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcfK-0003zW-3w
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltcco-0000dT-DS
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:59:02 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltccl-0001hG-PR
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:59:01 -0400
Received: by mail-pl1-x635.google.com with SMTP id e1so1757979plh.8
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U6r0AsCBcP39NkFCDivd8pxb+8mEL/CMTHT5JqhWz5U=;
 b=D9PWTT0AvV63ieEX/fRTL5mJw95rRaT4sN1O/7sO8FmBZpuQ1yXpz4uPIZB/OcuHlE
 /08kb01ovs/w1p4oZII0m3gamjNzMy/c53rVwg2w6F/h03iLrHARNYkKZvB2xd44vklv
 YkNpThiu0TD7kXGOcrXoPejSSiW5EYoMfS9luD8E2ZyXqyagG9cnbo0LPxlU5ykgZ5x5
 b+qXWhmbDdOQw6ANDsOlAAmWO85m88PN1GnXOvwO7eyVYVKeK2LSDKPfb36TZOLccckg
 /4pmff9gb2se4Y7x1wmAMebRerpC9qiY/OjZn5luebUhic+l0KonDCRjln3WmkxNBZ7Z
 TDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U6r0AsCBcP39NkFCDivd8pxb+8mEL/CMTHT5JqhWz5U=;
 b=AYVJpedIKrk3SIWOmMBkxNCVuMfFulYlGMl8xTE36cxWzy3HMVxI462o1yb7H2QK7q
 82ecuA3FBkz2iW6oAYHh0j0P5CMNWbWjiou21wIESemzOglQuxsGTno5t3wtnFrj6zFw
 Ri7LrCOBUawgzFATgZMtqTHjPxQB7KF9sKSHQgNBegQnJ+J4OtzxXA4DiSt97OSM2QjX
 mUqMRESlloQ/LM+FI8Gt0CWB7svQn9/KXO7zKng7CVLPTKqub8/Ohh3qW2MxA8za5JZ1
 C4l/BBMPp5ccRXNAs+6vuhGn9dqNUOMM3mmnoNWEWiL7bibQZxdus9gg4HxjYBqy9to+
 EX8g==
X-Gm-Message-State: AOAM5329EqpHIdzV5I4gpB9q45AqQ437bBwwMG3pDCnNf2xGx+Xpebdg
 yiJIaUsy24y58ciKS5KgFOf4M7uNDSWv4Q==
X-Google-Smtp-Source: ABdhPJwoFqnKkAEea4G63fEYIk3tnh4Q5kcRfoAXPsOiDSXFx6DZWOHF1CyoVXQXqJckj9Ow/ERgjQ==
X-Received: by 2002:a17:90b:4b49:: with SMTP id
 mi9mr12455677pjb.219.1623877137968; 
 Wed, 16 Jun 2021 13:58:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id c5sm3151283pfn.144.2021.06.16.13.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:58:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] accel/tcg: Probe the proper permissions for atomic ops
Date: Wed, 16 Jun 2021 13:58:56 -0700
Message-Id: <20210616205856.1584273-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had a single ATOMIC_MMU_LOOKUP macro that probed for
read+write on all atomic ops.  This is incorrect for
plain atomic load and atomic store.

For user-only, we rely on the host page permissions.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/390
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

v2: Pass in DATA_SIZE to atomic_mmu_lookup, because MemOp
does have an encoding for 16-byte data.

---
 accel/tcg/atomic_template.h | 24 +++++-----
 accel/tcg/cputlb.c          | 95 ++++++++++++++++++++++++++-----------
 accel/tcg/user-exec.c       |  8 ++--
 3 files changed, 83 insertions(+), 44 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 0ff7f913e1..afa8a9daf3 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -74,7 +74,7 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv EXTRA_ARGS)
 {
     ATOMIC_MMU_DECLS;
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;
+    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
                                          ATOMIC_MMU_IDX);
@@ -95,7 +95,7 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr EXTRA_ARGS)
 {
     ATOMIC_MMU_DECLS;
-    DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP;
+    DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
                                          ATOMIC_MMU_IDX);
 
@@ -110,7 +110,7 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr,
                      ABI_TYPE val EXTRA_ARGS)
 {
     ATOMIC_MMU_DECLS;
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;
+    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, true,
                                          ATOMIC_MMU_IDX);
 
@@ -125,7 +125,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
                            ABI_TYPE val EXTRA_ARGS)
 {
     ATOMIC_MMU_DECLS;
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;
+    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
                                          ATOMIC_MMU_IDX);
@@ -142,7 +142,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE val EXTRA_ARGS)                    \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                           \
+    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
     DATA_TYPE ret;                                                  \
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
                                          ATOMIC_MMU_IDX);           \
@@ -176,7 +176,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE xval EXTRA_ARGS)                   \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
-    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                          \
+    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
     XDATA_TYPE cmp, old, new, val = xval;                           \
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
                                          ATOMIC_MMU_IDX);           \
@@ -221,7 +221,7 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv EXTRA_ARGS)
 {
     ATOMIC_MMU_DECLS;
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;
+    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
                                          ATOMIC_MMU_IDX);
@@ -242,7 +242,7 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr EXTRA_ARGS)
 {
     ATOMIC_MMU_DECLS;
-    DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP;
+    DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
                                          ATOMIC_MMU_IDX);
 
@@ -257,7 +257,7 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr,
                      ABI_TYPE val EXTRA_ARGS)
 {
     ATOMIC_MMU_DECLS;
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;
+    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, true,
                                          ATOMIC_MMU_IDX);
 
@@ -274,7 +274,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
                            ABI_TYPE val EXTRA_ARGS)
 {
     ATOMIC_MMU_DECLS;
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;
+    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     ABI_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
                                          ATOMIC_MMU_IDX);
@@ -291,7 +291,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE val EXTRA_ARGS)                    \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                           \
+    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
     DATA_TYPE ret;                                                  \
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
                                          false, ATOMIC_MMU_IDX);    \
@@ -323,7 +323,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE xval EXTRA_ARGS)                   \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
-    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                          \
+    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
     XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
                                          false, ATOMIC_MMU_IDX);    \
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f24348e979..b6d5fc6326 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1742,18 +1742,22 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
 
 #endif
 
-/* Probe for a read-modify-write atomic operation.  Do not allow unaligned
- * operations, or io operations to proceed.  Return the host address.  */
+/*
+ * Probe for an atomic operation.  Do not allow unaligned operations,
+ * or io operations to proceed.  Return the host address.
+ *
+ * @prot may be PAGE_READ, PAGE_WRITE, or PAGE_READ|PAGE_WRITE.
+ */
 static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
-                               TCGMemOpIdx oi, uintptr_t retaddr)
+                               TCGMemOpIdx oi, int size, int prot,
+                               uintptr_t retaddr)
 {
     size_t mmu_idx = get_mmuidx(oi);
-    uintptr_t index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *tlbe = tlb_entry(env, mmu_idx, addr);
-    target_ulong tlb_addr = tlb_addr_write(tlbe);
     MemOp mop = get_memop(oi);
     int a_bits = get_alignment_bits(mop);
-    int s_bits = mop & MO_SIZE;
+    uintptr_t index;
+    CPUTLBEntry *tlbe;
+    target_ulong tlb_addr;
     void *hostaddr;
 
     /* Adjust the given return address.  */
@@ -1767,7 +1771,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     }
 
     /* Enforce qemu required alignment.  */
-    if (unlikely(addr & ((1 << s_bits) - 1))) {
+    if (unlikely(addr & (size - 1))) {
         /* We get here if guest alignment was not requested,
            or was not enforced by cpu_unaligned_access above.
            We might widen the access and emulate, but for now
@@ -1775,15 +1779,45 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
         goto stop_the_world;
     }
 
+    index = tlb_index(env, mmu_idx, addr);
+    tlbe = tlb_entry(env, mmu_idx, addr);
+
     /* Check TLB entry and enforce page permissions.  */
-    if (!tlb_hit(tlb_addr, addr)) {
-        if (!VICTIM_TLB_HIT(addr_write, addr)) {
-            tlb_fill(env_cpu(env), addr, 1 << s_bits, MMU_DATA_STORE,
-                     mmu_idx, retaddr);
-            index = tlb_index(env, mmu_idx, addr);
-            tlbe = tlb_entry(env, mmu_idx, addr);
+    if (prot & PAGE_WRITE) {
+        tlb_addr = tlb_addr_write(tlbe);
+        if (!tlb_hit(tlb_addr, addr)) {
+            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+                tlb_fill(env_cpu(env), addr, size,
+                         MMU_DATA_STORE, mmu_idx, retaddr);
+                index = tlb_index(env, mmu_idx, addr);
+                tlbe = tlb_entry(env, mmu_idx, addr);
+            }
+            tlb_addr = tlb_addr_write(tlbe) & ~TLB_INVALID_MASK;
+        }
+
+        /* Let the guest notice RMW on a write-only page.  */
+        if ((prot & PAGE_READ) &&
+            unlikely(tlbe->addr_read != (tlb_addr & ~TLB_NOTDIRTY))) {
+            tlb_fill(env_cpu(env), addr, size,
+                     MMU_DATA_LOAD, mmu_idx, retaddr);
+            /*
+             * Since we don't support reads and writes to different addresses,
+             * and we do have the proper page loaded for write, this shouldn't
+             * ever return.  But just in case, handle via stop-the-world.
+             */
+            goto stop_the_world;
+        }
+    } else /* if (prot & PAGE_READ) */ {
+        tlb_addr = tlbe->addr_read;
+        if (!tlb_hit(tlb_addr, addr)) {
+            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+                tlb_fill(env_cpu(env), addr, size,
+                         MMU_DATA_LOAD, mmu_idx, retaddr);
+                index = tlb_index(env, mmu_idx, addr);
+                tlbe = tlb_entry(env, mmu_idx, addr);
+            }
+            tlb_addr = tlbe->addr_read & ~TLB_INVALID_MASK;
         }
-        tlb_addr = tlb_addr_write(tlbe) & ~TLB_INVALID_MASK;
     }
 
     /* Notice an IO access or a needs-MMU-lookup access */
@@ -1793,20 +1827,10 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
         goto stop_the_world;
     }
 
-    /* Let the guest notice RMW on a write-only page.  */
-    if (unlikely(tlbe->addr_read != (tlb_addr & ~TLB_NOTDIRTY))) {
-        tlb_fill(env_cpu(env), addr, 1 << s_bits, MMU_DATA_LOAD,
-                 mmu_idx, retaddr);
-        /* Since we don't support reads and writes to different addresses,
-           and we do have the proper page loaded for write, this shouldn't
-           ever return.  But just in case, handle via stop-the-world.  */
-        goto stop_the_world;
-    }
-
     hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
 
     if (unlikely(tlb_addr & TLB_NOTDIRTY)) {
-        notdirty_write(env_cpu(env), addr, 1 << s_bits,
+        notdirty_write(env_cpu(env), addr, size,
                        &env_tlb(env)->d[mmu_idx].iotlb[index], retaddr);
     }
 
@@ -2669,7 +2693,12 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
 #define ATOMIC_NAME(X) \
     HELPER(glue(glue(glue(atomic_ ## X, SUFFIX), END), _mmu))
 #define ATOMIC_MMU_DECLS
-#define ATOMIC_MMU_LOOKUP atomic_mmu_lookup(env, addr, oi, retaddr)
+#define ATOMIC_MMU_LOOKUP_RW \
+    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ | PAGE_WRITE, retaddr)
+#define ATOMIC_MMU_LOOKUP_R \
+    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ, retaddr)
+#define ATOMIC_MMU_LOOKUP_W \
+    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_WRITE, retaddr)
 #define ATOMIC_MMU_CLEANUP
 #define ATOMIC_MMU_IDX   get_mmuidx(oi)
 
@@ -2698,10 +2727,18 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
 
 #undef EXTRA_ARGS
 #undef ATOMIC_NAME
-#undef ATOMIC_MMU_LOOKUP
+#undef ATOMIC_MMU_LOOKUP_RW
+#undef ATOMIC_MMU_LOOKUP_R
+#undef ATOMIC_MMU_LOOKUP_W
+
 #define EXTRA_ARGS         , TCGMemOpIdx oi
 #define ATOMIC_NAME(X)     HELPER(glue(glue(atomic_ ## X, SUFFIX), END))
-#define ATOMIC_MMU_LOOKUP  atomic_mmu_lookup(env, addr, oi, GETPC())
+#define ATOMIC_MMU_LOOKUP_RW \
+    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ | PAGE_WRITE, GETPC())
+#define ATOMIC_MMU_LOOKUP_R \
+    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ, GETPC())
+#define ATOMIC_MMU_LOOKUP_W \
+    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_WRITE, GETPC())
 
 #define DATA_SIZE 1
 #include "atomic_template.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index fb2d43e6a9..e67b1617b5 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1220,7 +1220,9 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 
 /* Macro to call the above, with local variables from the use context.  */
 #define ATOMIC_MMU_DECLS do {} while (0)
-#define ATOMIC_MMU_LOOKUP  atomic_mmu_lookup(env, addr, DATA_SIZE, GETPC())
+#define ATOMIC_MMU_LOOKUP_RW  atomic_mmu_lookup(env, addr, DATA_SIZE, GETPC())
+#define ATOMIC_MMU_LOOKUP_R   ATOMIC_MMU_LOOKUP_RW
+#define ATOMIC_MMU_LOOKUP_W   ATOMIC_MMU_LOOKUP_RW
 #define ATOMIC_MMU_CLEANUP do { clear_helper_retaddr(); } while (0)
 #define ATOMIC_MMU_IDX MMU_USER_IDX
 
@@ -1250,12 +1252,12 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 
 #undef EXTRA_ARGS
 #undef ATOMIC_NAME
-#undef ATOMIC_MMU_LOOKUP
+#undef ATOMIC_MMU_LOOKUP_RW
 
 #define EXTRA_ARGS     , TCGMemOpIdx oi, uintptr_t retaddr
 #define ATOMIC_NAME(X) \
     HELPER(glue(glue(glue(atomic_ ## X, SUFFIX), END), _mmu))
-#define ATOMIC_MMU_LOOKUP  atomic_mmu_lookup(env, addr, DATA_SIZE, retaddr)
+#define ATOMIC_MMU_LOOKUP_RW  atomic_mmu_lookup(env, addr, DATA_SIZE, retaddr)
 
 #define DATA_SIZE 16
 #include "atomic_template.h"
-- 
2.25.1


