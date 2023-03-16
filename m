Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5AD6BD636
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:46:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqig-0004wM-Ai; Thu, 16 Mar 2023 12:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqie-0004vV-AV; Thu, 16 Mar 2023 12:44:48 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqic-0007za-Ll; Thu, 16 Mar 2023 12:44:48 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GFaeCu021995; Thu, 16 Mar 2023 16:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qTpi2b279rj7VaO3e8o/SnTCpcS7LUHMgdMp0hqzffE=;
 b=XF5JeSSqNtmX3oKHRuumHiXrKzSeWgaCVu826ZSpxbJHQB9hl1U+leA0ohBVB3vG9iq/
 HA5TFz2OZFLQjWMfk56caGIA807bVp/m6uZ9gXbtGT2qYcNaX6kEDMxKSuOUQBDcbUFA
 eUoOrRwp7V8TVi1bvDB+5Tn/o0MOz2DsoUnH1oUtOK91vEqMvj8VjVdXkd9ZsPFSoyVC
 VgoXyetD0AfFxtSucyrA8asQwweof8CIFkvb2l2NsqpXUSK4907V6/nqbRAOvMhvoM3+
 th+57FvhZ2Zq7kY/jonu2GuiixUZsNE9Ga9BpXdXKYvxmobHzPtBdZ2dTzKGtx+SBkm/ eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc58xuf6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:43 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GFacLH021746;
 Thu, 16 Mar 2023 16:44:43 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc58xuf5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:42 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GFAjvp022053;
 Thu, 16 Mar 2023 16:44:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pbsvb0ygg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GGiboG27591288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 16:44:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33F8020043;
 Thu, 16 Mar 2023 16:44:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BF7420049;
 Thu, 16 Mar 2023 16:44:36 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 16:44:36 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v4 03/12] target/s390x: Handle LGRL from non-aligned addresses
Date: Thu, 16 Mar 2023 17:44:19 +0100
Message-Id: <20230316164428.275147-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316164428.275147-1-iii@linux.ibm.com>
References: <20230316164428.275147-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kq3xOsz7hYocs0Y2bTUzL3ommDOd7DdH
X-Proofpoint-GUID: CzjyQF13AA18mhP5AnyeKAN_7LxRrvrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160131
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
index 6fe8ca51437..d439d803509 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -414,7 +414,7 @@
     C(0xe358, LY,      RXY_a, LD,  0, a2, new, r1_32, ld32s, 0)
     C(0xb904, LGR,     RRE,   Z,   0, r2_o, 0, r1, mov2, 0)
     C(0xb914, LGFR,    RRE,   Z,   0, r2_32s, 0, r1, mov2, 0)
-    C(0xe304, LG,      RXY_a, Z,   0, a2, r1, 0, ld64, 0)
+    D(0xe304, LG,      RXY_a, Z,   0, a2, r1, 0, ld64, 0, 0)
     C(0xe314, LGF,     RXY_a, Z,   0, a2, r1, 0, ld32s, 0)
     F(0x2800, LDR,     RR_a,  Z,   0, f2, 0, f1, mov2, 0, IF_AFP1 | IF_AFP2)
     F(0x6800, LD,      RX_a,  Z,   0, m2_64, 0, f1, mov2, 0, IF_AFP1)
@@ -427,7 +427,7 @@
     C(0xc001, LGFI,    RIL_a, EI,  0, i2, 0, r1, mov2, 0)
 /* LOAD RELATIVE LONG */
     C(0xc40d, LRL,     RIL_b, GIE, 0, ri2, new, r1_32, ld32s, 0)
-    C(0xc408, LGRL,    RIL_b, GIE, 0, ri2, r1, 0, ld64, 0)
+    D(0xc408, LGRL,    RIL_b, GIE, 0, ri2, r1, 0, ld64, 0, MO_ALIGN)
     C(0xc40c, LGFRL,   RIL_b, GIE, 0, ri2, r1, 0, ld32s, 0)
 /* LOAD ADDRESS */
     C(0x4100, LA,      RX_a,  Z,   0, a2, 0, r1, mov2, 0)
@@ -457,7 +457,7 @@
     C(0xb902, LTGR,    RRE,   Z,   0, r2_o, 0, r1, mov2, s64)
     C(0xb912, LTGFR,   RRE,   Z,   0, r2_32s, 0, r1, mov2, s64)
     C(0xe312, LT,      RXY_a, EI,  0, a2, new, r1_32, ld32s, s64)
-    C(0xe302, LTG,     RXY_a, EI,  0, a2, r1, 0, ld64, s64)
+    D(0xe302, LTG,     RXY_a, EI,  0, a2, r1, 0, ld64, s64, 0)
     C(0xe332, LTGF,    RXY_a, GIE, 0, a2, r1, 0, ld32s, s64)
     F(0xb302, LTEBR,   RRE,   Z,   0, e2, 0, cond_e1e2, mov2, f32, IF_BFP)
     F(0xb312, LTDBR,   RRE,   Z,   0, f2, 0, f1, mov2, f64, IF_BFP)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 14c3896d529..a40289512da 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2782,7 +2782,8 @@ static DisasJumpType op_ld32u(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_ld64(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld64(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->out, o->in2, get_mem_index(s),
+                        MO_TEUQ | s->insn->data);
     return DISAS_NEXT;
 }
 
-- 
2.39.2


