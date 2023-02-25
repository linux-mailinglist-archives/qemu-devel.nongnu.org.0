Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F76A2850
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:24:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqjk-0008UV-Jp; Sat, 25 Feb 2023 04:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiz-000689-3a
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:17 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqim-00035n-Cc
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:11 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso5230783pjb.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=45/fsZysA6znj3lsxas/Rtz/1l3A7Tl30S+1TTOT2Q4=;
 b=g+vNjYz05eCDlEQYXQOMbIuEgMIxY1RWete2BPvO0/wo6gcBiYEPEGATtYZGDfKQSO
 auPYyj1S5CbXq8JH5wz59yX3Qjwj3e5cFgq1BXzGMNEYF6wDT6iy1SAIg4CNUkeFI2a3
 Cy98aQ3w9GKqiDukKmA8oDY+do2cYoTtHpMQdiye1hBfS1u+jfk5iLdKMSA2aDEv/G0a
 Ehq7Vw1a+pPawge7DOxDi7pNRxAxME9VAZsBVEsuBQObVxOVM4HYsZNbRGvGwBNJzskx
 FG0GVQIZ1foXpz4gsIpeA0fTlHGQdUhzqGGlX8r3Uhq23MT3V824A9AZWVIiqLvx5aMc
 g+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=45/fsZysA6znj3lsxas/Rtz/1l3A7Tl30S+1TTOT2Q4=;
 b=qL1Cm2YejtcIfjSaAJ9MBn5tKyVbKUZMipngRlOkX3OEu1O7Qzt7iYIyhTB+Da9faS
 0rlr6jWzzwv9TYrFQXpQBnxMsnxfWGTArqw586DuRsaGWLDoUX9TdamjY1e3mfVyZI+L
 9iQfkezXrAZWv9M6UmIyrSkSxdJrLfMJLAoFmOaiRyAF4gHN8fRo/4X+vIBNNYtenPFH
 XtEuHxESIk5sq7KKxan1PhC4HqrdygH4C0ReeJOWal/BB4Hwe2vMzpWImHf2OKmQ/oK4
 Jfs1rGbqx7r+1quoLPIBJyv5sQJWVld03Y3QS4fYCD89oykRFDcBY5o/qKSnjRX14fUF
 fzYg==
X-Gm-Message-State: AO0yUKUoHOAoCgq37SbOUo+CmhWmumOB9WQNMUSzL+66igjXwpxE6XBw
 jt1nmWeQkbsS4oO1TFJ1XyM8YlcsoJ54S35SkzI=
X-Google-Smtp-Source: AK7set9OfNtYlFFa5rM/r3r+8dt2rwn2Uc4ae+Fj4ZM6SZ0MyKYxJ45MMPp9Ar6f7R8pkJx0q7CJYg==
X-Received: by 2002:a05:6a20:1589:b0:b8:4b1a:deb5 with SMTP id
 h9-20020a056a20158900b000b84b1adeb5mr2338868pzj.18.1677316798864; 
 Sat, 25 Feb 2023 01:19:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 56/76] target/s390x: Use tcg_constant_* for DisasCompare
Date: Fri, 24 Feb 2023 23:14:07 -1000
Message-Id: <20230225091427.1817156-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The a and b fields are not modified by the consumer,
and while we need not free a constant, tcg will quietly
ignore such frees, so free_compare need not be changed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 44 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 3e3f685451..f2f2ea06eb 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -845,7 +845,7 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         c->is_64 = false;
         c->u.s32.a = tcg_temp_new_i32();
         tcg_gen_extrl_i64_i32(c->u.s32.a, cc_dst);
-        c->u.s32.b = tcg_const_i32(0);
+        c->u.s32.b = tcg_constant_i32(0);
         break;
     case CC_OP_LTGT_32:
     case CC_OP_LTUGTU_32:
@@ -860,7 +860,7 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_NZ:
     case CC_OP_FLOGR:
         c->u.s64.a = cc_dst;
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         c->g1 = true;
         break;
     case CC_OP_LTGT_64:
@@ -874,14 +874,14 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_TM_64:
     case CC_OP_ICM:
         c->u.s64.a = tcg_temp_new_i64();
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         tcg_gen_and_i64(c->u.s64.a, cc_src, cc_dst);
         break;
 
     case CC_OP_ADDU:
     case CC_OP_SUBU:
         c->is_64 = true;
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         c->g1 = true;
         switch (mask) {
         case 8 | 2:
@@ -904,65 +904,65 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         switch (mask) {
         case 0x8 | 0x4 | 0x2: /* cc != 3 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(3);
+            c->u.s32.b = tcg_constant_i32(3);
             break;
         case 0x8 | 0x4 | 0x1: /* cc != 2 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(2);
+            c->u.s32.b = tcg_constant_i32(2);
             break;
         case 0x8 | 0x2 | 0x1: /* cc != 1 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(1);
+            c->u.s32.b = tcg_constant_i32(1);
             break;
         case 0x8 | 0x2: /* cc == 0 || cc == 2 => (cc & 1) == 0 */
             cond = TCG_COND_EQ;
             c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
             break;
         case 0x8 | 0x4: /* cc < 2 */
             cond = TCG_COND_LTU;
-            c->u.s32.b = tcg_const_i32(2);
+            c->u.s32.b = tcg_constant_i32(2);
             break;
         case 0x8: /* cc == 0 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             break;
         case 0x4 | 0x2 | 0x1: /* cc != 0 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             break;
         case 0x4 | 0x1: /* cc == 1 || cc == 3 => (cc & 1) != 0 */
             cond = TCG_COND_NE;
             c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
             break;
         case 0x4: /* cc == 1 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(1);
+            c->u.s32.b = tcg_constant_i32(1);
             break;
         case 0x2 | 0x1: /* cc > 1 */
             cond = TCG_COND_GTU;
-            c->u.s32.b = tcg_const_i32(1);
+            c->u.s32.b = tcg_constant_i32(1);
             break;
         case 0x2: /* cc == 2 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(2);
+            c->u.s32.b = tcg_constant_i32(2);
             break;
         case 0x1: /* cc == 3 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(3);
+            c->u.s32.b = tcg_constant_i32(3);
             break;
         default:
             /* CC is masked by something else: (8 >> cc) & mask.  */
             cond = TCG_COND_NE;
             c->g1 = false;
-            c->u.s32.a = tcg_const_i32(8);
-            c->u.s32.b = tcg_const_i32(0);
-            tcg_gen_shr_i32(c->u.s32.a, c->u.s32.a, cc_op);
+            c->u.s32.a = tcg_temp_new_i32();
+            c->u.s32.b = tcg_constant_i32(0);
+            tcg_gen_shr_i32(c->u.s32.a, tcg_constant_i32(8), cc_op);
             tcg_gen_andi_i32(c->u.s32.a, c->u.s32.a, mask);
             break;
         }
@@ -1619,7 +1619,7 @@ static DisasJumpType op_bct32(DisasContext *s, DisasOps *o)
     tcg_gen_subi_i64(t, regs[r1], 1);
     store_reg32_i64(r1, t);
     c.u.s32.a = tcg_temp_new_i32();
-    c.u.s32.b = tcg_const_i32(0);
+    c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
     tcg_temp_free_i64(t);
 
@@ -1643,7 +1643,7 @@ static DisasJumpType op_bcth(DisasContext *s, DisasOps *o)
     tcg_gen_subi_i64(t, t, 1);
     store_reg32h_i64(r1, t);
     c.u.s32.a = tcg_temp_new_i32();
-    c.u.s32.b = tcg_const_i32(0);
+    c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
     tcg_temp_free_i64(t);
 
@@ -1664,7 +1664,7 @@ static DisasJumpType op_bct64(DisasContext *s, DisasOps *o)
 
     tcg_gen_subi_i64(regs[r1], regs[r1], 1);
     c.u.s64.a = regs[r1];
-    c.u.s64.b = tcg_const_i64(0);
+    c.u.s64.b = tcg_constant_i64(0);
 
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
-- 
2.34.1


