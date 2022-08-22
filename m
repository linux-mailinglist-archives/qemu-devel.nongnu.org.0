Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF7A59CBBB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:50:32 +0200 (CEST)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGFb-0000eA-8o
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG33-000372-JP
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:33 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG31-0006Z2-NK
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:33 -0400
Received: by mail-pg1-x535.google.com with SMTP id w13so5587718pgq.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 15:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=EK3yRg39diAjmCX4EAql2g9bvhe617TvOwEsTXwV/fE=;
 b=rIFMTY9tRkvDWsO48iwrM/l9SLt6hrQa3xuR/FZ1A9a4j5/E7NmyQFG6YXXE7N9EJZ
 ibg/Le0drVoc0xdkpWc1DLnhVn2ShtMl+MGUpm6mzCAdFVMteqxDuD0kdcYgKt/DwX9V
 RgJQSS1DWI/sHJ6i/l561UFvRtQN9eVDl1+SfXwdMAStwat37QF5hn9KwPfRtYh/VplB
 yS20Do69ZgTHTMBOdldspRGPpR5nbK3toOuYQL8u/bj1bt34C6KE2UCIJjJS9bNjQdTY
 YMUENYRULKWdlEX5ZDFlUL+HYygC7X83uGeiDYStHKTjbQuf3yaQcxX6TXhHpCaD++d6
 sCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=EK3yRg39diAjmCX4EAql2g9bvhe617TvOwEsTXwV/fE=;
 b=foqous/Oay4PEk018kYsaz2z4L0S9+qFTXubWgVIWdtURY7azOp7mvuyZnvz7MN/Ll
 j5aRXj6ghJgNcU+jb70mxhcwofHMrZkXFFJOTpGY6jtWgsl8Oc+wGwnGRTPgSLKxM94N
 PoIMw1U/3AssCX1JBzyvB76QbsSh9Dja/2bU9q2KqiVQLdlRR6oVH30NZPnOTjiXlGHA
 DfTrGH/XQLlVWinu63oR0iru0l7G8IjUboZSIsDqjEjpiaFiLJRxy0xeDH08hv8KWeFZ
 AYGjLxyH/EVKIMzQRl47W3dsgcoF2/QQoA8/fNIaE+ifQ0S7y5dxLX7P0DL31z9e5c9L
 LXYQ==
X-Gm-Message-State: ACgBeo3y82Q6tyg9XbSZmzkrkzVMKNy8p/uYqlp1huA0aLrE1pICicUF
 MF6cl+RN2Dtt6pCv/IHRhTaAkeqb/FQePA==
X-Google-Smtp-Source: AA6agR5s7dPepRGY39t23Y/Gnz0a1z9Nn/jlBfp6xSXbXqUFv3QQvjPtrkOu4TE3NIaroszGb5UWdA==
X-Received: by 2002:a63:ea11:0:b0:41d:9296:21e6 with SMTP id
 c17-20020a63ea11000000b0041d929621e6mr17985407pgi.603.1661207850346; 
 Mon, 22 Aug 2022 15:37:30 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 z6-20020a63e106000000b0042a2777550dsm7017419pgh.47.2022.08.22.15.37.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:37:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/i386: Use tcg gvec for pcmp{eq,gt}*
Date: Mon, 22 Aug 2022 15:37:19 -0700
Message-Id: <20220822223722.1697758-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822223722.1697758-1-richard.henderson@linaro.org>
References: <20220822223722.1697758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

As pcmpeqb is used by strlen et al, this is the highest overhead
sse operation, at 2.5%.  It's simple to include the other compares
at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h        |  8 --------
 target/i386/ops_sse_header.h |  8 --------
 target/i386/tcg/translate.c  | 31 +++++++++++++++++++++++++------
 3 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 535440f882..94440a9dc5 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -420,14 +420,6 @@ SSE_HELPER_Q(helper_pandn, FANDN)
 SSE_HELPER_Q(helper_por, FOR)
 SSE_HELPER_Q(helper_pxor, FXOR)
 
-SSE_HELPER_B(helper_pcmpgtb, FCMPGTB)
-SSE_HELPER_W(helper_pcmpgtw, FCMPGTW)
-SSE_HELPER_L(helper_pcmpgtl, FCMPGTL)
-
-SSE_HELPER_B(helper_pcmpeqb, FCMPEQ)
-SSE_HELPER_W(helper_pcmpeqw, FCMPEQ)
-SSE_HELPER_L(helper_pcmpeql, FCMPEQ)
-
 SSE_HELPER_W(helper_pmullw, FMULLW)
 #if SHIFT == 0
 SSE_HELPER_W(helper_pmulhrw, FMULHRW)
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index cef28f2aae..b9f957daf8 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -91,14 +91,6 @@ SSE_HELPER_Q(pandn, FANDN)
 SSE_HELPER_Q(por, FOR)
 SSE_HELPER_Q(pxor, FXOR)
 
-SSE_HELPER_B(pcmpgtb, FCMPGTB)
-SSE_HELPER_W(pcmpgtw, FCMPGTW)
-SSE_HELPER_L(pcmpgtl, FCMPGTL)
-
-SSE_HELPER_B(pcmpeqb, FCMPEQ)
-SSE_HELPER_W(pcmpeqw, FCMPEQ)
-SSE_HELPER_L(pcmpeql, FCMPEQ)
-
 SSE_HELPER_W(pmullw, FMULLW)
 #if SHIFT == 0
 SSE_HELPER_W(pmulhrw, FMULHRW)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c1f1f6f66b..467d018b68 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2847,9 +2847,9 @@ static const SSEFunc_0_epp sse_op_table1[256][4] = {
     [0x61] = MMX_OP2(punpcklwd),
     [0x62] = MMX_OP2(punpckldq),
     [0x63] = MMX_OP2(packsswb),
-    [0x64] = MMX_OP2(pcmpgtb),
-    [0x65] = MMX_OP2(pcmpgtw),
-    [0x66] = MMX_OP2(pcmpgtl),
+    [0x64] = { SSE_DUMMY, SSE_DUMMY },  /* pcmpgtb */
+    [0x65] = { SSE_DUMMY, SSE_DUMMY },  /* pcmpgtw */
+    [0x66] = { SSE_DUMMY, SSE_DUMMY },  /* pcmpgtl */
     [0x67] = MMX_OP2(packuswb),
     [0x68] = MMX_OP2(punpckhbw),
     [0x69] = MMX_OP2(punpckhwd),
@@ -2866,9 +2866,9 @@ static const SSEFunc_0_epp sse_op_table1[256][4] = {
     [0x71] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftw */
     [0x72] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftd */
     [0x73] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftq */
-    [0x74] = MMX_OP2(pcmpeqb),
-    [0x75] = MMX_OP2(pcmpeqw),
-    [0x76] = MMX_OP2(pcmpeql),
+    [0x74] = { SSE_DUMMY, SSE_DUMMY },     /* pcmpeqb */
+    [0x75] = { SSE_DUMMY, SSE_DUMMY },     /* pcmpeqw */
+    [0x76] = { SSE_DUMMY, SSE_DUMMY },     /* pcmpeql */
     [0x77] = { SSE_DUMMY }, /* emms */
     [0x78] = { NULL, SSE_SPECIAL, NULL, SSE_SPECIAL }, /* extrq_i, insertq_i */
     [0x79] = { NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r },
@@ -4415,6 +4415,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             return;
         }
     } else {
+        int vec_len = is_xmm ? 16 : 8;
+        int xmm_ofs = is_xmm ? offsetof(ZMMReg, ZMM_X(0)) : 0;
+
         /* generic MMX or SSE operation */
         switch(b) {
         case 0x70: /* pshufx insn */
@@ -4532,6 +4535,22 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             sse_fn_eppt = (SSEFunc_0_eppt)sse_fn_epp;
             sse_fn_eppt(cpu_env, s->ptr0, s->ptr1, s->A0);
             break;
+        case 0x64: /* pcmpgtb */
+        case 0x65: /* pcmpgtw */
+        case 0x66: /* pcmpgtl */
+            op1_offset += xmm_ofs;
+            op2_offset += xmm_ofs;
+            tcg_gen_gvec_cmp(TCG_COND_GT, b - 0x64, op1_offset, op1_offset,
+                             op2_offset, vec_len, vec_len);
+            break;
+        case 0x74: /* pcmpeqb */
+        case 0x75: /* pcmpeqw */
+        case 0x76: /* pcmpeql */
+            op1_offset += xmm_ofs;
+            op2_offset += xmm_ofs;
+            tcg_gen_gvec_cmp(TCG_COND_EQ, b - 0x74, op1_offset, op1_offset,
+                             op2_offset, vec_len, vec_len);
+            break;
         default:
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-- 
2.34.1


