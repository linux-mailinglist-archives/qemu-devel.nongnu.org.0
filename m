Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138CD57B236
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:01:10 +0200 (CEST)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE4dp-0003ow-66
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE4b2-00086b-6F
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE4ay-0007q0-C5
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658303891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgKRNWi2QRnlyCB3aV2gP/X2Vp2sew/5zpOM1DyxMVQ=;
 b=ZupES/6+m6eZyy39qwDXZfbvrZanhTx7XWDGfpmjUQWb5019ntin9MPfcTTjWVZZqJdq/H
 BxzAHql7hVVRLRZr0HHSwUjJfwO4M/CUnpSsnFx2kZa1Efa/ZQdl0iSNck0kob4C9eLlar
 gzSGlhXQTeILVgQjmg+bH5OJayBp0Q8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-bbQOOowaM--fy4G4rnV3Yg-1; Wed, 20 Jul 2022 03:58:02 -0400
X-MC-Unique: bbQOOowaM--fy4G4rnV3Yg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5A7A1824600;
 Wed, 20 Jul 2022 07:58:01 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 516F9492C3B;
 Wed, 20 Jul 2022 07:58:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 1/3] target/s390x: fix handling of zeroes in vfmin/vfmax
Date: Wed, 20 Jul 2022 09:57:54 +0200
Message-Id: <20220720075756.760404-2-thuth@redhat.com>
In-Reply-To: <20220720075756.760404-1-thuth@redhat.com>
References: <20220720075756.760404-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

vfmin_res() / vfmax_res() are trying to check whether a and b are both
zeroes, but in reality they check that they are the same kind of zero.
This causes incorrect results when comparing positive and negative
zeroes.

Fixes: da4807527f3b ("s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)")
Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220713182612.3780050-2-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/vec_fpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helper.c
index 2a618a1093..75cf605b9f 100644
--- a/target/s390x/tcg/vec_fpu_helper.c
+++ b/target/s390x/tcg/vec_fpu_helper.c
@@ -824,7 +824,7 @@ static S390MinMaxRes vfmin_res(uint16_t dcmask_a, uint16_t dcmask_b,
         default:
             g_assert_not_reached();
         }
-    } else if (unlikely(dcmask_a & dcmask_b & DCMASK_ZERO)) {
+    } else if (unlikely((dcmask_a & DCMASK_ZERO) && (dcmask_b & DCMASK_ZERO))) {
         switch (type) {
         case S390_MINMAX_TYPE_JAVA:
             return neg_a ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
@@ -874,7 +874,7 @@ static S390MinMaxRes vfmax_res(uint16_t dcmask_a, uint16_t dcmask_b,
         default:
             g_assert_not_reached();
         }
-    } else if (unlikely(dcmask_a & dcmask_b & DCMASK_ZERO)) {
+    } else if (unlikely((dcmask_a & DCMASK_ZERO) && (dcmask_b & DCMASK_ZERO))) {
         const bool neg_a = dcmask_a & DCMASK_NEGATIVE;
 
         switch (type) {
-- 
2.31.1


