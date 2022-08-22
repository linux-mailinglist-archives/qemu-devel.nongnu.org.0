Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5E259CBB5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:46:51 +0200 (CEST)
Received: from localhost ([::1]:52982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGC2-0005LT-4G
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG34-0003B2-Qg
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:34 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG33-0006ZQ-1K
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:34 -0400
Received: by mail-pl1-x62f.google.com with SMTP id jm11so11190073plb.13
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 15:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=7wrpwlAhlqlwE5ooXTHHegH9n59t020a14KTAhU8r2Q=;
 b=XtBe98nsakyDV3jWy3Ag9QQ9t7eeMOIt2JIZ8Xeb8KWDdNKCNOZEtMW1plc86tYCCQ
 Wjyq6vTk+2ZPu5HJKXXkWt/+FVdDa1SjHf2eDnCHrpOOp7490DIRnDO7dMnGeT7sbYM/
 qQdVdEhBlz57A067F5uPwvFIGKHLFkNkgTaVTJf2z+F6BKfvkyWqb0Y7AVxmXk19V0Q4
 YeMopaVqgRY1kNpki043ow7RjEV6nO2LeaWdKJxpkzXl+47T5b9MwmeWux4TtalZ/wvX
 MxitfFxQMJrKONxqCry1jOByAVlLzNuCV6WJE5g7q9e+1oV4wudtHl0kYfr1KMGmOL25
 PIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=7wrpwlAhlqlwE5ooXTHHegH9n59t020a14KTAhU8r2Q=;
 b=6xmBDix1jhPRTmAokxd5v7IOTCpSNIagnq3AW5wVEAO+hyOMioRlV/MToV+395Lir/
 klynwm9XaCbML+kGxHlEFRJg1P0jtj08dE1rcshM2Zhxz6iKOj3QR0N7Bpm2CG5mrBPt
 XN5159lrQggS7+1i+uBd0IMPMxAZyxZL0xoNnRTkmx/2+1AHvzY00BaF7gvCD6aE5zTC
 eTHFjaCK43igA0VgfHLrWYotG1LXhxXA6ktT/t87chVVncctnD0UyRAUTzw2PAptcmT2
 UexFKMtT2rsF5gj7pctEa6dxQbNpSKsg79/HEkRd71iozEOf3oclArfJLu5Mp4PtLDCS
 tw+g==
X-Gm-Message-State: ACgBeo3epLKjmaZ3FD17lbZOLgYIkTK/T6OLKDGLeInDL1amlge2f5sC
 LcYWiF5lxf8i1pukl+8354vkbLmiOBKjdg==
X-Google-Smtp-Source: AA6agR5HMvkuGy4MDQJHmrFiD59jahklX75RI6p7PsdbVVs+fUVUEr5PZF7fXe6og4o/WXbBzTpA6w==
X-Received: by 2002:a17:903:244c:b0:171:59be:6762 with SMTP id
 l12-20020a170903244c00b0017159be6762mr21667906pls.20.1661207851581; 
 Mon, 22 Aug 2022 15:37:31 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 z6-20020a63e106000000b0042a2777550dsm7017419pgh.47.2022.08.22.15.37.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:37:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/i386: Use tcg gvec for p{add,sub}*
Date: Mon, 22 Aug 2022 15:37:20 -0700
Message-Id: <20220822223722.1697758-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822223722.1697758-1-richard.henderson@linaro.org>
References: <20220822223722.1697758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Since psubb is the second highest overhead sse operation, at 0.9%.
It's simple to include add and the other sizes at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h        | 10 ---------
 target/i386/ops_sse_header.h | 10 ---------
 target/i386/tcg/translate.c  | 39 ++++++++++++++++++++++++++++--------
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 94440a9dc5..6f035b5c16 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -389,16 +389,6 @@ static inline int satsw(int x)
 #define FAVG(a, b) (((a) + (b) + 1) >> 1)
 #endif
 
-SSE_HELPER_B(helper_paddb, FADD)
-SSE_HELPER_W(helper_paddw, FADD)
-SSE_HELPER_L(helper_paddl, FADD)
-SSE_HELPER_Q(helper_paddq, FADD)
-
-SSE_HELPER_B(helper_psubb, FSUB)
-SSE_HELPER_W(helper_psubw, FSUB)
-SSE_HELPER_L(helper_psubl, FSUB)
-SSE_HELPER_Q(helper_psubq, FSUB)
-
 SSE_HELPER_B(helper_paddusb, FADDUB)
 SSE_HELPER_B(helper_paddsb, FADDSB)
 SSE_HELPER_B(helper_psubusb, FSUBUB)
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index b9f957daf8..da630fbc40 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -60,16 +60,6 @@ DEF_HELPER_3(glue(pslldq, SUFFIX), void, env, Reg, Reg)
 #define SSE_HELPER_Q(name, F)\
     DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
 
-SSE_HELPER_B(paddb, FADD)
-SSE_HELPER_W(paddw, FADD)
-SSE_HELPER_L(paddl, FADD)
-SSE_HELPER_Q(paddq, FADD)
-
-SSE_HELPER_B(psubb, FSUB)
-SSE_HELPER_W(psubw, FSUB)
-SSE_HELPER_L(psubl, FSUB)
-SSE_HELPER_Q(psubq, FSUB)
-
 SSE_HELPER_B(paddusb, FADDUB)
 SSE_HELPER_B(paddsb, FADDSB)
 SSE_HELPER_B(psubusb, FSUBUB)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 467d018b68..2a8ea3369a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2882,7 +2882,7 @@ static const SSEFunc_0_epp sse_op_table1[256][4] = {
     [0xd1] = MMX_OP2(psrlw),
     [0xd2] = MMX_OP2(psrld),
     [0xd3] = MMX_OP2(psrlq),
-    [0xd4] = MMX_OP2(paddq),
+    [0xd4] = { SSE_DUMMY, SSE_DUMMY },  /* paddq */
     [0xd5] = MMX_OP2(pmullw),
     [0xd6] = { NULL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
     [0xd7] = { SSE_SPECIAL, SSE_SPECIAL }, /* pmovmskb */
@@ -2919,13 +2919,13 @@ static const SSEFunc_0_epp sse_op_table1[256][4] = {
     [0xf6] = MMX_OP2(psadbw),
     [0xf7] = { (SSEFunc_0_epp)gen_helper_maskmov_mmx,
                (SSEFunc_0_epp)gen_helper_maskmov_xmm }, /* XXX: casts */
-    [0xf8] = MMX_OP2(psubb),
-    [0xf9] = MMX_OP2(psubw),
-    [0xfa] = MMX_OP2(psubl),
-    [0xfb] = MMX_OP2(psubq),
-    [0xfc] = MMX_OP2(paddb),
-    [0xfd] = MMX_OP2(paddw),
-    [0xfe] = MMX_OP2(paddl),
+    [0xf8] = { SSE_DUMMY, SSE_DUMMY },  /* psubb */
+    [0xf9] = { SSE_DUMMY, SSE_DUMMY },  /* psubw */
+    [0xfa] = { SSE_DUMMY, SSE_DUMMY },  /* psubl */
+    [0xfb] = { SSE_DUMMY, SSE_DUMMY },  /* psubq */
+    [0xfc] = { SSE_DUMMY, SSE_DUMMY },  /* paddb */
+    [0xfd] = { SSE_DUMMY, SSE_DUMMY },  /* paddw */
+    [0xfe] = { SSE_DUMMY, SSE_DUMMY },  /* paddl */
 };
 
 static const SSEFunc_0_epp sse_op_table2[3 * 8][2] = {
@@ -4551,6 +4551,29 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             tcg_gen_gvec_cmp(TCG_COND_EQ, b - 0x74, op1_offset, op1_offset,
                              op2_offset, vec_len, vec_len);
             break;
+        case 0xf8: /* psubb */
+        case 0xf9: /* psubw */
+        case 0xfa: /* psubl */
+        case 0xfb: /* psubq */
+            op1_offset += xmm_ofs;
+            op2_offset += xmm_ofs;
+            tcg_gen_gvec_sub(b - 0xf8, op1_offset, op1_offset,
+                             op2_offset, vec_len, vec_len);
+            break;
+        case 0xfc: /* paddb */
+        case 0xfd: /* paddw */
+        case 0xfe: /* paddl */
+            op1_offset += xmm_ofs;
+            op2_offset += xmm_ofs;
+            tcg_gen_gvec_add(b - 0xfc, op1_offset, op1_offset,
+                             op2_offset, vec_len, vec_len);
+            break;
+        case 0xd4: /* paddq */
+            op1_offset += xmm_ofs;
+            op2_offset += xmm_ofs;
+            tcg_gen_gvec_add(MO_64, op1_offset, op1_offset,
+                             op2_offset, vec_len, vec_len);
+            break;
         default:
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-- 
2.34.1


