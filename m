Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF616BC0E6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 00:29:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcaW7-0007bO-GH; Wed, 15 Mar 2023 19:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcaW4-0007aO-Ug; Wed, 15 Mar 2023 19:26:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcaW3-0006er-89; Wed, 15 Mar 2023 19:26:44 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FNMwk3023379; Wed, 15 Mar 2023 23:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KuY3yKPkza8WIfbrtA21wa91DvyFNAAZ27gAqc8yY6Y=;
 b=dDCnBBOvLUdZCU4ovpbatqNnEx0aFBxYofQDn264P6h/4gjTA+KR6biae0a4hOHUQaYC
 nHegNe4huKHT8zyJBlaoqLsUgGgmwK2Us65DwZbPeJ9RMJbtQgkkNHFCcur1RUpez2r1
 I4+oX9mY7QXyMMAuDqM7Ylt4d15iL3Zuz6JpF0Xj+TKQeg1dehYb08M4a8CMSiQbLfHs
 BTt4vOyj6zcb7GXPALZFWPFO5X+HCc80K+hb4nllwvo+bakr5Xo0j7ylSvavkBo3foLV
 IolpOh6eV6XBtPAOSRXKoTAlM3sNnZ0pkkPwv3W+rIYEy7GVKIePB4wn5AGC4KXKKeEo XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbqn401us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:26:41 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FNNh1r028211;
 Wed, 15 Mar 2023 23:26:40 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbqn401ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:26:40 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32FM3Kx3025759;
 Wed, 15 Mar 2023 23:26:39 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pbpfk81r8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:26:38 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FNQZiQ65732924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 23:26:35 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E95C20043;
 Wed, 15 Mar 2023 23:26:35 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFB2420040;
 Wed, 15 Mar 2023 23:26:34 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.19.28])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 23:26:34 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v3 04/12] target/s390x: Handle LRL and LGFRL from non-aligned
 addresses
Date: Thu, 16 Mar 2023 00:26:16 +0100
Message-Id: <20230315232624.107329-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315232624.107329-1-iii@linux.ibm.com>
References: <20230315232624.107329-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KQ5Kbc8VXzkdrigcCypLfI8FOPyuOPJ4
X-Proofpoint-ORIG-GUID: qzTBaPtnrsashxIXaf06kJllOzJa2Urx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=904 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303150188
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

Use MO_ALIGN and let do_unaligned_access() generate a specification
exception.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/insn-data.h.inc | 14 +++++++-------
 target/s390x/tcg/translate.c     |  3 ++-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index d439d803509..5aff4c0873a 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -410,12 +410,12 @@
 
 /* LOAD */
     C(0x1800, LR,      RR_a,  Z,   0, r2_o, 0, cond_r1r2_32, mov2, 0)
-    C(0x5800, L,       RX_a,  Z,   0, a2, new, r1_32, ld32s, 0)
-    C(0xe358, LY,      RXY_a, LD,  0, a2, new, r1_32, ld32s, 0)
+    D(0x5800, L,       RX_a,  Z,   0, a2, new, r1_32, ld32s, 0, 0)
+    D(0xe358, LY,      RXY_a, LD,  0, a2, new, r1_32, ld32s, 0, 0)
     C(0xb904, LGR,     RRE,   Z,   0, r2_o, 0, r1, mov2, 0)
     C(0xb914, LGFR,    RRE,   Z,   0, r2_32s, 0, r1, mov2, 0)
     D(0xe304, LG,      RXY_a, Z,   0, a2, r1, 0, ld64, 0, 0)
-    C(0xe314, LGF,     RXY_a, Z,   0, a2, r1, 0, ld32s, 0)
+    D(0xe314, LGF,     RXY_a, Z,   0, a2, r1, 0, ld32s, 0, 0)
     F(0x2800, LDR,     RR_a,  Z,   0, f2, 0, f1, mov2, 0, IF_AFP1 | IF_AFP2)
     F(0x6800, LD,      RX_a,  Z,   0, m2_64, 0, f1, mov2, 0, IF_AFP1)
     F(0xed65, LDY,     RXY_a, LD,  0, m2_64, 0, f1, mov2, 0, IF_AFP1)
@@ -426,9 +426,9 @@
 /* LOAD IMMEDIATE */
     C(0xc001, LGFI,    RIL_a, EI,  0, i2, 0, r1, mov2, 0)
 /* LOAD RELATIVE LONG */
-    C(0xc40d, LRL,     RIL_b, GIE, 0, ri2, new, r1_32, ld32s, 0)
+    D(0xc40d, LRL,     RIL_b, GIE, 0, ri2, new, r1_32, ld32s, 0, MO_ALIGN)
     D(0xc408, LGRL,    RIL_b, GIE, 0, ri2, r1, 0, ld64, 0, MO_ALIGN)
-    C(0xc40c, LGFRL,   RIL_b, GIE, 0, ri2, r1, 0, ld32s, 0)
+    D(0xc40c, LGFRL,   RIL_b, GIE, 0, ri2, r1, 0, ld32s, 0, MO_ALIGN)
 /* LOAD ADDRESS */
     C(0x4100, LA,      RX_a,  Z,   0, a2, 0, r1, mov2, 0)
     C(0xe371, LAY,     RXY_a, LD,  0, a2, 0, r1, mov2, 0)
@@ -456,9 +456,9 @@
     C(0x1200, LTR,     RR_a,  Z,   0, r2_o, 0, cond_r1r2_32, mov2, s32)
     C(0xb902, LTGR,    RRE,   Z,   0, r2_o, 0, r1, mov2, s64)
     C(0xb912, LTGFR,   RRE,   Z,   0, r2_32s, 0, r1, mov2, s64)
-    C(0xe312, LT,      RXY_a, EI,  0, a2, new, r1_32, ld32s, s64)
+    D(0xe312, LT,      RXY_a, EI,  0, a2, new, r1_32, ld32s, s64, 0)
     D(0xe302, LTG,     RXY_a, EI,  0, a2, r1, 0, ld64, s64, 0)
-    C(0xe332, LTGF,    RXY_a, GIE, 0, a2, r1, 0, ld32s, s64)
+    D(0xe332, LTGF,    RXY_a, GIE, 0, a2, r1, 0, ld32s, s64, 0)
     F(0xb302, LTEBR,   RRE,   Z,   0, e2, 0, cond_e1e2, mov2, f32, IF_BFP)
     F(0xb312, LTDBR,   RRE,   Z,   0, f2, 0, f1, mov2, f64, IF_BFP)
     F(0xb342, LTXBR,   RRE,   Z,   x2h, x2l, 0, x1_P, movx, f128, IF_BFP)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a40289512da..f89e1ce353b 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2770,7 +2770,8 @@ static DisasJumpType op_ld16u(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_ld32s(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld32s(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_tl(o->out, o->in2, get_mem_index(s),
+                       MO_TESL | s->insn->data);
     return DISAS_NEXT;
 }
 
-- 
2.39.2


