Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7706AED69
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaY-00064B-9O; Tue, 07 Mar 2023 12:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaW-000631-KQ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:00 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaU-0000Dy-RG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:00 -0500
Received: by mail-pl1-x633.google.com with SMTP id v11so14998639plz.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEquaurnsxfKMHWFUGcK4c6BV3x2G/er2extu0c3P7k=;
 b=WlAfuUvmjkAfzCmc4Jb4AtjKa9kqPixMHoQ6UQfaRrgeVb13Cvt3RVQpI9W0g/kQka
 ZIW463/w4Ehy/odfMi7j72Fj+81Uk0OGWHIEX5nAcjzE79FHXkzVoEfxY6B2CdWmkpMt
 cUB7HrKrk2RQHXVFyp4JgcdNXKhRYn5IQtu52iGMkoiAFe8ylWhgbZcdQ7lkyYG8sFhV
 Ajn0Ji5sDK1CGhA7drc9XseFqhBQIrvDZ7KoMu+VBBC8ryIZN/aArS4SE9TrQ7Bk+YAK
 M7ATMYkhi3HY54/n40apcTnQ/203wHJGH0sGHbxo+rNpgqbJQbj6taX8erO1H3D0K5EO
 OehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dEquaurnsxfKMHWFUGcK4c6BV3x2G/er2extu0c3P7k=;
 b=D88YEW9C82RJ4WsPNiP8BSPzTu3m14x0Gw1sLcN+Nk363fsGrB0CQOI2YLSvqyRqJG
 CScPirmE89cjSfXmMaGbsCagx/seYX4jxplbjW32eR2i6vveNDdJd33vldf3n04/i/Dz
 6Q43rQjLPDltEmpijtraVhhiXhUiGhixry/Dwzj4yE53IWYMRjMxN9FTkJFK4kt8hBKQ
 tBWd8gZryk15FJYU3/qEbhMMzPFJsWyt8ErKMtSaBuf4/cJS8ZfbPK7tyIlhO/WGuBLL
 6Dwp+mEnynXITOY5l9YrzdR+iw2EDHPtgUG20rS3+Nw9NNbT8/p9Kqt3w+e7CtHM/CeD
 /BjQ==
X-Gm-Message-State: AO0yUKVfuR4V5+JWrI+O/kgtuDrKMKrOuIKz35XZxSsxAKR3naYVvLs9
 j+cA+B+dL6NfZQ5XgmDKpF6qkM58Xj3EU1qEATU=
X-Google-Smtp-Source: AK7set+//C7rE8+ambt7vMBfxY9LE+V9iWsbWJCF19SKoWgff3q1/Dt/gFm0tlxdk4y4cDrJ2tLSZA==
X-Received: by 2002:a17:903:455:b0:19d:16ee:e85a with SMTP id
 iw21-20020a170903045500b0019d16eee85amr14213704plb.39.1678211937565; 
 Tue, 07 Mar 2023 09:58:57 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/67] target/s390x: Drop free_compare
Date: Tue,  7 Mar 2023 09:57:51 -0800
Message-Id: <20230307175848.2508955-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 46 +-----------------------------------
 1 file changed, 1 insertion(+), 45 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 21a57d5eb2..669671075e 100644
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


