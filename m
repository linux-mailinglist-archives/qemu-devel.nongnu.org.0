Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDFE32AE17
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 03:45:53 +0100 (CET)
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHHWK-00076s-C6
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 21:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHHUz-0006ed-Bo
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 21:44:29 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHHUx-0006dA-9n
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 21:44:29 -0500
Received: by mail-pf1-x434.google.com with SMTP id o188so8550665pfg.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 18:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2C2j2srR5Nl7s2THJtwpVDBKZjajl2LXuzt0m7IgeU=;
 b=fJW12jp4zq6CieB05kcD0hvV9jkv1ymipS6pxKq2j399ExWoPk6pq3LpQmG4QNzVny
 8hq0wGxp8wT/Ie3PRZ5ZqnjEI9xzZB2wZf/ASnlu4oBZpZYMyZKFqdv3m5MwbN8AEsbj
 EtMepZ6vNVczzBzf40AJahduaxE7sUOaTMx2wokXfXg0pmA2KSk9lRYkFSLvEhRx+9ls
 9m0hDwWbYWyEbTLPVVxB+2RAwrmOUhaBfX2sx4NwcFlobjs34O3L/0D+lEddPsuajaH9
 5HD0AKXjK6hBBXexSrKE/2joTGi+EJ4gNCm2NEhRiw6aogYiOwopJ9ql2Gf6mpq5a2Ej
 qvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2C2j2srR5Nl7s2THJtwpVDBKZjajl2LXuzt0m7IgeU=;
 b=im4d92KLX0PIY2VUipH7za2Qxbh9ZCfqpuhnf38JoAS2bqFF4gqPdoiQYPXfwGAhIU
 OvN5i7XZ2/a4bKbaSs6y6lrRaRAPShaUCobZskBkPo5A8F2oyVrFh8I7ZCTG6vYAubVt
 Rt+JR2WGlYIUYxhIebdm2jOy6ILlqVebrDdIpC5juMzZHd+HLLYeQfIEEqj1eKd0+/Ld
 s2ijQk145cLX5bbGCdrgjkZSy/GbPeADcOqO65Nuhf62fp/d6CoLNg3awC9vwgXihJMn
 aE3Fu8QRHYphD4zro9Y13wwpWa7J8B5hd9ToldWJowVq8ZOrH5HA87tfgVH9QtHvpzf1
 mFdQ==
X-Gm-Message-State: AOAM533H2Kv9clRy/DM84sYirRfheUaEOySYV66mGJac7VfVLJ1DCxGE
 mwRR57oDmV+rbn2W33EQwwDJdiEzeqSkdw==
X-Google-Smtp-Source: ABdhPJw5TD+LnKy3X8att6FztwhwIQnPSKQ0Xl23WS1vmgSr6AIMoe6njsoTioPjI9X/gLS4Epj9bw==
X-Received: by 2002:a63:1906:: with SMTP id z6mr21318513pgl.292.1614739465634; 
 Tue, 02 Mar 2021 18:44:25 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r2sm21268752pgv.50.2021.03.02.18.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 18:44:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] target/s390x: Implement the MVPG condition-code-option bit
Date: Tue,  2 Mar 2021 18:44:23 -0800
Message-Id: <20210303024423.3125722-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the CCO bit is set, MVPG should not generate an exception but
report page translation faults via a CC code.

Create a new helper, access_prepare_nf, which can use probe_access_flags
in non-faulting mode, and then handle watchpoints.

Cc: David Hildenbrand <david@redhat.com>
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/mem_helper.c | 87 ++++++++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 25cfede806..b397333c0b 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -130,28 +130,62 @@ typedef struct S390Access {
     int mmu_idx;
 } S390Access;
 
+static bool access_prepare_nf(S390Access *access, CPUS390XState *env,
+                              bool nofault, vaddr vaddr1, int size,
+                              MMUAccessType access_type,
+                              int mmu_idx, uintptr_t ra)
+{
+    void *haddr1, *haddr2 = NULL;
+    int size1, size2;
+    vaddr vaddr2 = 0;
+    int flags;
+
+    assert(size > 0 && size <= 4096);
+
+    size1 = MIN(size, -(vaddr1 | TARGET_PAGE_MASK)),
+    size2 = size - size1;
+
+    flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
+                               nofault, &haddr1, ra);
+    if (unlikely(size2)) {
+        /* The access crosses page boundaries. */
+        vaddr2 = wrap_address(env, vaddr1 + size1);
+        flags |= probe_access_flags(env, vaddr2, access_type, mmu_idx,
+                                    nofault, &haddr2, ra);
+    }
+
+    if (unlikely(flags & TLB_INVALID_MASK)) {
+        return false;
+    }
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
+    return true;
+}
+
 static S390Access access_prepare(CPUS390XState *env, vaddr vaddr, int size,
                                  MMUAccessType access_type, int mmu_idx,
                                  uintptr_t ra)
 {
-    S390Access access = {
-        .vaddr1 = vaddr,
-        .size1 = MIN(size, -(vaddr | TARGET_PAGE_MASK)),
-        .mmu_idx = mmu_idx,
-    };
-
-    g_assert(size > 0 && size <= 4096);
-    access.haddr1 = probe_access(env, access.vaddr1, access.size1, access_type,
-                                 mmu_idx, ra);
-
-    if (unlikely(access.size1 != size)) {
-        /* The access crosses page boundaries. */
-        access.vaddr2 = wrap_address(env, vaddr + access.size1);
-        access.size2 = size - access.size1;
-        access.haddr2 = probe_access(env, access.vaddr2, access.size2,
-                                     access_type, mmu_idx, ra);
-    }
-    return access;
+    S390Access ret;
+    bool ok = access_prepare_nf(&ret, env, false, vaddr, size,
+                                access_type, mmu_idx, ra);
+    assert(ok);
+    return ret;
 }
 
 /* Helper to handle memset on a single page. */
@@ -845,8 +879,10 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
     const int mmu_idx = cpu_mmu_index(env, false);
     const bool f = extract64(r0, 11, 1);
     const bool s = extract64(r0, 10, 1);
+    const bool cco = extract64(r0, 8, 1);
     uintptr_t ra = GETPC();
     S390Access srca, desta;
+    bool ok;
 
     if ((f && s) || extract64(r0, 12, 4)) {
         tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
@@ -858,13 +894,18 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
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
+    ok = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
+                           MMU_DATA_LOAD, mmu_idx, ra);
+    if (!ok) {
+        return 2;
+    }
+    ok = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
+                           MMU_DATA_STORE, mmu_idx, ra);
+    if (!ok) {
+        return 1;
+    }
     access_memmove(env, &desta, &srca, ra);
     return 0; /* data moved */
 }
-- 
2.25.1


