Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E83293E7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 22:44:01 +0100 (CET)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqKe-0003yd-HN
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 16:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1lGok4-000167-Jd
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:02:08 -0500
Received: from mail.ispras.ru ([83.149.199.84]:60678)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1lGok2-0006an-8O
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:02:08 -0500
Received: from localhost.localdomain (unknown [77.232.9.83])
 by mail.ispras.ru (Postfix) with ESMTPSA id 44C3540755F1;
 Mon,  1 Mar 2021 20:01:57 +0000 (UTC)
From: Vitaly Cheptsov <cheptsov@ispras.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: fix icount support on Book-e vms accessing SPRs
Date: Mon,  1 Mar 2021 22:59:19 +0300
Message-Id: <20210301195919.9333-2-cheptsov@ispras.ru>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210301195919.9333-1-cheptsov@ispras.ru>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 01 Mar 2021 16:41:25 -0500
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
Cc: Vitaly Cheptsov <cheptsov@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Failing to guard SPR access with gen_io_start/gen_stop_exception
causes "Bad icount read" exceptions when running VMs with
e500mc and e500v2 CPUs with an icount parameter.

Cc: qemu-devel@nongnu.org
Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
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
2.24.3 (Apple Git-128)


