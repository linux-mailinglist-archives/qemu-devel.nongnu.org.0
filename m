Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A16AABD6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTs-0006Zg-De; Sat, 04 Mar 2023 13:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTZ-0006U0-3K
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:21 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTV-0003O5-T1
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:20 -0500
Received: by mail-pl1-x62e.google.com with SMTP id y11so6111579plg.1
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgBa2ERsQgrO6e/WAUiGru/VeOh/EJOtLRcCdLzGBVc=;
 b=otqBSvPmnfdKY1Iz7U7v6MdYMw6A/SMC2fGUMiKJjVjPqeBwhWn01MdLYX/zObBP93
 NED2qpgY8iamd5WaVOU6ZvUVGJ5r/j1iUKgH5vduajU2Bfggo5FXcJg8T/q8QDDsyL+K
 m/oBBCp0XhUu4CoCvE1uqKVyxVQGmvzyhnSPlR8ODw/3+/mQy1zowlWkaEPe8Rs1QMj3
 9oqhQ1WNRVi9+eOEqPsbnwCpFQaLqiQIRyjrGVxWUv96bCHH8o/2SYf9dLL4ilyjM1Up
 B1SsyrocG3HOrfEPXqmCEOetMZpeL/UTLIoq9wYVtMkYLZyB3Md9dJsMmz514+AfZnWO
 Cc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lgBa2ERsQgrO6e/WAUiGru/VeOh/EJOtLRcCdLzGBVc=;
 b=bi+aUOgTTkQe5X9vAp2JrRarJjDCO8pBfM2HipTexsEWCx+3q1StQek8z1/TfkWHoq
 5Yd9JWkLPv7soMVwYHJkoPFb/+bXdV/s40l31Axpybddo9fqTELIft6GXJmrF3G3A+nc
 qQs54YjMJTLV5oKUbxtqOQ2v+h+QjyZ1ImlskiWDfJ688+QqjJAnNqgKXEPBhngbG/TN
 G8jwCKbUeogpXrvPyFNwQtvr6eupptiwJHw/1rG3Xyri5kDvUrVSZoYmqr6KTmzTAOK9
 nwHNBMv5lkEabTHgnyHZ2FTnlFIeZixdAQp1AR0+5IvqxpMYqHQOHZySH5612gw5+tEa
 gl3g==
X-Gm-Message-State: AO0yUKVY3hvvbj3UAfws+hjHdlUUnrcUbLgHj3XRDz1vbz+g33ofv5ez
 qv8Or0n/v0+RiIxR7ocDR7t3UO63clu/ur8BcesECA==
X-Google-Smtp-Source: AK7set/MmyPOQ8CJO2gpyDOrFPDBmG7lqsLcPSbQ5hTN8gUu9evM07LCzbsB4EXBZeWrhX7b5srXMA==
X-Received: by 2002:a05:6a21:3284:b0:cd:1709:8d57 with SMTP id
 yt4-20020a056a21328400b000cd17098d57mr7377037pzb.1.1677953953593; 
 Sat, 04 Mar 2023 10:19:13 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v3 13/20] target/s390x: Drop free_compare
Date: Sat,  4 Mar 2023 10:18:53 -0800
Message-Id: <20230304181900.1097116-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Translators are no longer required to free tcg temporaries.
Remove the g1 and g2 members of DisasCompare, as they were
used to track which temps needed to be freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: David Hildenbrand <david@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org
---
 target/s390x/tcg/translate.c | 46 +-----------------------------------
 1 file changed, 1 insertion(+), 45 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 811049ea28..76a1233946 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -156,8 +156,6 @@ struct DisasContext {
 typedef struct {
     TCGCond cond:8;
     bool is_64;
-    bool g1;
-    bool g2;
     union {
         struct { TCGv_i64 a, b; } s64;
         struct { TCGv_i32 a, b; } s32;
@@ -722,7 +720,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         c->cond = (mask ? TCG_COND_ALWAYS : TCG_COND_NEVER);
         c->u.s32.a = cc_op;
         c->u.s32.b = cc_op;
-        c->g1 = c->g2 = true;
         c->is_64 = false;
         return;
     }
@@ -839,7 +836,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
 
     /* Load up the arguments of the comparison.  */
     c->is_64 = true;
-    c->g1 = c->g2 = false;
     switch (old_cc_op) {
     case CC_OP_LTGT0_32:
         c->is_64 = false;
@@ -861,13 +857,11 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_FLOGR:
         c->u.s64.a = cc_dst;
         c->u.s64.b = tcg_constant_i64(0);
-        c->g1 = true;
         break;
     case CC_OP_LTGT_64:
     case CC_OP_LTUGTU_64:
         c->u.s64.a = cc_src;
         c->u.s64.b = cc_dst;
-        c->g1 = c->g2 = true;
         break;
 
     case CC_OP_TM_32:
@@ -882,7 +876,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_SUBU:
         c->is_64 = true;
         c->u.s64.b = tcg_constant_i64(0);
-        c->g1 = true;
         switch (mask) {
         case 8 | 2:
         case 4 | 1: /* result */
@@ -900,7 +893,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_STATIC:
         c->is_64 = false;
         c->u.s32.a = cc_op;
-        c->g1 = true;
         switch (mask) {
         case 0x8 | 0x4 | 0x2: /* cc != 3 */
             cond = TCG_COND_NE;
@@ -916,7 +908,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
             break;
         case 0x8 | 0x2: /* cc == 0 || cc == 2 => (cc & 1) == 0 */
             cond = TCG_COND_EQ;
-            c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
             c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
@@ -935,7 +926,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
             break;
         case 0x4 | 0x1: /* cc == 1 || cc == 3 => (cc & 1) != 0 */
             cond = TCG_COND_NE;
-            c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
             c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
@@ -959,7 +949,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         default:
             /* CC is masked by something else: (8 >> cc) & mask.  */
             cond = TCG_COND_NE;
-            c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
             c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_shr_i32(c->u.s32.a, tcg_constant_i32(8), cc_op);
@@ -974,24 +963,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     c->cond = cond;
 }
 
-static void free_compare(DisasCompare *c)
-{
-    if (!c->g1) {
-        if (c->is_64) {
-            tcg_temp_free_i64(c->u.s64.a);
-        } else {
-            tcg_temp_free_i32(c->u.s32.a);
-        }
-    }
-    if (!c->g2) {
-        if (c->is_64) {
-            tcg_temp_free_i64(c->u.s64.b);
-        } else {
-            tcg_temp_free_i32(c->u.s32.b);
-        }
-    }
-}
-
 /* ====================================================================== */
 /* Define the insn format enumeration.  */
 #define F0(N)                         FMT_##N,
@@ -1302,7 +1273,6 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
     }
 
  egress:
-    free_compare(c);
     return ret;
 }
 
@@ -1612,8 +1582,6 @@ static DisasJumpType op_bct32(DisasContext *s, DisasOps *o)
 
     c.cond = TCG_COND_NE;
     c.is_64 = false;
-    c.g1 = false;
-    c.g2 = false;
 
     t = tcg_temp_new_i64();
     tcg_gen_subi_i64(t, regs[r1], 1);
@@ -1635,8 +1603,6 @@ static DisasJumpType op_bcth(DisasContext *s, DisasOps *o)
 
     c.cond = TCG_COND_NE;
     c.is_64 = false;
-    c.g1 = false;
-    c.g2 = false;
 
     t = tcg_temp_new_i64();
     tcg_gen_shri_i64(t, regs[r1], 32);
@@ -1659,8 +1625,6 @@ static DisasJumpType op_bct64(DisasContext *s, DisasOps *o)
 
     c.cond = TCG_COND_NE;
     c.is_64 = true;
-    c.g1 = true;
-    c.g2 = false;
 
     tcg_gen_subi_i64(regs[r1], regs[r1], 1);
     c.u.s64.a = regs[r1];
@@ -1680,8 +1644,6 @@ static DisasJumpType op_bx32(DisasContext *s, DisasOps *o)
 
     c.cond = (s->insn->data ? TCG_COND_LE : TCG_COND_GT);
     c.is_64 = false;
-    c.g1 = false;
-    c.g2 = false;
 
     t = tcg_temp_new_i64();
     tcg_gen_add_i64(t, regs[r1], regs[r3]);
@@ -1708,15 +1670,12 @@ static DisasJumpType op_bx64(DisasContext *s, DisasOps *o)
 
     if (r1 == (r3 | 1)) {
         c.u.s64.b = load_reg(r3 | 1);
-        c.g2 = false;
     } else {
         c.u.s64.b = regs[r3 | 1];
-        c.g2 = true;
     }
 
     tcg_gen_add_i64(regs[r1], regs[r1], regs[r3]);
     c.u.s64.a = regs[r1];
-    c.g1 = true;
 
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
@@ -1731,7 +1690,7 @@ static DisasJumpType op_cj(DisasContext *s, DisasOps *o)
     if (s->insn->data) {
         c.cond = tcg_unsigned_cond(c.cond);
     }
-    c.is_64 = c.g1 = c.g2 = true;
+    c.is_64 = true;
     c.u.s64.a = o->in1;
     c.u.s64.b = o->in2;
 
@@ -2925,13 +2884,11 @@ static DisasJumpType op_loc(DisasContext *s, DisasOps *o)
     if (c.is_64) {
         tcg_gen_movcond_i64(c.cond, o->out, c.u.s64.a, c.u.s64.b,
                             o->in2, o->in1);
-        free_compare(&c);
     } else {
         TCGv_i32 t32 = tcg_temp_new_i32();
         TCGv_i64 t, z;
 
         tcg_gen_setcond_i32(c.cond, t32, c.u.s32.a, c.u.s32.b);
-        free_compare(&c);
 
         t = tcg_temp_new_i64();
         tcg_gen_extu_i32_i64(t, t32);
@@ -4022,7 +3979,6 @@ static DisasJumpType op_soc(DisasContext *s, DisasOps *o)
     } else {
         tcg_gen_brcond_i32(c.cond, c.u.s32.a, c.u.s32.b, lab);
     }
-    free_compare(&c);
 
     r1 = get_field(s, r1);
     a = get_address(s, 0, get_field(s, b2), get_field(s, d2));
-- 
2.34.1


