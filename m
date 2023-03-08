Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48C6B137E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 22:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0vq-0007OS-Mr; Wed, 08 Mar 2023 16:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pa0vo-0007Nw-7V; Wed, 08 Mar 2023 16:02:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pa0vm-0004va-FB; Wed, 08 Mar 2023 16:02:39 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328KHpc0021180; Wed, 8 Mar 2023 21:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HxshGZRrxpc1Zh2nPsFD2MrHeMMMVcruiRbejSDsmag=;
 b=DAY5+STgmjSSXuLtVKoLetDgv0Cw6KdW/qmkoKfktFecm10stiuR5oHFqqxKawdG4/Ec
 CiVnhXea0ofJpttUQzqzG9wFScgQ99XGSPTsPpTyS0+EKY+JV0GYzsIc2aV0eJnemKCl
 gH4vZVabhFii9vu4KVfVnGpRVPbvh/US6kQDfvUlg2ZToLn5CXJtGLKjYzTrsCk2XccJ
 S4pQubQ3OLyHucxQcoqXDK7OCnmQTgfi33+WBQUy74E9FQHrvVmOeid5t/6cbrprmGFU
 WXbOYI3uEzpdmlUEc+8hCyMGBfkTjFb3lhPf5Ac4CINTjrRxIEWW694Pa9qad9vWx5UE mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6k0c6us6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 21:02:34 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 328Kp1br011362;
 Wed, 8 Mar 2023 21:02:33 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6k0c6urk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 21:02:33 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 328IV7Ek014998;
 Wed, 8 Mar 2023 21:02:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3p6gbw8yvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 21:02:31 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 328L2S8163963482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Mar 2023 21:02:28 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5787020040;
 Wed,  8 Mar 2023 21:02:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EB062004B;
 Wed,  8 Mar 2023 21:02:28 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  8 Mar 2023 21:02:27 +0000 (GMT)
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Subject: [PATCH v2 1/2] target/s390x: Fix emulation of C(G)HRL
Date: Wed,  8 Mar 2023 22:02:25 +0100
Message-Id: <20230308210226.2847503-2-nsg@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308210226.2847503-1-nsg@linux.ibm.com>
References: <20230308210226.2847503-1-nsg@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hPt9epAwGOD4Ke-uaJuJYXJQKlsswk4l
X-Proofpoint-GUID: ulpWDVCOPZLPWQ65tEEs3V1DHn64YMC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=885
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303080173
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nsg@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
2.37.2


