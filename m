Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023CE38312E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:35:36 +0200 (CEST)
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieLH-00070T-0x
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieGp-0007P2-D8
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieGn-0000Lv-DF
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7oC5YC2ddXurDtf32pdmsWcpmxGMGoSxNpuKz3zs50=;
 b=G2wlbcMjeUWIB53CemKkYMa0DW/GIwC+Jdgwdttv5Bk7KpEeChi0l/82WEpDiZQsgVM0rJ
 UUK977XNd4qOBxcuQLsb6JM7db5Gnhe7lyPX4Yo/UBDPiLYqp8JMXE/VvhlvpdfAfehGNN
 JQSPrWr28/LvtNSJpYHl4utdLYH/Q0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-0tb-MeWFNZK1JZSklb6QPg-1; Mon, 17 May 2021 10:30:55 -0400
X-MC-Unique: 0tb-MeWFNZK1JZSklb6QPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D45F108C2AE;
 Mon, 17 May 2021 14:30:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 133D65E278;
 Mon, 17 May 2021 14:30:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/26] softfloat: Implement
 float128_(min|minnum|minnummag|max|maxnum|maxnummag)
Date: Mon, 17 May 2021 16:27:36 +0200
Message-Id: <20210517142739.38597-24-david@redhat.com>
In-Reply-To: <20210517142739.38597-1-david@redhat.com>
References: <20210517142739.38597-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With Richard's softfloat rework, the float128 implementation is
straight-forward. Unfortuantely, we don't have any tests we can simply
adjust/unlock.

Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fpu/softfloat.c         | 17 +++++++++++++++++
 include/fpu/softfloat.h |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 7376b3470c..bfe5a6b975 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3893,6 +3893,22 @@ static float64 float64_minmax(float64 a, float64 b, float_status *s, int flags)
     return which ? b : a;
 }
 
+static float128 float128_minmax(float128 a, float128 b, float_status *s,
+                                int flags)
+{
+    FloatParts128 pa, pb;
+    int which;
+
+    float128_unpack_canonical(&pa, a, s);
+    float128_unpack_canonical(&pb, b, s);
+    which = parts_minmax(&pa, &pb, s, flags, &float64_params);
+    if (unlikely(which < 0)) {
+        /* Some sort of nan, need to repack default and silenced nans. */
+        return float128_round_pack_canonical(&pa, s);
+    }
+    return which ? b : a;
+}
+
 #define MINMAX_1(type, name, flags) \
     type type##_##name(type a, type b, float_status *s) \
     { return type##_minmax(a, b, s, flags); }
@@ -3909,6 +3925,7 @@ MINMAX_2(float16)
 MINMAX_2(bfloat16)
 MINMAX_2(float32)
 MINMAX_2(float64)
+MINMAX_2(float128)
 
 #undef MINMAX_1
 #undef MINMAX_2
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 94f7841b9f..ec7dca0960 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1204,6 +1204,12 @@ float128 float128_rem(float128, float128, float_status *status);
 float128 float128_sqrt(float128, float_status *status);
 FloatRelation float128_compare(float128, float128, float_status *status);
 FloatRelation float128_compare_quiet(float128, float128, float_status *status);
+float128 float128_min(float128, float128, float_status *status);
+float128 float128_max(float128, float128, float_status *status);
+float128 float128_minnum(float128, float128, float_status *status);
+float128 float128_maxnum(float128, float128, float_status *status);
+float128 float128_minnummag(float128, float128, float_status *status);
+float128 float128_maxnummag(float128, float128, float_status *status);
 bool float128_is_quiet_nan(float128, float_status *status);
 bool float128_is_signaling_nan(float128, float_status *status);
 float128 float128_silence_nan(float128, float_status *status);
-- 
2.31.1


