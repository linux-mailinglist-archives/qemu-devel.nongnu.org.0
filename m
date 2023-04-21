Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FD06EAB9E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:28:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqns-0001pk-WC; Fri, 21 Apr 2023 09:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnr-0001j3-0H
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:27:55 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqno-0003sj-1z
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:27:54 -0400
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-38be12d59dcso1326915b6e.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083670; x=1684675670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FN853kGcAYdV8a890u3Fe0ddWEgn/rZ1yzgBeq+xwhk=;
 b=h23xXR4REdbMF3mqxbQyVhWLOXMtab62vIA6k1JA0aZQ5MqWfWRCpgOx3Jbpn4ZRjc
 mgttND6ZHgiuXV5ToltfrjpANqBSm4vT2fZY9atD8OmZCuFHMtNEGo1Yw3FXSv+yNKpq
 hqw3ZDKSPXJuEqepGgItI2J45upoN0313VXe/9s/UtzlicbWVfYb1J8khPo2Z5rb9Ugg
 wtcGlNsc8hqB5CLDllyOOU6wI3Ahn+SgHxiklSUqXDhLzzuiyV8/ar8vR1itHhLV1stz
 59Nz9s4byHYQihyEOrfiCBkGMMARLCn1Em7/YZM/tjgo9/2GGvmpMspsGYrEjaolY6Ym
 jSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083670; x=1684675670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FN853kGcAYdV8a890u3Fe0ddWEgn/rZ1yzgBeq+xwhk=;
 b=IzwlN4Gvfx7FdPpPe+4ffDbeCt/Jg6Yv0JiwsqPKX+gPy092tsVHCUNnBnY1ixyby+
 IdQBd5vQBJ/dKcGHoMCWkBUG+z2y6w7If9Pbs7GvZzHe7+mhwk2MujLk6GOytjoRFzIy
 gPERQ5x7m6aRfibrEFJDGAZnJFwZpYko1gHIx26FyYDmWGN4x710CwC/aMrjyTZClxAn
 jQTdno1wQlUV57YNfMBwSbBEHT6iJsukW2mljWVZunLo5UcFt0wwbZJHGPnM3VRoFPMy
 yEZvBHSx9a1r8zEXBubaxOz5dMNRX67bPn7Ct1c7Kz6D1uF33pNeKGrK6wcCJbfztOv6
 LNMQ==
X-Gm-Message-State: AAQBX9ewdpAA/9pqtcpyGudQ+7btggVjZE0Kv3zat9/wWaiXhH72ua82
 u1uCPjG/Xeb06lMCGG5KB/gS78/lLOiiVVb2Rbg=
X-Google-Smtp-Source: AKy350bSoDbGdlGJ/jBL5UjeA3RBggr1kj/I/4YIZnvUQ2k/caeXE2wACsN1qdZcYmBUgzdPkC2Z+g==
X-Received: by 2002:a05:6808:601:b0:38d:fc14:851 with SMTP id
 y1-20020a056808060100b0038dfc140851mr2610911oih.15.1682083670544; 
 Fri, 21 Apr 2023 06:27:50 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: [PATCH v8 06/11] target/riscv: Update check for Zca/Zcf/Zcd
Date: Fri, 21 Apr 2023 10:27:22 -0300
Message-Id: <20230421132727.121462-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Even though Zca/Zcf/Zcd can be included by C/F/D, however, their priv
version is higher than the priv version of C/F/D. So if we use check
for them instead of check for C/F/D totally, it will trigger new
problem when we try to disable the extensions based on the configured
priv version.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 12 +++++++-----
 target/riscv/insn_trans/trans_rvf.c.inc | 14 ++++++++------
 target/riscv/insn_trans/trans_rvi.c.inc |  5 +++--
 target/riscv/translate.c                |  5 +++--
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 2c51e01c40..6bdb55ef43 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -31,9 +31,11 @@
     } \
 } while (0)
 
-#define REQUIRE_ZCD(ctx) do { \
-    if (!ctx->cfg_ptr->ext_zcd) {  \
-        return false;     \
+#define REQUIRE_ZCD_OR_DC(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zcd) { \
+        if (!has_ext(ctx, RVD) || !has_ext(ctx, RVC)) { \
+            return false; \
+        } \
     } \
 } while (0)
 
@@ -67,13 +69,13 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 
 static bool trans_c_fld(DisasContext *ctx, arg_fld *a)
 {
-    REQUIRE_ZCD(ctx);
+    REQUIRE_ZCD_OR_DC(ctx);
     return trans_fld(ctx, a);
 }
 
 static bool trans_c_fsd(DisasContext *ctx, arg_fsd *a)
 {
-    REQUIRE_ZCD(ctx);
+    REQUIRE_ZCD_OR_DC(ctx);
     return trans_fsd(ctx, a);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index b2de4fcf3f..c47138575a 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -30,10 +30,12 @@
     } \
 } while (0)
 
-#define REQUIRE_ZCF(ctx) do {                  \
-    if (!ctx->cfg_ptr->ext_zcf) {              \
-        return false;                          \
-    }                                          \
+#define REQUIRE_ZCF_OR_FC(ctx) do {                     \
+    if (!ctx->cfg_ptr->ext_zcf) {                       \
+        if (!has_ext(ctx, RVF) || !has_ext(ctx, RVC)) { \
+            return false;                               \
+        }                                               \
+    }                                                   \
 } while (0)
 
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
@@ -69,13 +71,13 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 
 static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
 {
-    REQUIRE_ZCF(ctx);
+    REQUIRE_ZCF_OR_FC(ctx);
     return trans_flw(ctx, a);
 }
 
 static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
 {
-    REQUIRE_ZCF(ctx);
+    REQUIRE_ZCF_OR_FC(ctx);
     return trans_fsw(ctx, a);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index c70c495fc5..e33f63bea1 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     gen_set_pc(ctx, cpu_pc);
-    if (!ctx->cfg_ptr->ext_zca) {
+    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
         TCGv t0 = tcg_temp_new();
 
         misaligned = gen_new_label();
@@ -169,7 +169,8 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
+    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca &&
+        ((ctx->base.pc_next + a->imm) & 0x3)) {
         /* misaligned */
         gen_exception_inst_addr_mis(ctx);
     } else {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 928da0d3f0..a889454137 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 
     /* check misaligned: */
     next_pc = ctx->base.pc_next + imm;
-    if (!ctx->cfg_ptr->ext_zca) {
+    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
         if ((next_pc & 0x3) != 0) {
             gen_exception_inst_addr_mis(ctx);
             return;
@@ -1123,7 +1123,8 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
          * The Zca extension is added as way to refer to instructions in the C
          * extension that do not include the floating-point loads and stores
          */
-        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
+        if ((has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zca) &&
+            decode_insn16(ctx, opcode)) {
             return;
         }
     } else {
-- 
2.40.0


