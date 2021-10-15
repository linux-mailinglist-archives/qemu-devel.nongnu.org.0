Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127342E9C7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:13:45 +0200 (CEST)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHPU-0000SB-AK
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHFt-0001IB-Lg
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:03:49 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHFr-000475-QP
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:03:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id f11so3710262pfc.12
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zgXf8MU37B6LQ4wf2E5V0IBnlpowQzYgj8b+5qKG438=;
 b=msfBYghfpA+rO0RO3ArAXPkUji8jOZs8oGsNDDgtbedg9cTsL0wIUo5OT7BVb5wQVd
 fTn5xpEGdnaIWkjmsxRNJGbptx9L9OOupDsKm0PU81k39LsDotPDmzvzyV4vs+s+eVw9
 PVau+GilW3Xs+4vlkA51HcNiRkmfLs3DhYo0+0WGsoNoVweV0SGjIPJTvuMxkkHuDGhf
 Ive1GanVHx8SSV0onFgWnqlHs/IKa6aOuXnQBTqx6Fj2xax4BDpE87MhcKJpZ6l7Ed8S
 fBM0TXBukeTf+y1ON2DACwf17mWHpe4FfVqnBuoIlGelpn/5vEcTs3G6CW+apVMCJmzL
 lanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zgXf8MU37B6LQ4wf2E5V0IBnlpowQzYgj8b+5qKG438=;
 b=nrMGRVwR5ESGQeshFU9baoWR4OC2Bsk3H7AwK5+3CrcPVAi7gGI38WqTcUaC4KZNda
 1iJCu8f3ZQSD3gmTpY2foqumW+yMPobsE7AOhiNhPYZcackiQQFE0taaWhG/gm7mABZA
 3G+XL7oM/AOr54F1xFmbYTdRGdD/Q+3F3qqiSqNzXhlMiZA5rxPVR2QYmJEWnpfQwSQ7
 LzPiMBpNWglpCrbC/tDqJ5YLwarjDfAHYlremvgnEWG8UJ5vVRrba8DVbSAaagiUjBAw
 l9VwQ5edXVeX7vwur8lRab9PVfKUJbOtGix19MK7A3bcWbS+aJELjMbpijet5nZ2I3Uf
 Rv4g==
X-Gm-Message-State: AOAM533A4MaQpaSamarqp14gwzVUoaWjnVsP/1fbd4uV652QzdTyG02h
 qo7g8st8GuHwf8/PPdoH1Lat5j3Zl1JfNHN9
X-Google-Smtp-Source: ABdhPJzEx2SlpPA+C2D2+h3z8cZLjE3ZjAd7AtWNYBmdZpqmpcFb9d+nrcC3L5gm66ZfezALs2RUcQ==
X-Received: by 2002:a05:6a00:90:b0:44c:6029:7fcb with SMTP id
 c16-20020a056a00009000b0044c60297fcbmr9960999pfj.69.1634281426227; 
 Fri, 15 Oct 2021 00:03:46 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id w15sm4209553pfc.220.2021.10.15.00.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:03:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 6/6] target/riscv: zfh: implement zfhmin extension
Date: Fri, 15 Oct 2021 15:03:06 +0800
Message-Id: <20211015070307.3860984-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015070307.3860984-1-frank.chang@sifive.com>
References: <20211015070307.3860984-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Zfhmin extension is a subset of Zfh extension, consisting only of data
transfer and conversion instructions.

If enabled, only the following instructions from Zfh extension are
included:
  * flh, fsh, fmv.x.h, fmv.h.x, fcvt.s.h, fcvt.h.s
  * If D extension is present: fcvt.d.h, fcvt.h.d

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c                        |  1 +
 target/riscv/cpu.h                        |  1 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 21 +++++++++++++--------
 target/riscv/translate.c                  |  2 ++
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 992cfc3ab0b..89a612f7606 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -592,6 +592,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 88684e72be1..d70f63ddfe6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -298,6 +298,7 @@ struct RISCVCPU {
         bool ext_ifencei;
         bool ext_icsr;
         bool ext_zfh;
+        bool ext_zfhmin;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 837a8002b7f..69aebe52107 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -21,13 +21,18 @@
         return false;         \
 } while (0)
 
+#define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {     \
+    if (!(ctx->ext_zfh || ctx->ext_zfhmin)) \
+        return false;                       \
+} while (0)
+
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
 {
     TCGv_i64 dest;
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -49,7 +54,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -282,7 +287,7 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
 static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
@@ -295,7 +300,7 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
     REQUIRE_EXT(ctx, RVD);
 
     gen_set_rm(ctx, a->rm);
@@ -310,7 +315,7 @@ static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
@@ -323,7 +328,7 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
     REQUIRE_EXT(ctx, RVD);
 
     gen_set_rm(ctx, a->rm);
@@ -440,7 +445,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
 static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
 
@@ -460,7 +465,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 442ef42f441..f23bc919c08 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -70,6 +70,7 @@ typedef struct DisasContext {
     bool virt_enabled;
     bool ext_ifencei;
     bool ext_zfh;
+    bool ext_zfhmin;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -559,6 +560,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
+    ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
     ctx->vlen = cpu->cfg.vlen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.25.1


