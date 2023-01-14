Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6973566AEC8
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 00:32:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGq0W-0000DJ-F8; Sat, 14 Jan 2023 18:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGq0S-0008U5-VB
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:32:13 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGq0R-0004FK-7a
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:32:12 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a184so18575227pfa.9
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 15:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TPJtijyYg7SioJJm8YKTqkjAc4t5Wt3KkB0wi9IGkog=;
 b=DvoqW17yKdjbtWOoIu1IuzkAPwXkVd8ppyizrTvgby+yHodfaaXFEr3qCz+ZLDbSd4
 k3ZZWZsfO4TARos1MqMFLg52Dbn47QZX5xNRBW1kDIpwm3giZJ2L9D0yKz5ARibTrrTl
 zoKgDnlNEzNWKFeOxoB7rr1QiSdWl2aiyD6+hQtV9t1YjdESwnnhOV5F8XuIGmkQGk3c
 cdoarq80/rdqb4+mO/u2JyRpyqJ1KFdfHRr4tLvqnio5SNG2GJ9mmH4lKCvzh9Yl6561
 rwLDa5dy3SZQ7P3bxn1ohRX4ZZxSS6ub37KhpFG67i5MwdmBNf2DTHkmk5gEDLnhJkvW
 7dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TPJtijyYg7SioJJm8YKTqkjAc4t5Wt3KkB0wi9IGkog=;
 b=HWUE1bzaI+vSVoLAEAq4cOJTjwBwvxQKJPVHdeg8YCOPeW2PdGaFWeGArzw6vL1xhR
 4ncmUQ4+EnZLLH7PLPtMsifHJ48FJMZ/ZoQJdl4nnYEhE2CqpUlG+/Q0y3yP2J64d0d5
 sVVz36A8Hm1OYAxp3GtNTGlGLuzBrP6y0WjoDSNA5uQVuIKH4W1IfZ6eSEI6ywBDh9/a
 jfBeneFSCbiu+h6sOkt9pY4LlzFKoiHjLDl3rb3t6zE15z0xYQ0Tnmtg0fCdk9P/L0rD
 xfSJJ3AWlbtHXZXFF1FP2snU77gyJ0EicvGpiiBh8FjMhaILDNmdsuFFurMgHrxyMDoN
 LxSw==
X-Gm-Message-State: AFqh2krpea/uUgbokvSYt7+4QGFy7hoQS036WYnGIrpWbDZpOs4xkvJy
 PVKWRauIsgU4tMmTZc0WtZSe++1Je6ApqKrl
X-Google-Smtp-Source: AMrXdXvKjzL8FU8vhCeTmqFiuJmkbzuRDXNAglAQstTQx7wyJd1/9KYSl/mk11Q16E7/DYSl44JmoA==
X-Received: by 2002:a62:1a53:0:b0:58d:8ea0:ce31 with SMTP id
 a80-20020a621a53000000b0058d8ea0ce31mr1692951pfa.27.1673739129820; 
 Sat, 14 Jan 2023 15:32:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 q4-20020aa79824000000b00581d62be96dsm3434079pfl.197.2023.01.14.15.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 15:32:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH] target/i386: Fix BZHI instruction
Date: Sat, 14 Jan 2023 13:32:06 -1000
Message-Id: <20230114233206.3118472-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

We did not correctly handle N >= operand size.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1374
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/test-i386-bmi2.c |  3 +++
 target/i386/tcg/emit.c.inc      | 14 +++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
index 982d4abda4..0244df7987 100644
--- a/tests/tcg/i386/test-i386-bmi2.c
+++ b/tests/tcg/i386/test-i386-bmi2.c
@@ -123,6 +123,9 @@ int main(int argc, char *argv[]) {
     result = bzhiq(mask, 0x1f);
     assert(result == (mask & ~(-1 << 30)));
 
+    result = bzhiq(mask, 0x40);
+    assert(result == mask);
+
     result = rorxq(0x2132435465768798, 8);
     assert(result == 0x9821324354657687);
 
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 4d7702c106..1eace1231a 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1143,20 +1143,20 @@ static void gen_BLSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 static void gen_BZHI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
-    TCGv bound;
+    TCGv bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    TCGv zero = tcg_constant_tl(0);
+    TCGv mone = tcg_constant_tl(-1);
 
-    tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
-    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    tcg_gen_ext8u_tl(s->T1, s->T1);
 
     /*
      * Note that since we're using BMILG (in order to get O
      * cleared) we need to store the inverse into C.
      */
-    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src, s->T1, bound);
-    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1, bound, bound, s->T1);
+    tcg_gen_setcond_tl(TCG_COND_LEU, cpu_cc_src, s->T1, bound);
 
-    tcg_gen_movi_tl(s->A0, -1);
-    tcg_gen_shl_tl(s->A0, s->A0, s->T1);
+    tcg_gen_shl_tl(s->A0, mone, s->T1);
+    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->T1, bound, s->A0, zero);
     tcg_gen_andc_tl(s->T0, s->T0, s->A0);
 
     gen_op_update1_cc(s);
-- 
2.34.1


