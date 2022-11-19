Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551EF630C55
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 06:57:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owGq3-00070g-Ul; Sat, 19 Nov 2022 00:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1owGq0-00070G-UD
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:56:24 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1owGpy-0003Cx-Sw
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:56:24 -0500
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id F3EE040737CA;
 Sat, 19 Nov 2022 05:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru F3EE040737CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1668837360;
 bh=XlZmL9qDLD0IhAjhBCIBkVUFND5Sk1/nWxHMaR2ZER4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Tc0pAjDvM1PEAsZ0rdYpRXWY9fb2x93lUl6gLDSbFbm2XFvhldMBCfxLs7wdnKh+2
 oLw9u7fKNTscyOR2PZMmUB8p0rb+0NwQWluVx2GllxsGtq29tyBXtT6He76u6IGq52
 hORDejFsSO62W1j5YUo+RTVvRDX3n36x/GD4KJz8=
Subject: [PATCH 2/4] target/avr: implement small RAM/large RAM feature
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Sat, 19 Nov 2022 08:55:59 +0300
Message-ID: <166883735975.1540909.16334439765982123298.stgit@pasha-ThinkPad-X280>
In-Reply-To: <166883734868.1540909.6779276759642478650.stgit@pasha-ThinkPad-X280>
References: <166883734868.1540909.6779276759642478650.stgit@pasha-ThinkPad-X280>
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

translate.c functions use RAMPZ for RAM access. This register
is also used for ROM reads. However, in MCUs with 64k RAM support
RAMPZ is used for ROM only. Therefore when RAMPZ is set,
addressing the RAM becomes incorrect in the emulator.
This patch adds LARGE RAM feature which can be used in xmega controllers,
that could be added later. For the currently supported MCUs this
feature is disabled and RAMPZ is not used for RAM access.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 target/avr/cpu.h       |    2 ++
 target/avr/translate.c |   63 ++++++++++++++++++++++++++++++------------------
 2 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 96419c0c2b..cfdc0ecb70 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -106,6 +106,8 @@ typedef enum AVRFeature {
     AVR_FEATURE_RAMPX,
     AVR_FEATURE_RAMPY,
     AVR_FEATURE_RAMPZ,
+
+    AVR_FEATURE_LARGE_RAM,
 } AVRFeature;
 
 typedef struct CPUArchState {
diff --git a/target/avr/translate.c b/target/avr/translate.c
index c9a0a39c2d..e4900d630f 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1542,13 +1542,17 @@ static bool trans_BRBS(DisasContext *ctx, arg_BRBS *a)
  *  M assumed to be in 0x000000ff format
  *  L assumed to be in 0x000000ff format
  */
-static void gen_set_addr(TCGv addr, TCGv H, TCGv M, TCGv L)
+static void gen_set_addr_short(TCGv addr, TCGv M, TCGv L)
 {
-
     tcg_gen_andi_tl(L, addr, 0x000000ff);
 
     tcg_gen_andi_tl(M, addr, 0x0000ff00);
     tcg_gen_shri_tl(M, M, 8);
+}
+
+static void gen_set_addr(TCGv addr, TCGv H, TCGv M, TCGv L)
+{
+    gen_set_addr_short(addr, M, L);
 
     tcg_gen_andi_tl(H, addr, 0x00ff0000);
 }
@@ -1563,9 +1567,13 @@ static void gen_set_yaddr(TCGv addr)
     gen_set_addr(addr, cpu_rampY, cpu_r[29], cpu_r[28]);
 }
 
-static void gen_set_zaddr(TCGv addr)
+static void gen_set_zaddr(DisasContext *ctx, TCGv addr, bool ram)
 {
-    gen_set_addr(addr, cpu_rampZ, cpu_r[31], cpu_r[30]);
+    if (!ram || avr_feature(ctx->env, AVR_FEATURE_LARGE_RAM)) {
+        gen_set_addr(addr, cpu_rampZ, cpu_r[31], cpu_r[30]);
+    } else {
+        gen_set_addr_short(addr, cpu_r[31], cpu_r[30]);
+    }
 }
 
 static TCGv gen_get_addr(TCGv H, TCGv M, TCGv L)
@@ -1588,9 +1596,16 @@ static TCGv gen_get_yaddr(void)
     return gen_get_addr(cpu_rampY, cpu_r[29], cpu_r[28]);
 }
 
-static TCGv gen_get_zaddr(void)
+static TCGv gen_get_zaddr(DisasContext *ctx, bool ram)
 {
-    return gen_get_addr(cpu_rampZ, cpu_r[31], cpu_r[30]);
+    if (!ram || avr_feature(ctx->env, AVR_FEATURE_LARGE_RAM)) {
+        return gen_get_addr(cpu_rampZ, cpu_r[31], cpu_r[30]);
+    } else {
+        TCGv zero = tcg_const_i32(0);
+        TCGv res = gen_get_addr(zero, cpu_r[31], cpu_r[30]);
+        tcg_temp_free_i32(zero);
+        return res;
+    }
 }
 
 /*
@@ -1868,12 +1883,12 @@ static bool trans_LDDY(DisasContext *ctx, arg_LDDY *a)
 static bool trans_LDZ2(DisasContext *ctx, arg_LDZ2 *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
 
     gen_data_load(ctx, Rd, addr);
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
 
-    gen_set_zaddr(addr);
+    gen_set_zaddr(ctx, addr, true);
 
     tcg_temp_free_i32(addr);
 
@@ -1883,12 +1898,12 @@ static bool trans_LDZ2(DisasContext *ctx, arg_LDZ2 *a)
 static bool trans_LDZ3(DisasContext *ctx, arg_LDZ3 *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
 
     tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
     gen_data_load(ctx, Rd, addr);
 
-    gen_set_zaddr(addr);
+    gen_set_zaddr(ctx, addr, true);
 
     tcg_temp_free_i32(addr);
 
@@ -1898,7 +1913,7 @@ static bool trans_LDZ3(DisasContext *ctx, arg_LDZ3 *a)
 static bool trans_LDDZ(DisasContext *ctx, arg_LDDZ *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
 
     tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
     gen_data_load(ctx, Rd, addr);
@@ -2088,12 +2103,12 @@ static bool trans_STDY(DisasContext *ctx, arg_STDY *a)
 static bool trans_STZ2(DisasContext *ctx, arg_STZ2 *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
 
     gen_data_store(ctx, Rd, addr);
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
 
-    gen_set_zaddr(addr);
+    gen_set_zaddr(ctx, addr, true);
 
     tcg_temp_free_i32(addr);
 
@@ -2103,12 +2118,12 @@ static bool trans_STZ2(DisasContext *ctx, arg_STZ2 *a)
 static bool trans_STZ3(DisasContext *ctx, arg_STZ3 *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
 
     tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
     gen_data_store(ctx, Rd, addr);
 
-    gen_set_zaddr(addr);
+    gen_set_zaddr(ctx, addr, true);
 
     tcg_temp_free_i32(addr);
 
@@ -2118,7 +2133,7 @@ static bool trans_STZ3(DisasContext *ctx, arg_STZ3 *a)
 static bool trans_STDZ(DisasContext *ctx, arg_STDZ *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
 
     tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
     gen_data_store(ctx, Rd, addr);
@@ -2228,7 +2243,7 @@ static bool trans_ELPM1(DisasContext *ctx, arg_ELPM1 *a)
     }
 
     TCGv Rd = cpu_r[0];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, false);
 
     tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
 
@@ -2244,7 +2259,7 @@ static bool trans_ELPM2(DisasContext *ctx, arg_ELPM2 *a)
     }
 
     TCGv Rd = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, false);
 
     tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
 
@@ -2260,11 +2275,11 @@ static bool trans_ELPMX(DisasContext *ctx, arg_ELPMX *a)
     }
 
     TCGv Rd = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, false);
 
     tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
-    gen_set_zaddr(addr);
+    gen_set_zaddr(ctx, addr, false);
 
     tcg_temp_free_i32(addr);
 
@@ -2402,7 +2417,7 @@ static bool trans_XCH(DisasContext *ctx, arg_XCH *a)
 
     TCGv Rd = cpu_r[a->rd];
     TCGv t0 = tcg_temp_new_i32();
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
 
     gen_data_load(ctx, t0, addr);
     gen_data_store(ctx, Rd, addr);
@@ -2432,7 +2447,7 @@ static bool trans_LAS(DisasContext *ctx, arg_LAS *a)
     }
 
     TCGv Rr = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
     TCGv t0 = tcg_temp_new_i32();
     TCGv t1 = tcg_temp_new_i32();
 
@@ -2467,7 +2482,7 @@ static bool trans_LAC(DisasContext *ctx, arg_LAC *a)
     }
 
     TCGv Rr = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
     TCGv t0 = tcg_temp_new_i32();
     TCGv t1 = tcg_temp_new_i32();
 
@@ -2502,7 +2517,7 @@ static bool trans_LAT(DisasContext *ctx, arg_LAT *a)
     }
 
     TCGv Rd = cpu_r[a->rd];
-    TCGv addr = gen_get_zaddr();
+    TCGv addr = gen_get_zaddr(ctx, true);
     TCGv t0 = tcg_temp_new_i32();
     TCGv t1 = tcg_temp_new_i32();
 


