Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470A6734C4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:50:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIR8f-0004Gi-5U; Thu, 19 Jan 2023 04:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIR8c-0004Fr-C1
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:23:14 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIR8a-0006GB-QT
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:23:14 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 79B9940737AC;
 Thu, 19 Jan 2023 09:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 79B9940737AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1674120190;
 bh=o/aySluarGl07VSrD5n+eG+q632Cw4z1i55Kl2eM+0w=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=qBKD1+0y7kBIVdZM1SqrydJ0u8hnbFgpgK1H5tnQgLkhorLXX+tTce4k6q1BgNaMg
 yqLusJRV5O73d+VUICUS4rYZk056ElejZtpa9SWyiKdCTtpxnl2R39VKPm1MPznfaD
 MXe9nn+5t5zLxpyexT/ZaZ73gf8NxXLBSRG9kad8=
Subject: [PATCH v2 5/5] target/avr: enable icount mode
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Thu, 19 Jan 2023 12:23:10 +0300
Message-ID: <167412019026.3110454.15241120845845520583.stgit@pasha-ThinkPad-X280>
In-Reply-To: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
References: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Icount mode requires correct can_do_io flag management for checking
that IO operations are performed only in the last TB instruction.
This patch sets this flag before every helper which can lead to
virtual hardware access. It enables deterministic execution
in icount mode for AVR.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 target/avr/translate.c |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 40b15d116e..ee137dfe54 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1406,6 +1406,10 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
 {
     TCGv temp = tcg_const_i32(a->reg);
 
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(temp, cpu_env, temp);
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_EQ;
@@ -1424,6 +1428,10 @@ static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
 {
     TCGv temp = tcg_const_i32(a->reg);
 
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(temp, cpu_env, temp);
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_NE;
@@ -1621,6 +1629,9 @@ static TCGv gen_get_zaddr(DisasContext *ctx, bool ram)
 static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
 {
     if (ctx->base.tb->flags & TB_FLAGS_FULL_ACCESS) {
+        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         gen_helper_fullwr(cpu_env, data, addr);
     } else {
         tcg_gen_qemu_st8(data, addr, MMU_DATA_IDX); /* mem[addr] = data */
@@ -1630,6 +1641,9 @@ static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
 static void gen_data_load(DisasContext *ctx, TCGv data, TCGv addr)
 {
     if (ctx->base.tb->flags & TB_FLAGS_FULL_ACCESS) {
+        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         gen_helper_fullrd(data, cpu_env, addr);
     } else {
         tcg_gen_qemu_ld8u(data, addr, MMU_DATA_IDX); /* data = mem[addr] */
@@ -2335,6 +2349,10 @@ static bool trans_IN(DisasContext *ctx, arg_IN *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv port = tcg_const_i32(a->imm);
 
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(Rd, cpu_env, port);
 
     tcg_temp_free_i32(port);
@@ -2351,6 +2369,10 @@ static bool trans_OUT(DisasContext *ctx, arg_OUT *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv port = tcg_const_i32(a->imm);
 
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_outb(cpu_env, port, Rd);
 
     tcg_temp_free_i32(port);
@@ -2651,6 +2673,10 @@ static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
     TCGv data = tcg_temp_new_i32();
     TCGv port = tcg_const_i32(a->reg);
 
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_ori_tl(data, data, 1 << a->bit);
     gen_helper_outb(cpu_env, port, data);
@@ -2670,6 +2696,10 @@ static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
     TCGv data = tcg_temp_new_i32();
     TCGv port = tcg_const_i32(a->reg);
 
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_andi_tl(data, data, ~(1 << a->bit));
     gen_helper_outb(cpu_env, port, data);


