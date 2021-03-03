Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C032ACC3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 02:40:52 +0100 (CET)
Received: from localhost ([::1]:40224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHGVP-0000K9-9w
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 20:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHGTw-0008C7-GI
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 20:39:20 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHGTu-0005a2-N9
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 20:39:20 -0500
Received: by mail-pl1-x630.google.com with SMTP id p5so13136659plo.4
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 17:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZ97uMunfAGCnWu1sil3Tpn+4Vo2orqUvsENooULL8c=;
 b=Woxe402HfL+SD+GkSbIDaf1eggbY+Nzinaft4HjoEd4nhdt+b53UWXxILocoAsj6jL
 +j38KHYvlLxczFat59ZLwl7E7jFvT2L+X6MQFrRw1gZ/VZCypBzcmM4CydHV7g3WnChb
 weQIfYwb50KjOQti869exStMVnG6HL0bXijdpA05+bRp5CodzQw/eKQXz502eEI7+6gK
 ee/0zbn5p/OB+5x0rttBwLEFpL2IrgKKWi6osvmr1nee+dJG00vD9kQ7d14oKf3DF9O4
 xhvc5hyYpJ+5Fg6JzZPxjIkgVPRtJuaT8naafiH/1S2yA1ObGaNoMjaUK1SGpZGw0Ir6
 +ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZ97uMunfAGCnWu1sil3Tpn+4Vo2orqUvsENooULL8c=;
 b=ARhTMrrY4yqHDDVtgub9/Me9aFTloiIdx97WWdMgideDPiHDKYkO+U59wECsUAma6D
 Uu2100xOiFMaN48kuZSqK0Rm3r0MjyiM8gdcKpWRNRFv70CyVbq+uHyS0l0Lcq45mvq0
 pntT7+Rx+BQCX64d0ANZ4ZcRfPrrK6dtZjQ6uRvZa5kr6No4+9wPW3prtoKr7kvstnE2
 ZHh+SIqAvUrjgVDO8RTxMQouptcQrvs4AvbONZYLhaTIVrFjgQ6nV5GnukI4oMgRStgj
 DtP072NdO2rEMvcrcB/xuwn2cG2STnjn2k2i7dzhdqaY8B3wVZ2K7ILXu/Y5cE6/lRIm
 frdg==
X-Gm-Message-State: AOAM531tE9q7jIIt8Ranx1rFbrx0tJDMDyteN8+gZKPMguBDz+4M4U1e
 G0VfbtBwsTNa4gEKq/8JYuXm643YFP6Hwg==
X-Google-Smtp-Source: ABdhPJzjROK4UqWer07KBqnmNdk5ABb3u5E6BKU6G76bjKUe9tmjssH6SHjLiLjqu7NvBEX/Zu+yqw==
X-Received: by 2002:a17:90a:2ec6:: with SMTP id
 h6mr7177633pjs.103.1614735556729; 
 Tue, 02 Mar 2021 17:39:16 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q128sm22643671pfb.51.2021.03.02.17.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:39:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/s390x: Implement the MVPG condition-code-option bit
Date: Tue,  2 Mar 2021 17:39:15 -0800
Message-Id: <20210303013915.3122076-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

If the CCO bit is set, MVPG should not generate an exception
but report page translation faults via a CC code.  Create a new
helper, access_prepare_nf, which can use probe_access_flags in
non-faulting mode.

Cc: David Hildenbrand <david@redhat.com>
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/mem_helper.c | 76 +++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 23 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 25cfede806..9e359b0d19 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -130,28 +130,51 @@ typedef struct S390Access {
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
+    bool ok;
+
+    g_assert(size > 0 && size <= 4096);
+
+    size1 = MIN(size, -(vaddr1 | TARGET_PAGE_MASK)),
+    size2 = size - size1;
+
+    ok = probe_access_flags(env, vaddr1, access_type, mmu_idx,
+                            nofault, &haddr1, ra);
+    if (likely(ok) && unlikely(size2)) {
+        /* The access crosses page boundaries. */
+        vaddr2 = wrap_address(env, vaddr1 + size1);
+        ok = probe_access_flags(env, vaddr2, access_type, mmu_idx,
+                                nofault, &haddr2, ra);
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
+    return ok;
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
+    g_assert(ok);
+    return ret;
 }
 
 /* Helper to handle memset on a single page. */
@@ -845,8 +868,10 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
     const int mmu_idx = cpu_mmu_index(env, false);
     const bool f = extract64(r0, 11, 1);
     const bool s = extract64(r0, 10, 1);
+    const bool cco = extract64(r0, 8, 1);
     uintptr_t ra = GETPC();
     S390Access srca, desta;
+    bool ok;
 
     if ((f && s) || extract64(r0, 12, 4)) {
         tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
@@ -858,13 +883,18 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
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


