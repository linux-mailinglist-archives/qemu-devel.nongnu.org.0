Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFE85B8714
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 13:13:18 +0200 (CEST)
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYQKT-0008W4-Bp
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 07:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oYQ5k-0006aK-20; Wed, 14 Sep 2022 06:58:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28790
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oYQ5i-0005s5-2p; Wed, 14 Sep 2022 06:58:03 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28EAigRW020053;
 Wed, 14 Sep 2022 10:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wqhW1O2+BV6Dtm5s1TupZw6SDUFTLr5cDFgzr2tZ3cY=;
 b=LVBsLZDI7Uh9LtGweoSs37Vf+X6L8+/OLKzlchAuoL1EZ/ck3lqO4kS6LW8devW+3JjB
 Ht9RjSNSSEcoGBkahFk15wzy3/artcNYzA8ckUZFVekEfZJyIZ6DVoX8WDm0WpCA8Eko
 G1dOol4NyHZti5RPJyPyVPMYRaaq8gSkv2XxhfnQ6Q+TeamjupSziwBZ56FC9SXE4KMV
 W6SiHG74aNx8Xs12MAGoMVQggOFu2Eo0dmokxP3oP/rWSsA0KSEvtaZ7uPbHAghO1G2A
 2gNyBn3a4oFCC7sReQkeAk1ZZKppTTwsycWdv/gHUa8OXtFPE3JsBaJXe9Cv8c6j6w5G 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkdfgrb5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 10:57:57 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28EAjtbh023559;
 Wed, 14 Sep 2022 10:57:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkdfgrb4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 10:57:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28EAoiZT012004;
 Wed, 14 Sep 2022 10:57:55 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3jjy95rvxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 10:57:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28EAvpFL41877830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Sep 2022 10:57:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D278A4066;
 Wed, 14 Sep 2022 10:57:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89845A405B;
 Wed, 14 Sep 2022 10:57:51 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 14 Sep 2022 10:57:51 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id 3B79AE042B; Wed, 14 Sep 2022 12:57:51 +0200 (CEST)
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 1/1] s390x/tcg: Fix opcode for lzrf
Date: Wed, 14 Sep 2022 12:57:50 +0200
Message-Id: <20220914105750.767697-1-borntraeger@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kq2Zz__QTerjXlRQqmw7-NhVJ972Vn4f
X-Proofpoint-ORIG-GUID: J-sKqfvNJ7s3S1UnAzOLb_ZRXElURbOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_03,2022-09-14_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=964
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140051
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

Fix the opcode for Load and Zero Rightmost Byte (32).

Cc: qemu-stable@nongnu.org
Reported-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
---
 target/s390x/tcg/insn-data.def | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 6d2cfe5fa2b7..6382ceabfcfa 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -466,7 +466,7 @@
     C(0xe39f, LAT,     RXY_a, LAT, 0, m2_32u, r1, 0, lat, 0)
     C(0xe385, LGAT,    RXY_a, LAT, 0, a2, r1, 0, lgat, 0)
 /* LOAD AND ZERO RIGHTMOST BYTE */
-    C(0xe3eb, LZRF,    RXY_a, LZRB, 0, m2_32u, new, r1_32, lzrb, 0)
+    C(0xe33b, LZRF,    RXY_a, LZRB, 0, m2_32u, new, r1_32, lzrb, 0)
     C(0xe32a, LZRG,    RXY_a, LZRB, 0, m2_64, r1, 0, lzrb, 0)
 /* LOAD LOGICAL AND ZERO RIGHTMOST BYTE */
     C(0xe33a, LLZRGF,  RXY_a, LZRB, 0, m2_32u, r1, 0, lzrb, 0)
-- 
2.37.1


