Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F93870305D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:43:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIz-00020e-BM; Mon, 15 May 2023 10:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHh-0007AI-U5
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-00053H-6P
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:45 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1aafa03f541so124390515ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161225; x=1686753225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OL2XP1Zb93dTXqFgRsxjJukwO3HhoSqGjshmJLLIfT8=;
 b=cW31/wa8O7gdur2bQrthPNfiw1vDI1ei6DdH3XU5CIRFHuNlMCoEt3lA6NLG5wgLXE
 PqGzocd3VhnlLedTsaFWmnLPt2a0Y6MuGzN7nk2meDGIvg3XHJyidACNmy/2/ilUHYCX
 l0F1+hs2Fc7GF3Mg6pDGx7jR5tSnWexI+FW6W8gtC2m9uBuWssp3RLBKSedPLc6l934a
 /3daWL4d1qciIV26Lf3yttNkT1gNV5y/iopBV4S5Ny7hldhJIUdBPG4v1E9BcsW2rV29
 8sirB/vSanMSB18TMSSbj64RukzOzKQzTR0AwpRAA7F9caqu3OitgZ9TdWsw3OzE7/jl
 Q/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161225; x=1686753225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OL2XP1Zb93dTXqFgRsxjJukwO3HhoSqGjshmJLLIfT8=;
 b=L+52U2DLSAAX2wNU4+i2wrt5MsFImHsJUDWsQ7RRdn/2CwAGS3Q36njcpYVLdvmCrz
 ciWcmb/bKt7HpFsFw/6vxLUeIktT5ofOViuVOzKhH1w1j/LeubsYtuJbjEEAxE67NAFI
 JhHNspLIbfmQm+MrrX3fW6/uAnxLdt183qGjhiL51NwOJN9xSlUTZh6Ywx1PfA1XrIRC
 M30dezutX3ykpx+nK5btDdHhcg5EhaNMGKT9owMNcRKGAnUXsGiUuL7nlXaSbMnLA0JA
 4/hrTxRsEVP47BVaUF3Q3I9BVCt9IZNi66fGerksHoowCuSb66YD1GJtfbRcxy71booc
 BnXA==
X-Gm-Message-State: AC+VfDwh3Acw6wc9rD1LtJdYe4xiJGOTmCXHCpNAcTEe19nNF6ZD0sLe
 xiniKnk62aDHn/RA11V44Lw4prKWj4TPOo+JuwM=
X-Google-Smtp-Source: ACHHUZ7XqVkAnsyA/a9SfaF5RBDZg4ByY2hwVsUoVrEYzEGycOY24yODiIOuIbvwkqRKl7IQeNoHvA==
X-Received: by 2002:a17:902:b08d:b0:1ad:e099:fc04 with SMTP id
 p13-20020a170902b08d00b001ade099fc04mr11824812plr.38.1684161225613; 
 Mon, 15 May 2023 07:33:45 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 36/54] tcg: Introduce tcg_out_movext3
Date: Mon, 15 May 2023 07:32:55 -0700
Message-Id: <20230515143313.734053-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

With x86_64 as host, we do not have any temporaries with which to
resolve cycles, but we do have xchg.   As a side bonus, the set of
graphs that can be made with 3 nodes and all nodes conflicting is
small: two.  We can solve the cycle with a single temp.

This is required for x86_64 to handle stores of i128: 1 address
register and 2 data registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 138 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 107 insertions(+), 31 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index aa0a6c3763..8688248284 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -532,6 +532,82 @@ static void tcg_out_movext2(TCGContext *s, const TCGMovExtend *i1,
     tcg_out_movext1_new_src(s, i1, src1);
 }
 
+/**
+ * tcg_out_movext3 -- move and extend three pair
+ * @s: tcg context
+ * @i1: first move description
+ * @i2: second move description
+ * @i3: third move description
+ * @scratch: temporary register, or -1 for none
+ *
+ * As tcg_out_movext, for all of @i1, @i2 and @i3, caring for overlap
+ * between the sources and destinations.
+ */
+
+static void tcg_out_movext3(TCGContext *s, const TCGMovExtend *i1,
+                            const TCGMovExtend *i2, const TCGMovExtend *i3,
+                            int scratch)
+{
+    TCGReg src1 = i1->src;
+    TCGReg src2 = i2->src;
+    TCGReg src3 = i3->src;
+
+    if (i1->dst != src2 && i1->dst != src3) {
+        tcg_out_movext1(s, i1);
+        tcg_out_movext2(s, i2, i3, scratch);
+        return;
+    }
+    if (i2->dst != src1 && i2->dst != src3) {
+        tcg_out_movext1(s, i2);
+        tcg_out_movext2(s, i1, i3, scratch);
+        return;
+    }
+    if (i3->dst != src1 && i3->dst != src2) {
+        tcg_out_movext1(s, i3);
+        tcg_out_movext2(s, i1, i2, scratch);
+        return;
+    }
+
+    /*
+     * There is a cycle.  Since there are only 3 nodes, the cycle is
+     * either "clockwise" or "anti-clockwise", and can be solved with
+     * a single scratch or two xchg.
+     */
+    if (i1->dst == src2 && i2->dst == src3 && i3->dst == src1) {
+        /* "Clockwise" */
+        if (tcg_out_xchg(s, MAX(i1->src_type, i2->src_type), src1, src2)) {
+            tcg_out_xchg(s, MAX(i2->src_type, i3->src_type), src2, src3);
+            /* The data is now in the correct registers, now extend. */
+            tcg_out_movext1_new_src(s, i1, i1->dst);
+            tcg_out_movext1_new_src(s, i2, i2->dst);
+            tcg_out_movext1_new_src(s, i3, i3->dst);
+        } else {
+            tcg_debug_assert(scratch >= 0);
+            tcg_out_mov(s, i1->src_type, scratch, src1);
+            tcg_out_movext1(s, i3);
+            tcg_out_movext1(s, i2);
+            tcg_out_movext1_new_src(s, i1, scratch);
+        }
+    } else if (i1->dst == src3 && i2->dst == src1 && i3->dst == src2) {
+        /* "Anti-clockwise" */
+        if (tcg_out_xchg(s, MAX(i2->src_type, i3->src_type), src2, src3)) {
+            tcg_out_xchg(s, MAX(i1->src_type, i2->src_type), src1, src2);
+            /* The data is now in the correct registers, now extend. */
+            tcg_out_movext1_new_src(s, i1, i1->dst);
+            tcg_out_movext1_new_src(s, i2, i2->dst);
+            tcg_out_movext1_new_src(s, i3, i3->dst);
+        } else {
+            tcg_debug_assert(scratch >= 0);
+            tcg_out_mov(s, i1->src_type, scratch, src1);
+            tcg_out_movext1(s, i2);
+            tcg_out_movext1(s, i3);
+            tcg_out_movext1_new_src(s, i1, scratch);
+        }
+    } else {
+        g_assert_not_reached();
+    }
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
@@ -5149,46 +5225,46 @@ static int tcg_out_helper_stk_ofs(TCGType type, unsigned slot)
 
 static void tcg_out_helper_load_regs(TCGContext *s,
                                      unsigned nmov, TCGMovExtend *mov,
-                                     unsigned ntmp, const int *tmp)
+                                     const TCGLdstHelperParam *parm)
 {
+    TCGReg dst3;
+
     switch (nmov) {
-    default:
+    case 4:
         /* The backend must have provided enough temps for the worst case. */
-        tcg_debug_assert(ntmp + 1 >= nmov);
+        tcg_debug_assert(parm->ntmp >= 2);
 
-        for (unsigned i = nmov - 1; i >= 2; --i) {
-            TCGReg dst = mov[i].dst;
-
-            for (unsigned j = 0; j < i; ++j) {
-                if (dst == mov[j].src) {
-                    /*
-                     * Conflict.
-                     * Copy the source to a temporary, recurse for the
-                     * remaining moves, perform the extension from our
-                     * scratch on the way out.
-                     */
-                    TCGReg scratch = tmp[--ntmp];
-                    tcg_out_mov(s, mov[i].src_type, scratch, mov[i].src);
-                    mov[i].src = scratch;
-
-                    tcg_out_helper_load_regs(s, i, mov, ntmp, tmp);
-                    tcg_out_movext1(s, &mov[i]);
-                    return;
-                }
+        dst3 = mov[3].dst;
+        for (unsigned j = 0; j < 3; ++j) {
+            if (dst3 == mov[j].src) {
+                /*
+                 * Conflict. Copy the source to a temporary, perform the
+                 * remaining moves, then the extension from our scratch
+                 * on the way out.
+                 */
+                TCGReg scratch = parm->tmp[1];
+                tcg_out_movext3(s, mov, mov + 1, mov + 2, parm->tmp[0]);
+                tcg_out_movext1_new_src(s, &mov[3], scratch);
+                break;
             }
-
-            /* No conflicts: perform this move and continue. */
-            tcg_out_movext1(s, &mov[i]);
         }
-        /* fall through for the final two moves */
 
+        /* No conflicts: perform this move and continue. */
+        tcg_out_movext1(s, &mov[3]);
+        /* fall through */
+
+    case 3:
+        tcg_out_movext3(s, mov, mov + 1, mov + 2,
+                        parm->ntmp ? parm->tmp[0] : -1);
+        break;
     case 2:
-        tcg_out_movext2(s, mov, mov + 1, ntmp ? tmp[0] : -1);
-        return;
+        tcg_out_movext2(s, mov, mov + 1,
+                        parm->ntmp ? parm->tmp[0] : -1);
+        break;
     case 1:
         tcg_out_movext1(s, mov);
-        return;
-    case 0:
+        break;
+    default:
         g_assert_not_reached();
     }
 }
@@ -5235,7 +5311,7 @@ static void tcg_out_helper_load_slots(TCGContext *s,
     for (i = 0; i < nmov; ++i) {
         mov[i].dst = tcg_target_call_iarg_regs[mov[i].dst];
     }
-    tcg_out_helper_load_regs(s, nmov, mov, parm->ntmp, parm->tmp);
+    tcg_out_helper_load_regs(s, nmov, mov, parm);
 }
 
 static void tcg_out_helper_load_imm(TCGContext *s, unsigned slot,
-- 
2.34.1


