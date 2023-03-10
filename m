Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4FF6B4F45
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:44:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paglg-0007du-GN; Fri, 10 Mar 2023 12:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pagld-0007aE-CE; Fri, 10 Mar 2023 12:42:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paglb-00083j-H8; Fri, 10 Mar 2023 12:42:57 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32AGqWCJ010548; Fri, 10 Mar 2023 17:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zHk0lQ7WQ4b7SR1HuUNSk65l//gs1XG+F1Cb/akds1Q=;
 b=eSrmsfEX0uA0bVxTxHL1nWDVYp7HLZwtVMWa0OrXbTEYLdAGS+UK5QidgoIvVnwXpzXH
 sAxYCN855ooMKIchOmWkVm3kRGS1HbyzSTVkExDW6qgf9ts6Hg/nzpqQseZPy6cnFs/j
 o2lh1h5+l9mNeNPlJHEc69phv72X6ZCkayZQcSbIXuIQELGp9qTkOq5ebPxSCvaHY+Q5
 QUVqsMq5r1AYh7otFKpHE1uznqQZg7OPcg4MP3eLUqzmJL9TjnKoTuLv4HN3Xueb5bmp
 qK0E4LElq5PYX4jYbiL2IWkKnNqFtlcdm8FFRhrzIWBJ/41dJgKVpq1/LjECEgN0Wnxb Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p86kk4cbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:52 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32AH7MsP019674;
 Fri, 10 Mar 2023 17:42:52 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p86kk4car-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:52 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32A837RL020036;
 Fri, 10 Mar 2023 17:42:49 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p6ftvm76b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:49 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32AHgkeL1638938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 17:42:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5483E2004B;
 Fri, 10 Mar 2023 17:42:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCC9620040;
 Fri, 10 Mar 2023 17:42:45 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.22.18])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Mar 2023 17:42:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH 09/12] target/s390x: Handle STRL to non-aligned addresses
Date: Fri, 10 Mar 2023 18:42:20 +0100
Message-Id: <20230310174223.944843-10-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310174223.944843-1-iii@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FLKDobC7oTWJ6xJK3U_6e8_a6vnycd8t
X-Proofpoint-GUID: ioPn-ULGEry_7202X-y8476CETeaGuSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_08,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100139
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

Use MO_ALIGN_4 and let do_unaligned_access() generate a specification
exception.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/insn-data.h.inc | 12 ++++++------
 target/s390x/tcg/translate.c     |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index b2451a720b6..4e635fb1677 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -840,15 +840,15 @@
     F(0xed15, SQDB,    RXE,   Z,   0, m2_64, new, f1, sqdb, 0, IF_BFP)
 
 /* STORE */
-    C(0x5000, ST,      RX_a,  Z,   r1_o, a2, 0, 0, st32, 0)
-    C(0xe350, STY,     RXY_a, LD,  r1_o, a2, 0, 0, st32, 0)
+    D(0x5000, ST,      RX_a,  Z,   r1_o, a2, 0, 0, st32, 0, 0)
+    D(0xe350, STY,     RXY_a, LD,  r1_o, a2, 0, 0, st32, 0, 0)
     C(0xe324, STG,     RXY_a, Z,   r1_o, a2, 0, 0, st64, 0)
     F(0x6000, STD,     RX_a,  Z,   f1, a2, 0, 0, st64, 0, IF_AFP1)
     F(0xed67, STDY,    RXY_a, LD,  f1, a2, 0, 0, st64, 0, IF_AFP1)
-    F(0x7000, STE,     RX_a,  Z,   e1, a2, 0, 0, st32, 0, IF_AFP1)
-    F(0xed66, STEY,    RXY_a, LD,  e1, a2, 0, 0, st32, 0, IF_AFP1)
+    E(0x7000, STE,     RX_a,  Z,   e1, a2, 0, 0, st32, 0, 0, IF_AFP1)
+    E(0xed66, STEY,    RXY_a, LD,  e1, a2, 0, 0, st32, 0, 0, IF_AFP1)
 /* STORE RELATIVE LONG */
-    C(0xc40f, STRL,    RIL_b, GIE, r1_o, ri2, 0, 0, st32, 0)
+    D(0xc40f, STRL,    RIL_b, GIE, r1_o, ri2, 0, 0, st32, 0, MO_ALIGN_4)
     C(0xc40b, STGRL,   RIL_b, GIE, r1_o, ri2, 0, 0, st64, 0)
 /* STORE CHARACTER */
     C(0x4200, STC,     RX_a,  Z,   r1_o, a2, 0, 0, st8, 0)
@@ -867,7 +867,7 @@
 /* STORE HALFWORD RELATIVE LONG */
     C(0xc407, STHRL,   RIL_b, GIE, r1_o, ri2, 0, 0, st16, 0)
 /* STORE HIGH */
-    C(0xe3cb, STFH,    RXY_a, HW,  r1_sr32, a2, 0, 0, st32, 0)
+    D(0xe3cb, STFH,    RXY_a, HW,  r1_sr32, a2, 0, 0, st32, 0, 0)
 /* STORE ON CONDITION */
     D(0xebf3, STOC,    RSY_b, LOC, 0, 0, 0, 0, soc, 0, 0)
     D(0xebe3, STOCG,   RSY_b, LOC, 0, 0, 0, 0, soc, 0, 1)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a8dcc234a53..818f3292c5c 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4497,7 +4497,8 @@ static DisasJumpType op_st16(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_st32(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_st32(o->in1, o->in2, get_mem_index(s));
+    tcg_gen_qemu_st_tl(o->in1, o->in2, get_mem_index(s),
+                       MO_TEUL | s->insn->data);
     return DISAS_NEXT;
 }
 
-- 
2.39.2


