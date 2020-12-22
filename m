Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA82E08FB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:52:27 +0100 (CET)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfHG-0005hv-VT
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAV-0004xk-OK
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAQ-00076W-NY
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdIHbTWAaDT4Vtw9RuCO9eQlu859a94g1qjPjqemdgA=;
 b=PptVkCSAZnWcMFQF4uq+xEOT32iPsDuhUrbgXw5hm/VDZyoGAvumA8mDGbCSIa6WKOBZxS
 urHL58mdy68ij4gtywqINSrgb7kuxN3aNnUcGOuNSsQ9WzgWsnLccv0xC35WOvx89tHoi2
 9VycCZHFoaql0IxF6wCqR6GjL38M6HE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-knwIoB27NvCX4TxJ5WVVPQ-1; Tue, 22 Dec 2020 05:45:17 -0500
X-MC-Unique: knwIoB27NvCX4TxJ5WVVPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E21AE5F9E3;
 Tue, 22 Dec 2020 10:45:15 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86FB87B130;
 Tue, 22 Dec 2020 10:45:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/14] target/s390x: Improve ADD LOGICAL WITH CARRY
Date: Tue, 22 Dec 2020 11:44:54 +0100
Message-Id: <20201222104503.224510-6-cohuck@redhat.com>
In-Reply-To: <20201222104503.224510-1-cohuck@redhat.com>
References: <20201222104503.224510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Now that ADD LOGICAL outputs carry, we can use that as input directly.
It also means we can re-use CC_OP_ADDU and produce an output carry
directly from ADD LOGICAL WITH CARRY.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214221356.68039-3-richard.henderson@linaro.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cc_helper.c   | 26 ----------------
 target/s390x/helper.c      |  2 --
 target/s390x/insn-data.def |  8 ++---
 target/s390x/internal.h    |  2 --
 target/s390x/translate.c   | 63 ++++++++++++++++++--------------------
 5 files changed, 34 insertions(+), 67 deletions(-)

diff --git a/target/s390x/cc_helper.c b/target/s390x/cc_helper.c
index 59da4d1cc233..cd2c5c4b39a4 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/cc_helper.c
@@ -144,16 +144,6 @@ static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
     }
 }
 
-static uint32_t cc_calc_addc_64(uint64_t a1, uint64_t a2, uint64_t ar)
-{
-    /* Recover a2 + carry_in.  */
-    uint64_t a2c = ar - a1;
-    /* Check for a2+carry_in overflow, then a1+a2c overflow.  */
-    int carry_out = (a2c < a2) || (ar < a1);
-
-    return (ar != 0) + 2 * carry_out;
-}
-
 static uint32_t cc_calc_sub_64(int64_t a1, int64_t a2, int64_t ar)
 {
     if ((a1 > 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
@@ -240,16 +230,6 @@ static uint32_t cc_calc_add_32(int32_t a1, int32_t a2, int32_t ar)
     }
 }
 
-static uint32_t cc_calc_addc_32(uint32_t a1, uint32_t a2, uint32_t ar)
-{
-    /* Recover a2 + carry_in.  */
-    uint32_t a2c = ar - a1;
-    /* Check for a2+carry_in overflow, then a1+a2c overflow.  */
-    int carry_out = (a2c < a2) || (ar < a1);
-
-    return (ar != 0) + 2 * carry_out;
-}
-
 static uint32_t cc_calc_sub_32(int32_t a1, int32_t a2, int32_t ar)
 {
     if ((a1 > 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
@@ -485,9 +465,6 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
     case CC_OP_ADD_64:
         r =  cc_calc_add_64(src, dst, vr);
         break;
-    case CC_OP_ADDC_64:
-        r =  cc_calc_addc_64(src, dst, vr);
-        break;
     case CC_OP_SUB_64:
         r =  cc_calc_sub_64(src, dst, vr);
         break;
@@ -513,9 +490,6 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
     case CC_OP_ADD_32:
         r =  cc_calc_add_32(src, dst, vr);
         break;
-    case CC_OP_ADDC_32:
-        r =  cc_calc_addc_32(src, dst, vr);
-        break;
     case CC_OP_SUB_32:
         r =  cc_calc_sub_32(src, dst, vr);
         break;
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index db87a62a5776..4f4561bc645a 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -403,14 +403,12 @@ const char *cc_name(enum cc_op cc_op)
         [CC_OP_LTGT0_32]  = "CC_OP_LTGT0_32",
         [CC_OP_LTGT0_64]  = "CC_OP_LTGT0_64",
         [CC_OP_ADD_64]    = "CC_OP_ADD_64",
-        [CC_OP_ADDC_64]   = "CC_OP_ADDC_64",
         [CC_OP_SUB_64]    = "CC_OP_SUB_64",
         [CC_OP_SUBU_64]   = "CC_OP_SUBU_64",
         [CC_OP_SUBB_64]   = "CC_OP_SUBB_64",
         [CC_OP_ABS_64]    = "CC_OP_ABS_64",
         [CC_OP_NABS_64]   = "CC_OP_NABS_64",
         [CC_OP_ADD_32]    = "CC_OP_ADD_32",
-        [CC_OP_ADDC_32]   = "CC_OP_ADDC_32",
         [CC_OP_SUB_32]    = "CC_OP_SUB_32",
         [CC_OP_SUBU_32]   = "CC_OP_SUBU_32",
         [CC_OP_SUBB_32]   = "CC_OP_SUBB_32",
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 5461e6aa3b5b..e380723dcd3d 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -82,10 +82,10 @@
     C(0xcc0a, ALSIH,   RIL_a, HW,  r1_sr32, i2_32u, new, r1_32h, add, addu32)
     C(0xcc0b, ALSIHN,  RIL_a, HW,  r1_sr32, i2_32u, new, r1_32h, add, 0)
 /* ADD LOGICAL WITH CARRY */
-    C(0xb998, ALCR,    RRE,   Z,   r1, r2, new, r1_32, addc, addc32)
-    C(0xb988, ALCGR,   RRE,   Z,   r1, r2, r1, 0, addc, addc64)
-    C(0xe398, ALC,     RXY_a, Z,   r1, m2_32u, new, r1_32, addc, addc32)
-    C(0xe388, ALCG,    RXY_a, Z,   r1, m2_64, r1, 0, addc, addc64)
+    C(0xb998, ALCR,    RRE,   Z,   r1_32u, r2_32u, new, r1_32, addc32, addu32)
+    C(0xb988, ALCGR,   RRE,   Z,   r1, r2, r1, 0, addc64, addu64)
+    C(0xe398, ALC,     RXY_a, Z,   r1_32u, m2_32u, new, r1_32, addc32, addu32)
+    C(0xe388, ALCG,    RXY_a, Z,   r1, m2_64, r1, 0, addc64, addu64)
 
 /* AND */
     C(0x1400, NR,      RR_a,  Z,   r1, r2, new, r1_32, and, nz32)
diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 55c54421020c..f5f3ae063ee8 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -170,7 +170,6 @@ enum cc_op {
     CC_OP_LTGT0_64,             /* signed less/greater than 0 (64bit) */
 
     CC_OP_ADD_64,               /* overflow on add (64bit) */
-    CC_OP_ADDC_64,              /* overflow on unsigned add-carry (64bit) */
     CC_OP_SUB_64,               /* overflow on subtraction (64bit) */
     CC_OP_SUBU_64,              /* overflow on unsigned subtraction (64bit) */
     CC_OP_SUBB_64,              /* overflow on unsigned sub-borrow (64bit) */
@@ -179,7 +178,6 @@ enum cc_op {
     CC_OP_MULS_64,              /* overflow on signed multiply (64bit) */
 
     CC_OP_ADD_32,               /* overflow on add (32bit) */
-    CC_OP_ADDC_32,              /* overflow on unsigned add-carry (32bit) */
     CC_OP_SUB_32,               /* overflow on subtraction (32bit) */
     CC_OP_SUBU_32,              /* overflow on unsigned subtraction (32bit) */
     CC_OP_SUBB_32,              /* overflow on unsigned sub-borrow (32bit) */
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index b473233edf36..d1d97e469668 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -600,12 +600,10 @@ static void gen_op_calc_cc(DisasContext *s)
         dummy = tcg_const_i64(0);
         /* FALLTHRU */
     case CC_OP_ADD_64:
-    case CC_OP_ADDC_64:
     case CC_OP_SUB_64:
     case CC_OP_SUBU_64:
     case CC_OP_SUBB_64:
     case CC_OP_ADD_32:
-    case CC_OP_ADDC_32:
     case CC_OP_SUB_32:
     case CC_OP_SUBU_32:
     case CC_OP_SUBB_32:
@@ -665,12 +663,10 @@ static void gen_op_calc_cc(DisasContext *s)
         gen_helper_calc_cc(cc_op, cpu_env, local_cc_op, cc_src, cc_dst, dummy);
         break;
     case CC_OP_ADD_64:
-    case CC_OP_ADDC_64:
     case CC_OP_SUB_64:
     case CC_OP_SUBU_64:
     case CC_OP_SUBB_64:
     case CC_OP_ADD_32:
-    case CC_OP_ADDC_32:
     case CC_OP_SUB_32:
     case CC_OP_SUBU_32:
     case CC_OP_SUBB_32:
@@ -1443,30 +1439,41 @@ static DisasJumpType op_addu64(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_addc(DisasContext *s, DisasOps *o)
+/* Compute carry into cc_src. */
+static void compute_carry(DisasContext *s)
 {
-    DisasCompare cmp;
-    TCGv_i64 carry;
+    switch (s->cc_op) {
+    case CC_OP_ADDU:
+        /* The carry value is already in cc_src (1,0). */
+        break;
+    default:
+        gen_op_calc_cc(s);
+        /* fall through */
+    case CC_OP_STATIC:
+        /* The carry flag is the msb of CC; compute into cc_src. */
+        tcg_gen_extu_i32_i64(cc_src, cc_op);
+        tcg_gen_shri_i64(cc_src, cc_src, 1);
+        break;
+    }
+}
 
+static DisasJumpType op_addc32(DisasContext *s, DisasOps *o)
+{
+    compute_carry(s);
     tcg_gen_add_i64(o->out, o->in1, o->in2);
+    tcg_gen_add_i64(o->out, o->out, cc_src);
+    return DISAS_NEXT;
+}
 
-    /* The carry flag is the msb of CC, therefore the branch mask that would
-       create that comparison is 3.  Feeding the generated comparison to
-       setcond produces the carry flag that we desire.  */
-    disas_jcc(s, &cmp, 3);
-    carry = tcg_temp_new_i64();
-    if (cmp.is_64) {
-        tcg_gen_setcond_i64(cmp.cond, carry, cmp.u.s64.a, cmp.u.s64.b);
-    } else {
-        TCGv_i32 t = tcg_temp_new_i32();
-        tcg_gen_setcond_i32(cmp.cond, t, cmp.u.s32.a, cmp.u.s32.b);
-        tcg_gen_extu_i32_i64(carry, t);
-        tcg_temp_free_i32(t);
-    }
-    free_compare(&cmp);
+static DisasJumpType op_addc64(DisasContext *s, DisasOps *o)
+{
+    compute_carry(s);
+
+    TCGv_i64 zero = tcg_const_i64(0);
+    tcg_gen_add2_i64(o->out, cc_src, o->in1, zero, cc_src, zero);
+    tcg_gen_add2_i64(o->out, cc_src, o->out, cc_src, o->in2, zero);
+    tcg_temp_free_i64(zero);
 
-    tcg_gen_add_i64(o->out, o->out, carry);
-    tcg_temp_free_i64(carry);
     return DISAS_NEXT;
 }
 
@@ -5217,16 +5224,6 @@ static void cout_addu64(DisasContext *s, DisasOps *o)
     gen_op_update2_cc_i64(s, CC_OP_ADDU, cc_src, o->out);
 }
 
-static void cout_addc32(DisasContext *s, DisasOps *o)
-{
-    gen_op_update3_cc_i64(s, CC_OP_ADDC_32, o->in1, o->in2, o->out);
-}
-
-static void cout_addc64(DisasContext *s, DisasOps *o)
-{
-    gen_op_update3_cc_i64(s, CC_OP_ADDC_64, o->in1, o->in2, o->out);
-}
-
 static void cout_cmps32(DisasContext *s, DisasOps *o)
 {
     gen_op_update2_cc_i64(s, CC_OP_LTGT_32, o->in1, o->in2);
-- 
2.26.2


