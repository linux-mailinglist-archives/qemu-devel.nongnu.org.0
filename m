Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADBF2C1DC1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 06:53:43 +0100 (CET)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khRGo-0002m9-SK
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 00:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khREh-0001cf-D1; Tue, 24 Nov 2020 00:51:31 -0500
Received: from ozlabs.org ([203.11.71.1]:53987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khREe-0005WE-Ml; Tue, 24 Nov 2020 00:51:30 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CgCnK2XY2z9sSf; Tue, 24 Nov 2020 16:51:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606197077;
 bh=hJW71fux8M2sRdpesf6mBNsDFmX/bwnsaKy+Z1FcRYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EGLRcd2RLGDCE8f9QulsDNlIygcVLl8tpq4/rgGPul6QJmqMw/9KDJRHU2FsCWoCS
 N6BsyQ3NgDACAdlO5+EiukFb9H5ikqukwASn8EcLpI3oCEFoTm9qca7PiTYYQ5SOAX
 HZA5NAB9W9QQN56ch+VD6V3vyVQjOSyU41/qcNAc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 1/1] ppc/translate: Implement lxvwsx opcode
Date: Tue, 24 Nov 2020 16:51:14 +1100
Message-Id: <20201124055114.1017066-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124055114.1017066-1-david@gibson.dropbear.id.au>
References: <20201124055114.1017066-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: LemonBoy <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LemonBoy <thatlemon@gmail.com>

Implement the "Load VSX Vector Word & Splat Indexed" opcode, introduced
in Power ISA v3.0.

Buglink: https://bugs.launchpad.net/qemu/+bug/1793608
Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Message-Id: <d7d533e18c2bc10d924ee3e09907ff2b41fddb3a.1604912739.git.thatlemon@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.c.inc | 30 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-ops.c.inc  |  1 +
 2 files changed, 31 insertions(+)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b518de46db..075f063e98 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -139,6 +139,36 @@ static void gen_lxvw4x(DisasContext *ctx)
     tcg_temp_free_i64(xtl);
 }
 
+static void gen_lxvwsx(DisasContext *ctx)
+{
+    TCGv EA;
+    TCGv_i32 data;
+
+    if (xT(ctx->opcode) < 32) {
+        if (unlikely(!ctx->vsx_enabled)) {
+            gen_exception(ctx, POWERPC_EXCP_VSXU);
+            return;
+        }
+    } else {
+        if (unlikely(!ctx->altivec_enabled)) {
+            gen_exception(ctx, POWERPC_EXCP_VPU);
+            return;
+        }
+    }
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+
+    gen_addr_reg_index(ctx, EA);
+
+    data = tcg_temp_new_i32();
+    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
+    tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
+
+    tcg_temp_free(EA);
+    tcg_temp_free_i32(data);
+}
+
 static void gen_bswap16x8(TCGv_i64 outh, TCGv_i64 outl,
                           TCGv_i64 inh, TCGv_i64 inl)
 {
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 7fd3942b84..1d41beef26 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -5,6 +5,7 @@ GEN_HANDLER_E(lxsibzx, 0x1F, 0x0D, 0x18, 0, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(lxsihzx, 0x1F, 0x0D, 0x19, 0, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(lxsspx, 0x1F, 0x0C, 0x10, 0, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER_E(lxvd2x, 0x1F, 0x0C, 0x1A, 0, PPC_NONE, PPC2_VSX),
+GEN_HANDLER_E(lxvwsx, 0x1F, 0x0C, 0x0B, 0, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(lxvdsx, 0x1F, 0x0C, 0x0A, 0, PPC_NONE, PPC2_VSX),
 GEN_HANDLER_E(lxvw4x, 0x1F, 0x0C, 0x18, 0, PPC_NONE, PPC2_VSX),
 GEN_HANDLER_E(lxvh8x, 0x1F, 0x0C, 0x19, 0, PPC_NONE,  PPC2_ISA300),
-- 
2.28.0


