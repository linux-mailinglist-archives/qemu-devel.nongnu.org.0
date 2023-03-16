Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF06BD632
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:46:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqip-00052N-DC; Thu, 16 Mar 2023 12:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqil-0004zy-No; Thu, 16 Mar 2023 12:44:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqij-0008CJ-Tm; Thu, 16 Mar 2023 12:44:55 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GFl6jL025418; Thu, 16 Mar 2023 16:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Xy/Gzt0F6VfvUjZG68BUDgp+74cBQU6ZcIBM4MgZpLk=;
 b=SkOJ7vcxLQ70XOchMZfOeoi8l/yXUTNwFbHCnZpgsjjH6+pNwcjm0eWP1BOOijr7y/2S
 bI74wUEamWGHMopT3h/NS4oEQMyd7ZV0qzcWnNpQlfaZKHZ43XFbTHo2qw7lx5wFt3p6
 +tqkspfZgA7gkovToOHC6UxKoMGf+kOvxttpFv3hMzohq33zGFP8TPOS0nOsqB/WQoj8
 RCPwGvhKr6REqWR1VM2oHWGp4HmbMxiUO7VEM24+gii6PQuqX8tA0qKygWQXmkAr5Q8I
 A7Im6uQTWcSPJiH/JRx0bn56k9u8gH4SSx2/MnicsROAz6hKTRrTJc8BnkvrlqTj5PwR eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc4xdc9bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:52 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GGQr1h025669;
 Thu, 16 Mar 2023 16:44:51 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc4xdc9ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GF3SOV029280;
 Thu, 16 Mar 2023 16:44:49 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pbskt100t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:49 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GGik0B35127568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 16:44:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D24D20043;
 Thu, 16 Mar 2023 16:44:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97E7A20049;
 Thu, 16 Mar 2023 16:44:45 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 16:44:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v4 10/12] target/s390x: Handle STGRL to non-aligned addresses
Date: Thu, 16 Mar 2023 17:44:26 +0100
Message-Id: <20230316164428.275147-11-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316164428.275147-1-iii@linux.ibm.com>
References: <20230316164428.275147-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q82sJN4OA_Sq7vUb0fjgRGAAw9dOUGgG
X-Proofpoint-ORIG-GUID: EfPCmn0xbkCsZFgNCShG-mYOTMvcl6oz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160131
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

Use MO_ALIGN and let do_unaligned_access() generate a specification
exception.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/insn-data.h.inc | 8 ++++----
 target/s390x/tcg/translate.c     | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 30c02b3fcd6..597d968b0e8 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -842,14 +842,14 @@
 /* STORE */
     D(0x5000, ST,      RX_a,  Z,   r1_o, a2, 0, 0, st32, 0, 0)
     D(0xe350, STY,     RXY_a, LD,  r1_o, a2, 0, 0, st32, 0, 0)
-    C(0xe324, STG,     RXY_a, Z,   r1_o, a2, 0, 0, st64, 0)
-    F(0x6000, STD,     RX_a,  Z,   f1, a2, 0, 0, st64, 0, IF_AFP1)
-    F(0xed67, STDY,    RXY_a, LD,  f1, a2, 0, 0, st64, 0, IF_AFP1)
+    D(0xe324, STG,     RXY_a, Z,   r1_o, a2, 0, 0, st64, 0, 0)
+    E(0x6000, STD,     RX_a,  Z,   f1, a2, 0, 0, st64, 0, 0, IF_AFP1)
+    E(0xed67, STDY,    RXY_a, LD,  f1, a2, 0, 0, st64, 0, 0, IF_AFP1)
     E(0x7000, STE,     RX_a,  Z,   e1, a2, 0, 0, st32, 0, 0, IF_AFP1)
     E(0xed66, STEY,    RXY_a, LD,  e1, a2, 0, 0, st32, 0, 0, IF_AFP1)
 /* STORE RELATIVE LONG */
     D(0xc40f, STRL,    RIL_b, GIE, r1_o, ri2, 0, 0, st32, 0, MO_ALIGN)
-    C(0xc40b, STGRL,   RIL_b, GIE, r1_o, ri2, 0, 0, st64, 0)
+    D(0xc40b, STGRL,   RIL_b, GIE, r1_o, ri2, 0, 0, st64, 0, MO_ALIGN)
 /* STORE CHARACTER */
     C(0x4200, STC,     RX_a,  Z,   r1_o, a2, 0, 0, st8, 0)
     C(0xe372, STCY,    RXY_a, LD,  r1_o, a2, 0, 0, st8, 0)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 8fd21425dba..7626692df22 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4377,7 +4377,8 @@ static DisasJumpType op_st32(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_st64(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_st64(o->in1, o->in2, get_mem_index(s));
+    tcg_gen_qemu_st_i64(o->in1, o->in2, get_mem_index(s),
+                        MO_TEUQ | s->insn->data);
     return DISAS_NEXT;
 }
 
-- 
2.39.2


