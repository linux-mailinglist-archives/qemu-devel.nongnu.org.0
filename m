Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C83F51B3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:07:28 +0200 (CEST)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGEB-0007Q7-7v
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2r-0006A4-Ey
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:45 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2l-00036P-Pg
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso717683pjq.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pDXnUWS0BwMutSCt7YsEkS8Wc9bolLs5aemQ/b75V+c=;
 b=jOnpgk+UWmhzPU+W3PQsR6ww1flx3l2mb1uWhk9UEy53ItsvaWeZlW2NrI44iYz3+l
 TRz6zEwrsIT5UnNLUJFi6XbZ1fd8QhXuMXRoUNlgyMvrasvCVy6naR9bX7rlDvP/xyu6
 bU8bMOm3x7hpLOHiDDdfMGEB7VUwgzaLE4gR2qkSP6qlBsiSrzzxTBdBTPyBNFVx+rQv
 zRVMhzjsKIBTFya5PJoyrBY7V43l8ENiskPiA0lZqsSav4NC0hAoVNTlz8NU55PjVbaC
 BlbLDjpJfotTpAGja1/GGzK/FTqgt6dYKVok38CvIfOtOdU+8bwsq/AeLr3KWZKKYB58
 dVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pDXnUWS0BwMutSCt7YsEkS8Wc9bolLs5aemQ/b75V+c=;
 b=bjg3g3e5nn0V4vJO5I+QIwtcUWRB+DcApb9YPuYfALyWNfN9YCadmVKJQU5h5HyihD
 ZFuu/cT8k+0VP9DnOQpk+i0kjJxGUrB0VbOHMujq3IKobqk6700vprtOzTYI+4hPpXFH
 nIzfs8Z0bLMjcCxK60O+8KCtQCBwn3LPYhPDoRFkuFC7s/zc2zymun0z8fhJWlFunQXH
 R9lVQ/uvW05jXe9AF3pwZjDLyT2x5TfwCb/6L/t9x+KeREheJ5YvmlQM686GGrMXCNhX
 voIqIQWqUJO0PoLcXM73UZaDldJAMjdWMxlwSfqSqpk3+9cidehQV0GjZ95N9Z2BUQ1Y
 lKKw==
X-Gm-Message-State: AOAM532kY0jcUav5g6phmIXM++hR1D/bwDKAXseHFrUA4HcHekRW27Cr
 8cbDsbl4NJ9zI6sD5wBTV+JGma8Ia+Dn4w==
X-Google-Smtp-Source: ABdhPJwMj5RZ+WgYiQqLwZphBaoQ4d0UrhaGy+GBuJvEM2WolRE1EzG4Ble2+4779xZjM6VXRnHAFw==
X-Received: by 2002:a17:902:860c:b0:131:771d:b9d9 with SMTP id
 f12-20020a170902860c00b00131771db9d9mr14694493plo.22.1629748538202; 
 Mon, 23 Aug 2021 12:55:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/24] target/riscv: Move gen_* helpers for RVM
Date: Mon, 23 Aug 2021 12:55:14 -0700
Message-Id: <20210823195529.560295-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move these helpers near their use by the trans_*
functions within insn_trans/trans_rvm.c.inc.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 127 ------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 127 ++++++++++++++++++++++++
 2 files changed, 127 insertions(+), 127 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1855eacbac..7fbacfa6ee 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -249,133 +249,6 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
     }
 }
 
-static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv rl = tcg_temp_new();
-    TCGv rh = tcg_temp_new();
-
-    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
-    /* fix up for one negative */
-    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
-    tcg_gen_and_tl(rl, rl, arg2);
-    tcg_gen_sub_tl(ret, rh, rl);
-
-    tcg_temp_free(rl);
-    tcg_temp_free(rh);
-}
-
-static void gen_div(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, mone, min;
-
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    mone = tcg_constant_tl(-1);
-    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
-
-    /*
-     * If overflow, set temp2 to 1, else source2.
-     * This produces the required result of min.
-     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_and_tl(temp1, temp1, temp2);
-    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, source2);
-
-    /*
-     * If div by zero, set temp1 to -1 and temp2 to 1 to
-     * produce the required result of -1.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
-
-    tcg_gen_div_tl(ret, temp1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, max;
-
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    max = tcg_constant_tl(~0);
-
-    /*
-     * If div by zero, set temp1 to max and temp2 to 1 to
-     * produce the required result of max.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
-    tcg_gen_divu_tl(ret, temp1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, mone, min;
-
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    mone = tcg_constant_tl(-1);
-    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
-
-    /*
-     * If overflow, set temp1 to 0, else source1.
-     * This avoids a possible host trap, and produces the required result of 0.
-     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_and_tl(temp1, temp1, temp2);
-    tcg_gen_movcond_tl(TCG_COND_NE, temp1, temp1, zero, zero, source1);
-
-    /*
-     * If div by zero, set temp2 to 1, else source2.
-     * This avoids a possible host trap, but produces an incorrect result.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
-
-    tcg_gen_rem_tl(temp1, temp1, temp2);
-
-    /* If div by zero, the required result is the original dividend. */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp, zero, one;
-
-    temp = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-
-    /*
-     * If div by zero, set temp to 1, else source2.
-     * This avoids a possible host trap, but produces an incorrect result.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp, source2, zero, one, source2);
-
-    tcg_gen_remu_tl(temp, source1, temp);
-
-    /* If div by zero, the required result is the original dividend. */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
-
-    tcg_temp_free(temp);
-}
-
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 80552be7a3..b89a85ad3a 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -39,6 +39,21 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulh);
 }
 
+static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv rl = tcg_temp_new();
+    TCGv rh = tcg_temp_new();
+
+    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
+    /* fix up for one negative */
+    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
+    tcg_gen_and_tl(rl, rl, arg2);
+    tcg_gen_sub_tl(ret, rh, rl);
+
+    tcg_temp_free(rl);
+    tcg_temp_free(rh);
+}
+
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
@@ -59,24 +74,136 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
 }
 
+static void gen_div(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    /*
+     * If overflow, set temp2 to 1, else source2.
+     * This produces the required result of min.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, source2);
+
+    /*
+     * If div by zero, set temp1 to -1 and temp2 to 1 to
+     * produce the required result of -1.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
+
+    tcg_gen_div_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
 
+static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, max;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    max = tcg_constant_tl(~0);
+
+    /*
+     * If div by zero, set temp1 to max and temp2 to 1 to
+     * produce the required result of max.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+    tcg_gen_divu_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
 
+static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    /*
+     * If overflow, set temp1 to 0, else source1.
+     * This avoids a possible host trap, and produces the required result of 0.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp1, temp1, zero, zero, source1);
+
+    /*
+     * If div by zero, set temp2 to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect result.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+
+    tcg_gen_rem_tl(temp1, temp1, temp2);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
 
+static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp, zero, one;
+
+    temp = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+
+    /*
+     * If div by zero, set temp to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect result.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp, source2, zero, one, source2);
+
+    tcg_gen_remu_tl(temp, source1, temp);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
+
+    tcg_temp_free(temp);
+}
+
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-- 
2.25.1


