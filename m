Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861759CBC7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:53:59 +0200 (CEST)
Received: from localhost ([::1]:59104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGIw-0008JA-Au
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG35-0003Dg-Uo
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:35 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG34-0006Zb-56
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:35 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c2so11227321plo.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=X2jvrMtbYp1eNI0Clq6mipibH+5GoGu45vlAlcjZM8M=;
 b=XFXOHvGzuFkLFYj0FQaPgKgdZG/A1Vs5if281+9hJUAe03KaOrny5IZbyn+G9FcMVh
 QyT5HYVoLd54rl8cUUJLX0BX2tKTCRyReTYYfIY2Y8mYqrgzBWWD87mroqI8nTguti7S
 XdL5V8TO2NArCg2ZY8lsVnGh4z22AfHf20z20gOULU2tQHHkI5QqAcgRihrp3/W62n/J
 A4OpQtIW6Q6t5nuCqKmXSaEnE0id731kSad3Gh9XfuBmFgT82FuxeCrggPeFxM5Ctoh2
 Xd0GWuP6xkxn8zFYkFshRNYJqx19Chi5bDxuAn9/M0dHxo0VDk8cDiDUVi6ORHG8gNhd
 rxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=X2jvrMtbYp1eNI0Clq6mipibH+5GoGu45vlAlcjZM8M=;
 b=qEB6+5l5OXmY+JmlASztKo0HwAWWvpbYEitKGvWbShGM3Yxo8wOw4+h5y3ghyGe034
 Fs4UfK/xZ9ZWShKaZjPzTJbzCw86tYuyJn17EmR/t8a1vxp/hZGl1wX0E29328c9eUg1
 s2dGWD1SV/ssTcusyTeECh6XICDDOYrfTou69Bdu7jzLvTc045DzEUbaJ1zAb1VCcrIm
 azg6s911/szng/WZQ+xOYqTXAFwu22MbT/AtCpnJjLP3BQGqXSWD1cDNYX3TFwBcu8hA
 0UPbZbU68tEbPfpIryF93qiVwIQ2lMlsviPrJAR6eYSUf+4FiR2uY/wKVaa1Pm3nVOTB
 8BcQ==
X-Gm-Message-State: ACgBeo1eWghD/tYlPmacUFtgio+HyreoBilaIJFKpkR+P/EGusBya5Hw
 jMjjsB4oUVnomoZQCAPjGJN3vQFIJFKuSQ==
X-Google-Smtp-Source: AA6agR6l1QFwgzC5BNTZxaHkjGv/MjqCQ7p191FF3YaFJr2YstB/mVWr1/tDxNLAfjaysV3bVghOzQ==
X-Received: by 2002:a17:902:f64f:b0:172:a790:320a with SMTP id
 m15-20020a170902f64f00b00172a790320amr21896045plg.149.1661207852658; 
 Mon, 22 Aug 2022 15:37:32 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 z6-20020a63e106000000b0042a2777550dsm7017419pgh.47.2022.08.22.15.37.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:37:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/i386: Use tcg gvec for pand, pandn, por, pxor
Date: Mon, 22 Aug 2022 15:37:21 -0700
Message-Id: <20220822223722.1697758-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822223722.1697758-1-richard.henderson@linaro.org>
References: <20220822223722.1697758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h        |  5 ----
 target/i386/ops_sse_header.h |  5 ----
 target/i386/tcg/translate.c  | 45 +++++++++++++++++++++++++++++-------
 3 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 6f035b5c16..b21f315f37 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -405,11 +405,6 @@ SSE_HELPER_B(helper_pmaxub, FMAXUB)
 SSE_HELPER_W(helper_pminsw, FMINSW)
 SSE_HELPER_W(helper_pmaxsw, FMAXSW)
 
-SSE_HELPER_Q(helper_pand, FAND)
-SSE_HELPER_Q(helper_pandn, FANDN)
-SSE_HELPER_Q(helper_por, FOR)
-SSE_HELPER_Q(helper_pxor, FXOR)
-
 SSE_HELPER_W(helper_pmullw, FMULLW)
 #if SHIFT == 0
 SSE_HELPER_W(helper_pmulhrw, FMULHRW)
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index da630fbc40..542701720e 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -76,11 +76,6 @@ SSE_HELPER_B(pmaxub, FMAXUB)
 SSE_HELPER_W(pminsw, FMINSW)
 SSE_HELPER_W(pmaxsw, FMAXSW)
 
-SSE_HELPER_Q(pand, FAND)
-SSE_HELPER_Q(pandn, FANDN)
-SSE_HELPER_Q(por, FOR)
-SSE_HELPER_Q(pxor, FXOR)
-
 SSE_HELPER_W(pmullw, FMULLW)
 #if SHIFT == 0
 SSE_HELPER_W(pmulhrw, FMULHRW)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2a8ea3369a..d25d914d63 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2820,10 +2820,10 @@ static const SSEFunc_0_epp sse_op_table1[256][4] = {
     [0x51] = SSE_FOP(sqrt),
     [0x52] = { gen_helper_rsqrtps, NULL, gen_helper_rsqrtss, NULL },
     [0x53] = { gen_helper_rcpps, NULL, gen_helper_rcpss, NULL },
-    [0x54] = { gen_helper_pand_xmm, gen_helper_pand_xmm }, /* andps, andpd */
-    [0x55] = { gen_helper_pandn_xmm, gen_helper_pandn_xmm }, /* andnps, andnpd */
-    [0x56] = { gen_helper_por_xmm, gen_helper_por_xmm }, /* orps, orpd */
-    [0x57] = { gen_helper_pxor_xmm, gen_helper_pxor_xmm }, /* xorps, xorpd */
+    [0x54] = { SSE_DUMMY, SSE_DUMMY }, /* andps, andpd */
+    [0x55] = { SSE_DUMMY, SSE_DUMMY }, /* andnps, andnpd */
+    [0x56] = { SSE_DUMMY, SSE_DUMMY }, /* orps, orpd */
+    [0x57] = { SSE_DUMMY, SSE_DUMMY }, /* xorps, xorpd */
     [0x58] = SSE_FOP(add),
     [0x59] = SSE_FOP(mul),
     [0x5a] = { gen_helper_cvtps2pd, gen_helper_cvtpd2ps,
@@ -2889,11 +2889,11 @@ static const SSEFunc_0_epp sse_op_table1[256][4] = {
     [0xd8] = MMX_OP2(psubusb),
     [0xd9] = MMX_OP2(psubusw),
     [0xda] = MMX_OP2(pminub),
-    [0xdb] = MMX_OP2(pand),
+    [0xdb] = { SSE_DUMMY, SSE_DUMMY }, /* pand */
     [0xdc] = MMX_OP2(paddusb),
     [0xdd] = MMX_OP2(paddusw),
     [0xde] = MMX_OP2(pmaxub),
-    [0xdf] = MMX_OP2(pandn),
+    [0xdf] = { SSE_DUMMY, SSE_DUMMY }, /* pandn */
     [0xe0] = MMX_OP2(pavgb),
     [0xe1] = MMX_OP2(psraw),
     [0xe2] = MMX_OP2(psrad),
@@ -2905,11 +2905,11 @@ static const SSEFunc_0_epp sse_op_table1[256][4] = {
     [0xe8] = MMX_OP2(psubsb),
     [0xe9] = MMX_OP2(psubsw),
     [0xea] = MMX_OP2(pminsw),
-    [0xeb] = MMX_OP2(por),
+    [0xeb] = { SSE_DUMMY, SSE_DUMMY },  /* por */
     [0xec] = MMX_OP2(paddsb),
     [0xed] = MMX_OP2(paddsw),
     [0xee] = MMX_OP2(pmaxsw),
-    [0xef] = MMX_OP2(pxor),
+    [0xef] = { SSE_DUMMY, SSE_DUMMY },  /* pxor */
     [0xf0] = { NULL, NULL, NULL, SSE_SPECIAL }, /* lddqu */
     [0xf1] = MMX_OP2(psllw),
     [0xf2] = MMX_OP2(pslld),
@@ -4535,6 +4535,35 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             sse_fn_eppt = (SSEFunc_0_eppt)sse_fn_epp;
             sse_fn_eppt(cpu_env, s->ptr0, s->ptr1, s->A0);
             break;
+        case 0x54: /* andps, andpd */
+        case 0xdb: /* pand */
+            op1_offset += xmm_ofs;
+            op2_offset += xmm_ofs;
+            tcg_gen_gvec_and(MO_64, op1_offset, op1_offset,
+                             op2_offset, vec_len, vec_len);
+            break;
+        case 0x55: /* andnps, andnpd */
+        case 0xdf: /* pandn */
+            op1_offset += xmm_ofs;
+            op2_offset += xmm_ofs;
+            /* x86 inverts the first operand; tcg inverts the second. */
+            tcg_gen_gvec_andc(MO_64, op1_offset, op2_offset,
+                              op1_offset, vec_len, vec_len);
+            break;
+        case 0x56: /* orps, orpd */
+        case 0xeb: /* por */
+            op1_offset += xmm_ofs;
+            op2_offset += xmm_ofs;
+            tcg_gen_gvec_or(MO_64, op1_offset, op1_offset,
+                            op2_offset, vec_len, vec_len);
+            break;
+        case 0x57: /* xorps, xorpd */
+        case 0xef: /* pxor */
+            op1_offset += xmm_ofs;
+            op2_offset += xmm_ofs;
+            tcg_gen_gvec_xor(MO_64, op1_offset, op1_offset,
+                             op2_offset, vec_len, vec_len);
+            break;
         case 0x64: /* pcmpgtb */
         case 0x65: /* pcmpgtw */
         case 0x66: /* pcmpgtl */
-- 
2.34.1


