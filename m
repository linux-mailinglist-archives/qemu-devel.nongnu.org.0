Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8AD570FF1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:02:24 +0200 (CEST)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5EE-0003VM-Vq
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oB59q-0006R4-96; Mon, 11 Jul 2022 21:57:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17124
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oB59o-0003Kd-OP; Mon, 11 Jul 2022 21:57:49 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C1hMlP015496;
 Tue, 12 Jul 2022 01:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4Fj1UioewLhsV7Pq3Sl+vvJsOkTYmeq+V1wiwJSVnns=;
 b=prDVYIrRrmsDb3Y8afhIipWcxrPTf/Cow87uGHgRdy5eI4k/uhVWNGHtHv6qCos+3S14
 gM9Xu83Pa8U3X6a3b34Bgq0wrEdDw6mvTBLTa/AoUhClP5h8b2S6v3UP6ikVW5VaUEhE
 B30qzURIg7ZLd6goRcyRnDWPjwlkvyGLuhtpAvdea1hsTiPZ9lFaSBx8NENLjAKd/SBV
 Hl/2Wx0YRRQ7GU40LAnOc8i5nrRVWIAUuyjD/EwnTYfOyDvPTFRwVhCK1mVnh+XFjepf
 UMKNDiLF+5Db8WxsZf2FZzY1S67Y0VODJjofskg+c9QWYqebjCZnTtgmGCoirAq3JQOz Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8yhs88g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:35 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26C1uEsS031710;
 Tue, 12 Jul 2022 01:57:34 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8yhs88fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:34 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26C1pIkg005591;
 Tue, 12 Jul 2022 01:57:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3h71a8jqyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:32 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26C1vTNj10027452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 01:57:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C94EA405B;
 Tue, 12 Jul 2022 01:57:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98DE6A4051;
 Tue, 12 Jul 2022 01:57:28 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.48.196])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jul 2022 01:57:28 +0000 (GMT)
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
Subject: [PATCH 1/3] target/s390x: fix handling of zeroes in vfmin/vfmax
Date: Tue, 12 Jul 2022 03:57:15 +0200
Message-Id: <20220712015717.3602602-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220712015717.3602602-1-iii@linux.ibm.com>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mZ_NNa_dhOh4nnnRh_ry-ucryJuJjwi0
X-Proofpoint-ORIG-GUID: Eylyn8YOPucvGZz-hPQQDqxIL2ArmLoR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_26,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxlogscore=938
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120004
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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


