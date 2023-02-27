Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3456A40C0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboE-0005Xz-AW; Mon, 27 Feb 2023 06:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboC-0005WO-EN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboA-0005gC-Hn
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2W75rkVRLi0PLmhomrqiDNgo/vNSDvKn4xxxoW/ipk=;
 b=Vg6xXSEkfT261LAUP/dK516I2adB1DNJs7ivbSNuMotOZmf4t7dy9P9F0UaUZ4yV1xZOWE
 A3piq05LSAEw8h02qjN7OKjRwMFdX8KqFRHZPXUsuqDJBeNGyHwvYUIGYAMk6lNFmhxE+a
 GFKWV2bhTgfYqdPjdLrUW44kU9AVIks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-jukybfDHNtuKV46Wsh582A-1; Mon, 27 Feb 2023 06:36:40 -0500
X-MC-Unique: jukybfDHNtuKV46Wsh582A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FC1D100F908;
 Mon, 27 Feb 2023 11:36:40 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73FD61121314;
 Mon, 27 Feb 2023 11:36:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 14/33] target/s390x: Remove TLB_NOTDIRTY workarounds
Date: Mon, 27 Feb 2023 12:36:02 +0100
Message-Id: <20230227113621.58468-15-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

When this code was written, it was using tlb_vaddr_to_host,
which does not handle TLB_DIRTY.  Since then, it has been
converted to probe_access_flags, which does.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230109201856.3916639-6-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 74 +++++++++++------------------------
 1 file changed, 22 insertions(+), 52 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index dc9b5ff088..e9d54b1dd5 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -122,11 +122,7 @@ typedef struct S390Access {
      * If we can't access the host page directly, we'll have to do I/O access
      * via ld/st helpers. These are internal details, so we store the
      * mmu idx to do the access here instead of passing it around in the
-     * helpers. Maybe, one day we can get rid of ld/st access - once we can
-     * handle TLB_NOTDIRTY differently. We don't expect these special accesses
-     * to trigger exceptions - only if we would have TLB_NOTDIRTY on LAP
-     * pages, we might trigger a new MMU translation - very unlikely that
-     * the mapping changes in between and we would trigger a fault.
+     * helpers.
      */
     int mmu_idx;
 } S390Access;
@@ -224,28 +220,14 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
                              uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    g_assert(haddr);
     memset(haddr, byte, size);
 #else
-    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
-    int i;
-
     if (likely(haddr)) {
         memset(haddr, byte, size);
     } else {
-        /*
-         * Do a single access and test if we can then get access to the
-         * page. This is especially relevant to speed up TLB_NOTDIRTY.
-         */
-        g_assert(size > 0);
-        cpu_stb_mmu(env, vaddr, byte, oi, ra);
-        haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
-        if (likely(haddr)) {
-            memset(haddr + 1, byte, size - 1);
-        } else {
-            for (i = 1; i < size; i++) {
-                cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
-            }
+        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+        for (int i = 0; i < size; i++) {
+            cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
         }
     }
 #endif
@@ -265,25 +247,18 @@ static void access_memset(CPUS390XState *env, S390Access *desta,
 }
 
 static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr,
-                                  void **haddr, int offset,
+                                  void *haddr, int offset,
                                   int mmu_idx, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    return ldub_p(*haddr + offset);
+    return ldub_p(haddr + offset);
 #else
-    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
-    uint8_t byte;
-
-    if (likely(*haddr)) {
-        return ldub_p(*haddr + offset);
+    if (likely(haddr)) {
+        return ldub_p(haddr + offset);
+    } else {
+        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+        return cpu_ldb_mmu(env, vaddr + offset, oi, ra);
     }
-    /*
-     * Do a single access and test if we can then get access to the
-     * page. This is especially relevant to speed up TLB_NOTDIRTY.
-     */
-    byte = cpu_ldb_mmu(env, vaddr + offset, oi, ra);
-    *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_LOAD, mmu_idx);
-    return byte;
 #endif
 }
 
@@ -291,32 +266,27 @@ static uint8_t access_get_byte(CPUS390XState *env, S390Access *access,
                                int offset, uintptr_t ra)
 {
     if (offset < access->size1) {
-        return do_access_get_byte(env, access->vaddr1, &access->haddr1,
+        return do_access_get_byte(env, access->vaddr1, access->haddr1,
                                   offset, access->mmu_idx, ra);
     }
-    return do_access_get_byte(env, access->vaddr2, &access->haddr2,
+    return do_access_get_byte(env, access->vaddr2, access->haddr2,
                               offset - access->size1, access->mmu_idx, ra);
 }
 
-static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, void **haddr,
+static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, void *haddr,
                                int offset, uint8_t byte, int mmu_idx,
                                uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    stb_p(*haddr + offset, byte);
+    stb_p(haddr + offset, byte);
 #else
-    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
 
-    if (likely(*haddr)) {
-        stb_p(*haddr + offset, byte);
-        return;
+    if (likely(haddr)) {
+        stb_p(haddr + offset, byte);
+    } else {
+        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+        cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
     }
-    /*
-     * Do a single access and test if we can then get access to the
-     * page. This is especially relevant to speed up TLB_NOTDIRTY.
-     */
-    cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
-    *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
 #endif
 }
 
@@ -324,10 +294,10 @@ static void access_set_byte(CPUS390XState *env, S390Access *access,
                             int offset, uint8_t byte, uintptr_t ra)
 {
     if (offset < access->size1) {
-        do_access_set_byte(env, access->vaddr1, &access->haddr1, offset, byte,
+        do_access_set_byte(env, access->vaddr1, access->haddr1, offset, byte,
                            access->mmu_idx, ra);
     } else {
-        do_access_set_byte(env, access->vaddr2, &access->haddr2,
+        do_access_set_byte(env, access->vaddr2, access->haddr2,
                            offset - access->size1, byte, access->mmu_idx, ra);
     }
 }
-- 
2.31.1


