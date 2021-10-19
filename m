Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF671433C4A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:32:59 +0200 (CEST)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcs2s-0000yO-Nt
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqz2-0005CI-A4
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyu-0007Ze-6j
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id s1so12086287plg.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=70ix3AhGljp8w7VYIEJb5B8tKM59m/WakgkEPwbsgro=;
 b=UiZazeEmfmFIwl/fnVf2oVa9qmGGbUcPmAvLbJ8aFZ8HnmGHVEmelARF5uE6yMS3U/
 VCcHh9zUoRDXDCWwVV6kX+gBg/a+7iX9k5/GLzuSJX/fesMbxgN3bTmLbzdezLRXWqNI
 8QQfHq7ra/I0Y+z3Sci/Esdnlei4aLkeX5Q3/vAMFMfjQeeLSj9sM4Z9XK6kVu3wPIX7
 5x9BKfG6942D/krghcWaUT4oM5d6yITyTyQXSjFCcSdlv2x8AXwQ9kikaCruILe0sF6Q
 +SO8FZX5NKAtA/TTR2iJvnomv5lcl5vOh5weJLDsE1C9yMFkVlmUNsHUffOLKp9bo5yr
 ZbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70ix3AhGljp8w7VYIEJb5B8tKM59m/WakgkEPwbsgro=;
 b=6K3becVLMQNTCI8Sk7kD+PZPfgIjAcJ3f7en445POF6Uvn5snhcOqLX3GjFijb9ayn
 Ew5MBzRGnxkTqqjpR6x/LluuZvomeuXt9Detz0Rd3O+aQ1UQbK96oATS2GgnVszcwUfu
 cvKs6b5Wv+/YWw4M8BBalWauHq6chddcp+Q9moFjGcimCatjApa1MiznfBk4XmyOEi6E
 LMPkmeqXEMJkwXJ3kCHdOgLZ6xMleAVno72pZV5woL8cBn1CGHcXXEdgL83yUtH84raU
 UBc65zbhwPknh3aXvB2iWhu90vjAcYl8zfOC6wPvzV1YRVnbuldhfwdyYiWE25HPcZsD
 kIzg==
X-Gm-Message-State: AOAM532rBXI2uDI7xr86CgquMua/lQSKy+D7aJawMmd6EwCdvYpW6Fy/
 oXyqd29avSXpr7NKyfJ2UQZje+WlO+idUQ==
X-Google-Smtp-Source: ABdhPJwFcM15n2Q3dZIiaBRsgLfF828KElAA22XixQ1dNDvD/fu56fuU/x+Yg4j0GE8okRZOrOQ2Ww==
X-Received: by 2002:a17:902:ed94:b0:138:ca3a:425d with SMTP id
 e20-20020a170902ed9400b00138ca3a425dmr34238412plj.78.1634657086679; 
 Tue, 19 Oct 2021 08:24:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/16] target/riscv: Use gen_arith_per_ol for RVM
Date: Tue, 19 Oct 2021 08:24:32 -0700
Message-Id: <20211019152438.269077-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The multiply high-part instructions require a separate
implementation for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 +++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 26 ++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6ed925c003..5d54570cc9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -403,6 +403,22 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                             void (*f_tl)(TCGv, TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv, TCGv))
+{
+    int olen = get_olen(ctx);
+
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            f_tl = f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_arith(ctx, a, ext, f_tl);
+}
+
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 9a1fe3c799..2af0e5c139 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -33,10 +33,16 @@ static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
     tcg_temp_free(discard);
 }
 
+static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
+{
+    tcg_gen_mul_tl(ret, s1, s2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
+    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -54,10 +60,23 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(rh);
 }
 
+static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    tcg_gen_ext32s_tl(t1, arg1);
+    tcg_gen_ext32u_tl(t2, arg2);
+    tcg_gen_mul_tl(ret, t1, t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -71,7 +90,8 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
+    /* gen_mulh_w works for either sign as input. */
+    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w);
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
-- 
2.25.1


