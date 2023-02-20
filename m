Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2075369D308
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:46:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB6l-0004ku-J7; Mon, 20 Feb 2023 13:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6Q-0004XI-4l
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:34 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6K-00044o-VL
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:28 -0500
Received: by mail-pl1-x631.google.com with SMTP id q11so2822459plx.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4uWfLRIfJk8kynH2znY8EtkUuU9POntvMHrtKgCos1g=;
 b=OzuxOo1fwaD4OM+KS6DQ9ysd3Grl2m21EX7DuIotwt+Bb9788wTEcyU5CAEQl4tkzK
 sspxZ9O72hxflQ7bCAjI0MVheZu6+5DfGzpV0Ae9NxwznH18k73FA8HiFDfpSEHH3iN7
 L+m7rrwi8mLaS+4XvDKclB00s7KSPMiD15TrKex5ukZoBizIEcGWgg1iQvFwXVj1jRon
 CABH414+XiUBTKXFRDFLOyP/KpiZdmltnvDVkzsarygILEvWDIfU4sIYkjySk/6OlXok
 bG1gf6h2OBnfiQ425/5sQCsXLYftBuWgxPvEPwlIvKVVicfUJRpYpw3iDkTWpcK8a1VH
 BjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4uWfLRIfJk8kynH2znY8EtkUuU9POntvMHrtKgCos1g=;
 b=mJTRbPuW/yQ+mzTIvlYD0MhRInFGZulMOl1MmKGknyhXQsRO7NiwW/Kp/jueK16+Lj
 x5b7VA4BUMPftIjtkz8LI0Xj71PhrzpH4oOHdP6ZeLMrLYuoU0ZGEfGUVHgFlxRlScSB
 fe+Tb67I7RdvZJwzIge5xt7zGxUXvRNLEFqRfMEp+8WfHackhIjVBqRe2pbUWTkzbq0S
 PgeeyDlvBKcXjZHmHdLQKm0gczxXMn/aoIhPXGPrag+Y7s/yP+8p7lgLTd4QzHa76ro9
 1+McpIj4BCmU9Va0WWKahcfO6sFEjkotCGVuEL+C15o+TVYvTeJRDTh82/PXZecFiK5U
 E23w==
X-Gm-Message-State: AO0yUKXd9y28LyqS99evbctZAwQ2PeWq5UJaN9DJc3mCIIu2CtFz4b8M
 pUL04O6dKLayF7zKuxAcPy89Ie7ub5GTUnC8xuA=
X-Google-Smtp-Source: AK7set9GR1M4mms3ngbzQfIbZkPXYTnKqi7x2UeGpGLI6hOvJ7WcPuWSUYbbAzXoG1vRODrBu61MVw==
X-Received: by 2002:a17:902:f682:b0:198:e056:4d78 with SMTP id
 l2-20020a170902f68200b00198e0564d78mr3815310plg.23.1676918460844; 
 Mon, 20 Feb 2023 10:41:00 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 02/27] target/s390x: Use tcg_constant_* for DisasCompare
Date: Mon, 20 Feb 2023 08:40:27 -1000
Message-Id: <20230220184052.163465-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
index 35e844ef3c..a534419073 100644
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


