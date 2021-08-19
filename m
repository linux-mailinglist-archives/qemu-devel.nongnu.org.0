Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0023F160F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:19:46 +0200 (CEST)
Received: from localhost ([::1]:46762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGeDB-00005Q-WD
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzX-0006uE-Iz
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:39 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzV-0000QV-3u
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:39 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so4300270pjb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HE6ZBvI9HHOGgRLaGbIJrlYpKtPkbe52/WMJg5LJPmc=;
 b=DkPTOjmgWRFZB8/N5GdEKNhamehpx7R+WaEZEcwz7EFD2oOps0fHE2rSE9PgsXE9d6
 RJUlByu/Cnk6H3jeufQ+DbfFCvk3ON6qcJX9fbS2UeMbiSx+OsOwSLvjmI3DRulBULCR
 kCbp6pxDPqaIeFeNHJYGqMR2IEjHyuNM085mDDHd9c7mfUklQedz2E/dRwvsl+xsVcFI
 i8Si5+0EBdXeHlWvBwQvlD67euE4nBKDR421Rs3kxGc3h4goCqAYIpoP4YZ+9xsZepx/
 zhdlnFQbwpxhiX9Ib734LRmAhKmCUXcr9n8Vw3qpfzO47Mn0K3q/2l8G7xlggxezfG+k
 ukFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HE6ZBvI9HHOGgRLaGbIJrlYpKtPkbe52/WMJg5LJPmc=;
 b=nkBmk+WJ9UBhxEYGB0rcLo+E+sos9LgDqE7o9U460SU1f9Hq4K73EjiR9qLqBPdOYJ
 u6zorXX9dgT4DFTIXy47DVzllav6RtcLPvRUqS/wwi04LTmClXhGpyBuyNSr+ZfxN3rV
 jk3vzLmXhh6/oDRuo3K3io12v6sWgVHt1s8QvS3MeF9f9TgDKMoyztVaerMM45CixLi/
 WBZuJzHeXkmvV44FInNtoX4AaKKwXSlHcuQhLPgsa4FvI4jWri15kxtzOMkGARhQ8A/P
 NKCaQASwxlu4m+npivnm7XuA4v4c2Q8idLqV2T/vLQwsV8Wp5PT6LQouGo9M82XkL6Ub
 yUgA==
X-Gm-Message-State: AOAM533LUazlApZPI8mlKStDjAB03LWxasA9nSyxtbt25WMezj9QV1vA
 w7nHB/S2LxQgbzU3guhgNSG50Rq8rD0fzg==
X-Google-Smtp-Source: ABdhPJwl03LjKhQOW4AL2ry7vKJLxqYsfqdCd+J8NafKBSHZwXkVSCR5RLo4rma6a1sn8/LezEBlMA==
X-Received: by 2002:a17:90a:c28d:: with SMTP id
 f13mr13893012pjt.73.1629363935719; 
 Thu, 19 Aug 2021 02:05:35 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/21] target/riscv: Use {get,dest}_gpr for RVD
Date: Wed, 18 Aug 2021 23:05:00 -1000
Message-Id: <20210819090502.428068-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 125 ++++++++++++------------
 1 file changed, 60 insertions(+), 65 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 11b9b3f90b..db9ae15755 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -20,30 +20,40 @@
 
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
+    addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
 
 static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 {
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
+    addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
 
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -252,11 +262,10 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_feq_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_helper_feq_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -265,11 +274,10 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_flt_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_helper_flt_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -278,11 +286,10 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fle_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_helper_fle_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -291,10 +298,10 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fclass_d(t0, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fclass_d(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -303,12 +310,11 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_w_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -317,12 +323,11 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_wu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -331,12 +336,10 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
     return true;
@@ -347,12 +350,10 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
     return true;
@@ -364,11 +365,11 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_l_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -378,11 +379,11 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_lu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -406,12 +407,11 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, src);
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -422,12 +422,11 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, src);
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -439,11 +438,7 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
     REQUIRE_EXT(ctx, RVD);
 
 #ifdef TARGET_RISCV64
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
-    tcg_temp_free(t0);
+    tcg_gen_mov_tl(cpu_fpr[a->rd], get_gpr(ctx, a->rs1, EXT_NONE));
     mark_fs_dirty(ctx);
     return true;
 #else
-- 
2.25.1


