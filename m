Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960236A40BA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboK-0005hk-VY; Mon, 27 Feb 2023 06:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboF-0005dr-BR
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboD-0005gq-Fc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKAMphEjWC3G2kT87C3UlKB2yZG6Vl47kFoNLNmNTk8=;
 b=FNy2QCbjjojcG5yXcS4vTCmxdxh8N7tD5A0NmHxmalOyyO2F0tXh2lGCLTHNztElWvQZAr
 klFRjbPz9vQin9EDHpqot5m0T1YsdKlqUoba2SfDmASFkUwbgXAIp2+6ROExnTyeNMJqfY
 KD2j3OVh/WE4LJR7VyG3VvBVLJQSOk0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-aPiggFU8NHWU9mlI2j3wGw-1; Mon, 27 Feb 2023 06:36:36 -0500
X-MC-Unique: aPiggFU8NHWU9mlI2j3wGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 998F83C0E445;
 Mon, 27 Feb 2023 11:36:35 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE9BA1121314;
 Mon, 27 Feb 2023 11:36:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 10/33] target/s390x: Fix s390_probe_access for user-only
Date: Mon, 27 Feb 2023 12:35:58 +0100
Message-Id: <20230227113621.58468-11-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

In db9aab5783a2 we broke the contract of s390_probe_access, in that it
no longer returned an exception code, nor set __excp_addr.  Fix both.

Reported-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230109201856.3916639-2-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index d6725fd18c..9a6dce4cda 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -138,23 +138,27 @@ typedef struct S390Access {
  * For !CONFIG_USER_ONLY, the TEC is stored stored to env->tlb_fill_tec.
  * For CONFIG_USER_ONLY, the faulting address is stored to env->__excp_addr.
  */
-static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
-                             MMUAccessType access_type, int mmu_idx,
-                             bool nonfault, void **phost, uintptr_t ra)
+static inline int s390_probe_access(CPUArchState *env, target_ulong addr,
+                                    int size, MMUAccessType access_type,
+                                    int mmu_idx, bool nonfault,
+                                    void **phost, uintptr_t ra)
 {
-#if defined(CONFIG_USER_ONLY)
-    return probe_access_flags(env, addr, access_type, mmu_idx,
-                              nonfault, phost, ra);
-#else
-    int flags;
+    int flags = probe_access_flags(env, addr, access_type, mmu_idx,
+                                   nonfault, phost, ra);
 
-    env->tlb_fill_exc = 0;
-    flags = probe_access_flags(env, addr, access_type, mmu_idx, nonfault, phost,
-                               ra);
-    if (env->tlb_fill_exc) {
+    if (unlikely(flags & TLB_INVALID_MASK)) {
+        assert(!nonfault);
+#ifdef CONFIG_USER_ONLY
+        /* Address is in TEC in system mode; see s390_cpu_record_sigsegv. */
+        env->__excp_addr = addr & TARGET_PAGE_MASK;
+        return (page_get_flags(addr) & PAGE_VALID
+                ? PGM_PROTECTION : PGM_ADDRESSING);
+#else
         return env->tlb_fill_exc;
+#endif
     }
 
+#ifndef CONFIG_USER_ONLY
     if (unlikely(flags & TLB_WATCHPOINT)) {
         /* S390 does not presently use transaction attributes. */
         cpu_check_watchpoint(env_cpu(env), addr, size,
@@ -162,8 +166,9 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
                              (access_type == MMU_DATA_STORE
                               ? BP_MEM_WRITE : BP_MEM_READ), ra);
     }
-    return 0;
 #endif
+
+    return 0;
 }
 
 static int access_prepare_nf(S390Access *access, CPUS390XState *env,
-- 
2.31.1


