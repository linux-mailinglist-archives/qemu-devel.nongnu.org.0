Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C036A40CB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboX-0005mW-Ax; Mon, 27 Feb 2023 06:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboB-0005Vo-7u
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo8-0005fo-SM
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAKwmeTOeyn7JLLAVF91NlLOO4Jtbx8guz8PqtxwXWo=;
 b=g/ikOSqDMida5zsGvwnzoDQvOYFSQSq5Past3Vp6e8Y3cpTwrPepSTvnFos4gviIKjK8m6
 NY+l/Rj/li9HThOG5jwA94Azi7IJ2VURiUxNaBVZrLqZ5GSaSujGndMW+EsG4OMW8zrkq2
 p0DqIHgYXuSE8HkUX8xd95qyqS/TNBU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-QMhUR_nSMJa4yJPLCaIgxA-1; Mon, 27 Feb 2023 06:36:37 -0500
X-MC-Unique: QMhUR_nSMJa4yJPLCaIgxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC43C3815EEC;
 Mon, 27 Feb 2023 11:36:36 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFAA51121314;
 Mon, 27 Feb 2023 11:36:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 11/33] target/s390x: Pass S390Access pointer into access_prepare
Date: Mon, 27 Feb 2023 12:35:59 +0100
Message-Id: <20230227113621.58468-12-thuth@redhat.com>
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

Passing a pointer from the caller down to access_prepare_nf
eliminates a structure copy.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230109201856.3916639-3-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 100 +++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 9a6dce4cda..28bf3bd53c 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -212,15 +212,14 @@ static int access_prepare_nf(S390Access *access, CPUS390XState *env,
     return 0;
 }
 
-static S390Access access_prepare(CPUS390XState *env, vaddr vaddr, int size,
-                                 MMUAccessType access_type, int mmu_idx,
-                                 uintptr_t ra)
+static inline void access_prepare(S390Access *ret, CPUS390XState *env,
+                                  vaddr vaddr, int size,
+                                  MMUAccessType access_type, int mmu_idx,
+                                  uintptr_t ra)
 {
-    S390Access ret;
-    int exc = access_prepare_nf(&ret, env, false, vaddr, size,
+    int exc = access_prepare_nf(ret, env, false, vaddr, size,
                                 access_type, mmu_idx, ra);
     assert(!exc);
-    return ret;
 }
 
 /* Helper to handle memset on a single page. */
@@ -412,9 +411,9 @@ static uint32_t do_helper_nc(CPUS390XState *env, uint32_t l, uint64_t dest,
     /* NC always processes one more byte than specified - maximum is 256 */
     l++;
 
-    srca1 = access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
-    srca2 = access_prepare(env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca1, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&srca2, env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
     for (i = 0; i < l; i++) {
         const uint8_t x = access_get_byte(env, &srca1, i, ra) &
                           access_get_byte(env, &srca2, i, ra);
@@ -446,9 +445,9 @@ static uint32_t do_helper_xc(CPUS390XState *env, uint32_t l, uint64_t dest,
     /* XC always processes one more byte than specified - maximum is 256 */
     l++;
 
-    srca1 = access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
-    srca2 = access_prepare(env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca1, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&srca2, env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
 
     /* xor with itself is the same as memset(0) */
     if (src == dest) {
@@ -487,9 +486,9 @@ static uint32_t do_helper_oc(CPUS390XState *env, uint32_t l, uint64_t dest,
     /* OC always processes one more byte than specified - maximum is 256 */
     l++;
 
-    srca1 = access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
-    srca2 = access_prepare(env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca1, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&srca2, env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
     for (i = 0; i < l; i++) {
         const uint8_t x = access_get_byte(env, &srca1, i, ra) |
                           access_get_byte(env, &srca2, i, ra);
@@ -520,8 +519,8 @@ static uint32_t do_helper_mvc(CPUS390XState *env, uint32_t l, uint64_t dest,
     /* MVC always copies one more byte than specified - maximum is 256 */
     l++;
 
-    srca = access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
 
     /*
      * "When the operands overlap, the result is obtained as if the operands
@@ -559,8 +558,8 @@ void HELPER(mvcrl)(CPUS390XState *env, uint64_t l, uint64_t dest, uint64_t src)
     /* MVCRL always copies one more byte than specified - maximum is 256 */
     l++;
 
-    srca = access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
 
     for (i = l - 1; i >= 0; i--) {
         uint8_t byte = access_get_byte(env, &srca, i, ra);
@@ -580,8 +579,8 @@ void HELPER(mvcin)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
     l++;
 
     src = wrap_address(env, src - l + 1);
-    srca = access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
     for (i = 0; i < l; i++) {
         const uint8_t x = access_get_byte(env, &srca, l - i - 1, ra);
 
@@ -600,9 +599,9 @@ void HELPER(mvn)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
     /* MVN always copies one more byte than specified - maximum is 256 */
     l++;
 
-    srca1 = access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
-    srca2 = access_prepare(env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca1, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&srca2, env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
     for (i = 0; i < l; i++) {
         const uint8_t x = (access_get_byte(env, &srca1, i, ra) & 0x0f) |
                           (access_get_byte(env, &srca2, i, ra) & 0xf0);
@@ -623,8 +622,8 @@ void HELPER(mvo)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
     S390Access srca, desta;
     int i, j;
 
-    srca = access_prepare(env, src, len_src, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, dest, len_dest, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca, env, src, len_src, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, dest, len_dest, MMU_DATA_STORE, mmu_idx, ra);
 
     /* Handle rightmost byte */
     byte_dest = cpu_ldub_data_ra(env, dest + len_dest - 1, ra);
@@ -656,9 +655,9 @@ void HELPER(mvz)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
     /* MVZ always copies one more byte than specified - maximum is 256 */
     l++;
 
-    srca1 = access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
-    srca2 = access_prepare(env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca1, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&srca2, env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
     for (i = 0; i < l; i++) {
         const uint8_t x = (access_get_byte(env, &srca1, i, ra) & 0xf0) |
                           (access_get_byte(env, &srca2, i, ra) & 0x0f);
@@ -1002,8 +1001,8 @@ uint32_t HELPER(mvst)(CPUS390XState *env, uint32_t r1, uint32_t r2)
      * this point). We might over-indicate watchpoints within the pages
      * (if we ever care, we have to limit processing to a single byte).
      */
-    srca = access_prepare(env, s, len, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, d, len, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca, env, s, len, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, d, len, MMU_DATA_STORE, mmu_idx, ra);
     for (i = 0; i < len; i++) {
         const uint8_t v = access_get_byte(env, &srca, i, ra);
 
@@ -1090,19 +1089,19 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
         len = MIN(MIN(*srclen, -(*src | TARGET_PAGE_MASK)), len);
         *destlen -= len;
         *srclen -= len;
-        srca = access_prepare(env, *src, len, MMU_DATA_LOAD, mmu_idx, ra);
-        desta = access_prepare(env, *dest, len, MMU_DATA_STORE, mmu_idx, ra);
+        access_prepare(&srca, env, *src, len, MMU_DATA_LOAD, mmu_idx, ra);
+        access_prepare(&desta, env, *dest, len, MMU_DATA_STORE, mmu_idx, ra);
         access_memmove(env, &desta, &srca, ra);
         *src = wrap_address(env, *src + len);
         *dest = wrap_address(env, *dest + len);
     } else if (wordsize == 1) {
         /* Pad the remaining area */
         *destlen -= len;
-        desta = access_prepare(env, *dest, len, MMU_DATA_STORE, mmu_idx, ra);
+        access_prepare(&desta, env, *dest, len, MMU_DATA_STORE, mmu_idx, ra);
         access_memset(env, &desta, pad, ra);
         *dest = wrap_address(env, *dest + len);
     } else {
-        desta = access_prepare(env, *dest, len, MMU_DATA_STORE, mmu_idx, ra);
+        access_prepare(&desta, env, *dest, len, MMU_DATA_STORE, mmu_idx, ra);
 
         /* The remaining length selects the padding byte. */
         for (i = 0; i < len; (*destlen)--, i++) {
@@ -1158,16 +1157,16 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t r1, uint32_t r2)
     while (destlen) {
         cur_len = MIN(destlen, -(dest | TARGET_PAGE_MASK));
         if (!srclen) {
-            desta = access_prepare(env, dest, cur_len, MMU_DATA_STORE, mmu_idx,
-                                   ra);
+            access_prepare(&desta, env, dest, cur_len,
+                           MMU_DATA_STORE, mmu_idx, ra);
             access_memset(env, &desta, pad, ra);
         } else {
             cur_len = MIN(MIN(srclen, -(src | TARGET_PAGE_MASK)), cur_len);
 
-            srca = access_prepare(env, src, cur_len, MMU_DATA_LOAD, mmu_idx,
-                                  ra);
-            desta = access_prepare(env, dest, cur_len, MMU_DATA_STORE, mmu_idx,
-                                   ra);
+            access_prepare(&srca, env, src, cur_len,
+                           MMU_DATA_LOAD, mmu_idx, ra);
+            access_prepare(&desta, env, dest, cur_len,
+                           MMU_DATA_STORE, mmu_idx, ra);
             access_memmove(env, &desta, &srca, ra);
             src = wrap_address(env, src + cur_len);
             srclen -= cur_len;
@@ -2272,8 +2271,8 @@ uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2,
         return cc;
     }
 
-    srca = access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_PRIMARY_IDX, ra);
-    desta = access_prepare(env, a1, l, MMU_DATA_STORE, MMU_SECONDARY_IDX, ra);
+    access_prepare(&srca, env, a2, l, MMU_DATA_LOAD, MMU_PRIMARY_IDX, ra);
+    access_prepare(&desta, env, a1, l, MMU_DATA_STORE, MMU_SECONDARY_IDX, ra);
     access_memmove(env, &desta, &srca, ra);
     return cc;
 }
@@ -2306,9 +2305,8 @@ uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2,
     } else if (!l) {
         return cc;
     }
-
-    srca = access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_SECONDARY_IDX, ra);
-    desta = access_prepare(env, a1, l, MMU_DATA_STORE, MMU_PRIMARY_IDX, ra);
+    access_prepare(&srca, env, a2, l, MMU_DATA_LOAD, MMU_SECONDARY_IDX, ra);
+    access_prepare(&desta, env, a1, l, MMU_DATA_STORE, MMU_PRIMARY_IDX, ra);
     access_memmove(env, &desta, &srca, ra);
     return cc;
 }
@@ -2649,10 +2647,12 @@ uint32_t HELPER(mvcos)(CPUS390XState *env, uint64_t dest, uint64_t src,
 
     /* FIXME: Access using correct keys and AR-mode */
     if (len) {
-        S390Access srca = access_prepare(env, src, len, MMU_DATA_LOAD,
-                                         mmu_idx_from_as(src_as), ra);
-        S390Access desta = access_prepare(env, dest, len, MMU_DATA_STORE,
-                                          mmu_idx_from_as(dest_as), ra);
+        S390Access srca, desta;
+
+        access_prepare(&srca, env, src, len, MMU_DATA_LOAD,
+                       mmu_idx_from_as(src_as), ra);
+        access_prepare(&desta, env, dest, len, MMU_DATA_STORE,
+                       mmu_idx_from_as(dest_as), ra);
 
         access_memmove(env, &desta, &srca, ra);
     }
-- 
2.31.1


