Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF946F8AD2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:25:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vF-0000eJ-KU; Fri, 05 May 2023 17:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vB-0000cW-B6
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:57 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v8-0004ON-LG
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:57 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso1772342f8f.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321893; x=1685913893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4lFFawE3xIDuNSdeSLKcLA/U4uM/LgDoGJspbHlWdI=;
 b=YkNOgkh4PYLB6Z6JgGBgnovLxIH70+57tCMC4mnFJV8c5fb3ZAi/ddMRAVw9X7knLZ
 IUfiWnZZN8LP6mQLDA+Q7TY3cJNzuKYSa3FwvBHw2M/esSXGj9PXvjVZe94oMdkeo10v
 DH8BSe0tLW6Yf9LXKk3NpZS/HKr9qihDa0rTcqASmrAZ+GTr8QXL44NW4uoMvULRbHto
 3tK5LFrUwC+v+dGKqTNT/s+r1dLS+MyIebYxXgErX5TJ4nQCVqn41sjdPImR+q2G502Y
 BTgSEX1PofS3XA5V8+oczS2ZgNpUngbp1UeijC0rXl5erw+qkJDD/+mbr3wQFoYDyz6O
 sObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321893; x=1685913893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4lFFawE3xIDuNSdeSLKcLA/U4uM/LgDoGJspbHlWdI=;
 b=jfJQnKSKLD8iegS3a92Mh38mBZz7KtjCpKTOXbnDy6r5XYLwJj7FUtEqdmpRuiN3y2
 oXT6cIIyJ7MaVf3sjLTHxDoY5n7F4mR4Hq9MHLCXWV7UwWN3flzurO+kjC3Csn+h4dX2
 UnEKN+YbHNeBiXZmY0gQInwv62EnvJ/iarT+iBpC2ZY8SGh7iqtaCwN9WsbdgylBX6sN
 jyRRKmuCVaRR+kWg5TJ6KMV7R6Cx0DzqqPpnFXIoeYU5nlToTFNLLj6lu3eQ/2S5VTAG
 iMmZXsbqOpJHqUvb/T3fvF2Y69LS8x0er4MtyDLsANVjpWrC38pvpo1tN4AnLBBzR3bY
 QXww==
X-Gm-Message-State: AC+VfDza4OQU0/AankzRDXZ5I4sbioC8o5+uevAGBAi9Ew8TaGqwfHGg
 bwJzQfd9/I4Weon2vIITnCOmwlWd253goVOmC6E6mA==
X-Google-Smtp-Source: ACHHUZ4NwkOe7pCyFEIdavENJA7I5kgcL0Scd5QJ1qUUfx+jDZ89mUUWuSb+qiGy+zh40333Q3FzUw==
X-Received: by 2002:adf:fc8c:0:b0:306:3204:3633 with SMTP id
 g12-20020adffc8c000000b0030632043633mr2244337wrr.22.1683321892999; 
 Fri, 05 May 2023 14:24:52 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 07/42] target/s390x: Finish conversion to tcg_gen_qemu_{ld,
 st}_*
Date: Fri,  5 May 2023 22:24:12 +0100
Message-Id: <20230505212447.374546-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Convert away from the old interface with the implicit
MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230502135741.1158035-7-richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 152 ++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 81 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 46b874e94d..a05205beb1 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1973,32 +1973,24 @@ static DisasJumpType op_clc(DisasContext *s, DisasOps *o)
 {
     int l = get_field(s, l1);
     TCGv_i32 vl;
+    MemOp mop;
 
     switch (l + 1) {
     case 1:
-        tcg_gen_qemu_ld8u(cc_src, o->addr1, get_mem_index(s));
-        tcg_gen_qemu_ld8u(cc_dst, o->in2, get_mem_index(s));
-        break;
     case 2:
-        tcg_gen_qemu_ld16u(cc_src, o->addr1, get_mem_index(s));
-        tcg_gen_qemu_ld16u(cc_dst, o->in2, get_mem_index(s));
-        break;
     case 4:
-        tcg_gen_qemu_ld32u(cc_src, o->addr1, get_mem_index(s));
-        tcg_gen_qemu_ld32u(cc_dst, o->in2, get_mem_index(s));
-        break;
     case 8:
-        tcg_gen_qemu_ld64(cc_src, o->addr1, get_mem_index(s));
-        tcg_gen_qemu_ld64(cc_dst, o->in2, get_mem_index(s));
-        break;
+        mop = ctz32(l + 1) | MO_TE;
+        tcg_gen_qemu_ld_tl(cc_src, o->addr1, get_mem_index(s), mop);
+        tcg_gen_qemu_ld_tl(cc_dst, o->in2, get_mem_index(s), mop);
+        gen_op_update2_cc_i64(s, CC_OP_LTUGTU_64, cc_src, cc_dst);
+        return DISAS_NEXT;
     default:
         vl = tcg_constant_i32(l);
         gen_helper_clc(cc_op, cpu_env, vl, o->addr1, o->in2);
         set_cc_static(s);
         return DISAS_NEXT;
     }
-    gen_op_update2_cc_i64(s, CC_OP_LTUGTU_64, cc_src, cc_dst);
-    return DISAS_NEXT;
 }
 
 static DisasJumpType op_clcl(DisasContext *s, DisasOps *o)
@@ -2199,7 +2191,7 @@ static DisasJumpType op_cvd(DisasContext *s, DisasOps *o)
     TCGv_i32 t2 = tcg_temp_new_i32();
     tcg_gen_extrl_i64_i32(t2, o->in1);
     gen_helper_cvd(t1, t2);
-    tcg_gen_qemu_st64(t1, o->in2, get_mem_index(s));
+    tcg_gen_qemu_st_i64(t1, o->in2, get_mem_index(s), MO_TEUQ);
     return DISAS_NEXT;
 }
 
@@ -2457,7 +2449,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
     switch (m3) {
     case 0xf:
         /* Effectively a 32-bit load.  */
-        tcg_gen_qemu_ld32u(tmp, o->in2, get_mem_index(s));
+        tcg_gen_qemu_ld_i64(tmp, o->in2, get_mem_index(s), MO_TEUL);
         len = 32;
         goto one_insert;
 
@@ -2465,7 +2457,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
     case 0x6:
     case 0x3:
         /* Effectively a 16-bit load.  */
-        tcg_gen_qemu_ld16u(tmp, o->in2, get_mem_index(s));
+        tcg_gen_qemu_ld_i64(tmp, o->in2, get_mem_index(s), MO_TEUW);
         len = 16;
         goto one_insert;
 
@@ -2474,7 +2466,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
     case 0x2:
     case 0x1:
         /* Effectively an 8-bit load.  */
-        tcg_gen_qemu_ld8u(tmp, o->in2, get_mem_index(s));
+        tcg_gen_qemu_ld_i64(tmp, o->in2, get_mem_index(s), MO_UB);
         len = 8;
         goto one_insert;
 
@@ -2490,7 +2482,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
         ccm = 0;
         while (m3) {
             if (m3 & 0x8) {
-                tcg_gen_qemu_ld8u(tmp, o->in2, get_mem_index(s));
+                tcg_gen_qemu_ld_i64(tmp, o->in2, get_mem_index(s), MO_UB);
                 tcg_gen_addi_i64(o->in2, o->in2, 1);
                 tcg_gen_deposit_i64(o->out, o->out, tmp, pos, 8);
                 ccm |= 0xffull << pos;
@@ -2746,25 +2738,25 @@ static DisasJumpType op_llgt(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_ld8s(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld8s(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->out, o->in2, get_mem_index(s), MO_SB);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_ld8u(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld8u(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->out, o->in2, get_mem_index(s), MO_UB);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_ld16s(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld16s(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->out, o->in2, get_mem_index(s), MO_TESW);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_ld16u(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_ld16u(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->out, o->in2, get_mem_index(s), MO_TEUW);
     return DISAS_NEXT;
 }
 
@@ -2803,7 +2795,7 @@ static DisasJumpType op_lat(DisasContext *s, DisasOps *o)
 static DisasJumpType op_lgat(DisasContext *s, DisasOps *o)
 {
     TCGLabel *lab = gen_new_label();
-    tcg_gen_qemu_ld64(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->out, o->in2, get_mem_index(s), MO_TEUQ);
     /* The value is stored even in case of trap. */
     tcg_gen_brcondi_i64(TCG_COND_NE, o->out, 0, lab);
     gen_trap(s);
@@ -2825,7 +2817,8 @@ static DisasJumpType op_lfhat(DisasContext *s, DisasOps *o)
 static DisasJumpType op_llgfat(DisasContext *s, DisasOps *o)
 {
     TCGLabel *lab = gen_new_label();
-    tcg_gen_qemu_ld32u(o->out, o->in2, get_mem_index(s));
+
+    tcg_gen_qemu_ld_i64(o->out, o->in2, get_mem_index(s), MO_TEUL);
     /* The value is stored even in case of trap. */
     tcg_gen_brcondi_i64(TCG_COND_NE, o->out, 0, lab);
     gen_trap(s);
@@ -2942,7 +2935,7 @@ static DisasJumpType op_lpswe(DisasContext *s, DisasOps *o)
     tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s),
                         MO_TEUQ | MO_ALIGN_8);
     tcg_gen_addi_i64(o->in2, o->in2, 8);
-    tcg_gen_qemu_ld64(t2, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(t2, o->in2, get_mem_index(s), MO_TEUQ);
     gen_helper_load_psw(cpu_env, t1, t2);
     return DISAS_NORETURN;
 }
@@ -2966,7 +2959,7 @@ static DisasJumpType op_lm32(DisasContext *s, DisasOps *o)
     /* Only one register to read. */
     t1 = tcg_temp_new_i64();
     if (unlikely(r1 == r3)) {
-        tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
+        tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s), MO_TEUL);
         store_reg32_i64(r1, t1);
         return DISAS_NEXT;
     }
@@ -2974,9 +2967,9 @@ static DisasJumpType op_lm32(DisasContext *s, DisasOps *o)
     /* First load the values of the first and last registers to trigger
        possible page faults. */
     t2 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s), MO_TEUL);
     tcg_gen_addi_i64(t2, o->in2, 4 * ((r3 - r1) & 15));
-    tcg_gen_qemu_ld32u(t2, t2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(t2, t2, get_mem_index(s), MO_TEUL);
     store_reg32_i64(r1, t1);
     store_reg32_i64(r3, t2);
 
@@ -2991,7 +2984,7 @@ static DisasJumpType op_lm32(DisasContext *s, DisasOps *o)
     while (r1 != r3) {
         r1 = (r1 + 1) & 15;
         tcg_gen_add_i64(o->in2, o->in2, t2);
-        tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
+        tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s), MO_TEUL);
         store_reg32_i64(r1, t1);
     }
     return DISAS_NEXT;
@@ -3006,7 +2999,7 @@ static DisasJumpType op_lmh(DisasContext *s, DisasOps *o)
     /* Only one register to read. */
     t1 = tcg_temp_new_i64();
     if (unlikely(r1 == r3)) {
-        tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
+        tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s), MO_TEUL);
         store_reg32h_i64(r1, t1);
         return DISAS_NEXT;
     }
@@ -3014,9 +3007,9 @@ static DisasJumpType op_lmh(DisasContext *s, DisasOps *o)
     /* First load the values of the first and last registers to trigger
        possible page faults. */
     t2 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s), MO_TEUL);
     tcg_gen_addi_i64(t2, o->in2, 4 * ((r3 - r1) & 15));
-    tcg_gen_qemu_ld32u(t2, t2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(t2, t2, get_mem_index(s), MO_TEUL);
     store_reg32h_i64(r1, t1);
     store_reg32h_i64(r3, t2);
 
@@ -3031,7 +3024,7 @@ static DisasJumpType op_lmh(DisasContext *s, DisasOps *o)
     while (r1 != r3) {
         r1 = (r1 + 1) & 15;
         tcg_gen_add_i64(o->in2, o->in2, t2);
-        tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
+        tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s), MO_TEUL);
         store_reg32h_i64(r1, t1);
     }
     return DISAS_NEXT;
@@ -3045,7 +3038,7 @@ static DisasJumpType op_lm64(DisasContext *s, DisasOps *o)
 
     /* Only one register to read. */
     if (unlikely(r1 == r3)) {
-        tcg_gen_qemu_ld64(regs[r1], o->in2, get_mem_index(s));
+        tcg_gen_qemu_ld_i64(regs[r1], o->in2, get_mem_index(s), MO_TEUQ);
         return DISAS_NEXT;
     }
 
@@ -3053,9 +3046,9 @@ static DisasJumpType op_lm64(DisasContext *s, DisasOps *o)
        possible page faults. */
     t1 = tcg_temp_new_i64();
     t2 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld64(t1, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s), MO_TEUQ);
     tcg_gen_addi_i64(t2, o->in2, 8 * ((r3 - r1) & 15));
-    tcg_gen_qemu_ld64(regs[r3], t2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(regs[r3], t2, get_mem_index(s), MO_TEUQ);
     tcg_gen_mov_i64(regs[r1], t1);
 
     /* Only two registers to read. */
@@ -3069,7 +3062,7 @@ static DisasJumpType op_lm64(DisasContext *s, DisasOps *o)
     while (r1 != r3) {
         r1 = (r1 + 1) & 15;
         tcg_gen_add_i64(o->in2, o->in2, t1);
-        tcg_gen_qemu_ld64(regs[r1], o->in2, get_mem_index(s));
+        tcg_gen_qemu_ld_i64(regs[r1], o->in2, get_mem_index(s), MO_TEUQ);
     }
     return DISAS_NEXT;
 }
@@ -3923,15 +3916,15 @@ static DisasJumpType op_soc(DisasContext *s, DisasOps *o)
     a = get_address(s, 0, get_field(s, b2), get_field(s, d2));
     switch (s->insn->data) {
     case 1: /* STOCG */
-        tcg_gen_qemu_st64(regs[r1], a, get_mem_index(s));
+        tcg_gen_qemu_st_i64(regs[r1], a, get_mem_index(s), MO_TEUQ);
         break;
     case 0: /* STOC */
-        tcg_gen_qemu_st32(regs[r1], a, get_mem_index(s));
+        tcg_gen_qemu_st_i64(regs[r1], a, get_mem_index(s), MO_TEUL);
         break;
     case 2: /* STOCFH */
         h = tcg_temp_new_i64();
         tcg_gen_shri_i64(h, regs[r1], 32);
-        tcg_gen_qemu_st32(h, a, get_mem_index(s));
+        tcg_gen_qemu_st_i64(h, a, get_mem_index(s), MO_TEUL);
         break;
     default:
         g_assert_not_reached();
@@ -4050,7 +4043,7 @@ static DisasJumpType op_ectg(DisasContext *s, DisasOps *o)
     gen_addi_and_wrap_i64(s, o->addr1, regs[r3], 0);
 
     /* load the third operand into r3 before modifying anything */
-    tcg_gen_qemu_ld64(regs[r3], o->addr1, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(regs[r3], o->addr1, get_mem_index(s), MO_TEUQ);
 
     /* subtract CPU timer from first operand and store in GR0 */
     gen_helper_stpt(tmp, cpu_env);
@@ -4128,9 +4121,9 @@ static DisasJumpType op_stcke(DisasContext *s, DisasOps *o)
     tcg_gen_shri_i64(c1, c1, 8);
     tcg_gen_ori_i64(c2, c2, 0x10000);
     tcg_gen_or_i64(c2, c2, todpr);
-    tcg_gen_qemu_st64(c1, o->in2, get_mem_index(s));
+    tcg_gen_qemu_st_i64(c1, o->in2, get_mem_index(s), MO_TEUQ);
     tcg_gen_addi_i64(o->in2, o->in2, 8);
-    tcg_gen_qemu_st64(c2, o->in2, get_mem_index(s));
+    tcg_gen_qemu_st_i64(c2, o->in2, get_mem_index(s), MO_TEUQ);
     /* ??? We don't implement clock states.  */
     gen_op_movi_cc(s, 0);
     return DISAS_NEXT;
@@ -4343,7 +4336,7 @@ static DisasJumpType op_stnosm(DisasContext *s, DisasOps *o)
        restart, we'll have the wrong SYSTEM MASK in place.  */
     t = tcg_temp_new_i64();
     tcg_gen_shri_i64(t, psw_mask, 56);
-    tcg_gen_qemu_st8(t, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_st_i64(t, o->addr1, get_mem_index(s), MO_UB);
 
     if (s->fields.op == 0xac) {
         tcg_gen_andi_i64(psw_mask, psw_mask,
@@ -4380,13 +4373,13 @@ static DisasJumpType op_stfle(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_st8(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_st8(o->in1, o->in2, get_mem_index(s));
+    tcg_gen_qemu_st_i64(o->in1, o->in2, get_mem_index(s), MO_UB);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_st16(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_st16(o->in1, o->in2, get_mem_index(s));
+    tcg_gen_qemu_st_i64(o->in1, o->in2, get_mem_index(s), MO_TEUW);
     return DISAS_NEXT;
 }
 
@@ -4424,7 +4417,7 @@ static DisasJumpType op_stcm(DisasContext *s, DisasOps *o)
     case 0xf:
         /* Effectively a 32-bit store.  */
         tcg_gen_shri_i64(tmp, o->in1, pos);
-        tcg_gen_qemu_st32(tmp, o->in2, get_mem_index(s));
+        tcg_gen_qemu_st_i64(tmp, o->in2, get_mem_index(s), MO_TEUL);
         break;
 
     case 0xc:
@@ -4432,7 +4425,7 @@ static DisasJumpType op_stcm(DisasContext *s, DisasOps *o)
     case 0x3:
         /* Effectively a 16-bit store.  */
         tcg_gen_shri_i64(tmp, o->in1, pos);
-        tcg_gen_qemu_st16(tmp, o->in2, get_mem_index(s));
+        tcg_gen_qemu_st_i64(tmp, o->in2, get_mem_index(s), MO_TEUW);
         break;
 
     case 0x8:
@@ -4441,7 +4434,7 @@ static DisasJumpType op_stcm(DisasContext *s, DisasOps *o)
     case 0x1:
         /* Effectively an 8-bit store.  */
         tcg_gen_shri_i64(tmp, o->in1, pos);
-        tcg_gen_qemu_st8(tmp, o->in2, get_mem_index(s));
+        tcg_gen_qemu_st_i64(tmp, o->in2, get_mem_index(s), MO_UB);
         break;
 
     default:
@@ -4450,7 +4443,7 @@ static DisasJumpType op_stcm(DisasContext *s, DisasOps *o)
         while (m3) {
             if (m3 & 0x8) {
                 tcg_gen_shri_i64(tmp, o->in1, pos);
-                tcg_gen_qemu_st8(tmp, o->in2, get_mem_index(s));
+                tcg_gen_qemu_st_i64(tmp, o->in2, get_mem_index(s), MO_UB);
                 tcg_gen_addi_i64(o->in2, o->in2, 1);
             }
             m3 = (m3 << 1) & 0xf;
@@ -4469,11 +4462,8 @@ static DisasJumpType op_stm(DisasContext *s, DisasOps *o)
     TCGv_i64 tsize = tcg_constant_i64(size);
 
     while (1) {
-        if (size == 8) {
-            tcg_gen_qemu_st64(regs[r1], o->in2, get_mem_index(s));
-        } else {
-            tcg_gen_qemu_st32(regs[r1], o->in2, get_mem_index(s));
-        }
+        tcg_gen_qemu_st_i64(regs[r1], o->in2, get_mem_index(s),
+                            size == 8 ? MO_TEUQ : MO_TEUL);
         if (r1 == r3) {
             break;
         }
@@ -4494,7 +4484,7 @@ static DisasJumpType op_stmh(DisasContext *s, DisasOps *o)
 
     while (1) {
         tcg_gen_shl_i64(t, regs[r1], t32);
-        tcg_gen_qemu_st32(t, o->in2, get_mem_index(s));
+        tcg_gen_qemu_st_i64(t, o->in2, get_mem_index(s), MO_TEUL);
         if (r1 == r3) {
             break;
         }
@@ -4804,28 +4794,28 @@ static DisasJumpType op_xc(DisasContext *s, DisasOps *o)
 
         l++;
         while (l >= 8) {
-            tcg_gen_qemu_st64(o->in2, o->addr1, get_mem_index(s));
+            tcg_gen_qemu_st_i64(o->in2, o->addr1, get_mem_index(s), MO_UQ);
             l -= 8;
             if (l > 0) {
                 tcg_gen_addi_i64(o->addr1, o->addr1, 8);
             }
         }
         if (l >= 4) {
-            tcg_gen_qemu_st32(o->in2, o->addr1, get_mem_index(s));
+            tcg_gen_qemu_st_i64(o->in2, o->addr1, get_mem_index(s), MO_UL);
             l -= 4;
             if (l > 0) {
                 tcg_gen_addi_i64(o->addr1, o->addr1, 4);
             }
         }
         if (l >= 2) {
-            tcg_gen_qemu_st16(o->in2, o->addr1, get_mem_index(s));
+            tcg_gen_qemu_st_i64(o->in2, o->addr1, get_mem_index(s), MO_UW);
             l -= 2;
             if (l > 0) {
                 tcg_gen_addi_i64(o->addr1, o->addr1, 2);
             }
         }
         if (l) {
-            tcg_gen_qemu_st8(o->in2, o->addr1, get_mem_index(s));
+            tcg_gen_qemu_st_i64(o->in2, o->addr1, get_mem_index(s), MO_UB);
         }
         gen_op_movi_cc(s, 0);
         return DISAS_NEXT;
@@ -5314,13 +5304,13 @@ static void wout_cond_e1e2(DisasContext *s, DisasOps *o)
 
 static void wout_m1_8(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_st8(o->out, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_st_i64(o->out, o->addr1, get_mem_index(s), MO_UB);
 }
 #define SPEC_wout_m1_8 0
 
 static void wout_m1_16(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_st16(o->out, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_st_i64(o->out, o->addr1, get_mem_index(s), MO_TEUW);
 }
 #define SPEC_wout_m1_16 0
 
@@ -5334,7 +5324,7 @@ static void wout_m1_16a(DisasContext *s, DisasOps *o)
 
 static void wout_m1_32(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_st32(o->out, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_st_i64(o->out, o->addr1, get_mem_index(s), MO_TEUL);
 }
 #define SPEC_wout_m1_32 0
 
@@ -5348,7 +5338,7 @@ static void wout_m1_32a(DisasContext *s, DisasOps *o)
 
 static void wout_m1_64(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_st64(o->out, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_st_i64(o->out, o->addr1, get_mem_index(s), MO_TEUQ);
 }
 #define SPEC_wout_m1_64 0
 
@@ -5362,7 +5352,7 @@ static void wout_m1_64a(DisasContext *s, DisasOps *o)
 
 static void wout_m2_32(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_qemu_st32(o->out, o->in2, get_mem_index(s));
+    tcg_gen_qemu_st_i64(o->out, o->in2, get_mem_index(s), MO_TEUL);
 }
 #define SPEC_wout_m2_32 0
 
@@ -5557,7 +5547,7 @@ static void in1_m1_8u(DisasContext *s, DisasOps *o)
 {
     in1_la1(s, o);
     o->in1 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld8u(o->in1, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_UB);
 }
 #define SPEC_in1_m1_8u 0
 
@@ -5565,7 +5555,7 @@ static void in1_m1_16s(DisasContext *s, DisasOps *o)
 {
     in1_la1(s, o);
     o->in1 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld16s(o->in1, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TESW);
 }
 #define SPEC_in1_m1_16s 0
 
@@ -5573,7 +5563,7 @@ static void in1_m1_16u(DisasContext *s, DisasOps *o)
 {
     in1_la1(s, o);
     o->in1 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld16u(o->in1, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEUW);
 }
 #define SPEC_in1_m1_16u 0
 
@@ -5581,7 +5571,7 @@ static void in1_m1_32s(DisasContext *s, DisasOps *o)
 {
     in1_la1(s, o);
     o->in1 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld32s(o->in1, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TESL);
 }
 #define SPEC_in1_m1_32s 0
 
@@ -5589,7 +5579,7 @@ static void in1_m1_32u(DisasContext *s, DisasOps *o)
 {
     in1_la1(s, o);
     o->in1 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld32u(o->in1, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEUL);
 }
 #define SPEC_in1_m1_32u 0
 
@@ -5597,7 +5587,7 @@ static void in1_m1_64(DisasContext *s, DisasOps *o)
 {
     in1_la1(s, o);
     o->in1 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld64(o->in1, o->addr1, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in1, o->addr1, get_mem_index(s), MO_TEUQ);
 }
 #define SPEC_in1_m1_64 0
 
@@ -5811,35 +5801,35 @@ static void in2_sh(DisasContext *s, DisasOps *o)
 static void in2_m2_8u(DisasContext *s, DisasOps *o)
 {
     in2_a2(s, o);
-    tcg_gen_qemu_ld8u(o->in2, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_UB);
 }
 #define SPEC_in2_m2_8u 0
 
 static void in2_m2_16s(DisasContext *s, DisasOps *o)
 {
     in2_a2(s, o);
-    tcg_gen_qemu_ld16s(o->in2, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_TESW);
 }
 #define SPEC_in2_m2_16s 0
 
 static void in2_m2_16u(DisasContext *s, DisasOps *o)
 {
     in2_a2(s, o);
-    tcg_gen_qemu_ld16u(o->in2, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_TEUW);
 }
 #define SPEC_in2_m2_16u 0
 
 static void in2_m2_32s(DisasContext *s, DisasOps *o)
 {
     in2_a2(s, o);
-    tcg_gen_qemu_ld32s(o->in2, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_TESL);
 }
 #define SPEC_in2_m2_32s 0
 
 static void in2_m2_32u(DisasContext *s, DisasOps *o)
 {
     in2_a2(s, o);
-    tcg_gen_qemu_ld32u(o->in2, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_TEUL);
 }
 #define SPEC_in2_m2_32u 0
 
@@ -5855,14 +5845,14 @@ static void in2_m2_32ua(DisasContext *s, DisasOps *o)
 static void in2_m2_64(DisasContext *s, DisasOps *o)
 {
     in2_a2(s, o);
-    tcg_gen_qemu_ld64(o->in2, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_TEUQ);
 }
 #define SPEC_in2_m2_64 0
 
 static void in2_m2_64w(DisasContext *s, DisasOps *o)
 {
     in2_a2(s, o);
-    tcg_gen_qemu_ld64(o->in2, o->in2, get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, o->in2, get_mem_index(s), MO_TEUQ);
     gen_addi_and_wrap_i64(s, o->in2, o->in2, 0);
 }
 #define SPEC_in2_m2_64w 0
@@ -5879,14 +5869,14 @@ static void in2_m2_64a(DisasContext *s, DisasOps *o)
 static void in2_mri2_16s(DisasContext *s, DisasOps *o)
 {
     o->in2 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld16s(o->in2, gen_ri2(s), get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, gen_ri2(s), get_mem_index(s), MO_TESW);
 }
 #define SPEC_in2_mri2_16s 0
 
 static void in2_mri2_16u(DisasContext *s, DisasOps *o)
 {
     o->in2 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld16u(o->in2, gen_ri2(s), get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, gen_ri2(s), get_mem_index(s), MO_TEUW);
 }
 #define SPEC_in2_mri2_16u 0
 
-- 
2.34.1


