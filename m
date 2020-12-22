Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0DA2E08F3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:50:32 +0100 (CET)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfFP-00023k-Ua
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAV-0004w7-1q
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAS-00076k-2d
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8He6kTPA2QkQ8HF12+K234j7gKgnYo8PrNtW0gYca4A=;
 b=Wm9+2LrNWGErKkGkJbMyylSdO3np+Y8S5V2g9Lpe7wxJ/2B71Hb+X3OQOXX6tPwnxq2rWt
 8JD4t1uvuMeAeHnZzA2+gI/MyAxLrjbJe+T7MiulkADCJmfU99PL3+xIjvt7W0Lp1L53AG
 FvG0kea0fty5V4d7pUnu1KUPtebjDIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-TVCF13RANVaKzeCCbwb4gQ-1; Tue, 22 Dec 2020 05:45:20 -0500
X-MC-Unique: TVCF13RANVaKzeCCbwb4gQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72CA918C9F46;
 Tue, 22 Dec 2020 10:45:19 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E80BE7B130;
 Tue, 22 Dec 2020 10:45:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/14] target/s390x: Improve SUB LOGICAL WITH BORROW
Date: Tue, 22 Dec 2020 11:44:56 +0100
Message-Id: <20201222104503.224510-8-cohuck@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Now that SUB LOGICAL outputs borrow, we can use that as input directly.
It also means we can re-use CC_OP_SUBU and produce an output borrow
directly from SUB LOGICAL WITH BORROW.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214221356.68039-5-richard.henderson@linaro.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cc_helper.c   | 32 -----------------
 target/s390x/helper.c      |  2 --
 target/s390x/insn-data.def |  8 ++---
 target/s390x/internal.h    |  2 --
 target/s390x/translate.c   | 74 +++++++++++++++++++++-----------------
 5 files changed, 45 insertions(+), 73 deletions(-)

diff --git a/target/s390x/cc_helper.c b/target/s390x/cc_helper.c
index c7728d1225a3..e7039d0d183a 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/cc_helper.c
@@ -164,19 +164,6 @@ static uint32_t cc_calc_sub_64(int64_t a1, int64_t a2, int64_t ar)
     }
 }
 
-static uint32_t cc_calc_subb_64(uint64_t a1, uint64_t a2, uint64_t ar)
-{
-    int borrow_out;
-
-    if (ar != a1 - a2) {	/* difference means borrow-in */
-        borrow_out = (a2 >= a1);
-    } else {
-        borrow_out = (a2 > a1);
-    }
-
-    return (ar != 0) + 2 * !borrow_out;
-}
-
 static uint32_t cc_calc_abs_64(int64_t dst)
 {
     if ((uint64_t)dst == 0x8000000000000000ULL) {
@@ -237,19 +224,6 @@ static uint32_t cc_calc_sub_32(int32_t a1, int32_t a2, int32_t ar)
     }
 }
 
-static uint32_t cc_calc_subb_32(uint32_t a1, uint32_t a2, uint32_t ar)
-{
-    int borrow_out;
-
-    if (ar != a1 - a2) {	/* difference means borrow-in */
-        borrow_out = (a2 >= a1);
-    } else {
-        borrow_out = (a2 > a1);
-    }
-
-    return (ar != 0) + 2 * !borrow_out;
-}
-
 static uint32_t cc_calc_abs_32(int32_t dst)
 {
     if ((uint32_t)dst == 0x80000000UL) {
@@ -450,9 +424,6 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
     case CC_OP_SUB_64:
         r =  cc_calc_sub_64(src, dst, vr);
         break;
-    case CC_OP_SUBB_64:
-        r =  cc_calc_subb_64(src, dst, vr);
-        break;
     case CC_OP_ABS_64:
         r =  cc_calc_abs_64(dst);
         break;
@@ -472,9 +443,6 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
     case CC_OP_SUB_32:
         r =  cc_calc_sub_32(src, dst, vr);
         break;
-    case CC_OP_SUBB_32:
-        r =  cc_calc_subb_32(src, dst, vr);
-        break;
     case CC_OP_ABS_32:
         r =  cc_calc_abs_32(dst);
         break;
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index fa3aa500e52f..7678994febe6 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -405,12 +405,10 @@ const char *cc_name(enum cc_op cc_op)
         [CC_OP_LTGT0_64]  = "CC_OP_LTGT0_64",
         [CC_OP_ADD_64]    = "CC_OP_ADD_64",
         [CC_OP_SUB_64]    = "CC_OP_SUB_64",
-        [CC_OP_SUBB_64]   = "CC_OP_SUBB_64",
         [CC_OP_ABS_64]    = "CC_OP_ABS_64",
         [CC_OP_NABS_64]   = "CC_OP_NABS_64",
         [CC_OP_ADD_32]    = "CC_OP_ADD_32",
         [CC_OP_SUB_32]    = "CC_OP_SUB_32",
-        [CC_OP_SUBB_32]   = "CC_OP_SUBB_32",
         [CC_OP_ABS_32]    = "CC_OP_ABS_32",
         [CC_OP_NABS_32]   = "CC_OP_NABS_32",
         [CC_OP_COMP_32]   = "CC_OP_COMP_32",
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 7ff3e7e517e2..26badb663a04 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -916,10 +916,10 @@
     C(0xc205, SLFI,    RIL_a, EI,  r1_32u, i2_32u, new, r1_32, sub, subu32)
     C(0xc204, SLGFI,   RIL_a, EI,  r1, i2_32u, r1, 0, subu64, subu64)
 /* SUBTRACT LOGICAL WITH BORROW */
-    C(0xb999, SLBR,    RRE,   Z,   r1, r2, new, r1_32, subb, subb32)
-    C(0xb989, SLBGR,   RRE,   Z,   r1, r2, r1, 0, subb, subb64)
-    C(0xe399, SLB,     RXY_a, Z,   r1, m2_32u, new, r1_32, subb, subb32)
-    C(0xe389, SLBG,    RXY_a, Z,   r1, m2_64, r1, 0, subb, subb64)
+    C(0xb999, SLBR,    RRE,   Z,   r1_32u, r2_32u, new, r1_32, subb32, subu32)
+    C(0xb989, SLBGR,   RRE,   Z,   r1, r2, r1, 0, subb64, subu64)
+    C(0xe399, SLB,     RXY_a, Z,   r1_32u, m2_32u, new, r1_32, subb32, subu32)
+    C(0xe389, SLBG,    RXY_a, Z,   r1, m2_64, r1, 0, subb64, subu64)
 
 /* SUPERVISOR CALL */
     C(0x0a00, SVC,     I,     Z,   0, 0, 0, 0, svc, 0)
diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 4077047494bd..11515bb6173f 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -172,14 +172,12 @@ enum cc_op {
 
     CC_OP_ADD_64,               /* overflow on add (64bit) */
     CC_OP_SUB_64,               /* overflow on subtraction (64bit) */
-    CC_OP_SUBB_64,              /* overflow on unsigned sub-borrow (64bit) */
     CC_OP_ABS_64,               /* sign eval on abs (64bit) */
     CC_OP_NABS_64,              /* sign eval on nabs (64bit) */
     CC_OP_MULS_64,              /* overflow on signed multiply (64bit) */
 
     CC_OP_ADD_32,               /* overflow on add (32bit) */
     CC_OP_SUB_32,               /* overflow on subtraction (32bit) */
-    CC_OP_SUBB_32,              /* overflow on unsigned sub-borrow (32bit) */
     CC_OP_ABS_32,               /* sign eval on abs (64bit) */
     CC_OP_NABS_32,              /* sign eval on nabs (64bit) */
     CC_OP_MULS_32,              /* overflow on signed multiply (32bit) */
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 40add1df1ffc..3d5c0d61064c 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -601,10 +601,8 @@ static void gen_op_calc_cc(DisasContext *s)
         /* FALLTHRU */
     case CC_OP_ADD_64:
     case CC_OP_SUB_64:
-    case CC_OP_SUBB_64:
     case CC_OP_ADD_32:
     case CC_OP_SUB_32:
-    case CC_OP_SUBB_32:
         local_cc_op = tcg_const_i32(s->cc_op);
         break;
     case CC_OP_CONST0:
@@ -663,10 +661,8 @@ static void gen_op_calc_cc(DisasContext *s)
         break;
     case CC_OP_ADD_64:
     case CC_OP_SUB_64:
-    case CC_OP_SUBB_64:
     case CC_OP_ADD_32:
     case CC_OP_SUB_32:
-    case CC_OP_SUBB_32:
         /* 3 arguments */
         gen_helper_calc_cc(cc_op, cpu_env, local_cc_op, cc_src, cc_dst, cc_vr);
         break;
@@ -4746,29 +4742,51 @@ static DisasJumpType op_subu64(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_subb(DisasContext *s, DisasOps *o)
+/* Compute borrow (0, -1) into cc_src. */
+static void compute_borrow(DisasContext *s)
 {
-    DisasCompare cmp;
-    TCGv_i64 borrow;
+    switch (s->cc_op) {
+    case CC_OP_SUBU:
+        /* The borrow value is already in cc_src (0,-1). */
+        break;
+    default:
+        gen_op_calc_cc(s);
+        /* fall through */
+    case CC_OP_STATIC:
+        /* The carry flag is the msb of CC; compute into cc_src. */
+        tcg_gen_extu_i32_i64(cc_src, cc_op);
+        tcg_gen_shri_i64(cc_src, cc_src, 1);
+        /* fall through */
+    case CC_OP_ADDU:
+        /* Convert carry (1,0) to borrow (0,-1). */
+        tcg_gen_subi_i64(cc_src, cc_src, 1);
+        break;
+    }
+}
 
-    tcg_gen_sub_i64(o->out, o->in1, o->in2);
+static DisasJumpType op_subb32(DisasContext *s, DisasOps *o)
+{
+    compute_borrow(s);
 
-    /* The !borrow flag is the msb of CC.  Since we want the inverse of
-       that, we ask for a comparison of CC=0 | CC=1 -> mask of 8 | 4.  */
-    disas_jcc(s, &cmp, 8 | 4);
-    borrow = tcg_temp_new_i64();
-    if (cmp.is_64) {
-        tcg_gen_setcond_i64(cmp.cond, borrow, cmp.u.s64.a, cmp.u.s64.b);
-    } else {
-        TCGv_i32 t = tcg_temp_new_i32();
-        tcg_gen_setcond_i32(cmp.cond, t, cmp.u.s32.a, cmp.u.s32.b);
-        tcg_gen_extu_i32_i64(borrow, t);
-        tcg_temp_free_i32(t);
-    }
-    free_compare(&cmp);
+    /* Borrow is {0, -1}, so add to subtract. */
+    tcg_gen_add_i64(o->out, o->in1, cc_src);
+    tcg_gen_sub_i64(o->out, o->out, o->in2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_subb64(DisasContext *s, DisasOps *o)
+{
+    compute_borrow(s);
+
+    /*
+     * Borrow is {0, -1}, so add to subtract; replicate the
+     * borrow input to produce 128-bit -1 for the addition.
+     */
+    TCGv_i64 zero = tcg_const_i64(0);
+    tcg_gen_add2_i64(o->out, cc_src, o->in1, zero, cc_src, cc_src);
+    tcg_gen_sub2_i64(o->out, cc_src, o->out, cc_src, o->in2, zero);
+    tcg_temp_free_i64(zero);
 
-    tcg_gen_sub_i64(o->out, o->out, borrow);
-    tcg_temp_free_i64(borrow);
     return DISAS_NEXT;
 }
 
@@ -5307,16 +5325,6 @@ static void cout_subu64(DisasContext *s, DisasOps *o)
     gen_op_update2_cc_i64(s, CC_OP_SUBU, cc_src, o->out);
 }
 
-static void cout_subb32(DisasContext *s, DisasOps *o)
-{
-    gen_op_update3_cc_i64(s, CC_OP_SUBB_32, o->in1, o->in2, o->out);
-}
-
-static void cout_subb64(DisasContext *s, DisasOps *o)
-{
-    gen_op_update3_cc_i64(s, CC_OP_SUBB_64, o->in1, o->in2, o->out);
-}
-
 static void cout_tm32(DisasContext *s, DisasOps *o)
 {
     gen_op_update2_cc_i64(s, CC_OP_TM_32, o->in1, o->in2);
-- 
2.26.2


