Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35449493695
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:51:58 +0100 (CET)
Received: from localhost ([::1]:33612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6hB-0004k8-1L
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:51:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6Of-0006bi-8X
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:32:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6Oc-0004gR-AK
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642581165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/715XU7qWgZJxG9QrxPeM2NDksn9LlnidWCxFUs7jFo=;
 b=AiBEUc54FmEaLAFe0ds7+8GkLPXvaHtdh/Md0z5w4+FQ+aqlWOPs5CwKR7csB9USxIVRTk
 S8vTkDeks2W8E8NzW94zUfRda1k2SY9lImyGf1tlCMUzXgZsiSBGRMKHUX8hPBquHayAbn
 FJytZn+HreMVn5jm8DhfuMbxa/oBUFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-p5JWrHIxN468abWK9ut8fg-1; Wed, 19 Jan 2022 03:32:42 -0500
X-MC-Unique: p5JWrHIxN468abWK9ut8fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5452610151E0;
 Wed, 19 Jan 2022 08:32:41 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 912684F858;
 Wed, 19 Jan 2022 08:32:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] target/s390x: Fix shifting 32-bit values for more than
 31 bits
Date: Wed, 19 Jan 2022 09:32:10 +0100
Message-Id: <20220119083215.120911-6-thuth@redhat.com>
In-Reply-To: <20220119083215.120911-1-thuth@redhat.com>
References: <20220119083215.120911-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

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
Message-Id: <20220112165016.226996-5-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu-dump.c        |  3 +--
 target/s390x/s390x-internal.h  |  3 +--
 target/s390x/tcg/cc_helper.c   | 36 +++-----------------------
 target/s390x/tcg/insn-data.def | 36 +++++++++++++-------------
 target/s390x/tcg/translate.c   | 47 ++++++++++++++++------------------
 5 files changed, 45 insertions(+), 80 deletions(-)

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
index c9b7b0e8c6..8d04097f78 100644
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
     uint64_t mask = -1ULL << (63 - shift);
     uint64_t sign = 1ULL << 63;
@@ -459,11 +432,8 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
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
index 766b4c87b2..46dea73357 100644
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
@@ -4113,9 +4099,18 @@ static DisasJumpType op_soc(DisasContext *s, DisasOps *o)
 
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
+    if (s->insn->data == 31) {
+        tcg_temp_free_i64(t);
+    }
     tcg_gen_shl_i64(o->out, o->in1, o->in2);
     /* The arithmetic left shift is curious in that it does not affect
        the sign bit.  Copy that over from the source unchanged.  */
@@ -5924,17 +5919,19 @@ static void in2_ri2(DisasContext *s, DisasOps *o)
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
2.27.0


