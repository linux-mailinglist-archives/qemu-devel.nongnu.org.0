Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF65663161
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRd-0002tD-HW; Mon, 09 Jan 2023 15:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRY-0002pd-9a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:30 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRW-0007OD-0e
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:27 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so12049354pjb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfVA0nj/TN3+VHB5xtnDhkO2uqdEaNgLQfY+g2hMs6Y=;
 b=hoDmb0RyIFGZvnJeDTBZ+Y7CZKIMBjDaMxbB3TodTkUaWVGPZsguX3QgPkEXAb54pt
 hU+wUiuR30OMukm8XouyuIns6HTCwcGnym7OKat//ii9t41TKtHvi7Ce+oA10VTBF3BB
 XgnDUaDBML/qNcNe13jaTTl+Whuveclc+XSJ1x0gIZPxkyMGi3QLsv1k+v+PSHD2mSpG
 WnOwrsdNk0IZSuGDGeyunMLuaD7v7NIHhQoac3q35JkbGS25CI/C/1r/P0d3Cs+nOuXE
 8/hdJglbP74L49heZgTs3Wy/c7pi6gWaocW/ezFD/ijWCaavsk7yCs2NZPpZ4O45QduD
 V/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfVA0nj/TN3+VHB5xtnDhkO2uqdEaNgLQfY+g2hMs6Y=;
 b=D7x39jMGM8Bh69vqrEhvWKrOJLy38fTRorY2BjCP5YnQRq7v9cdUUuEoijPJehc3fD
 TmkD7QRZ06aKwZTn+T5/eZQvqS8WzOOJ6f4GdLP1uRjaCJ93NH5C9yrPEGBqK6rcyIdM
 0k3/5D0D/TeFndhSeRwuoWGgCMtg79NArJK3/hnpnkklqg5J/vNorS2/UecaUQEBrNXF
 +N2mZLTdJ9AEsTrb7aA0Ta4+LQ6T3DU8PS/ZJ6F3AjNm7BE4l5kpfAEYYZ8R9Q8T4G4p
 wy642dgLi2JXvkmPthEIJNWLg+4hsTMGBF3BYsO/7EMqDAS3lePY4OcQw5dh6FiOTFU/
 +ndQ==
X-Gm-Message-State: AFqh2kq8mz8JEyRAWCQAdXtpWSh2rkvLHbbHpjyJcDdvNSCZgEkOhqlo
 96emM5fW1N0SnTeEK9va3Ka88Yz3OFjPCj+k
X-Google-Smtp-Source: AMrXdXsgFhtXcmirE2U3wscRI1YdRyRrv7ZfKeGoAySFUpNSEqs+rkVlYE3jqBVnsKfV+TfjvCiKZA==
X-Received: by 2002:a05:6a20:8ee1:b0:ac:3f3f:9fbd with SMTP id
 m33-20020a056a208ee100b000ac3f3f9fbdmr65009082pzk.48.1673294904103; 
 Mon, 09 Jan 2023 12:08:24 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 02/27] target/s390x: Use tcg_constant_* for DisasCompare
Date: Mon,  9 Jan 2023 12:07:54 -0800
Message-Id: <20230109200819.3916395-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index f1c0e1af0d..2fa052249f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -830,7 +830,7 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         c->is_64 = false;
         c->u.s32.a = tcg_temp_new_i32();
         tcg_gen_extrl_i64_i32(c->u.s32.a, cc_dst);
-        c->u.s32.b = tcg_const_i32(0);
+        c->u.s32.b = tcg_constant_i32(0);
         break;
     case CC_OP_LTGT_32:
     case CC_OP_LTUGTU_32:
@@ -845,7 +845,7 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_NZ:
     case CC_OP_FLOGR:
         c->u.s64.a = cc_dst;
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         c->g1 = true;
         break;
     case CC_OP_LTGT_64:
@@ -859,14 +859,14 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
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
@@ -889,65 +889,65 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
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
@@ -1604,7 +1604,7 @@ static DisasJumpType op_bct32(DisasContext *s, DisasOps *o)
     tcg_gen_subi_i64(t, regs[r1], 1);
     store_reg32_i64(r1, t);
     c.u.s32.a = tcg_temp_new_i32();
-    c.u.s32.b = tcg_const_i32(0);
+    c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
     tcg_temp_free_i64(t);
 
@@ -1628,7 +1628,7 @@ static DisasJumpType op_bcth(DisasContext *s, DisasOps *o)
     tcg_gen_subi_i64(t, t, 1);
     store_reg32h_i64(r1, t);
     c.u.s32.a = tcg_temp_new_i32();
-    c.u.s32.b = tcg_const_i32(0);
+    c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
     tcg_temp_free_i64(t);
 
@@ -1649,7 +1649,7 @@ static DisasJumpType op_bct64(DisasContext *s, DisasOps *o)
 
     tcg_gen_subi_i64(regs[r1], regs[r1], 1);
     c.u.s64.a = regs[r1];
-    c.u.s64.b = tcg_const_i64(0);
+    c.u.s64.b = tcg_constant_i64(0);
 
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
-- 
2.34.1


