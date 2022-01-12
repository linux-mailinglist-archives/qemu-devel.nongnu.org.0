Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BAE48C618
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:31:07 +0100 (CET)
Received: from localhost ([::1]:51072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eeY-0007ke-1s
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:31:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7dVt-0003z1-Ce; Wed, 12 Jan 2022 08:18:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13638
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7dVr-0003sk-2X; Wed, 12 Jan 2022 08:18:04 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBbTcZ018660; 
 Wed, 12 Jan 2022 13:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RdIWA6kvlPtLi3HzpWDrRDrz8DNpzOPDU0a1sHvzODo=;
 b=ZIZpK9AXaIJ0Wwyg0aPCm1WzqkGv5uaR/82pGyA2ewDezvAeNExFnIe87zTbsSiJYH5q
 pgeN74ee+5rycfg2zUvGp8Hntr1fXRTj9QakxjPJeaHXlP04WYM0W7m/box5QYjZx6Dr
 6msBkuHLlbeK7xA1y/SBW7F0L3m9slBb5URV5uw7F0jt8AK0BZnEXRynsVqKvRz5U4gW
 z55Nf+AhH/+npaw3cplhElb/E4RV2BIzCn6UOkNzZgQ/RDqRbuZ5lZmqSQeIPb8/JyTG
 D7fNJgPYux3don6nwDBI2KQM3pwB4Aad/WMM5KI5lFDMho7O3pvk4FJK1CGW+hJFgYC+ nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhvrc614y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:18:01 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CDCL2b001862;
 Wed, 12 Jan 2022 13:18:00 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhvrc614e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:18:00 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CDCTZw013679;
 Wed, 12 Jan 2022 13:17:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3df289jddv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:17:58 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CD8q5Q47907156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 13:08:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 798F7AE04D;
 Wed, 12 Jan 2022 13:17:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 023F3AE045;
 Wed, 12 Jan 2022 13:17:55 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 13:17:54 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 4/5] target/s390x: Fix shifting 32-bit values for more than
 31 bits
Date: Wed, 12 Jan 2022 14:17:50 +0100
Message-Id: <20220112131751.226011-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112131751.226011-1-iii@linux.ibm.com>
References: <20220112131751.226011-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RdDqi7geCY8BmgNTaQ0-tTvEQmQYmFf7
X-Proofpoint-GUID: 3c0zqb23tsnddjB4rLUSexzon2XV6IKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120086
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to PoP, both 32- and 64-bit shifts use lowest 6 address
bits. The current code special-cases 32-bit shifts to use only 5 bits,
which is not correct. For example, shifting by 32 bits currently
preserves the initial value, however, it's supposed zero it out
instead.

Fix by merging sh32 and sh64 and adapting CC calculation to shift
values greater than 31.

Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/cpu-dump.c        |  3 +--
 target/s390x/s390x-internal.h  |  3 +--
 target/s390x/tcg/cc_helper.c   | 36 +++-------------------------
 target/s390x/tcg/insn-data.def | 36 ++++++++++++++--------------
 target/s390x/tcg/translate.c   | 44 +++++++++++++++-------------------
 5 files changed, 42 insertions(+), 80 deletions(-)

diff --git a/target/s390x/cpu-dump.c b/target/s390x/cpu-dump.c
index 0f5c062994..ffa9e94d84 100644
--- a/target/s390x/cpu-dump.c
+++ b/target/s390x/cpu-dump.c
@@ -121,8 +121,7 @@ const char *cc_name(enum cc_op cc_op)
         [CC_OP_NZ_F64]    = "CC_OP_NZ_F64",
         [CC_OP_NZ_F128]   = "CC_OP_NZ_F128",
         [CC_OP_ICM]       = "CC_OP_ICM",
-        [CC_OP_SLA_32]    = "CC_OP_SLA_32",
-        [CC_OP_SLA_64]    = "CC_OP_SLA_64",
+        [CC_OP_SLA]       = "CC_OP_SLA",
         [CC_OP_FLOGR]     = "CC_OP_FLOGR",
         [CC_OP_LCBB]      = "CC_OP_LCBB",
         [CC_OP_VC]        = "CC_OP_VC",
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 1a178aed41..6fc8cad2d5 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -193,8 +193,7 @@ enum cc_op {
     CC_OP_NZ_F128,              /* FP dst != 0 (128bit) */
 
     CC_OP_ICM,                  /* insert characters under mask */
-    CC_OP_SLA_32,               /* Calculate shift left signed (32bit) */
-    CC_OP_SLA_64,               /* Calculate shift left signed (64bit) */
+    CC_OP_SLA,                  /* Calculate shift left signed */
     CC_OP_FLOGR,                /* find leftmost one */
     CC_OP_LCBB,                 /* load count to block boundary */
     CC_OP_VC,                   /* vector compare result */
diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
index b6acffa3e8..c2e5878594 100644
--- a/target/s390x/tcg/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -268,34 +268,7 @@ static uint32_t cc_calc_icm(uint64_t mask, uint64_t val)
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
-static uint32_t cc_calc_sla_64(uint64_t src, int shift)
+static uint32_t cc_calc_sla(uint64_t src, int shift)
 {
     /* Do not use (1ULL << (shift + 1)): it triggers UB when shift is 63.  */
     uint64_t mask = ((((1ULL << shift) - 1) << 1) + 1) << (64 - (shift + 1));
@@ -460,11 +433,8 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
     case CC_OP_ICM:
         r =  cc_calc_icm(src, dst);
         break;
-    case CC_OP_SLA_32:
-        r =  cc_calc_sla_32(src, dst);
-        break;
-    case CC_OP_SLA_64:
-        r =  cc_calc_sla_64(src, dst);
+    case CC_OP_SLA:
+        r =  cc_calc_sla(src, dst);
         break;
     case CC_OP_FLOGR:
         r = cc_calc_flogr(dst);
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
index 68ca7e476a..1c076af31e 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -636,8 +636,7 @@ static void gen_op_calc_cc(DisasContext *s)
     case CC_OP_LTUGTU_64:
     case CC_OP_TM_32:
     case CC_OP_TM_64:
-    case CC_OP_SLA_32:
-    case CC_OP_SLA_64:
+    case CC_OP_SLA:
     case CC_OP_SUBU:
     case CC_OP_NZ_F128:
     case CC_OP_VC:
@@ -1178,19 +1177,6 @@ struct DisasInsn {
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
@@ -4113,9 +4099,15 @@ static DisasJumpType op_soc(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_sla(DisasContext *s, DisasOps *o)
 {
+    TCGv_i64 t;
     uint64_t sign = 1ull << s->insn->data;
-    enum cc_op cco = s->insn->data == 31 ? CC_OP_SLA_32 : CC_OP_SLA_64;
-    gen_op_update2_cc_i64(s, cco, o->in1, o->in2);
+    if (s->insn->data == 31) {
+        t = tcg_temp_new_i64();
+        tcg_gen_shli_i64(t, o->in1, 32);
+    } else {
+        t = o->in1;
+    }
+    gen_op_update2_cc_i64(s, CC_OP_SLA, t, o->in2);
     tcg_gen_shl_i64(o->out, o->in1, o->in2);
     /* The arithmetic left shift is curious in that it does not affect
        the sign bit.  Copy that over from the source unchanged.  */
@@ -5923,17 +5915,19 @@ static void in2_ri2(DisasContext *s, DisasOps *o)
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


