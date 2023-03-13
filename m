Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31AF6B7C36
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbkGV-0007wR-M3; Mon, 13 Mar 2023 11:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbkGS-0007s7-4R; Mon, 13 Mar 2023 11:39:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbkGQ-0004vz-7s; Mon, 13 Mar 2023 11:39:07 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DErmIj031947; Mon, 13 Mar 2023 15:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HCWkphwK+bqGYatuBhN05GHt6x8yChmBHnjFjAsIamw=;
 b=FnLMmhVtGWr32jSWnU2V/xcqgAsuSZ5oGcqiaPf7XwEiSj/y3XXfYtK0HMesFNrBAi+J
 H2VwGBgd2VQqiYETyWVqwOJig8P067ABgrX1icYvBwLEWl1KiV5r3gq2MuNxDYpGCUdb
 7JJBcNR9HOMnV0+iqFSYnowP4EIVfsO1A/ShLBPzoTjMErADZdhVOdfXMkT3Ez+YTQ6M
 psYKEmSkQP+zzHKPDfaGq+sjPWEuLPkGYFAQoMG4ttbHum3yH+flS9nUzLU3M2U+UbOt
 cRO8frg8Rc+yZn5i/D7NQ51XP4RAr8aiEakWzKzoKv+h9872EXxtP+6EoCKFZyzqUFnn 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa60dsa2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:39:03 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DEtkZ3005231;
 Mon, 13 Mar 2023 15:39:03 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa60dsa1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:39:03 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DEL6C2010535;
 Mon, 13 Mar 2023 15:39:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3p8h96arpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:39:00 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32DFcvXf18547308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 15:38:57 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A0A92004B;
 Mon, 13 Mar 2023 15:38:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9064420040;
 Mon, 13 Mar 2023 15:38:56 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.87.70])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Mar 2023 15:38:56 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v2 05/12] target/s390x: Handle LLGFRL from non-aligned
 addresses
Date: Mon, 13 Mar 2023 16:38:37 +0100
Message-Id: <20230313153844.9231-6-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313153844.9231-1-iii@linux.ibm.com>
References: <20230313153844.9231-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AyGQR1rbehkTwxML1AxO5-6XzncOXrRb
X-Proofpoint-GUID: LnWEnuVHu_mAMZNIqkxooqTtwXDoNPUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_07,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxlogscore=934 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303130121
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

Use MO_ALIGN and let do_unaligned_access() generate a specification
exception.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/insn-data.h.inc | 6 +++---
 target/s390x/tcg/translate.c     | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 5aff4c0873a..3abd2dbedd5 100644
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
+    D(0xc40e, LLGFRL,  RIL_b, GIE, 0, ri2, r1, 0, ld32u, 0, MO_ALIGN)
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


