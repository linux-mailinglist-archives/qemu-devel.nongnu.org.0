Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE61B48BDF4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 05:47:59 +0100 (CET)
Received: from localhost ([::1]:43728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7VYF-0003aU-3A
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 23:47:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQq-0002UQ-UX; Tue, 11 Jan 2022 23:40:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQb-0003YW-C2; Tue, 11 Jan 2022 23:40:20 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C4RpJ3012183; 
 Wed, 12 Jan 2022 04:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J83HURtq5LL9vfeAUmPri8tsdUBWpf1P51Iig/xoVi0=;
 b=ZMOa/BRMhY9zhdymqX09axpw+nemfCehS8Iu19kaEdFGCM1ewWxCj24q+0xMEOYBzoVH
 QWEhgGKP2ypJYyHsgZdbLY+faR13uoiYa6Y44Avtfqf1is3v5VitFd6FrqMwQE9Kx6qB
 6/h0z2PamjA84KTNb8JvQwOmMEJIuG3Hyq8+EKFl3qu4aLFLLlvRTCKx4b3krKuzMXSn
 KkhysWNSXOLKa0PpgHw3NdBxgaxC2l4Q2mpx5sfHPES0GZhRJe6IFOl6JYgEVVs/9+kW
 IRiiLjlG81oz/KZluRuCTBDLc59dUo/XTTgVtpkmabne+pimDQxkFbeJSe3iEQf4uT+e 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhqyxg4m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:40:01 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20C4YPpf027833;
 Wed, 12 Jan 2022 04:40:01 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhqyxg4km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:40:01 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C4XwZn024552;
 Wed, 12 Jan 2022 04:39:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3df289ncqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:58 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20C4dtKP36635036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 04:39:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA01E42052;
 Wed, 12 Jan 2022 04:39:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45BE542042;
 Wed, 12 Jan 2022 04:39:55 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 04:39:55 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 4/5] target/s390x: Fix shifting 32-bit values for more than
 31 bits
Date: Wed, 12 Jan 2022 05:39:47 +0100
Message-Id: <20220112043948.224405-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112043948.224405-1-iii@linux.ibm.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GnoZWnETPoRCtXag9YSSYtxK4b84zPLo
X-Proofpoint-ORIG-GUID: GZVUYyvGxRvNipGHEbsT2Cg-F0_eGI6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_01,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120024
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to PoP, both 32- and 64-bit shifts use lowest 6 address
bits. The current code special-cases 32-bit shifts to use only 5 bits,
which is not correct. For example, shifting by 32 bits currently
preserves the initial value, however, it's supposed zero it out
instead.

Fix by merging sh32 and sh64 and adapting cc_calc_sla_32() to shift
values greater than 31.

Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/cc_helper.c   | 32 +++++-------------------------
 target/s390x/tcg/insn-data.def | 36 +++++++++++++++++-----------------
 target/s390x/tcg/translate.c   | 31 ++++++++++-------------------
 3 files changed, 33 insertions(+), 66 deletions(-)

diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
index b6acffa3e8..3cfbfadf48 100644
--- a/target/s390x/tcg/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -268,33 +268,6 @@ static uint32_t cc_calc_icm(uint64_t mask, uint64_t val)
     }
 }
 
-static uint32_t cc_calc_sla_32(uint32_t src, int shift)
-{
-    uint32_t mask = ((1U << shift) - 1U) << (32 - shift);
-    uint32_t sign = 1U << 31;
-    uint32_t match;
-    int32_t r;
-
-    /* Check if the sign bit stays the same.  */
-    if (src & sign) {
-        match = mask;
-    } else {
-        match = 0;
-    }
-    if ((src & mask) != match) {
-        /* Overflow.  */
-        return 3;
-    }
-
-    r = ((src << shift) & ~sign) | (src & sign);
-    if (r == 0) {
-        return 0;
-    } else if (r < 0) {
-        return 1;
-    }
-    return 2;
-}
-
 static uint32_t cc_calc_sla_64(uint64_t src, int shift)
 {
     /* Do not use (1ULL << (shift + 1)): it triggers UB when shift is 63.  */
@@ -323,6 +296,11 @@ static uint32_t cc_calc_sla_64(uint64_t src, int shift)
     return 2;
 }
 
+static uint32_t cc_calc_sla_32(uint32_t src, int shift)
+{
+    return cc_calc_sla_64(((uint64_t)src) << 32, shift);
+}
+
 static uint32_t cc_calc_flogr(uint64_t dst)
 {
     return dst ? 2 : 0;
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 90c753068c..1c3e115712 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -747,8 +747,8 @@
     C(0xb9e1, POPCNT,  RRE,   PC,  0, r2_o, r1, 0, popcnt, nz64)
 
 /* ROTATE LEFT SINGLE LOGICAL */
-    C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh32, new, r1_32, rll32, 0)
-    C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh64, r1, 0, rll64, 0)
+    C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh, new, r1_32, rll32, 0)
+    C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh, r1, 0, rll64, 0)
 
 /* ROTATE THEN INSERT SELECTED BITS */
     C(0xec55, RISBG,   RIE_f, GIE, 0, r2, r1, 0, risbg, s64)
@@ -784,29 +784,29 @@
     C(0x0400, SPM,     RR_a,  Z,   r1, 0, 0, 0, spm, 0)
 
 /* SHIFT LEFT SINGLE */
-    D(0x8b00, SLA,     RS_a,  Z,   r1, sh32, new, r1_32, sla, 0, 31)
-    D(0xebdd, SLAK,    RSY_a, DO,  r3, sh32, new, r1_32, sla, 0, 31)
-    D(0xeb0b, SLAG,    RSY_a, Z,   r3, sh64, r1, 0, sla, 0, 63)
+    D(0x8b00, SLA,     RS_a,  Z,   r1, sh, new, r1_32, sla, 0, 31)
+    D(0xebdd, SLAK,    RSY_a, DO,  r3, sh, new, r1_32, sla, 0, 31)
+    D(0xeb0b, SLAG,    RSY_a, Z,   r3, sh, r1, 0, sla, 0, 63)
 /* SHIFT LEFT SINGLE LOGICAL */
-    C(0x8900, SLL,     RS_a,  Z,   r1_o, sh32, new, r1_32, sll, 0)
-    C(0xebdf, SLLK,    RSY_a, DO,  r3_o, sh32, new, r1_32, sll, 0)
-    C(0xeb0d, SLLG,    RSY_a, Z,   r3_o, sh64, r1, 0, sll, 0)
+    C(0x8900, SLL,     RS_a,  Z,   r1_o, sh, new, r1_32, sll, 0)
+    C(0xebdf, SLLK,    RSY_a, DO,  r3_o, sh, new, r1_32, sll, 0)
+    C(0xeb0d, SLLG,    RSY_a, Z,   r3_o, sh, r1, 0, sll, 0)
 /* SHIFT RIGHT SINGLE */
-    C(0x8a00, SRA,     RS_a,  Z,   r1_32s, sh32, new, r1_32, sra, s32)
-    C(0xebdc, SRAK,    RSY_a, DO,  r3_32s, sh32, new, r1_32, sra, s32)
-    C(0xeb0a, SRAG,    RSY_a, Z,   r3_o, sh64, r1, 0, sra, s64)
+    C(0x8a00, SRA,     RS_a,  Z,   r1_32s, sh, new, r1_32, sra, s32)
+    C(0xebdc, SRAK,    RSY_a, DO,  r3_32s, sh, new, r1_32, sra, s32)
+    C(0xeb0a, SRAG,    RSY_a, Z,   r3_o, sh, r1, 0, sra, s64)
 /* SHIFT RIGHT SINGLE LOGICAL */
-    C(0x8800, SRL,     RS_a,  Z,   r1_32u, sh32, new, r1_32, srl, 0)
-    C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh32, new, r1_32, srl, 0)
-    C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh64, r1, 0, srl, 0)
+    C(0x8800, SRL,     RS_a,  Z,   r1_32u, sh, new, r1_32, srl, 0)
+    C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh, new, r1_32, srl, 0)
+    C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh, r1, 0, srl, 0)
 /* SHIFT LEFT DOUBLE */
-    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sla, 0, 63)
+    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sla, 0, 63)
 /* SHIFT LEFT DOUBLE LOGICAL */
-    C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sll, 0)
+    C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sll, 0)
 /* SHIFT RIGHT DOUBLE */
-    C(0x8e00, SRDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sra, s64)
+    C(0x8e00, SRDA,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sra, s64)
 /* SHIFT RIGHT DOUBLE LOGICAL */
-    C(0x8c00, SRDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, srl, 0)
+    C(0x8c00, SRDL,    RS_a,  Z,   r1_D32, sh, new, r1_D32, srl, 0)
 
 /* SQUARE ROOT */
     F(0xb314, SQEBR,   RRE,   Z,   0, e2, new, e1, sqeb, 0, IF_BFP)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 68ca7e476a..5a2b609d0f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1178,19 +1178,6 @@ struct DisasInsn {
 /* ====================================================================== */
 /* Miscellaneous helpers, used by several operations.  */
 
-static void help_l2_shift(DisasContext *s, DisasOps *o, int mask)
-{
-    int b2 = get_field(s, b2);
-    int d2 = get_field(s, d2);
-
-    if (b2 == 0) {
-        o->in2 = tcg_const_i64(d2 & mask);
-    } else {
-        o->in2 = get_address(s, 0, b2, d2);
-        tcg_gen_andi_i64(o->in2, o->in2, mask);
-    }
-}
-
 static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
 {
     if (dest == s->pc_tmp) {
@@ -5923,17 +5910,19 @@ static void in2_ri2(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in2_ri2 0
 
-static void in2_sh32(DisasContext *s, DisasOps *o)
+static void in2_sh(DisasContext *s, DisasOps *o)
 {
-    help_l2_shift(s, o, 31);
-}
-#define SPEC_in2_sh32 0
+    int b2 = get_field(s, b2);
+    int d2 = get_field(s, d2);
 
-static void in2_sh64(DisasContext *s, DisasOps *o)
-{
-    help_l2_shift(s, o, 63);
+    if (b2 == 0) {
+        o->in2 = tcg_const_i64(d2 & 0x3f);
+    } else {
+        o->in2 = get_address(s, 0, b2, d2);
+        tcg_gen_andi_i64(o->in2, o->in2, 0x3f);
+    }
 }
-#define SPEC_in2_sh64 0
+#define SPEC_in2_sh 0
 
 static void in2_m2_8u(DisasContext *s, DisasOps *o)
 {
-- 
2.31.1


