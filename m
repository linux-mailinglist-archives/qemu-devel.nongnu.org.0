Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E82F2BFB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:57:56 +0100 (CET)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGR1-0003GJ-4Y
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAn-0003eT-Hn
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:09 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAj-0007R4-0N
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:09 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u4so1297247pjn.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fl1+91Qp/M1QMhLTc9AwqONPESXGYC0ye50jErfNJXM=;
 b=i8A3wptLPLTX6u1X0RmGB9uZ0P8ONWJCA5cj9Hv+Us4zjwWgyjoZPvXTWKYc5UXNau
 ZG1oyg1WeCvXeV46elmeHlT/SZZj+u2ppxJDMdwG1WJfca6sMKI+pNgSTse/yLVFMA2e
 mYAcgjZqy4t+c4kLJCY6bjx/nxFjAH+pAdMx4Nw7Ctup3fA6yPOaqMSU10Z03B98gUhq
 uXdW95+6+KpIfuL3B7u90ndO+B830gRYwvLY4tS2vupxM2djIWz4ksrj5aA/eHtFI9kA
 dfWSM/qGFFA4TMOUc+f8FUYZh+4gChXU4byOgqXb+8cKDahYob7aUwZvTMR9+YqD54uY
 ftEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fl1+91Qp/M1QMhLTc9AwqONPESXGYC0ye50jErfNJXM=;
 b=VUrgPNvwABWmiJbuuKPqCBlvmRhSMdUgffkbrAP7LCx2hTiJWz7Ve5stv1vI4qw3dZ
 8i5GXk3pB9D7JPA9PzSJh8jr7ko+G2EkeZV9hu3KABI66ctg7fzYrQoWicklGbfIAJOn
 WUziRV6qqAkRNL/nlh7umbxze22j/Z0JLAe/effwbJcWdsRsfXHoFfaxnV7b0Ifv1kib
 j/efSj2NnRoznt3fOT5K4ErjyXhrXb8Z/bIx9Xo0xv5OokZorAHSnmbZTBBbDpain/s1
 8nXQJ1LO4CBTA4zvljkvpnJIrngRIDqXdKuwbHJ/0czooxRWNhambV8Br9vUQk98s5B/
 e25w==
X-Gm-Message-State: AOAM533cr1uySBbTrHpQOyjpg2UXW3x8dPf5K0UUxmzqnyBJCxan81ET
 TQMsNWznEl4F2X1z0rtiPMIUf4Q4WNPIZBQn
X-Google-Smtp-Source: ABdhPJwRwDjonZJXZY90yDn9ay3oqA+8YaxyN4ejqO916eQnAYMcwpGAZiftM1HVFnEqfunrSyoD5g==
X-Received: by 2002:a17:902:8f90:b029:db:fc74:c59a with SMTP id
 z16-20020a1709028f90b02900dbfc74c59amr3963174plo.58.1610444462584; 
 Tue, 12 Jan 2021 01:41:02 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:01 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 16/72] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Tue, 12 Jan 2021 17:38:50 +0800
Message-Id: <20210112093950.17530-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Add fp16 nan-box check generator function, if a 16-bit input is not
  properly nanboxed, then the input is replaced with the default qnan.
* Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
  generate the NaN-boxed floating-point values based on SEW setting.
* Apply nanbox helper in opfvf_trans().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 35 ++++++++++++++++++++++++-
 target/riscv/translate.c                | 10 +++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 18a1c409fcf..ccfa93cf2f8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2100,6 +2100,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
 /*
  *** Vector Float Point Arithmetic Instructions
  */
+
+/*
+ * As RVF-only cpus always have values NaN-boxed to 64-bits,
+ * RVF and RVD can be treated equally.
+ * We don't have to deal with the cases of: SEW > FLEN.
+ *
+ * If SEW < FLEN, check whether input fp register is a valid
+ * NaN-boxed value, in which case the least-significant SEW bits
+ * of the f regsiter are used, else the canonical NaN value is used.
+ */
+static void do_nanbox(DisasContext *s, TCGv_i64 out, TCGv_i64 in)
+{
+    switch (s->sew) {
+    case 1:
+        gen_check_nanbox_h(out, in);
+        break;
+    case 2:
+        gen_check_nanbox_s(out, in);
+        break;
+    case 3:
+        tcg_gen_mov_i64(out, in);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Vector Single-Width Floating-Point Add/Subtract Instructions */
 
 /*
@@ -2152,6 +2179,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
 {
     TCGv_ptr dest, src2, mask;
     TCGv_i32 desc;
+    TCGv_i64 t1;
 
     TCGLabel *over = gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2165,12 +2193,17 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+    /* NaN-box f[rs1] */
+    t1 = tcg_temp_new_i64();
+    do_nanbox(s, t1, cpu_fpr[rs1]);
+
+    fn(dest, mask, t1, src2, cpu_env, desc);
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
     tcg_temp_free_i32(desc);
+    tcg_temp_free_i64(t1);
     mark_vs_dirty(s);
     gen_set_label(over);
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d9b3b37f698..511b7b868f5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -122,6 +122,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
  *
  * Here, the result is always nan-boxed, even the canonical nan.
  */
+static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
+{
+    TCGv_i64 t_max = tcg_const_i64(0xffffffffffff0000ull);
+    TCGv_i64 t_nan = tcg_const_i64(0xffffffffffff7e00ull);
+
+    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
+    tcg_temp_free_i64(t_max);
+    tcg_temp_free_i64(t_nan);
+}
+
 static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 {
     TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);
-- 
2.17.1


