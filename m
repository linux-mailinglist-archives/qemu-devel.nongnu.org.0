Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9832AA74
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:36:25 +0100 (CET)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAoi-0005JL-L2
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHARv-0002oW-7I
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHARs-0001rp-BT
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614712366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FQbxM2Klg1c2IH4+aDaVIkZg6X5ktIoD7GNQ1tTtZ84=;
 b=jIJWTXLHDnSfPPG8LFRIBZVRPpFjzjIq24ZmjZWcPrpXe2Lr4bt1A/+M0QsAF5sS50ZYSQ
 oMHDM+qJPNnhkyV8Yjn/OaVmRxqc7E+spslVE+GnpakxrFGJfk0xffsASv6KlgrxF0y9ZU
 1x8h2EFvRGVrBXUVBtLRFu+zIZ1NyHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-fbxwbw6tOo27eMb6tGmpSg-1; Tue, 02 Mar 2021 14:12:32 -0500
X-MC-Unique: fbxwbw6tOo27eMb6tGmpSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C36580196E;
 Tue,  2 Mar 2021 19:12:31 +0000 (UTC)
Received: from thuth.com (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B566D19C93;
 Tue,  2 Mar 2021 19:12:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH] target/s390x: Implement the MVPG condition-code-option bit
Date: Tue,  2 Mar 2021 20:12:24 +0100
Message-Id: <20210302191224.380963-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the CCO bit is set, MVPG should not generate an exception
but report page translation faults via a CC code, so we have
to check the translation in this case before calling the
access_prepare() function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 This patch is required to get Claudio's new kvm-unit-tests patches
 working with TCG: https://www.spinics.net/lists/kvm/msg236784.html

 target/s390x/cpu.h         | 14 ++++++++++++++
 target/s390x/excp_helper.c | 14 --------------
 target/s390x/mem_helper.c  | 23 ++++++++++++++++++++++-
 3 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 60d434d5ed..731e2c6452 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -366,6 +366,20 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
 #endif
 }
 
+static inline uint64_t cpu_mmu_idx_to_asc(int mmu_idx)
+{
+    switch (mmu_idx) {
+    case MMU_PRIMARY_IDX:
+        return PSW_ASC_PRIMARY;
+    case MMU_SECONDARY_IDX:
+        return PSW_ASC_SECONDARY;
+    case MMU_HOME_IDX:
+        return PSW_ASC_HOME;
+    default:
+        abort();
+    }
+}
+
 static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index ce16af394b..44bff27f8f 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -105,20 +105,6 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #else /* !CONFIG_USER_ONLY */
 
-static inline uint64_t cpu_mmu_idx_to_asc(int mmu_idx)
-{
-    switch (mmu_idx) {
-    case MMU_PRIMARY_IDX:
-        return PSW_ASC_PRIMARY;
-    case MMU_SECONDARY_IDX:
-        return PSW_ASC_SECONDARY;
-    case MMU_HOME_IDX:
-        return PSW_ASC_HOME;
-    default:
-        abort();
-    }
-}
-
 bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 25cfede806..c7037adf2c 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -855,10 +855,31 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
     r1 = wrap_address(env, r1 & TARGET_PAGE_MASK);
     r2 = wrap_address(env, r2 & TARGET_PAGE_MASK);
 
+    /*
+     * If the condition-code-option (CCO) bit is set and DAT is enabled,
+     * we have to check for page table translation faults first:
+     */
+#ifndef CONFIG_USER_ONLY
+    if (extract64(r0, 8, 1) && mmu_idx != MMU_REAL_IDX) {
+        uint64_t asc = cpu_mmu_idx_to_asc(mmu_idx);
+        uint64_t raddr, tec;
+        int flags, exc;
+
+        exc = mmu_translate(env, r2, MMU_DATA_LOAD, asc, &raddr, &flags, &tec);
+        if (exc) {
+            return 2;
+        }
+
+        exc = mmu_translate(env, r1, MMU_DATA_STORE, asc, &raddr, &flags, &tec);
+        if (exc && exc != PGM_PROTECTION) {
+            return 1;
+        }
+    }
+#endif
+
     /*
      * TODO:
      * - Access key handling
-     * - CC-option with surpression of page-translation exceptions
      * - Store r1/r2 register identifiers at real location 162
      */
     srca = access_prepare(env, r2, TARGET_PAGE_SIZE, MMU_DATA_LOAD, mmu_idx,
-- 
2.27.0


