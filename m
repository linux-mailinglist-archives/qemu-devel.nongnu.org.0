Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA524388EBB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:13:31 +0200 (CEST)
Received: from localhost ([::1]:57422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM0w-0007h1-P6
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgw-000143-2B; Wed, 19 May 2021 08:52:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49577 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgt-0001Is-ID; Wed, 19 May 2021 08:52:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnh274tz9t1C; Wed, 19 May 2021 22:52:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428728;
 bh=5l+IgCc2WP15Qzz3g4MsYYRCDw3Ffn4jNv/r3457ZYM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e93B3cEjiAI54r7OTEvL5GtTwRmCnIb+x6JKx/mGB/aK4b00UKoj4szW7zJpn8U+o
 aJMi0O5w0uZTf3RAxiEXPdMTWuybtRtKyLW6kCFhPWXjMd0iLOsHoKuTMcxxAU0iuX
 f6znYwrzHe0ZnjZAnW+VjcckNks8jhweYR4sLYQQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 24/48] target/ppc: Remove unnecessary gen_io_end calls
Date: Wed, 19 May 2021 22:51:24 +1000
Message-Id: <20210519125148.27720-25-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Since ba3e7926691ed33, we switched the implementation of icount
to always reset can_do_io at the start of the following TB.
Most of them were removed in 9e9b10c64911, but some were missed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210512185441.3619828-10-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 047d872c6b..d51a1913a7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -570,7 +570,6 @@ void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -582,7 +581,6 @@ void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -605,7 +603,6 @@ void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -617,7 +614,6 @@ void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -663,7 +659,6 @@ void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -675,7 +670,6 @@ void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
-- 
2.31.1


