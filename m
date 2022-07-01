Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B5F56294A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 04:53:54 +0200 (CEST)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o76n2-0006pK-Cf
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 22:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o76kw-00067J-K3
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 22:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o76kt-0000hN-B8
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 22:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656643897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=emJIzaXU33jokcSSZk15QMiAvLvTJVyhadkqR2/7Mwg=;
 b=bHGs2L4Uaxk9NLCtnSeZ0M8llr+8L/ElKAWlJTY66H125a/Rxe8uxtcZhnD2M0IZyLvvar
 N0bn9APjZugQWRB0MtkBlAkr73obsZfSujry/yz51xvp1VexDbb8BQPGmucLzpLf1WSD/K
 QNSXEcacRixonstF/We5VmutghVtDoU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-8F8RYlKgMEi8JD_3gF284A-1; Thu, 30 Jun 2022 22:51:36 -0400
X-MC-Unique: 8F8RYlKgMEi8JD_3gF284A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B9DC811E75;
 Fri,  1 Jul 2022 02:51:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C8052026D64;
 Fri,  1 Jul 2022 02:51:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] include/qemu/host-utils: Remove unused code in the *_overflow
 wrappers
Date: Fri,  1 Jul 2022 04:51:32 +0200
Message-Id: <20220701025132.303469-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to commit cec07c0b612975 the code in the #else paths was required
for GCC < 5.0 and Clang < 3.8. We don't support such old compilers
at all anymore, so we can remove these lines now. We keep the wrapper
function, though, since they are easier to read and help to make sure that
the parameters have the right types.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/host-utils.h | 65 ---------------------------------------
 1 file changed, 65 deletions(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index bc743f5e32..29f3a99878 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -376,12 +376,7 @@ static inline uint64_t uabs64(int64_t v)
  */
 static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
 {
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
     return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return ((*ret ^ x) & ~(x ^ y)) < 0;
-#endif
 }
 
 /**
@@ -394,12 +389,7 @@ static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
  */
 static inline bool sadd64_overflow(int64_t x, int64_t y, int64_t *ret)
 {
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
     return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return ((*ret ^ x) & ~(x ^ y)) < 0;
-#endif
 }
 
 /**
@@ -412,12 +402,7 @@ static inline bool sadd64_overflow(int64_t x, int64_t y, int64_t *ret)
  */
 static inline bool uadd32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
 {
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
     return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return *ret < x;
-#endif
 }
 
 /**
@@ -430,12 +415,7 @@ static inline bool uadd32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
  */
 static inline bool uadd64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
 {
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
     return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return *ret < x;
-#endif
 }
 
 /**
@@ -449,12 +429,7 @@ static inline bool uadd64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
  */
 static inline bool ssub32_overflow(int32_t x, int32_t y, int32_t *ret)
 {
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
     return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return ((*ret ^ x) & (x ^ y)) < 0;
-#endif
 }
 
 /**
@@ -468,12 +443,7 @@ static inline bool ssub32_overflow(int32_t x, int32_t y, int32_t *ret)
  */
 static inline bool ssub64_overflow(int64_t x, int64_t y, int64_t *ret)
 {
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
     return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return ((*ret ^ x) & (x ^ y)) < 0;
-#endif
 }
 
 /**
@@ -487,12 +457,7 @@ static inline bool ssub64_overflow(int64_t x, int64_t y, int64_t *ret)
  */
 static inline bool usub32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
 {
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
     return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return x < y;
-#endif
 }
 
 /**
@@ -506,12 +471,7 @@ static inline bool usub32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
  */
 static inline bool usub64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
 {
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
     return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return x < y;
-#endif
 }
 
 /**
@@ -524,13 +484,7 @@ static inline bool usub64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
  */
 static inline bool smul32_overflow(int32_t x, int32_t y, int32_t *ret)
 {
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
     return __builtin_mul_overflow(x, y, ret);
-#else
-    int64_t z = (int64_t)x * y;
-    *ret = z;
-    return *ret != z;
-#endif
 }
 
 /**
@@ -543,14 +497,7 @@ static inline bool smul32_overflow(int32_t x, int32_t y, int32_t *ret)
  */
 static inline bool smul64_overflow(int64_t x, int64_t y, int64_t *ret)
 {
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
     return __builtin_mul_overflow(x, y, ret);
-#else
-    uint64_t hi, lo;
-    muls64(&lo, &hi, x, y);
-    *ret = lo;
-    return hi != ((int64_t)lo >> 63);
-#endif
 }
 
 /**
@@ -563,13 +510,7 @@ static inline bool smul64_overflow(int64_t x, int64_t y, int64_t *ret)
  */
 static inline bool umul32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
 {
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
     return __builtin_mul_overflow(x, y, ret);
-#else
-    uint64_t z = (uint64_t)x * y;
-    *ret = z;
-    return z > UINT32_MAX;
-#endif
 }
 
 /**
@@ -582,13 +523,7 @@ static inline bool umul32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
  */
 static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
 {
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
     return __builtin_mul_overflow(x, y, ret);
-#else
-    uint64_t hi;
-    mulu64(ret, &hi, x, y);
-    return hi != 0;
-#endif
 }
 
 /*
-- 
2.31.1


