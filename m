Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE742CC83
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:06:54 +0200 (CEST)
Received: from localhost ([::1]:55410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malSf-0003rj-MB
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDk-0007eM-Tt
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:32 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDb-0008BT-7g
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso5340444pjb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=joleVnTQvmCPUfTbQ24Gv4VvWMa3K0Rbxd/UEEUltmA=;
 b=lZTKUtWGiX/x0UK7tnEBqVeVa0mgTZK34p3pQ9bsmfHxMXPtalXSW12wsnCbKQvT7P
 icrcl+lwu/AkNl6j+scsVx/XX1zEBCi4sY6tekyaC5LfKBLZ5qfkeKAJIq/bFkf4Cu/L
 WLBHcrKEPq3EaAega38TrO+J04GKWrITr6qwm/xV8RHDYkYQ4monoRSJrnQhXGGBVS66
 3S0I01wW3MI9VP9Q7n9LmmzvRGePV9C54WYPAS6pbp9jrGL5DqWdPQrbpUFQMP2AplFK
 j7wvj0wl+r5JfXraS0HEbT8f9aR5mHa5A62r7WNKGCv6eLMKItdY8UE75KMU8fbW9KMC
 5Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=joleVnTQvmCPUfTbQ24Gv4VvWMa3K0Rbxd/UEEUltmA=;
 b=VmEnaCeoqebVXgGW1BE884PkdMxrG4/hX96R0HdVxp+V0REdMSd94X/keQ4f4QRClM
 R1xoJNg2N4QNUxdtjX+4kzxHFpJGCHqH9I9t0dLvHgw8fGDJNtqa4naFSPswklUttyUN
 i9FzCBQTZgIb3UGM7NjI9sr4JsrKwdO++UZDBV3z+NY7+yMqdhR/bK90oiQPC64ppjx9
 l1scE6Ekk6PCK3KmWzRdVWOp66jQsLoAq5RDaYrRdPnYPx5y1Fv7l3yaVcrVGSalRvQw
 AhGlxttrKKfUusukvbt+BL00gCSfvRasoCvkNcVU2zps9UgL/vpRpSxZkEK98RBxVkCG
 7Wiw==
X-Gm-Message-State: AOAM532gZOxJSKfKT7XT0tCGoPqKy4N5gHtY5g1frip90FzHxbxiUEwx
 6bdHekli7K0Ey3HKzp39y14HcDglVSmN1w==
X-Google-Smtp-Source: ABdhPJyjuuASdaFiQobwXqTFjE2G0ofVOOfzu6teGkagcABXiGDGsqb8G812kSOQlQ2DhfTlfnDjCQ==
X-Received: by 2002:a17:90b:1101:: with SMTP id
 gi1mr15844911pjb.11.1634158276170; 
 Wed, 13 Oct 2021 13:51:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] target/riscv: Use gen_arith_per_ol for RVM
Date: Wed, 13 Oct 2021 13:51:01 -0700
Message-Id: <20211013205104.1031679-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The multiply high-part instructions require a separate
implementation for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 +++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 26 ++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6ab5c6aa58..f960929c16 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -427,6 +427,22 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
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


