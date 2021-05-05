Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F32B3738DA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:52:53 +0200 (CEST)
Received: from localhost ([::1]:42398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leF99-0000Rf-Sc
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1leF6c-0007Fl-62
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:50:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1leF6T-0005zH-Hh
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620211802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6+GlYhWHnz6iOlMWUKZRy6xvZVZrZYZEyUyg01fTwbA=;
 b=IeL7DiEV9eh6gK1j9MDR5L4t5uVkB9Fm66yLK2N7eOV/IvOZ1Uamu2tGfjN7ZY1zuFx578
 9JmQ3mDntF/7VXhE8ISgS1/DDeJQdpOCG7qQDgmXyqBt6v1wMOieoYNoiSDqW+a/Ao8dO1
 s7dKAEXrKuYkDhzsftytw3Ssz4PdFVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-F5qQPHOFPBiIqCXKQ88Ktw-1; Wed, 05 May 2021 06:50:00 -0400
X-MC-Unique: F5qQPHOFPBiIqCXKQ88Ktw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A2450207;
 Wed,  5 May 2021 10:49:59 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-245.ams2.redhat.com [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FFE459446;
 Wed,  5 May 2021 10:49:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] softfloat: Silence signaling NaN when converting to/from
 float128
Date: Wed,  5 May 2021 12:49:52 +0200
Message-Id: <20210505104952.5632-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We forgot to silence the NaN, just as we already do for the other
conversions.

Found by comparing the result of running randomly generated FP instructions
under s390x/tcg and comparing against the result on real HW.

Unfortunately, test cases like f32_to_f128 cannot be unlocked yet as
some expected values (with NaN) are wrongly calculated.

Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fpu/softfloat.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 67cfa0fd82..e9f2117a6d 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -4924,7 +4924,9 @@ float128 float32_to_float128(float32 a, float_status *status)
     aSign = extractFloat32Sign( a );
     if ( aExp == 0xFF ) {
         if (aSig) {
-            return commonNaNToFloat128(float32ToCommonNaN(a, status), status);
+            float128 res = commonNaNToFloat128(float32ToCommonNaN(a, status),
+                                               status);
+            return float128_silence_nan(res, status);
         }
         return packFloat128( aSign, 0x7FFF, 0, 0 );
     }
@@ -5229,7 +5231,9 @@ float128 float64_to_float128(float64 a, float_status *status)
     aSign = extractFloat64Sign( a );
     if ( aExp == 0x7FF ) {
         if (aSig) {
-            return commonNaNToFloat128(float64ToCommonNaN(a, status), status);
+            float128 res = commonNaNToFloat128(float64ToCommonNaN(a, status),
+                                               status);
+            return float128_silence_nan(res, status);
         }
         return packFloat128( aSign, 0x7FFF, 0, 0 );
     }
@@ -6665,7 +6669,9 @@ float32 float128_to_float32(float128 a, float_status *status)
     aSign = extractFloat128Sign( a );
     if ( aExp == 0x7FFF ) {
         if ( aSig0 | aSig1 ) {
-            return commonNaNToFloat32(float128ToCommonNaN(a, status), status);
+            float32 res = commonNaNToFloat32(float128ToCommonNaN(a, status),
+                                             status);
+            return float32_silence_nan(res, status);
         }
         return packFloat32( aSign, 0xFF, 0 );
     }
@@ -6699,7 +6705,9 @@ float64 float128_to_float64(float128 a, float_status *status)
     aSign = extractFloat128Sign( a );
     if ( aExp == 0x7FFF ) {
         if ( aSig0 | aSig1 ) {
-            return commonNaNToFloat64(float128ToCommonNaN(a, status), status);
+            float64 res = commonNaNToFloat64(float128ToCommonNaN(a, status),
+                                             status);
+            return float64_silence_nan(res, status);
         }
         return packFloat64( aSign, 0x7FF, 0 );
     }
-- 
2.30.2


