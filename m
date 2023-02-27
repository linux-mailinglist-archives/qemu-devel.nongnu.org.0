Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF7E6A40BE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbob-0005no-11; Mon, 27 Feb 2023 06:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboK-0005hW-8L
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboD-0005gu-Oa
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJu1omemYgmdzSiPVvM1QWO79XReOAHvv5PBaV/QHbc=;
 b=V2aWMSQJ0Z9U/C92Si5c6FPlzLa/uF7O/PrmcelnH53aRElQU4I4ct7a0SRWGyld9MYHQB
 HTcuEg2WpeubflUwx8tJHbtgHhnd/QmP4osCPsuC4s1COfkfutdrthwHceioSsQ0zgn5b9
 prekFMBqoB0Y/fd1jj2IpKRSJoyK+54=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-74KnOLI2OAKFiiC3-nVJJA-1; Mon, 27 Feb 2023 06:36:41 -0500
X-MC-Unique: 74KnOLI2OAKFiiC3-nVJJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89255101AA78;
 Mon, 27 Feb 2023 11:36:41 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A44961121314;
 Mon, 27 Feb 2023 11:36:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 15/33] target/s390x: Inline do_access_{get,set}_byte
Date: Mon, 27 Feb 2023 12:36:03 +0100
Message-Id: <20230227113621.58468-16-thuth@redhat.com>
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

Inline into the parent functions with a simple test
to select the page, and a new define to remove ifdefs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230109201856.3916639-7-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 70 +++++++++++++++--------------------
 1 file changed, 30 insertions(+), 40 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index e9d54b1dd5..f28126fde6 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -35,6 +35,12 @@
 #include "hw/boards.h"
 #endif
 
+#ifdef CONFIG_USER_ONLY
+# define user_or_likely(X)    true
+#else
+# define user_or_likely(X)    likely(X)
+#endif
+
 /*****************************************************************************/
 /* Softmmu support */
 
@@ -246,59 +252,43 @@ static void access_memset(CPUS390XState *env, S390Access *desta,
                      desta->mmu_idx, ra);
 }
 
-static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr,
-                                  void *haddr, int offset,
-                                  int mmu_idx, uintptr_t ra)
-{
-#ifdef CONFIG_USER_ONLY
-    return ldub_p(haddr + offset);
-#else
-    if (likely(haddr)) {
-        return ldub_p(haddr + offset);
-    } else {
-        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
-        return cpu_ldb_mmu(env, vaddr + offset, oi, ra);
-    }
-#endif
-}
-
 static uint8_t access_get_byte(CPUS390XState *env, S390Access *access,
                                int offset, uintptr_t ra)
 {
-    if (offset < access->size1) {
-        return do_access_get_byte(env, access->vaddr1, access->haddr1,
-                                  offset, access->mmu_idx, ra);
-    }
-    return do_access_get_byte(env, access->vaddr2, access->haddr2,
-                              offset - access->size1, access->mmu_idx, ra);
-}
+    target_ulong vaddr = access->vaddr1;
+    void *haddr = access->haddr1;
 
-static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, void *haddr,
-                               int offset, uint8_t byte, int mmu_idx,
-                               uintptr_t ra)
-{
-#ifdef CONFIG_USER_ONLY
-    stb_p(haddr + offset, byte);
-#else
+    if (unlikely(offset >= access->size1)) {
+        offset -= access->size1;
+        vaddr = access->vaddr2;
+        haddr = access->haddr2;
+    }
 
-    if (likely(haddr)) {
-        stb_p(haddr + offset, byte);
+    if (user_or_likely(haddr)) {
+        return ldub_p(haddr + offset);
     } else {
-        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
-        cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
+        MemOpIdx oi = make_memop_idx(MO_UB, access->mmu_idx);
+        return cpu_ldb_mmu(env, vaddr + offset, oi, ra);
     }
-#endif
 }
 
 static void access_set_byte(CPUS390XState *env, S390Access *access,
                             int offset, uint8_t byte, uintptr_t ra)
 {
-    if (offset < access->size1) {
-        do_access_set_byte(env, access->vaddr1, access->haddr1, offset, byte,
-                           access->mmu_idx, ra);
+    target_ulong vaddr = access->vaddr1;
+    void *haddr = access->haddr1;
+
+    if (unlikely(offset >= access->size1)) {
+        offset -= access->size1;
+        vaddr = access->vaddr2;
+        haddr = access->haddr2;
+    }
+
+    if (user_or_likely(haddr)) {
+        stb_p(haddr + offset, byte);
     } else {
-        do_access_set_byte(env, access->vaddr2, access->haddr2,
-                           offset - access->size1, byte, access->mmu_idx, ra);
+        MemOpIdx oi = make_memop_idx(MO_UB, access->mmu_idx);
+        cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
     }
 }
 
-- 
2.31.1


