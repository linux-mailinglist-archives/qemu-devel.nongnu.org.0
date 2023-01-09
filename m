Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35391663177
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:26:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEybq-00054D-VE; Mon, 09 Jan 2023 15:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybo-00051u-EP
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:04 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybl-000532-QV
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:04 -0500
Received: by mail-pf1-x431.google.com with SMTP id 20so1660530pfu.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Vb74LtWwc21gHPOHl2LL8p9rDUC+c0bSduX6H/J5KQ=;
 b=YobFzlTrfQ6TGZV77IeqPPQy/04knVimR1S1P/dgR/ZaRAUVRhPL1Zn+NyC0Q7a8li
 gVHRJozwD5n5aYnu0D4izKELF3xr3AGG5BqUD4L1ARisKgcRdt8K80SJN87vtMW9Y/zX
 xSx3Jf7oo0arL/A58Up0FZ8D01CyGYAtK8XPROoZ1O7OhZioM8lnIlbN4GlBxH5+6+3s
 zg6am9kiI4vcGIluaMtMoallA4Q+GgwiCv8XrqtdEolrI8Wmdd5jsW31x7990j1ICLAe
 6jjUALnfp/jKCzuz8qWUdwEkJEZKs5s3Ziq7T2nMCRRoCg6m6dmwEdTH/XmmbgN/3WXH
 9Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Vb74LtWwc21gHPOHl2LL8p9rDUC+c0bSduX6H/J5KQ=;
 b=rS/94mkOyjbOpya6TUhh53EpCFuQTwWg6plVVLsEN33fIM95IkeAHJWeN4SolZzJIc
 UD3i3DbqW1Ary2VNIV2gNvdftQbCM+ILf5YV1QsX6h9r6vV9k2CIHYnds2UdqSrNY/0b
 SDWTGR2IDFzRS0oa6ozSS+iwOuAZ8rbGh1Kngh5wjbKlumVujie/YXXutn0BFsIhgQhF
 FrzpeqAzQOprHNVUsD2FbpYnFymqjS8dr3m+G4KcG+lIcuPfxZ+EkZ7tjqJ+Dq0/z/YM
 Hmb2F6HV5Rt4uj8ObJVylh40w3TrA/IDWXs5dqwZcmMYn2tvk8abycpWVSlDmHySo8ge
 zoMw==
X-Gm-Message-State: AFqh2koybGvlbic3dyRbce9zGIFD03Q7jSa3aqzBoGSk9a4ACQ5da3wF
 fpQIMOeMTZOvq7SjaEn7lNK0blbFh+d/LnMC
X-Google-Smtp-Source: AMrXdXs9bAZgwL8nWB3vX/bE8UoJA4zqG01e3gOPljksEK/7H6LuifTqFChVsRpGZf31Su81NxYHEw==
X-Received: by 2002:a05:6a00:f0e:b0:587:749c:c0dc with SMTP id
 cr14-20020a056a000f0e00b00587749cc0dcmr6641478pfb.25.1673295540111; 
 Mon, 09 Jan 2023 12:19:00 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 c132-20020a621c8a000000b00589a7824703sm1470972pfc.194.2023.01.09.12.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:18:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: [PATCH 2/7] target/s390x: Pass S390Access pointer into access_prepare
Date: Mon,  9 Jan 2023 12:18:51 -0800
Message-Id: <20230109201856.3916639-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109201856.3916639-1-richard.henderson@linaro.org>
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Passing a pointer from the caller down to access_prepare_nf
eliminates a structure copy.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 100 +++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 5c0a7b1961..6a50189ef0 100644
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
@@ -1005,8 +1004,8 @@ uint32_t HELPER(mvst)(CPUS390XState *env, uint32_t r1, uint32_t r2)
      * this point). We might over-indicate watchpoints within the pages
      * (if we ever care, we have to limit processing to a single byte).
      */
-    srca = access_prepare(env, s, len, MMU_DATA_LOAD, mmu_idx, ra);
-    desta = access_prepare(env, d, len, MMU_DATA_STORE, mmu_idx, ra);
+    access_prepare(&srca, env, s, len, MMU_DATA_LOAD, mmu_idx, ra);
+    access_prepare(&desta, env, d, len, MMU_DATA_STORE, mmu_idx, ra);
     for (i = 0; i < len; i++) {
         const uint8_t v = access_get_byte(env, &srca, i, ra);
 
@@ -1093,19 +1092,19 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
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
@@ -1161,16 +1160,16 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint32_t r1, uint32_t r2)
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
@@ -2329,8 +2328,8 @@ uint32_t HELPER(mvcs)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2,
         return cc;
     }
 
-    srca = access_prepare(env, a2, l, MMU_DATA_LOAD, MMU_PRIMARY_IDX, ra);
-    desta = access_prepare(env, a1, l, MMU_DATA_STORE, MMU_SECONDARY_IDX, ra);
+    access_prepare(&srca, env, a2, l, MMU_DATA_LOAD, MMU_PRIMARY_IDX, ra);
+    access_prepare(&desta, env, a1, l, MMU_DATA_STORE, MMU_SECONDARY_IDX, ra);
     access_memmove(env, &desta, &srca, ra);
     return cc;
 }
@@ -2363,9 +2362,8 @@ uint32_t HELPER(mvcp)(CPUS390XState *env, uint64_t l, uint64_t a1, uint64_t a2,
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
@@ -2706,10 +2704,12 @@ uint32_t HELPER(mvcos)(CPUS390XState *env, uint64_t dest, uint64_t src,
 
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
2.34.1


