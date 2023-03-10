Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8356B4F4C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paglc-0007VR-Qu; Fri, 10 Mar 2023 12:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paglW-0007PY-2n; Fri, 10 Mar 2023 12:42:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paglU-00082B-Hf; Fri, 10 Mar 2023 12:42:49 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32AH1OWI038414; Fri, 10 Mar 2023 17:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HQwdba2AzYGvJbIgFMam2SZXm+sYinlJHJDqhau8rZg=;
 b=NuDGTj40qfoIVs2bDWk73zv89yihe990+GW5lr0sGrvbTxzqeP2KbOod2eEwvZ4esyDK
 CgPVfF5Luup2/Iy7QdjT7ZKYaVyZLvsQ9H7KCbowT8M8sxgtB6GqytLL6iHyLDZ4cmlw
 gtVKDCKh3/zruBBdo0CvJ++pFmvUtLx5s/OIJyTdr7CibCrGBR4Ht9wlR+qfMJzyl7rQ
 l46lpzhR6QWzQeziuvh+2BFPetCDHFO07LSFXGvK1emOBBdVDYgANFKvQRiFVq/CUtt7
 OVERJlgh2LjW0PJVcE1Qy+DDE9/oMItJBKqbJHrQaaxDpQeRDMh86FzBNcGrJp53Jbvl lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p88k4gvwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:46 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32AHfq6r021261;
 Fri, 10 Mar 2023 17:42:46 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p88k4gvw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:46 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32A8F766019984;
 Fri, 10 Mar 2023 17:42:44 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p6ftvm766-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:44 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32AHgeB026804918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 17:42:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A940320040;
 Fri, 10 Mar 2023 17:42:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FFD220043;
 Fri, 10 Mar 2023 17:42:40 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.22.18])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Mar 2023 17:42:40 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH 05/12] target/s390x: Handle LLGFRL from non-aligned addresses
Date: Fri, 10 Mar 2023 18:42:16 +0100
Message-Id: <20230310174223.944843-6-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310174223.944843-1-iii@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -_hP5iDj0UqfRURg5pTkXe-U8Ve1Obv9
X-Proofpoint-ORIG-GUID: WhlmlYz_1NHwDjYS2n7xQgazIb55-dw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_08,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=948 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100139
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

Use MO_ALIGN_4 and let do_unaligned_access() generate a specification
exception.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/insn-data.h.inc | 6 +++---
 target/s390x/tcg/translate.c     | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 3f95493282a..b2451a720b6 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -502,16 +502,16 @@
     C(0xc405, LHRL,    RIL_b, GIE, 0, ri2, new, r1_32, ld16s, 0)
     C(0xc404, LGHRL,   RIL_b, GIE, 0, ri2, r1, 0, ld16s, 0)
 /* LOAD HIGH */
-    C(0xe3ca, LFH,     RXY_a, HW,  0, a2, new, r1_32h, ld32u, 0)
+    D(0xe3ca, LFH,     RXY_a, HW,  0, a2, new, r1_32h, ld32u, 0, 0)
 /* LOAG HIGH AND TRAP */
     C(0xe3c8, LFHAT,   RXY_a, LAT, 0, m2_32u, r1, 0, lfhat, 0)
 /* LOAD LOGICAL */
     C(0xb916, LLGFR,   RRE,   Z,   0, r2_32u, 0, r1, mov2, 0)
-    C(0xe316, LLGF,    RXY_a, Z,   0, a2, r1, 0, ld32u, 0)
+    D(0xe316, LLGF,    RXY_a, Z,   0, a2, r1, 0, ld32u, 0, 0)
 /* LOAD LOGICAL AND TRAP */
     C(0xe39d, LLGFAT,  RXY_a, LAT, 0, a2, r1, 0, llgfat, 0)
 /* LOAD LOGICAL RELATIVE LONG */
-    C(0xc40e, LLGFRL,  RIL_b, GIE, 0, ri2, r1, 0, ld32u, 0)
+    D(0xc40e, LLGFRL,  RIL_b, GIE, 0, ri2, r1, 0, ld32u, 0, MO_ALIGN_4)
 /* LOAD LOGICAL CHARACTER */
     C(0xb994, LLCR,    RRE,   EI,  0, r2_8u, 0, r1_32, mov2, 0)
     C(0xb984, LLGCR,   RRE,   EI,  0, r2_8u, 0, r1, mov2, 0)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 5033767cef4..6ceb14de92f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2846,7 +2846,8 @@ static DisasJumpType op_ld32s(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_ld32u(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld32u(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_tl(o->out, o->in2, get_mem_index(s),
+                       MO_TEUL | s->insn->data);
     return DISAS_NEXT;
 }
 
-- 
2.39.2


