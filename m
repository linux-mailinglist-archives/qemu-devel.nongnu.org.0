Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CD3337982
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:36:05 +0100 (CET)
Received: from localhost ([::1]:41222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOI8-0003F3-JH
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKO0k-00048D-KI
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:18:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKO0h-0002fn-Al
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615479478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGhxJpk6W78D0zSq9SUWVN6rl2oAc3LYQTuXbHOxXgc=;
 b=BhEacPOm1LgE0DjCCMhhUZGCwsqGnO+yIdm+7Q5FIUBLtBbtnsaM8vbriNHDRObjJOcUzE
 2+Zuk1tkylVYYYc/j74SVp8hkVJ2PwRY+QROa5aSkpMx/jHRg/duCMUh884Zr0+dUQY9w7
 Cv9U9NSoLBbOXwZEVnUxh2NjEKmB1r8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-53ceA3tVOUKINEvZd4GouQ-1; Thu, 11 Mar 2021 11:17:56 -0500
X-MC-Unique: 53ceA3tVOUKINEvZd4GouQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CB8A83DD23;
 Thu, 11 Mar 2021 16:17:55 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-26.ams2.redhat.com [10.36.115.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CFEB1001B2C;
 Thu, 11 Mar 2021 16:17:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/2] target/s390x: Implement the MVPG condition-code-option
 bit
Date: Thu, 11 Mar 2021 17:17:46 +0100
Message-Id: <20210311161747.129834-2-david@redhat.com>
In-Reply-To: <20210311161747.129834-1-david@redhat.com>
References: <20210311161747.129834-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

If the CCO bit is set, MVPG should not generate an exception but
report page translation faults via a CC code.

Create a new helper, access_prepare_nf, which can use probe_access_flags
in non-faulting mode, and then handle watchpoints.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[thuth: Added logic to still inject protection exceptions]
Signed-off-by: Thomas Huth <thuth@redhat.com>
[david: Look at env->tlb_fill_exc to determine if there was an exception]
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/cpu.h         |   5 ++
 target/s390x/excp_helper.c |   3 +
 target/s390x/mem_helper.c  | 124 ++++++++++++++++++++++++++++++-------
 3 files changed, 110 insertions(+), 22 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 60d434d5ed..468b4430f3 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -114,6 +114,11 @@ struct CPUS390XState {
 
     uint64_t diag318_info;
 
+#if !defined(CONFIG_USER_ONLY)
+    uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
+    int tlb_fill_exc;        /* exception number seen during tlb_fill */
+#endif
+
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index ce16af394b..c48cd6b46f 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -164,6 +164,9 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         tec = 0; /* unused */
     }
 
+    env->tlb_fill_exc = excp;
+    env->tlb_fill_tec = tec;
+
     if (!excp) {
         qemu_log_mask(CPU_LOG_MMU,
                       "%s: set tlb %" PRIx64 " -> %" PRIx64 " (%x)\n",
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 25cfede806..ebb55884c9 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -130,28 +130,93 @@ typedef struct S390Access {
     int mmu_idx;
 } S390Access;
 
-static S390Access access_prepare(CPUS390XState *env, vaddr vaddr, int size,
-                                 MMUAccessType access_type, int mmu_idx,
-                                 uintptr_t ra)
+/*
+ * With nofault=1, return the PGM_ exception that would have been injected
+ * into the guest; return 0 if no exception was detected.
+ *
+ * For !CONFIG_USER_ONLY, the TEC is stored stored to env->tlb_fill_tec.
+ * For CONFIG_USER_ONLY, the faulting address is stored to env->__excp_addr.
+ */
+static int access_prepare_nf(S390Access *access, CPUS390XState *env,
+                             bool nofault, vaddr vaddr1, int size,
+                             MMUAccessType access_type,
+                             int mmu_idx, uintptr_t ra)
 {
-    S390Access access = {
-        .vaddr1 = vaddr,
-        .size1 = MIN(size, -(vaddr | TARGET_PAGE_MASK)),
-        .mmu_idx = mmu_idx,
-    };
+    void *haddr1, *haddr2 = NULL;
+    int size1, size2;
+    vaddr vaddr2 = 0;
+    int flags;
+
+    assert(size > 0 && size <= 4096);
 
-    g_assert(size > 0 && size <= 4096);
-    access.haddr1 = probe_access(env, access.vaddr1, access.size1, access_type,
-                                 mmu_idx, ra);
+    size1 = MIN(size, -(vaddr1 | TARGET_PAGE_MASK)),
+    size2 = size - size1;
 
-    if (unlikely(access.size1 != size)) {
+#if !defined(CONFIG_USER_ONLY)
+    /*
+     * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
+     * to detect if there was an exception during tlb_fill().
+     */
+    env->tlb_fill_exc = 0;
+#endif
+    flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
+                               nofault, &haddr1, ra);
+#if !defined(CONFIG_USER_ONLY)
+    if (env->tlb_fill_exc) {
+        return env->tlb_fill_exc;
+    }
+#else
+    if (!haddr1) {
+        env->__excp_addr = vaddr1;
+        return PGM_ADDRESSING;
+    }
+#endif
+    if (unlikely(size2)) {
         /* The access crosses page boundaries. */
-        access.vaddr2 = wrap_address(env, vaddr + access.size1);
-        access.size2 = size - access.size1;
-        access.haddr2 = probe_access(env, access.vaddr2, access.size2,
-                                     access_type, mmu_idx, ra);
+        vaddr2 = wrap_address(env, vaddr1 + size1);
+        flags |= probe_access_flags(env, vaddr2, access_type, mmu_idx,
+                                    nofault, &haddr2, ra);
+#if !defined(CONFIG_USER_ONLY)
+        if (env->tlb_fill_exc) {
+            return env->tlb_fill_exc;
+        }
+#else
+        if (!haddr2) {
+            env->__excp_addr = vaddr2;
+            return PGM_ADDRESSING;
+        }
+#endif
     }
-    return access;
+
+    if (unlikely(flags & TLB_WATCHPOINT)) {
+        /* S390 does not presently use transaction attributes. */
+        cpu_check_watchpoint(env_cpu(env), vaddr1, size,
+                             MEMTXATTRS_UNSPECIFIED,
+                             (access_type == MMU_DATA_STORE
+                              ? BP_MEM_WRITE : BP_MEM_READ), ra);
+    }
+
+    *access = (S390Access) {
+        .vaddr1 = vaddr1,
+        .vaddr2 = vaddr2,
+        .haddr1 = haddr1,
+        .haddr2 = haddr2,
+        .size1 = size1,
+        .size2 = size2,
+        .mmu_idx = mmu_idx
+    };
+    return 0;
+}
+
+static S390Access access_prepare(CPUS390XState *env, vaddr vaddr, int size,
+                                 MMUAccessType access_type, int mmu_idx,
+                                 uintptr_t ra)
+{
+    S390Access ret;
+    int exc = access_prepare_nf(&ret, env, false, vaddr, size,
+                                access_type, mmu_idx, ra);
+    assert(!exc);
+    return ret;
 }
 
 /* Helper to handle memset on a single page. */
@@ -845,8 +910,10 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
     const int mmu_idx = cpu_mmu_index(env, false);
     const bool f = extract64(r0, 11, 1);
     const bool s = extract64(r0, 10, 1);
+    const bool cco = extract64(r0, 8, 1);
     uintptr_t ra = GETPC();
     S390Access srca, desta;
+    int exc;
 
     if ((f && s) || extract64(r0, 12, 4)) {
         tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
@@ -858,13 +925,26 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
     /*
      * TODO:
      * - Access key handling
-     * - CC-option with surpression of page-translation exceptions
      * - Store r1/r2 register identifiers at real location 162
      */
-    srca = access_prepare(env, r2, TARGET_PAGE_SIZE, MMU_DATA_LOAD, mmu_idx,
-                          ra);
-    desta = access_prepare(env, r1, TARGET_PAGE_SIZE, MMU_DATA_STORE, mmu_idx,
-                           ra);
+    exc = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
+                            MMU_DATA_LOAD, mmu_idx, ra);
+    if (exc) {
+        return 2;
+    }
+    exc = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
+                            MMU_DATA_STORE, mmu_idx, ra);
+    if (exc) {
+#if !defined(CONFIG_USER_ONLY)
+        if (exc == PGM_PROTECTION) {
+            stq_phys(env_cpu(env)->as,
+                     env->psa + offsetof(LowCore, trans_exc_code),
+                     env->tlb_fill_tec);
+            tcg_s390_program_interrupt(env, PGM_PROTECTION, ra);
+        }
+#endif
+        return 1;
+    }
     access_memmove(env, &desta, &srca, ra);
     return 0; /* data moved */
 }
-- 
2.29.2


