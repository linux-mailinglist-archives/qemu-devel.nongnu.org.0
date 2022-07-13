Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E6573C8A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 20:30:21 +0200 (CEST)
Received: from localhost ([::1]:34286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBh7s-0005e6-F2
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 14:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBh4V-0001Me-HT; Wed, 13 Jul 2022 14:26:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBh4T-0000Zo-ED; Wed, 13 Jul 2022 14:26:51 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DICGAn005106;
 Wed, 13 Jul 2022 18:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lgP3Ked9Fb2EyvDu6QFR0TsK8CbRS1dlAvUVIMLUgWA=;
 b=j5N0ULLd0XnViKK2LaNBU++IFgbVMPHomSHpTxK26ySJMK3ti145JbPeQ4VxuTqaG+RB
 lKfq0B+i7iKdnBOYfglR1fAYtWTZYB2fhN00PwnTvXfNRnBamT3qcfRoPfRg57A7LsUU
 AuvZiPw9jCPhE8cEgII8gaqyGLQPbJtz55aUya8UY5noo3daj6JQYBCjipZ219ffIZk5
 yp9SScMx52Y2fbTsBVNPoCHZuP5upm8K2Pd7di9nLW4RYiZbckgyUlo51dLsgZrfV3SH
 sx8KaF4dKJpZgPVYFJaGVlrb8wwP0ZcPr7amw5jbFkEvoV/uZfFI6eylj+n+xtd/17ZX jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha346ra8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:26 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DICNAh005258;
 Wed, 13 Jul 2022 18:26:26 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha346ra7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:26 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DHvEpW024410;
 Wed, 13 Jul 2022 18:26:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3h71a8nakd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26DIQK2e15335922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 18:26:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CB3042041;
 Wed, 13 Jul 2022 18:26:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93A584203F;
 Wed, 13 Jul 2022 18:26:19 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.47.149])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 18:26:19 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
Subject: [PATCH v2 1/3] target/s390x: fix handling of zeroes in vfmin/vfmax
Date: Wed, 13 Jul 2022 20:26:10 +0200
Message-Id: <20220713182612.3780050-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713182612.3780050-1-iii@linux.ibm.com>
References: <20220713182612.3780050-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CiaNGYzdmCpu6uB91OZUSuv5nsWn3nc0
X-Proofpoint-ORIG-GUID: SrOpGRahYS4G7ctn8yMmKk52-V25uTz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_07,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

vfmin_res() / vfmax_res() are trying to check whether a and b are both
zeroes, but in reality they check that they are the same kind of zero.
This causes incorrect results when comparing positive and negative
zeroes.

Fixes: da4807527f3b ("s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)")
Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
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
2.35.3


