Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54419333458
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:23:09 +0100 (CET)
Received: from localhost ([::1]:51730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqNI-0006TG-DT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqBL-0004Jm-9e; Tue, 09 Mar 2021 23:10:47 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60833 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqBH-0004FT-N7; Tue, 09 Mar 2021 23:10:46 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWf2QfLz9sf9; Wed, 10 Mar 2021 15:10:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349406;
 bh=RDDaoxGlqZ067yRviJA7gZVjML6Hf1+QMpsvVlDJQto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VFruNws5cnc9GidZp4B8EsTjLOmUovgYF8gktlEqJs/s32fgC2ND1MQHNiE2aBCXS
 8aBUQab91vnDp28CEGrJiP6+9B+ZBcZXf1OVzMJsfSMSOl69MWuUp7wym/4AKPIxDG
 h/4xf8mERAs8siBQ4LhwWtJ9uqjPb84IEZVY1o0o=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 18/20] target/ppc: fix icount support on Book-e vms accessing
 SPRs
Date: Wed, 10 Mar 2021 15:10:00 +1100
Message-Id: <20210310041002.333813-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Cheptsov <cheptsov@ispras.ru>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Cheptsov <cheptsov@ispras.ru>

Failing to guard SPR access with gen_io_start/gen_stop_exception
causes "Bad icount read" exceptions when running VMs with
e500mc and e500v2 CPUs with an icount parameter.

Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
Message-Id: <20210303140851.78383-1-cheptsov@ispras.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate_init.c.inc | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index e7324e85cd..09c9ae2c98 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -567,35 +567,71 @@ static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
 #if !defined(CONFIG_USER_ONLY)
 static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
 {
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
 }
 
 static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
 {
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
 }
 
 static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
 {
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_store_spr(sprn, cpu_gpr[gprn]);
     gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
     /* We must stop translation as we may have rebooted */
     gen_stop_exception(ctx);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
 }
 
 static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
 {
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
 }
 
 static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
 {
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
 }
 
 static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
 {
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
 }
 #endif
 
-- 
2.29.2


