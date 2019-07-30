Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63257A5C3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 12:14:04 +0200 (CEST)
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsP8u-0003Cq-2R
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 06:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40088)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hsP8K-0002lo-Mu
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 06:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hsP8J-0005q5-K9
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 06:13:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:41100)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hsP8J-0005pf-Db
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 06:13:27 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hsP8F-0006ts-EH; Tue, 30 Jul 2019 13:13:23 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Jul 2019 13:13:13 +0300
Message-Id: <1564481593-776647-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] Fix: fp-test uninitialized member floatX::exp
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
Cc: vsementsov@virtuozzo.com, jhauser@eecs.berkeley.edu, cota@braap.org,
 den@openvz.org, andrey.shinkevich@virtuozzo.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not all the paths in the functions, such as f16ToFloatX(), initialize
the member 'exp' of the structure floatX.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 source/slowfloat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/fp/berkeley-testfloat-3/source/slowfloat.c b/tests/fp/berkeley-testfloat-3/source/slowfloat.c
index 4e84656..6e0f0a6 100644
--- a/tests/fp/berkeley-testfloat-3/source/slowfloat.c
+++ b/tests/fp/berkeley-testfloat-3/source/slowfloat.c
@@ -623,6 +623,7 @@ static void f16ToFloatX( float16_t a, struct floatX *xPtr )
     xPtr->isInf = false;
     xPtr->isZero = false;
     xPtr->sign = ((uiA & 0x8000) != 0);
+    xPtr->exp = 0;
     exp = uiA>>10 & 0x1F;
     sig64 = uiA & 0x03FF;
     sig64 <<= 45;
@@ -759,6 +760,7 @@ static void f32ToFloatX( float32_t a, struct floatX *xPtr )
     xPtr->isInf = false;
     xPtr->isZero = false;
     xPtr->sign = ((uiA & 0x80000000) != 0);
+    xPtr->exp = 0;
     exp = uiA>>23 & 0xFF;
     sig64 = uiA & 0x007FFFFF;
     sig64 <<= 32;
@@ -895,6 +897,7 @@ static void f64ToFloatX( float64_t a, struct floatX *xPtr )
     xPtr->isInf = false;
     xPtr->isZero = false;
     xPtr->sign = ((uiA & UINT64_C( 0x8000000000000000 )) != 0);
+    xPtr->exp = 0;
     exp = uiA>>52 & 0x7FF;
     sig64 = uiA & UINT64_C( 0x000FFFFFFFFFFFFF );
     if ( exp == 0x7FF ) {
@@ -1220,6 +1223,7 @@ static void f128MToFloatX( const float128_t *aPtr, struct floatX *xPtr )
     xPtr->isZero = false;
     uiA64 = uiAPtr->v64;
     xPtr->sign = ((uiA64 & UINT64_C( 0x8000000000000000 )) != 0);
+    xPtr->exp = 0;
     exp = uiA64>>48 & 0x7FFF;
     sig.v64 = uiA64 & UINT64_C( 0x0000FFFFFFFFFFFF );
     sig.v0  = uiAPtr->v0;
-- 
1.8.3.1


