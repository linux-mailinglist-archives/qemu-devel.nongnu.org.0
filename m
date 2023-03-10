Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB4C6B3E3C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:43:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pab8X-0007gn-I7; Fri, 10 Mar 2023 06:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pab8U-0007cg-Un; Fri, 10 Mar 2023 06:42:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pab8T-00052q-3G; Fri, 10 Mar 2023 06:42:10 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32AAvDVq031124; Fri, 10 Mar 2023 11:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Y63nM3ZZWtnIRc0VCNCdDI4RuDvKAHp+MItszv7teRU=;
 b=IcSyM8Vk6xLLKocXDcCz2B2w9vme4fyn7bTRvv8LyUxtilr/WYrjtYgPNi9fkuaHbumT
 mj3Aa1zZUFoS6QD8MPfw286qTxqGiwve7DmqmoHlA5H3OxTz3xFOt+EL5K9VFS2zfuO/
 cveg3MQ3lsG0sIfrv6GYVVWeVjW3QOJtFd60MaevhGG1ZXxRNPmKeVVsgNufbideIN9R
 DKmOIn76ni39l3Pn2gteqqmY1WNa1/OgMzkvuKBrucOU7yuazlX/pT1Eq4rZsJ1+/den
 algGAZ+364V6Iz0kAumEvRi4iuBbT5+boR4NTb06V38/5s57bXJIUXcmKsd+4q/rSjKP Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7n9s5dnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 11:42:06 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ABa7FQ001400;
 Fri, 10 Mar 2023 11:42:05 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7n9s5dn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 11:42:05 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32A8bsuL032279;
 Fri, 10 Mar 2023 11:42:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3p6g03atsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 11:42:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32ABfx1g61210912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 11:41:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C99E20040;
 Fri, 10 Mar 2023 11:41:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26B272004B;
 Fri, 10 Mar 2023 11:41:59 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Mar 2023 11:41:59 +0000 (GMT)
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Subject: [PATCH v3 1/2] target/s390x: Fix emulation of C(G)HRL
Date: Fri, 10 Mar 2023 12:41:56 +0100
Message-Id: <20230310114157.3024170-2-nsg@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230310114157.3024170-1-nsg@linux.ibm.com>
References: <20230310114157.3024170-1-nsg@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2BhxtOLTFbxVrEsjAKM0wXxh3QmC5pmc
X-Proofpoint-GUID: caZVEA539qvLUH0VV-YS1CAtooAtX7hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_03,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=880
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100091
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The second operand of COMPARE HALFWORD RELATIVE LONG is a signed
halfword, it does not have the same size as the first operand.

Fixes: a7e836d5eb ("target-s390: Convert COMPARE, COMPARE LOGICAL")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
---
 target/s390x/tcg/insn-data.h.inc | 4 ++--
 target/s390x/tcg/translate.c     | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 9d2d35f084..6fe8ca5143 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -199,8 +199,8 @@
     C(0xe55c, CHSI,    SIL,   GIE, m1_32s, i2, 0, 0, 0, cmps64)
     C(0xe558, CGHSI,   SIL,   GIE, m1_64, i2, 0, 0, 0, cmps64)
 /* COMPARE HALFWORD RELATIVE LONG */
-    C(0xc605, CHRL,    RIL_b, GIE, r1_o, mri2_32s, 0, 0, 0, cmps32)
-    C(0xc604, CGHRL,   RIL_b, GIE, r1_o, mri2_64, 0, 0, 0, cmps64)
+    C(0xc605, CHRL,    RIL_b, GIE, r1_o, mri2_16s, 0, 0, 0, cmps32)
+    C(0xc604, CGHRL,   RIL_b, GIE, r1_o, mri2_16s, 0, 0, 0, cmps64)
 /* COMPARE HIGH */
     C(0xb9cd, CHHR,    RRE,   HW,  r1_sr32, r2_sr32, 0, 0, 0, cmps32)
     C(0xb9dd, CHLR,    RRE,   HW,  r1_sr32, r2_o, 0, 0, 0, cmps32)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 21a57d5eb2..d324c0b6f2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5979,6 +5979,13 @@ static void in2_m2_64a(DisasContext *s, DisasOps *o)
 #define SPEC_in2_m2_64a 0
 #endif
 
+static void in2_mri2_16s(DisasContext *s, DisasOps *o)
+{
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld16s(o->in2, gen_ri2(s), get_mem_index(s));
+}
+#define SPEC_in2_mri2_16s 0
+
 static void in2_mri2_16u(DisasContext *s, DisasOps *o)
 {
     o->in2 = tcg_temp_new_i64();
-- 
2.39.1


