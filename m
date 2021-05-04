Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E43372BD0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:16:27 +0200 (CEST)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvqc-000631-57
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldvfl-0007GL-H6; Tue, 04 May 2021 10:05:14 -0400
Received: from [201.28.113.2] (port=20951 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldvfg-0004E5-6m; Tue, 04 May 2021 10:05:11 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 4 May 2021 11:02:35 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id D5FE18012B4;
 Tue,  4 May 2021 11:02:35 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] target/ppc: turned SPR R/W callbacks not static
Date: Tue,  4 May 2021 11:01:56 -0300
Message-Id: <20210504140157.76066-5-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
References: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 04 May 2021 14:02:36.0026 (UTC)
 FILETIME=[22C21DA0:01D740EE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to compile translate_init.c.inc as a standalone file,
we have to make the callbacks accessible outside of translate.c;
This patch does exactly that

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/spr_tcg.h   | 134 ++++++++++++++++++++++++++
 target/ppc/translate.c | 210 ++++++++++++++++++++---------------------
 2 files changed, 237 insertions(+), 107 deletions(-)
 create mode 100644 target/ppc/spr_tcg.h

diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
new file mode 100644
index 0000000000..1d2890dea0
--- /dev/null
+++ b/target/ppc/spr_tcg.h
@@ -0,0 +1,134 @@
+/*
+ *  PowerPC emulation for qemu: read/write callbacks for SPRs
+ *
+ *  Copyright (C) 2021 Instituto de Pesquisas Eldorado
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef SPR_TCG_H
+#define SPR_TCG_H
+
+/* prototypes for readers and writers for SPRs */
+void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
+void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
+void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
+void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
+void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
+void spr_write_lr(DisasContext *ctx, int sprn, int gprn);
+void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
+void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
+void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
+void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
+void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
+void spr_read_atbu(DisasContext *ctx, int gprn, int sprn);
+void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn);
+void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
+void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
+void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
+
+#ifndef CONFIG_USER_ONLY
+void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
+void spr_write_clear(DisasContext *ctx, int sprn, int gprn);
+void spr_access_nop(DisasContext *ctx, int sprn, int gprn);
+void spr_read_decr(DisasContext *ctx, int gprn, int sprn);
+void spr_write_decr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_tbl(DisasContext *ctx, int sprn, int gprn);
+void spr_write_tbu(DisasContext *ctx, int sprn, int gprn);
+void spr_write_atbl(DisasContext *ctx, int sprn, int gprn);
+void spr_write_atbu(DisasContext *ctx, int sprn, int gprn);
+void spr_read_ibat(DisasContext *ctx, int gprn, int sprn);
+void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn);
+void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn);
+void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn);
+void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn);
+void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn);
+void spr_read_dbat(DisasContext *ctx, int gprn, int sprn);
+void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn);
+void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn);
+void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn);
+void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn);
+void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn);
+void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn);
+void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn);
+void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn);
+void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn);
+void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn);
+void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn);
+void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn);
+void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn);
+void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn);
+void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn);
+void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn);
+void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn);
+void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn);
+void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_pir(DisasContext *ctx, int sprn, int gprn);
+void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn);
+void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn);
+void spr_read_thrm(DisasContext *ctx, int gprn, int sprn);
+void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn);
+void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn);
+void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn);
+void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn);
+void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn);
+void spr_write_eplc(DisasContext *ctx, int sprn, int gprn);
+void spr_write_epsc(DisasContext *ctx, int sprn, int gprn);
+void spr_write_mas73(DisasContext *ctx, int sprn, int gprn);
+void spr_read_mas73(DisasContext *ctx, int gprn, int sprn);
+#ifdef TARGET_PPC64
+void spr_read_cfar(DisasContext *ctx, int gprn, int sprn);
+void spr_write_cfar(DisasContext *ctx, int sprn, int gprn);
+void spr_write_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_read_purr(DisasContext *ctx, int gprn, int sprn);
+void spr_write_purr(DisasContext *ctx, int sprn, int gprn);
+void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn);
+void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn);
+void spr_read_vtb(DisasContext *ctx, int gprn, int sprn);
+void spr_write_vtb(DisasContext *ctx, int sprn, int gprn);
+void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn);
+void spr_write_pidr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn);
+void spr_read_hior(DisasContext *ctx, int gprn, int sprn);
+void spr_write_hior(DisasContext *ctx, int sprn, int gprn);
+void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_pcr(DisasContext *ctx, int sprn, int gprn);
+void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn);
+void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn);
+void spr_write_amr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_uamor(DisasContext *ctx, int sprn, int gprn);
+void spr_write_iamr(DisasContext *ctx, int sprn, int gprn);
+#endif
+#endif
+
+#ifdef TARGET_PPC64
+void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn);
+void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn);
+void spr_read_tar(DisasContext *ctx, int gprn, int sprn);
+void spr_write_tar(DisasContext *ctx, int sprn, int gprn);
+void spr_read_tm(DisasContext *ctx, int gprn, int sprn);
+void spr_write_tm(DisasContext *ctx, int sprn, int gprn);
+void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn);
+void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn);
+void spr_read_ebb(DisasContext *ctx, int gprn, int sprn);
+void spr_write_ebb(DisasContext *ctx, int sprn, int gprn);
+void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn);
+void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn);
+void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
+void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
+#endif
+
+#endif
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e48fdc6cdf..0c7628657b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -36,6 +36,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/atomic128.h"
+#include "spr_tcg.h"
 
 
 #define CPU_SINGLE_STEP 0x1
@@ -373,7 +374,7 @@ static inline void gen_sync_exception(DisasContext *ctx)
 /*****************************************************************************/
 /* SPR READ/RITE CALLBACKS */
 
-static void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
+void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
 {
 #if 0
     sprn = ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
@@ -397,7 +398,7 @@ static void spr_load_dump_spr(int sprn)
 #endif
 }
 
-static void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
+void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
 {
     gen_load_spr(cpu_gpr[gprn], sprn);
     spr_load_dump_spr(sprn);
@@ -412,14 +413,14 @@ static void spr_store_dump_spr(int sprn)
 #endif
 }
 
-static void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
+void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
 {
     gen_store_spr(sprn, cpu_gpr[gprn]);
     spr_store_dump_spr(sprn);
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
+void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
 {
 #ifdef TARGET_PPC64
     TCGv t0 = tcg_temp_new();
@@ -432,7 +433,7 @@ static void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
 #endif
 }
 
-static void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
+void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
@@ -444,7 +445,7 @@ static void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t1);
 }
 
-static void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
+void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
 {
 }
 
@@ -452,7 +453,7 @@ static void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
 
 /* SPR common to all PowerPC */
 /* XER */
-static void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
+void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
 {
     TCGv dst = cpu_gpr[gprn];
     TCGv t0 = tcg_temp_new();
@@ -476,7 +477,7 @@ static void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
     tcg_temp_free(t2);
 }
 
-static void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
+void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv src = cpu_gpr[gprn];
     /* Write all flags, while reading back check for isa300 */
@@ -492,36 +493,36 @@ static void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
 }
 
 /* LR */
-static void spr_read_lr(DisasContext *ctx, int gprn, int sprn)
+void spr_read_lr(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_mov_tl(cpu_gpr[gprn], cpu_lr);
 }
 
-static void spr_write_lr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_lr(DisasContext *ctx, int sprn, int gprn)
 {
     tcg_gen_mov_tl(cpu_lr, cpu_gpr[gprn]);
 }
 
 /* CFAR */
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
-static void spr_read_cfar(DisasContext *ctx, int gprn, int sprn)
+void spr_read_cfar(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_mov_tl(cpu_gpr[gprn], cpu_cfar);
 }
 
-static void spr_write_cfar(DisasContext *ctx, int sprn, int gprn)
+void spr_write_cfar(DisasContext *ctx, int sprn, int gprn)
 {
     tcg_gen_mov_tl(cpu_cfar, cpu_gpr[gprn]);
 }
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
 
 /* CTR */
-static void spr_read_ctr(DisasContext *ctx, int gprn, int sprn)
+void spr_read_ctr(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_mov_tl(cpu_gpr[gprn], cpu_ctr);
 }
 
-static void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
 {
     tcg_gen_mov_tl(cpu_ctr, cpu_gpr[gprn]);
 }
@@ -532,13 +533,13 @@ static void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
 /* UPMCx */
 /* USIA */
 /* UDECR */
-static void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
+void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
 {
     gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
 }
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
-static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
+void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
 }
@@ -547,7 +548,7 @@ static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 /* SPR common to all non-embedded PowerPC */
 /* DECR */
 #if !defined(CONFIG_USER_ONLY)
-static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
+void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -558,7 +559,7 @@ static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
     }
 }
 
-static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -572,7 +573,7 @@ static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
 
 /* SPR common to all non-embedded PowerPC, except 601 */
 /* Time base */
-static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
+void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -584,7 +585,7 @@ static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
     }
 }
 
-static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
+void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -596,20 +597,18 @@ static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
     }
 }
 
-ATTRIBUTE_UNUSED
-static void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
+void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
 {
     gen_helper_load_atbl(cpu_gpr[gprn], cpu_env);
 }
 
-ATTRIBUTE_UNUSED
-static void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
+void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
 {
     gen_helper_load_atbu(cpu_gpr[gprn], cpu_env);
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
+void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -621,7 +620,7 @@ static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
     }
 }
 
-static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
+void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -633,21 +632,18 @@ static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
     }
 }
 
-ATTRIBUTE_UNUSED
-static void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
+void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_atbl(cpu_env, cpu_gpr[gprn]);
 }
 
-ATTRIBUTE_UNUSED
-static void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
+void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_atbu(cpu_env, cpu_gpr[gprn]);
 }
 
 #if defined(TARGET_PPC64)
-ATTRIBUTE_UNUSED
-static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
+void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -658,7 +654,7 @@ static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
     }
 }
 
-static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -670,7 +666,7 @@ static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
 }
 
 /* HDECR */
-static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
+void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -682,7 +678,7 @@ static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
     }
 }
 
-static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -694,7 +690,7 @@ static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
     }
 }
 
-static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
+void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -705,7 +701,7 @@ static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
     }
 }
 
-static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
+void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -716,7 +712,7 @@ static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
     }
 }
 
-static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
+void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -733,42 +729,42 @@ static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
 #if !defined(CONFIG_USER_ONLY)
 /* IBAT0U...IBAT0U */
 /* IBAT0L...IBAT7L */
-static void spr_read_ibat(DisasContext *ctx, int gprn, int sprn)
+void spr_read_ibat(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
                   offsetof(CPUPPCState,
                            IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
 }
 
-static void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
+void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
                   offsetof(CPUPPCState,
                            IBAT[sprn & 1][((sprn - SPR_IBAT4U) / 2) + 4]));
 }
 
-static void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
+void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
     gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
     tcg_temp_free_i32(t0);
 }
 
-static void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
+void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
     gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
     tcg_temp_free_i32(t0);
 }
 
-static void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
+void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0L) / 2);
     gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
     tcg_temp_free_i32(t0);
 }
 
-static void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
+void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
     gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
@@ -777,42 +773,42 @@ static void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
 
 /* DBAT0U...DBAT7U */
 /* DBAT0L...DBAT7L */
-static void spr_read_dbat(DisasContext *ctx, int gprn, int sprn)
+void spr_read_dbat(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
                   offsetof(CPUPPCState,
                            DBAT[sprn & 1][(sprn - SPR_DBAT0U) / 2]));
 }
 
-static void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
+void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
                   offsetof(CPUPPCState,
                            DBAT[sprn & 1][((sprn - SPR_DBAT4U) / 2) + 4]));
 }
 
-static void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
+void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0U) / 2);
     gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
     tcg_temp_free_i32(t0);
 }
 
-static void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
+void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
     gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
     tcg_temp_free_i32(t0);
 }
 
-static void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
+void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0L) / 2);
     gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
     tcg_temp_free_i32(t0);
 }
 
-static void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
+void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
     gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
@@ -820,7 +816,7 @@ static void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
 }
 
 /* SDR1 */
-static void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn)
+void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_sdr1(cpu_env, cpu_gpr[gprn]);
 }
@@ -828,45 +824,45 @@ static void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn)
 #if defined(TARGET_PPC64)
 /* 64 bits PowerPC specific SPRs */
 /* PIDR */
-static void spr_write_pidr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_pidr(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_pidr(cpu_env, cpu_gpr[gprn]);
 }
 
-static void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_lpidr(cpu_env, cpu_gpr[gprn]);
 }
 
-static void spr_read_hior(DisasContext *ctx, int gprn, int sprn)
+void spr_read_hior(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, excp_prefix));
 }
 
-static void spr_write_hior(DisasContext *ctx, int sprn, int gprn)
+void spr_write_hior(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0x3FFFFF00000ULL);
     tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
     tcg_temp_free(t0);
 }
-static void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_ptcr(cpu_env, cpu_gpr[gprn]);
 }
 
-static void spr_write_pcr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_pcr(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_pcr(cpu_env, cpu_gpr[gprn]);
 }
 
 /* DPDES */
-static void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
+void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
 {
     gen_helper_load_dpdes(cpu_gpr[gprn], cpu_env);
 }
 
-static void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
+void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_dpdes(cpu_env, cpu_gpr[gprn]);
 }
@@ -875,28 +871,28 @@ static void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
 
 /* PowerPC 601 specific registers */
 /* RTC */
-static void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn)
+void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn)
 {
     gen_helper_load_601_rtcl(cpu_gpr[gprn], cpu_env);
 }
 
-static void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn)
+void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn)
 {
     gen_helper_load_601_rtcu(cpu_gpr[gprn], cpu_env);
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn)
+void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_601_rtcu(cpu_env, cpu_gpr[gprn]);
 }
 
-static void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn)
+void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_601_rtcl(cpu_env, cpu_gpr[gprn]);
 }
 
-static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
+void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
     /* Must stop the translation as endianness may have changed */
@@ -906,21 +902,21 @@ static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
 
 /* Unified bats */
 #if !defined(CONFIG_USER_ONLY)
-static void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn)
+void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
                   offsetof(CPUPPCState,
                            IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
 }
 
-static void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn)
+void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
     gen_helper_store_601_batl(cpu_env, t0, cpu_gpr[gprn]);
     tcg_temp_free_i32(t0);
 }
 
-static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
+void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
     gen_helper_store_601_batu(cpu_env, t0, cpu_gpr[gprn]);
@@ -930,7 +926,7 @@ static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
 
 /* PowerPC 40x specific registers */
 #if !defined(CONFIG_USER_ONLY)
-static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
+void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -941,7 +937,7 @@ static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
     }
 }
 
-static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
+void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -952,7 +948,7 @@ static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
     }
 }
 
-static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
+void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -966,7 +962,7 @@ static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
     }
 }
 
-static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
+void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -977,7 +973,7 @@ static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
     }
 }
 
-static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -988,7 +984,7 @@ static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
     }
 }
 
-static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
 {
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -1003,20 +999,20 @@ static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
 /* PowerPC 403 specific registers */
 /* PBL1 / PBU1 / PBL2 / PBU2 */
 #if !defined(CONFIG_USER_ONLY)
-static void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
+void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
 {
     tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
                   offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
 }
 
-static void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32(sprn - SPR_403_PBL1);
     gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
     tcg_temp_free_i32(t0);
 }
 
-static void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
+void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xF);
@@ -1026,7 +1022,7 @@ static void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
 #endif
 
 /* SPE specific registers */
-static void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
+void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
 {
     TCGv_i32 t0 = tcg_temp_new_i32();
     tcg_gen_ld_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
@@ -1034,7 +1030,7 @@ static void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
     tcg_temp_free_i32(t0);
 }
 
-static void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(t0, cpu_gpr[gprn]);
@@ -1044,7 +1040,7 @@ static void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
 
 #if !defined(CONFIG_USER_ONLY)
 /* Callback used to write the exception vector base */
-static void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
+void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
     tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivpr_mask));
@@ -1054,7 +1050,7 @@ static void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t0);
 }
 
-static void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
+void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
 {
     int sprn_offs;
 
@@ -1082,7 +1078,7 @@ static void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
 
 #ifdef TARGET_PPC64
 #ifndef CONFIG_USER_ONLY
-static void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
@@ -1117,7 +1113,7 @@ static void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t2);
 }
 
-static void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
+void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
@@ -1148,7 +1144,7 @@ static void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t2);
 }
 
-static void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
@@ -1182,7 +1178,7 @@ static void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
 #endif
 
 #ifndef CONFIG_USER_ONLY
-static void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
+void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
 {
     gen_helper_fixup_thrm(cpu_env);
     gen_load_spr(cpu_gpr[gprn], sprn);
@@ -1191,7 +1187,7 @@ static void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
 #endif /* !CONFIG_USER_ONLY */
 
 #if !defined(CONFIG_USER_ONLY)
-static void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
+void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
 
@@ -1200,7 +1196,7 @@ static void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t0);
 }
 
-static void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
+void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
 
@@ -1209,7 +1205,7 @@ static void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t0);
 }
 
-static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
+void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 = tcg_temp_new();
 
@@ -1219,22 +1215,22 @@ static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t0);
 }
 
-static void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
+void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
 }
 
-static void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
+void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv_i32 t0 = tcg_const_i32(sprn);
     gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
     tcg_temp_free_i32(t0);
 }
-static void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
+void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_booke_set_eplc(cpu_env, cpu_gpr[gprn]);
 }
-static void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
+void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_booke_set_epsc(cpu_env, cpu_gpr[gprn]);
 }
@@ -1242,7 +1238,7 @@ static void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
 #endif
 
 #if !defined(CONFIG_USER_ONLY)
-static void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
+void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv val = tcg_temp_new();
     tcg_gen_ext32u_tl(val, cpu_gpr[gprn]);
@@ -1252,7 +1248,7 @@ static void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(val);
 }
 
-static void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
+void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
 {
     TCGv mas7 = tcg_temp_new();
     TCGv mas3 = tcg_temp_new();
@@ -1295,7 +1291,7 @@ static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
     tcg_temp_free_i32(t1);
 }
 
-static void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
+void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
 {
     TCGv spr_up = tcg_temp_new();
     TCGv spr = tcg_temp_new();
@@ -1308,7 +1304,7 @@ static void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
     tcg_temp_free(spr_up);
 }
 
-static void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
+void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv spr = tcg_temp_new();
 
@@ -1320,7 +1316,7 @@ static void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
+void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv hmer = tcg_temp_new();
 
@@ -1331,67 +1327,67 @@ static void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(hmer);
 }
 
-static void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
+void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
 }
 #endif /* !defined(CONFIG_USER_ONLY) */
 
-static void spr_read_tar(DisasContext *ctx, int gprn, int sprn)
+void spr_read_tar(DisasContext *ctx, int gprn, int sprn)
 {
     gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
     spr_read_generic(ctx, gprn, sprn);
 }
 
-static void spr_write_tar(DisasContext *ctx, int sprn, int gprn)
+void spr_write_tar(DisasContext *ctx, int sprn, int gprn)
 {
     gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
     spr_write_generic(ctx, sprn, gprn);
 }
 
-static void spr_read_tm(DisasContext *ctx, int gprn, int sprn)
+void spr_read_tm(DisasContext *ctx, int gprn, int sprn)
 {
     gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
     spr_read_generic(ctx, gprn, sprn);
 }
 
-static void spr_write_tm(DisasContext *ctx, int sprn, int gprn)
+void spr_write_tm(DisasContext *ctx, int sprn, int gprn)
 {
     gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
     spr_write_generic(ctx, sprn, gprn);
 }
 
-static void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn)
+void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn)
 {
     gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
     spr_read_prev_upper32(ctx, gprn, sprn);
 }
 
-static void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn)
+void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn)
 {
     gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
     spr_write_prev_upper32(ctx, sprn, gprn);
 }
 
-static void spr_read_ebb(DisasContext *ctx, int gprn, int sprn)
+void spr_read_ebb(DisasContext *ctx, int gprn, int sprn)
 {
     gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
     spr_read_generic(ctx, gprn, sprn);
 }
 
-static void spr_write_ebb(DisasContext *ctx, int sprn, int gprn)
+void spr_write_ebb(DisasContext *ctx, int sprn, int gprn)
 {
     gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
     spr_write_generic(ctx, sprn, gprn);
 }
 
-static void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn)
+void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn)
 {
     gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
     spr_read_prev_upper32(ctx, gprn, sprn);
 }
 
-static void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
+void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
 {
     gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
     spr_write_prev_upper32(ctx, sprn, gprn);
-- 
2.17.1


