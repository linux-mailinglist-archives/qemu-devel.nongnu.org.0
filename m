Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8066AEBA
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 00:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGpb2-0002Qm-5B; Sat, 14 Jan 2023 18:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGpay-0002Pg-Vt
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:05:53 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGpax-0000WE-2q
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:05:52 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p24so26849073plw.11
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 15:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/6qnLvEashDiP/jlq0RoDn2u7uOk63bf+cgKHgWoDI=;
 b=C6F8YNtn5cLyflRIJNM9IaayysIAuef+AOAtwprzqfs40BetGIcYMNYHdYPYSjA+Fv
 mQW1UKRX4nKDmMabjwWozyfYYJSROKc9/lf/SCp/pWNWsjSkPGNYbYx7HYmr/GFnLiFU
 YhHtXmST3UvCEIhx6MIekopFZjwVLWZkuSPCAsWHgB285OaTbK2OnjjWINVF5qqzYIyR
 jO6/Slv1y++2RQenhpMyYE4GtpWL8MxJFq1vufUzWfvkYXEWMIkY7eOc2KJKJVao0E4Y
 z1iISsozkemAfIMZvXtbuvbnYs8k5rIF0WcCbw4Vvg7uCIx0w8feD/Rqd0ie6aZeCJSM
 N/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/6qnLvEashDiP/jlq0RoDn2u7uOk63bf+cgKHgWoDI=;
 b=xlBsQPeXxG1ks0VwZdFtrPaXeIvgja2cSWy3Y8PkwyMx9s5vJmJQQP5kJplZX+1bQD
 +3Oc7Cfs1zcw/2nT6Jf1U2nqb7+mCzXgeAL+fgCyORcWxuRuSVGXKYYO4MXaWbG7OFCY
 fMswe1Servgd9y9MeBlJcH3XeG+1RGWW2egHMamf2TnSyKyCn9RSXiZFHMXN3HO6h235
 q/tFfxKlko4yGE/so1VWK/upjNl+qNn4D0OEqUPdQzPavZTCKZqoAqa3K9xVDetpaCOB
 tM0O3tdN5Xc3VFUsTqPMUwTZ5j5fvFEkA7Yd0YmtGgGxZvqe+/Ag82uVJ4x0RpoE1gIl
 yV3g==
X-Gm-Message-State: AFqh2koS2KDphAW/BcgTLQTZNzWfsVP6LanWB/xyYCyHFHJieZhcS0ko
 hZd+ObYQOE9X5fQmCwvyeZtMYmKoBG1J/CXe
X-Google-Smtp-Source: AMrXdXsyAvTdm8YdORKQpd3NoK3CdtD+9hsaKpPlJghHPDd9ahwKLf3ywn9gsf3vxJCKvl85RE44yQ==
X-Received: by 2002:a17:902:8686:b0:194:3fd8:f56a with SMTP id
 g6-20020a170902868600b001943fd8f56amr17936780plo.55.1673737549796; 
 Sat, 14 Jan 2023 15:05:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a170903244a00b0019334350ce6sm12331390pls.244.2023.01.14.15.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 15:05:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH 2/2] target/i386: Fix BEXTR instruction
Date: Sat, 14 Jan 2023 13:05:42 -1000
Message-Id: <20230114230542.3116013-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230114230542.3116013-1-richard.henderson@linaro.org>
References: <20230114230542.3116013-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

There were two problems here: not limiting the input to operand bits,
and not correctly handling large extraction length.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1372
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/test-i386-bmi2.c | 12 ++++++++++++
 target/i386/tcg/emit.c.inc      | 22 +++++++++++-----------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
index 3c3ef85513..982d4abda4 100644
--- a/tests/tcg/i386/test-i386-bmi2.c
+++ b/tests/tcg/i386/test-i386-bmi2.c
@@ -99,6 +99,9 @@ int main(int argc, char *argv[]) {
     result = bextrq(mask, 0x10f8);
     assert(result == 0);
 
+    result = bextrq(0xfedcba9876543210ull, 0x7f00);
+    assert(result == 0xfedcba9876543210ull);
+
     result = blsiq(0x30);
     assert(result == 0x10);
 
@@ -164,6 +167,15 @@ int main(int argc, char *argv[]) {
     result = bextrl(mask, 0x1038);
     assert(result == 0);
 
+    result = bextrl((reg_t)0x8f635a775ad3b9b4ull, 0x3018);
+    assert(result == 0x5a);
+
+    result = bextrl((reg_t)0xfedcba9876543210ull, 0x7f00);
+    assert(result == 0x76543210u);
+
+    result = bextrl(-1, 0);
+    assert(result == 0);
+
     result = blsil(0xffff);
     assert(result == 1);
 
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 9d610de8c2..4d7702c106 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1078,30 +1078,30 @@ static void gen_ANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 static void gen_BEXTR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
-    TCGv bound, zero;
+    TCGv bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    TCGv zero = tcg_constant_tl(0);
+    TCGv mone = tcg_constant_tl(-1);
 
     /*
      * Extract START, and shift the operand.
      * Shifts larger than operand size get zeros.
      */
     tcg_gen_ext8u_tl(s->A0, s->T1);
+    if (TARGET_LONG_BITS == 64 && ot == MO_32) {
+        tcg_gen_ext32u_tl(s->T0, s->T0);
+    }
     tcg_gen_shr_tl(s->T0, s->T0, s->A0);
 
-    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
-    zero = tcg_constant_tl(0);
     tcg_gen_movcond_tl(TCG_COND_LEU, s->T0, s->A0, bound, s->T0, zero);
 
     /*
-     * Extract the LEN into a mask.  Lengths larger than
-     * operand size get all ones.
+     * Extract the LEN into an inverse mask.  Lengths larger than
+     * operand size get all zeros, length 0 gets all ones.
      */
     tcg_gen_extract_tl(s->A0, s->T1, 8, 8);
-    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->A0, bound, s->A0, bound);
-
-    tcg_gen_movi_tl(s->T1, 1);
-    tcg_gen_shl_tl(s->T1, s->T1, s->A0);
-    tcg_gen_subi_tl(s->T1, s->T1, 1);
-    tcg_gen_and_tl(s->T0, s->T0, s->T1);
+    tcg_gen_shl_tl(s->T1, mone, s->A0);
+    tcg_gen_movcond_tl(TCG_COND_LEU, s->T1, s->A0, bound, s->T1, zero);
+    tcg_gen_andc_tl(s->T0, s->T0, s->T1);
 
     gen_op_update1_cc(s);
     set_cc_op(s, CC_OP_LOGICB + ot);
-- 
2.34.1


