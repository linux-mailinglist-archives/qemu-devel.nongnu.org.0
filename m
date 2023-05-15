Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0BC70306B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:45:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZJV-0003Vh-7b; Mon, 15 May 2023 10:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHr-0007Ic-Br
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:56 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHg-00053W-MS
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:54 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1aad6f2be8eso118636985ad.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161226; x=1686753226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNGmF8W7v6Sxbzk1GnBwY+ErFtp6C+F1QfXFPbibcyI=;
 b=eQt0RcAWhzyW2Wopvg07MsRwJi1ZEuf6nPyHHDqUfCSAcNYMq2343bqW2PeRl1uKlz
 m8QY53+nzWBJCub/B6y2gc5xJfl773zXd1YE8mgSqhG+DmuhuMK8gSXnOjvJojvAevMp
 i6QUhrwpQRIFgVKtkdMpRRrMzG/ossiX/eist+TN1WV4Qn9Jl6I+FFRIvI5XFx3l5+0K
 q4DaEjHHok+EtMSr/WvlDbyY6JImSnh7II8Rx9/cOkdIhFTHgkA6YnNIHnRNLdhCKoWE
 bVuxfEb7TzQUPmbYLY+SaaZSltbXkSOQwFO+GnNAhIazJI8sXCK9EqF6rZTddth+SYXi
 JRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161226; x=1686753226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNGmF8W7v6Sxbzk1GnBwY+ErFtp6C+F1QfXFPbibcyI=;
 b=aPES8ezTSHawpTKTWIKsnYPpxct/5M5dNOaASsBIbL6faFW90YT98LCODIGrxm8r4M
 l4+9/NqjZ38V1NRgtT5TUnDPGkj9BPn5SM3BcItZ2Hfp9lPTRYtWtyX8XoiReB4g83I4
 tbCTPHRsa3CLo4i7gSJK/okA92DtsO8U3+6h6QQnPOPHzOarVAUcHidM9ZfcruBjV4Up
 APmNaUFXdTkIhaK+mFx+szRyb9sjM0NKp6dml2uLnpPXKUZkz4bDHBnvALRRnnuwvDNx
 fQXINaDP7WZyhC96hqE+eTzhtmyqSbUsyDFCGfWWa5n76JV0nVlQ4Yugc4SFfO+sgdOY
 IKjg==
X-Gm-Message-State: AC+VfDyqMjEGcLbTe8dkwsmLnvXvYjs3pnprAd130WCtuzlYpBl7tDG1
 B2whlBjdtRrJXPAQnCya1qXryoJYuXL3C8vI5Pc=
X-Google-Smtp-Source: ACHHUZ6L/q4oZHAYLcySaFhpNwrT0gg9rmU3Fl+nJI7VpmC1uN8wDdfbj0oS2ObhCwd/8BMw9iayFw==
X-Received: by 2002:a17:902:c94b:b0:1ab:14f2:e7e6 with SMTP id
 i11-20020a170902c94b00b001ab14f2e7e6mr42088614pla.65.1684161226395; 
 Mon, 15 May 2023 07:33:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 37/54] tcg: Merge tcg_out_helper_load_regs into caller
Date: Mon, 15 May 2023 07:32:56 -0700
Message-Id: <20230515143313.734053-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Now that tcg_out_helper_load_regs is not recursive, we can
merge it into its only caller, tcg_out_helper_load_slots.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 89 +++++++++++++++++++++++++------------------------------
 1 file changed, 41 insertions(+), 48 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8688248284..ff7aec23e7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -5223,12 +5223,50 @@ static int tcg_out_helper_stk_ofs(TCGType type, unsigned slot)
     return ofs;
 }
 
-static void tcg_out_helper_load_regs(TCGContext *s,
-                                     unsigned nmov, TCGMovExtend *mov,
-                                     const TCGLdstHelperParam *parm)
+static void tcg_out_helper_load_slots(TCGContext *s,
+                                      unsigned nmov, TCGMovExtend *mov,
+                                      const TCGLdstHelperParam *parm)
 {
+    unsigned i;
     TCGReg dst3;
 
+    /*
+     * Start from the end, storing to the stack first.
+     * This frees those registers, so we need not consider overlap.
+     */
+    for (i = nmov; i-- > 0; ) {
+        unsigned slot = mov[i].dst;
+
+        if (arg_slot_reg_p(slot)) {
+            goto found_reg;
+        }
+
+        TCGReg src = mov[i].src;
+        TCGType dst_type = mov[i].dst_type;
+        MemOp dst_mo = dst_type == TCG_TYPE_I32 ? MO_32 : MO_64;
+
+        /* The argument is going onto the stack; extend into scratch. */
+        if ((mov[i].src_ext & MO_SIZE) != dst_mo) {
+            tcg_debug_assert(parm->ntmp != 0);
+            mov[i].dst = src = parm->tmp[0];
+            tcg_out_movext1(s, &mov[i]);
+        }
+
+        tcg_out_st(s, dst_type, src, TCG_REG_CALL_STACK,
+                   tcg_out_helper_stk_ofs(dst_type, slot));
+    }
+    return;
+
+ found_reg:
+    /*
+     * The remaining arguments are in registers.
+     * Convert slot numbers to argument registers.
+     */
+    nmov = i + 1;
+    for (i = 0; i < nmov; ++i) {
+        mov[i].dst = tcg_target_call_iarg_regs[mov[i].dst];
+    }
+
     switch (nmov) {
     case 4:
         /* The backend must have provided enough temps for the worst case. */
@@ -5269,51 +5307,6 @@ static void tcg_out_helper_load_regs(TCGContext *s,
     }
 }
 
-static void tcg_out_helper_load_slots(TCGContext *s,
-                                      unsigned nmov, TCGMovExtend *mov,
-                                      const TCGLdstHelperParam *parm)
-{
-    unsigned i;
-
-    /*
-     * Start from the end, storing to the stack first.
-     * This frees those registers, so we need not consider overlap.
-     */
-    for (i = nmov; i-- > 0; ) {
-        unsigned slot = mov[i].dst;
-
-        if (arg_slot_reg_p(slot)) {
-            goto found_reg;
-        }
-
-        TCGReg src = mov[i].src;
-        TCGType dst_type = mov[i].dst_type;
-        MemOp dst_mo = dst_type == TCG_TYPE_I32 ? MO_32 : MO_64;
-
-        /* The argument is going onto the stack; extend into scratch. */
-        if ((mov[i].src_ext & MO_SIZE) != dst_mo) {
-            tcg_debug_assert(parm->ntmp != 0);
-            mov[i].dst = src = parm->tmp[0];
-            tcg_out_movext1(s, &mov[i]);
-        }
-
-        tcg_out_st(s, dst_type, src, TCG_REG_CALL_STACK,
-                   tcg_out_helper_stk_ofs(dst_type, slot));
-    }
-    return;
-
- found_reg:
-    /*
-     * The remaining arguments are in registers.
-     * Convert slot numbers to argument registers.
-     */
-    nmov = i + 1;
-    for (i = 0; i < nmov; ++i) {
-        mov[i].dst = tcg_target_call_iarg_regs[mov[i].dst];
-    }
-    tcg_out_helper_load_regs(s, nmov, mov, parm);
-}
-
 static void tcg_out_helper_load_imm(TCGContext *s, unsigned slot,
                                     TCGType type, tcg_target_long imm,
                                     const TCGLdstHelperParam *parm)
-- 
2.34.1


