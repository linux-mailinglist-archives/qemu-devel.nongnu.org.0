Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1AE6A40CD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboG-0005dA-47; Mon, 27 Feb 2023 06:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboD-0005XL-0K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboB-0005gO-Fx
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qZyOf8rmw5OCUwVosJn2HKesgZmHQoVJenmudKYq3A=;
 b=iQZwMYbX9CMQBWonhYyq2KvMlx4J5vVDYifR8g3fOod6Ufgr04qlOZC3sy61dRreMCqSjv
 joawbG9SeR6ugWj2RuIJ5LwspFAFXw7eJjtszDNeEjNecVLE8Uu4E0XzQ8BttTNDawCf/o
 +s8dSsK9SwxHObZUDqYZQ35755rA7p4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-LukEIeTYP1K6pq1djUmfpA-1; Mon, 27 Feb 2023 06:36:39 -0500
X-MC-Unique: LukEIeTYP1K6pq1djUmfpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30A4A183B3C1;
 Mon, 27 Feb 2023 11:36:39 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 459B41121314;
 Mon, 27 Feb 2023 11:36:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 13/33] target/s390x: Tidy access_prepare_nf
Date: Mon, 27 Feb 2023 12:36:01 +0100
Message-Id: <20230227113621.58468-14-thuth@redhat.com>
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

Assign to access struct immediately, rather than waiting
until the end of the function.  This means we can pass
address of haddr struct members instead of allocating
extra space on the local stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230109201856.3916639-5-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 4d157ba9cf..dc9b5ff088 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -176,39 +176,35 @@ static int access_prepare_nf(S390Access *access, CPUS390XState *env,
                              MMUAccessType access_type,
                              int mmu_idx, uintptr_t ra)
 {
-    void *haddr1, *haddr2 = NULL;
     int size1, size2, exc;
-    vaddr vaddr2 = 0;
 
     assert(size > 0 && size <= 4096);
 
     size1 = MIN(size, -(vaddr1 | TARGET_PAGE_MASK)),
     size2 = size - size1;
 
+    memset(access, 0, sizeof(*access));
+    access->vaddr1 = vaddr1;
+    access->size1 = size1;
+    access->size2 = size2;
+    access->mmu_idx = mmu_idx;
+
     exc = s390_probe_access(env, vaddr1, size1, access_type, mmu_idx, nonfault,
-                            &haddr1, ra);
-    if (exc) {
+                            &access->haddr1, ra);
+    if (unlikely(exc)) {
         return exc;
     }
     if (unlikely(size2)) {
         /* The access crosses page boundaries. */
-        vaddr2 = wrap_address(env, vaddr1 + size1);
+        vaddr vaddr2 = wrap_address(env, vaddr1 + size1);
+
+        access->vaddr2 = vaddr2;
         exc = s390_probe_access(env, vaddr2, size2, access_type, mmu_idx,
-                                nonfault, &haddr2, ra);
-        if (exc) {
+                                nonfault, &access->haddr2, ra);
+        if (unlikely(exc)) {
             return exc;
         }
     }
-
-    *access = (S390Access) {
-        .vaddr1 = vaddr1,
-        .vaddr2 = vaddr2,
-        .haddr1 = haddr1,
-        .haddr2 = haddr2,
-        .size1 = size1,
-        .size2 = size2,
-        .mmu_idx = mmu_idx
-    };
     return 0;
 }
 
-- 
2.31.1


