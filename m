Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC063370164
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 21:40:46 +0200 (CEST)
Received: from localhost ([::1]:44842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZ0H-00077S-OW
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 15:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcYwl-0005hL-EA; Fri, 30 Apr 2021 15:37:07 -0400
Received: from [201.28.113.2] (port=1834 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcYwg-00020c-OU; Fri, 30 Apr 2021 15:37:07 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 16:35:51 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id CFF448013C2;
 Fri, 30 Apr 2021 16:35:51 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] target/ppc: Isolated SPR read/write callbacks
Date: Fri, 30 Apr 2021 16:35:28 -0300
Message-Id: <20210430193533.82136-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 30 Apr 2021 19:35:52.0016 (UTC)
 FILETIME=[07A50D00:01D73DF8]
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

Moved all SPR read/write callback, and some related functions, to a
new file specific for it. These callbacks are TCG only, so separating
them is required to support the build flag disable-tcg.

Making the spr_noaccess function not static, and moving the define to
internal.h is required, otherwise the project doesn't build

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/internal.h           |    3 +
 target/ppc/spr_tcg.c.inc        | 1052 +++++++++++++++++++++++++++++++
 target/ppc/translate.c          |   47 +-
 target/ppc/translate_init.c.inc |  981 ----------------------------
 4 files changed, 1056 insertions(+), 1027 deletions(-)
 create mode 100644 target/ppc/spr_tcg.c.inc

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 184ba6d6b3..1de15acfbd 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -228,4 +228,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
 void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
 gchar *ppc_gdb_arch_name(CPUState *cs);
 
+void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
+#define SPR_NOACCESS (&spr_noaccess)
+
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/spr_tcg.c.inc b/target/ppc/spr_tcg.c.inc
new file mode 100644
index 0000000000..8d033dae6f
--- /dev/null
+++ b/target/ppc/spr_tcg.c.inc
@@ -0,0 +1,1052 @@
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
+
+/*****************************************************************************/
+/* Reader and writer functions for SPRs */
+
+static void gen_read_xer(DisasContext *ctx, TCGv dst)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+    tcg_gen_mov_tl(dst, cpu_xer);
+    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
+    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
+    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
+    tcg_gen_or_tl(t0, t0, t1);
+    tcg_gen_or_tl(dst, dst, t2);
+    tcg_gen_or_tl(dst, dst, t0);
+    if (is_isa300(ctx)) {
+        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
+        tcg_gen_or_tl(dst, dst, t0);
+        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
+        tcg_gen_or_tl(dst, dst, t0);
+    }
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+
+static void gen_write_xer(TCGv src)
+{
+    /* Write all flags, while reading back check for isa300 */
+    tcg_gen_andi_tl(cpu_xer, src,
+                    ~((1u << XER_SO) |
+                      (1u << XER_OV) | (1u << XER_OV32) |
+                      (1u << XER_CA) | (1u << XER_CA32)));
+    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
+    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
+    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
+    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
+    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
+}
+
+void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
+{
+#if 0
+    sprn = ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
+    printf("ERROR: try to access SPR %d !\n", sprn);
+#endif
+}
+
+/* #define PPC_DUMP_SPR_ACCESSES */
+
+/*
+ * Generic callbacks:
+ * do nothing but store/retrieve spr value
+ */
+static void spr_load_dump_spr(int sprn)
+{
+#ifdef PPC_DUMP_SPR_ACCESSES
+    TCGv_i32 t0 = tcg_const_i32(sprn);
+    gen_helper_load_dump_spr(cpu_env, t0);
+    tcg_temp_free_i32(t0);
+#endif
+}
+
+static void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_load_spr(cpu_gpr[gprn], sprn);
+    spr_load_dump_spr(sprn);
+}
+
+static void spr_store_dump_spr(int sprn)
+{
+#ifdef PPC_DUMP_SPR_ACCESSES
+    TCGv_i32 t0 = tcg_const_i32(sprn);
+    gen_helper_store_dump_spr(cpu_env, t0);
+    tcg_temp_free_i32(t0);
+#endif
+}
+
+static void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_store_spr(sprn, cpu_gpr[gprn]);
+    spr_store_dump_spr(sprn);
+}
+
+#if !defined(CONFIG_USER_ONLY)
+static void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
+{
+#ifdef TARGET_PPC64
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
+    gen_store_spr(sprn, t0);
+    tcg_temp_free(t0);
+    spr_store_dump_spr(sprn);
+#else
+    spr_write_generic(ctx, sprn, gprn);
+#endif
+}
+
+static void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    gen_load_spr(t0, sprn);
+    tcg_gen_neg_tl(t1, cpu_gpr[gprn]);
+    tcg_gen_and_tl(t0, t0, t1);
+    gen_store_spr(sprn, t0);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
+{
+}
+
+#endif
+
+/* SPR common to all PowerPC */
+/* XER */
+static void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_read_xer(ctx, cpu_gpr[gprn]);
+}
+
+static void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_write_xer(cpu_gpr[gprn]);
+}
+
+/* LR */
+static void spr_read_lr(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_lr);
+}
+
+static void spr_write_lr(DisasContext *ctx, int sprn, int gprn)
+{
+    tcg_gen_mov_tl(cpu_lr, cpu_gpr[gprn]);
+}
+
+/* CFAR */
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+static void spr_read_cfar(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_cfar);
+}
+
+static void spr_write_cfar(DisasContext *ctx, int sprn, int gprn)
+{
+    tcg_gen_mov_tl(cpu_cfar, cpu_gpr[gprn]);
+}
+#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
+
+/* CTR */
+static void spr_read_ctr(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_ctr);
+}
+
+static void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
+{
+    tcg_gen_mov_tl(cpu_ctr, cpu_gpr[gprn]);
+}
+
+/* User read access to SPR */
+/* USPRx */
+/* UMMCRx */
+/* UPMCx */
+/* USIA */
+/* UDECR */
+static void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
+}
+
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
+}
+#endif
+
+/* SPR common to all non-embedded PowerPC */
+/* DECR */
+#if !defined(CONFIG_USER_ONLY)
+static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+#endif
+
+/* SPR common to all non-embedded PowerPC, except 601 */
+/* Time base */
+static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_end();
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_end();
+        gen_stop_exception(ctx);
+    }
+}
+
+ATTRIBUTE_UNUSED
+static void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_helper_load_atbl(cpu_gpr[gprn], cpu_env);
+}
+
+ATTRIBUTE_UNUSED
+static void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_helper_load_atbu(cpu_gpr[gprn], cpu_env);
+}
+
+#if !defined(CONFIG_USER_ONLY)
+static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_end();
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_end();
+        gen_stop_exception(ctx);
+    }
+}
+
+ATTRIBUTE_UNUSED
+static void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_atbl(cpu_env, cpu_gpr[gprn]);
+}
+
+ATTRIBUTE_UNUSED
+static void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_atbu(cpu_env, cpu_gpr[gprn]);
+}
+
+#if defined(TARGET_PPC64)
+ATTRIBUTE_UNUSED
+static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+/* HDECR */
+static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_end();
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_end();
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+#endif
+#endif
+
+#if !defined(CONFIG_USER_ONLY)
+/* IBAT0U...IBAT0U */
+/* IBAT0L...IBAT7L */
+static void spr_read_ibat(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
+                  offsetof(CPUPPCState,
+                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
+}
+
+static void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
+                  offsetof(CPUPPCState,
+                           IBAT[sprn & 1][((sprn - SPR_IBAT4U) / 2) + 4]));
+}
+
+static void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
+    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
+    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0L) / 2);
+    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
+    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+/* DBAT0U...DBAT7U */
+/* DBAT0L...DBAT7L */
+static void spr_read_dbat(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
+                  offsetof(CPUPPCState,
+                           DBAT[sprn & 1][(sprn - SPR_DBAT0U) / 2]));
+}
+
+static void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
+                  offsetof(CPUPPCState,
+                           DBAT[sprn & 1][((sprn - SPR_DBAT4U) / 2) + 4]));
+}
+
+static void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0U) / 2);
+    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
+    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0L) / 2);
+    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
+    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+/* SDR1 */
+static void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_sdr1(cpu_env, cpu_gpr[gprn]);
+}
+
+#if defined(TARGET_PPC64)
+/* 64 bits PowerPC specific SPRs */
+/* PIDR */
+static void spr_write_pidr(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_pidr(cpu_env, cpu_gpr[gprn]);
+}
+
+static void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_lpidr(cpu_env, cpu_gpr[gprn]);
+}
+
+static void spr_read_hior(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, excp_prefix));
+}
+
+static void spr_write_hior(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0x3FFFFF00000ULL);
+    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
+    tcg_temp_free(t0);
+}
+
+static void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_ptcr(cpu_env, cpu_gpr[gprn]);
+}
+
+static void spr_write_pcr(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_pcr(cpu_env, cpu_gpr[gprn]);
+}
+
+/* DPDES */
+static void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_helper_load_dpdes(cpu_gpr[gprn], cpu_env);
+}
+
+static void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_dpdes(cpu_env, cpu_gpr[gprn]);
+}
+#endif
+#endif
+
+/* PowerPC 601 specific registers */
+/* RTC */
+static void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_helper_load_601_rtcl(cpu_gpr[gprn], cpu_env);
+}
+
+static void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_helper_load_601_rtcu(cpu_gpr[gprn], cpu_env);
+}
+
+#if !defined(CONFIG_USER_ONLY)
+static void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_601_rtcu(cpu_env, cpu_gpr[gprn]);
+}
+
+static void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_601_rtcl(cpu_env, cpu_gpr[gprn]);
+}
+
+static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
+    /* Must stop the translation as endianness may have changed */
+    gen_stop_exception(ctx);
+}
+#endif
+
+/* Unified bats */
+#if !defined(CONFIG_USER_ONLY)
+static void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
+                  offsetof(CPUPPCState,
+                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
+}
+
+static void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
+    gen_helper_store_601_batl(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
+    gen_helper_store_601_batu(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+#endif
+
+/* PowerPC 40x specific registers */
+#if !defined(CONFIG_USER_ONLY)
+static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_store_spr(sprn, cpu_gpr[gprn]);
+    gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
+    /* We must stop translation as we may have rebooted */
+    gen_stop_exception(ctx);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+
+static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_stop_exception(ctx);
+    }
+}
+#endif
+
+/* PowerPC 403 specific registers */
+/* PBL1 / PBU1 / PBL2 / PBU2 */
+#if !defined(CONFIG_USER_ONLY)
+static void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
+{
+    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
+                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
+}
+
+static void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32(sprn - SPR_403_PBL1);
+    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xF);
+    gen_store_spr(SPR_PIR, t0);
+    tcg_temp_free(t0);
+}
+#endif
+
+/* SPE specific registers */
+static void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv_i32 t0 = tcg_temp_new_i32();
+    tcg_gen_ld_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
+    tcg_gen_extu_i32_tl(cpu_gpr[gprn], t0);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_temp_new_i32();
+    tcg_gen_trunc_tl_i32(t0, cpu_gpr[gprn]);
+    tcg_gen_st_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
+    tcg_temp_free_i32(t0);
+}
+
+#if !defined(CONFIG_USER_ONLY)
+
+/* Callback used to write the exception vector base */
+static void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivpr_mask));
+    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
+    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
+    gen_store_spr(sprn, t0);
+    tcg_temp_free(t0);
+}
+
+static void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
+{
+    int sprn_offs;
+
+    if (sprn >= SPR_BOOKE_IVOR0 && sprn <= SPR_BOOKE_IVOR15) {
+        sprn_offs = sprn - SPR_BOOKE_IVOR0;
+    } else if (sprn >= SPR_BOOKE_IVOR32 && sprn <= SPR_BOOKE_IVOR37) {
+        sprn_offs = sprn - SPR_BOOKE_IVOR32 + 32;
+    } else if (sprn >= SPR_BOOKE_IVOR38 && sprn <= SPR_BOOKE_IVOR42) {
+        sprn_offs = sprn - SPR_BOOKE_IVOR38 + 38;
+    } else {
+        printf("Trying to write an unknown exception vector %d %03x\n",
+               sprn, sprn);
+        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
+        return;
+    }
+
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivor_mask));
+    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
+    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_offs]));
+    gen_store_spr(sprn, t0);
+    tcg_temp_free(t0);
+}
+#endif
+
+#ifdef TARGET_PPC64
+#ifndef CONFIG_USER_ONLY
+static void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    /*
+     * Note, the HV=1 PR=0 case is handled earlier by simply using
+     * spr_write_generic for HV mode in the SPR table
+     */
+
+    /* Build insertion mask into t1 based on context */
+    if (ctx->pr) {
+        gen_load_spr(t1, SPR_UAMOR);
+    } else {
+        gen_load_spr(t1, SPR_AMOR);
+    }
+
+    /* Mask new bits into t2 */
+    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
+
+    /* Load AMR and clear new bits in t0 */
+    gen_load_spr(t0, SPR_AMR);
+    tcg_gen_andc_tl(t0, t0, t1);
+
+    /* Or'in new bits and write it out */
+    tcg_gen_or_tl(t0, t0, t2);
+    gen_store_spr(SPR_AMR, t0);
+    spr_store_dump_spr(SPR_AMR);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+
+static void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    /*
+     * Note, the HV=1 case is handled earlier by simply using
+     * spr_write_generic for HV mode in the SPR table
+     */
+
+    /* Build insertion mask into t1 based on context */
+    gen_load_spr(t1, SPR_AMOR);
+
+    /* Mask new bits into t2 */
+    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
+
+    /* Load AMR and clear new bits in t0 */
+    gen_load_spr(t0, SPR_UAMOR);
+    tcg_gen_andc_tl(t0, t0, t1);
+
+    /* Or'in new bits and write it out */
+    tcg_gen_or_tl(t0, t0, t2);
+    gen_store_spr(SPR_UAMOR, t0);
+    spr_store_dump_spr(SPR_UAMOR);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+
+static void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    /*
+     * Note, the HV=1 case is handled earlier by simply using
+     * spr_write_generic for HV mode in the SPR table
+     */
+
+    /* Build insertion mask into t1 based on context */
+    gen_load_spr(t1, SPR_AMOR);
+
+    /* Mask new bits into t2 */
+    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
+
+    /* Load AMR and clear new bits in t0 */
+    gen_load_spr(t0, SPR_IAMR);
+    tcg_gen_andc_tl(t0, t0, t1);
+
+    /* Or'in new bits and write it out */
+    tcg_gen_or_tl(t0, t0, t2);
+    gen_store_spr(SPR_IAMR, t0);
+    spr_store_dump_spr(SPR_IAMR);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+#endif /* CONFIG_USER_ONLY */
+#endif /* TARGET_PPC64 */
+
+#if !defined(CONFIG_USER_ONLY)
+static void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_helper_fixup_thrm(cpu_env);
+    gen_load_spr(cpu_gpr[gprn], sprn);
+    spr_load_dump_spr(sprn);
+}
+
+static void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR0_DCE | L1CSR0_CPE);
+    gen_store_spr(sprn, t0);
+    tcg_temp_free(t0);
+}
+
+static void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR1_ICE | L1CSR1_CPE);
+    gen_store_spr(sprn, t0);
+    tcg_temp_free(t0);
+}
+
+static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
+                    ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_L2LFC));
+    gen_store_spr(sprn, t0);
+    tcg_temp_free(t0);
+}
+
+static void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
+}
+
+static void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t0 = tcg_const_i32(sprn);
+    gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
+    tcg_temp_free_i32(t0);
+}
+
+static void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_booke_set_eplc(cpu_env, cpu_gpr[gprn]);
+}
+
+static void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_booke_set_epsc(cpu_env, cpu_gpr[gprn]);
+}
+
+static void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv val = tcg_temp_new();
+    tcg_gen_ext32u_tl(val, cpu_gpr[gprn]);
+    gen_store_spr(SPR_BOOKE_MAS3, val);
+    tcg_gen_shri_tl(val, cpu_gpr[gprn], 32);
+    gen_store_spr(SPR_BOOKE_MAS7, val);
+    tcg_temp_free(val);
+}
+
+static void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv mas7 = tcg_temp_new();
+    TCGv mas3 = tcg_temp_new();
+    gen_load_spr(mas7, SPR_BOOKE_MAS7);
+    tcg_gen_shli_tl(mas7, mas7, 32);
+    gen_load_spr(mas3, SPR_BOOKE_MAS3);
+    tcg_gen_or_tl(cpu_gpr[gprn], mas3, mas7);
+    tcg_temp_free(mas3);
+    tcg_temp_free(mas7);
+}
+
+#endif /* !defined(CONFIG_USER_ONLY) */
+
+#ifdef TARGET_PPC64
+static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
+                                    int bit, int sprn, int cause)
+{
+    TCGv_i32 t1 = tcg_const_i32(bit);
+    TCGv_i32 t2 = tcg_const_i32(sprn);
+    TCGv_i32 t3 = tcg_const_i32(cause);
+
+    gen_helper_fscr_facility_check(cpu_env, t1, t2, t3);
+
+    tcg_temp_free_i32(t3);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+}
+
+static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
+                                   int bit, int sprn, int cause)
+{
+    TCGv_i32 t1 = tcg_const_i32(bit);
+    TCGv_i32 t2 = tcg_const_i32(sprn);
+    TCGv_i32 t3 = tcg_const_i32(cause);
+
+    gen_helper_msr_facility_check(cpu_env, t1, t2, t3);
+
+    tcg_temp_free_i32(t3);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+}
+
+static void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv spr_up = tcg_temp_new();
+    TCGv spr = tcg_temp_new();
+
+    gen_load_spr(spr, sprn - 1);
+    tcg_gen_shri_tl(spr_up, spr, 32);
+    tcg_gen_ext32u_tl(cpu_gpr[gprn], spr_up);
+
+    tcg_temp_free(spr);
+    tcg_temp_free(spr_up);
+}
+
+static void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv spr = tcg_temp_new();
+
+    gen_load_spr(spr, sprn - 1);
+    tcg_gen_deposit_tl(spr, spr, cpu_gpr[gprn], 32, 32);
+    gen_store_spr(sprn - 1, spr);
+
+    tcg_temp_free(spr);
+}
+
+#if !defined(CONFIG_USER_ONLY)
+static void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv hmer = tcg_temp_new();
+
+    gen_load_spr(hmer, sprn);
+    tcg_gen_and_tl(hmer, cpu_gpr[gprn], hmer);
+    gen_store_spr(sprn, hmer);
+    spr_store_dump_spr(sprn);
+    tcg_temp_free(hmer);
+}
+
+static void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
+}
+#endif
+
+static void spr_read_tar(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
+    spr_read_generic(ctx, gprn, sprn);
+}
+
+static void spr_write_tar(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
+    spr_write_generic(ctx, sprn, gprn);
+}
+
+static void spr_read_tm(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
+    spr_read_generic(ctx, gprn, sprn);
+}
+
+static void spr_write_tm(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
+    spr_write_generic(ctx, sprn, gprn);
+}
+
+static void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
+    spr_read_prev_upper32(ctx, gprn, sprn);
+}
+
+static void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
+    spr_write_prev_upper32(ctx, sprn, gprn);
+}
+
+static void spr_read_ebb(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
+    spr_read_generic(ctx, gprn, sprn);
+}
+
+static void spr_write_ebb(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
+    spr_write_generic(ctx, sprn, gprn);
+}
+
+static void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn)
+{
+    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
+    spr_read_prev_upper32(ctx, gprn, sprn);
+}
+
+static void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
+    spr_write_prev_upper32(ctx, sprn, gprn);
+}
+#endif
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b319d409c6..dba112087e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4175,43 +4175,6 @@ static void gen_tdi(DisasContext *ctx)
 
 /***                          Processor control                            ***/
 
-static void gen_read_xer(DisasContext *ctx, TCGv dst)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_temp_new();
-    tcg_gen_mov_tl(dst, cpu_xer);
-    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
-    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
-    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
-    tcg_gen_or_tl(t0, t0, t1);
-    tcg_gen_or_tl(dst, dst, t2);
-    tcg_gen_or_tl(dst, dst, t0);
-    if (is_isa300(ctx)) {
-        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
-        tcg_gen_or_tl(dst, dst, t0);
-        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
-        tcg_gen_or_tl(dst, dst, t0);
-    }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-}
-
-static void gen_write_xer(TCGv src)
-{
-    /* Write all flags, while reading back check for isa300 */
-    tcg_gen_andi_tl(cpu_xer, src,
-                    ~((1u << XER_SO) |
-                      (1u << XER_OV) | (1u << XER_OV32) |
-                      (1u << XER_CA) | (1u << XER_CA32)));
-    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
-    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
-    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
-    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
-    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
-}
-
 /* mcrxr */
 static void gen_mcrxr(DisasContext *ctx)
 {
@@ -4299,15 +4262,6 @@ static void gen_mfmsr(DisasContext *ctx)
     tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_msr);
 }
 
-static void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
-{
-#if 0
-    sprn = ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
-    printf("ERROR: try to access SPR %d !\n", sprn);
-#endif
-}
-#define SPR_NOACCESS (&spr_noaccess)
-
 /* mfspr */
 static inline void gen_op_mfspr(DisasContext *ctx)
 {
@@ -7639,6 +7593,7 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
 };
 
 #include "helper_regs.h"
+#include "spr_tcg.c.inc"
 #include "translate_init.c.inc"
 
 /*****************************************************************************/
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 22b23793fd..13ad58863e 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -43,676 +43,8 @@
 #include "qapi/qapi-commands-machine-target.h"
 
 /* #define PPC_DEBUG_SPR */
-/* #define PPC_DUMP_SPR_ACCESSES */
 /* #define USE_APPLE_GDB */
 
-/*
- * Generic callbacks:
- * do nothing but store/retrieve spr value
- */
-static void spr_load_dump_spr(int sprn)
-{
-#ifdef PPC_DUMP_SPR_ACCESSES
-    TCGv_i32 t0 = tcg_const_i32(sprn);
-    gen_helper_load_dump_spr(cpu_env, t0);
-    tcg_temp_free_i32(t0);
-#endif
-}
-
-static void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_load_spr(cpu_gpr[gprn], sprn);
-    spr_load_dump_spr(sprn);
-}
-
-static void spr_store_dump_spr(int sprn)
-{
-#ifdef PPC_DUMP_SPR_ACCESSES
-    TCGv_i32 t0 = tcg_const_i32(sprn);
-    gen_helper_store_dump_spr(cpu_env, t0);
-    tcg_temp_free_i32(t0);
-#endif
-}
-
-static void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_store_spr(sprn, cpu_gpr[gprn]);
-    spr_store_dump_spr(sprn);
-}
-
-#if !defined(CONFIG_USER_ONLY)
-static void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
-{
-#ifdef TARGET_PPC64
-    TCGv t0 = tcg_temp_new();
-    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
-    gen_store_spr(sprn, t0);
-    tcg_temp_free(t0);
-    spr_store_dump_spr(sprn);
-#else
-    spr_write_generic(ctx, sprn, gprn);
-#endif
-}
-
-static void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    gen_load_spr(t0, sprn);
-    tcg_gen_neg_tl(t1, cpu_gpr[gprn]);
-    tcg_gen_and_tl(t0, t0, t1);
-    gen_store_spr(sprn, t0);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
-static void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
-{
-}
-
-#endif
-
-/* SPR common to all PowerPC */
-/* XER */
-static void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_read_xer(ctx, cpu_gpr[gprn]);
-}
-
-static void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_write_xer(cpu_gpr[gprn]);
-}
-
-/* LR */
-static void spr_read_lr(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_lr);
-}
-
-static void spr_write_lr(DisasContext *ctx, int sprn, int gprn)
-{
-    tcg_gen_mov_tl(cpu_lr, cpu_gpr[gprn]);
-}
-
-/* CFAR */
-#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
-static void spr_read_cfar(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_cfar);
-}
-
-static void spr_write_cfar(DisasContext *ctx, int sprn, int gprn)
-{
-    tcg_gen_mov_tl(cpu_cfar, cpu_gpr[gprn]);
-}
-#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
-
-/* CTR */
-static void spr_read_ctr(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_ctr);
-}
-
-static void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
-{
-    tcg_gen_mov_tl(cpu_ctr, cpu_gpr[gprn]);
-}
-
-/* User read access to SPR */
-/* USPRx */
-/* UMMCRx */
-/* UPMCx */
-/* USIA */
-/* UDECR */
-static void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
-}
-
-#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
-static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
-}
-#endif
-
-/* SPR common to all non-embedded PowerPC */
-/* DECR */
-#if !defined(CONFIG_USER_ONLY)
-static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-#endif
-
-/* SPR common to all non-embedded PowerPC, except 601 */
-/* Time base */
-static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
-        gen_stop_exception(ctx);
-    }
-}
-
-ATTRIBUTE_UNUSED
-static void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_helper_load_atbl(cpu_gpr[gprn], cpu_env);
-}
-
-ATTRIBUTE_UNUSED
-static void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_helper_load_atbu(cpu_gpr[gprn], cpu_env);
-}
-
-#if !defined(CONFIG_USER_ONLY)
-static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
-        gen_stop_exception(ctx);
-    }
-}
-
-ATTRIBUTE_UNUSED
-static void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_atbl(cpu_env, cpu_gpr[gprn]);
-}
-
-ATTRIBUTE_UNUSED
-static void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_atbu(cpu_env, cpu_gpr[gprn]);
-}
-
-#if defined(TARGET_PPC64)
-ATTRIBUTE_UNUSED
-static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-/* HDECR */
-static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-#endif
-#endif
-
-#if !defined(CONFIG_USER_ONLY)
-/* IBAT0U...IBAT0U */
-/* IBAT0L...IBAT7L */
-static void spr_read_ibat(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
-                  offsetof(CPUPPCState,
-                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
-}
-
-static void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
-                  offsetof(CPUPPCState,
-                           IBAT[sprn & 1][((sprn - SPR_IBAT4U) / 2) + 4]));
-}
-
-static void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
-    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-static void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
-    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-static void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0L) / 2);
-    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-static void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
-    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-/* DBAT0U...DBAT7U */
-/* DBAT0L...DBAT7L */
-static void spr_read_dbat(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
-                  offsetof(CPUPPCState,
-                           DBAT[sprn & 1][(sprn - SPR_DBAT0U) / 2]));
-}
-
-static void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
-                  offsetof(CPUPPCState,
-                           DBAT[sprn & 1][((sprn - SPR_DBAT4U) / 2) + 4]));
-}
-
-static void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0U) / 2);
-    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-static void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
-    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-static void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0L) / 2);
-    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-static void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
-    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-/* SDR1 */
-static void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_sdr1(cpu_env, cpu_gpr[gprn]);
-}
-
-#if defined(TARGET_PPC64)
-/* 64 bits PowerPC specific SPRs */
-/* PIDR */
-static void spr_write_pidr(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_pidr(cpu_env, cpu_gpr[gprn]);
-}
-
-static void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_lpidr(cpu_env, cpu_gpr[gprn]);
-}
-
-static void spr_read_hior(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, excp_prefix));
-}
-
-static void spr_write_hior(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0x3FFFFF00000ULL);
-    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
-    tcg_temp_free(t0);
-}
-static void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_ptcr(cpu_env, cpu_gpr[gprn]);
-}
-
-static void spr_write_pcr(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_pcr(cpu_env, cpu_gpr[gprn]);
-}
-
-/* DPDES */
-static void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_helper_load_dpdes(cpu_gpr[gprn], cpu_env);
-}
-
-static void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_dpdes(cpu_env, cpu_gpr[gprn]);
-}
-#endif
-#endif
-
-/* PowerPC 601 specific registers */
-/* RTC */
-static void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_helper_load_601_rtcl(cpu_gpr[gprn], cpu_env);
-}
-
-static void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_helper_load_601_rtcu(cpu_gpr[gprn], cpu_env);
-}
-
-#if !defined(CONFIG_USER_ONLY)
-static void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_601_rtcu(cpu_env, cpu_gpr[gprn]);
-}
-
-static void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_601_rtcl(cpu_env, cpu_gpr[gprn]);
-}
-
-static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
-    /* Must stop the translation as endianness may have changed */
-    gen_stop_exception(ctx);
-}
-#endif
-
-/* Unified bats */
-#if !defined(CONFIG_USER_ONLY)
-static void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
-                  offsetof(CPUPPCState,
-                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
-}
-
-static void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
-    gen_helper_store_601_batl(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
-    gen_helper_store_601_batu(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-#endif
-
-/* PowerPC 40x specific registers */
-#if !defined(CONFIG_USER_ONLY)
-static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_store_spr(sprn, cpu_gpr[gprn]);
-    gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
-    /* We must stop translation as we may have rebooted */
-    gen_stop_exception(ctx);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-
-static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
-{
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
-}
-#endif
-
-/* PowerPC 403 specific registers */
-/* PBL1 / PBU1 / PBL2 / PBU2 */
-#if !defined(CONFIG_USER_ONLY)
-static void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
-                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
-}
-
-static void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32(sprn - SPR_403_PBL1);
-    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-static void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xF);
-    gen_store_spr(SPR_PIR, t0);
-    tcg_temp_free(t0);
-}
-#endif
-
-/* SPE specific registers */
-static void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
-{
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    tcg_gen_ld_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
-    tcg_gen_extu_i32_tl(cpu_gpr[gprn], t0);
-    tcg_temp_free_i32(t0);
-}
-
-static void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    tcg_gen_trunc_tl_i32(t0, cpu_gpr[gprn]);
-    tcg_gen_st_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
-    tcg_temp_free_i32(t0);
-}
-
-#if !defined(CONFIG_USER_ONLY)
-/* Callback used to write the exception vector base */
-static void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivpr_mask));
-    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
-    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
-    gen_store_spr(sprn, t0);
-    tcg_temp_free(t0);
-}
-
-static void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
-{
-    int sprn_offs;
-
-    if (sprn >= SPR_BOOKE_IVOR0 && sprn <= SPR_BOOKE_IVOR15) {
-        sprn_offs = sprn - SPR_BOOKE_IVOR0;
-    } else if (sprn >= SPR_BOOKE_IVOR32 && sprn <= SPR_BOOKE_IVOR37) {
-        sprn_offs = sprn - SPR_BOOKE_IVOR32 + 32;
-    } else if (sprn >= SPR_BOOKE_IVOR38 && sprn <= SPR_BOOKE_IVOR42) {
-        sprn_offs = sprn - SPR_BOOKE_IVOR38 + 38;
-    } else {
-        printf("Trying to write an unknown exception vector %d %03x\n",
-               sprn, sprn);
-        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
-        return;
-    }
-
-    TCGv t0 = tcg_temp_new();
-    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivor_mask));
-    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
-    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_offs]));
-    gen_store_spr(sprn, t0);
-    tcg_temp_free(t0);
-}
-#endif
-
 static inline void vscr_init(CPUPPCState *env, uint32_t val)
 {
     /* Altivec always uses round-to-nearest */
@@ -1247,104 +579,6 @@ static void gen_spr_7xx(CPUPPCState *env)
 }
 
 #ifdef TARGET_PPC64
-#ifndef CONFIG_USER_ONLY
-static void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_temp_new();
-
-    /*
-     * Note, the HV=1 PR=0 case is handled earlier by simply using
-     * spr_write_generic for HV mode in the SPR table
-     */
-
-    /* Build insertion mask into t1 based on context */
-    if (ctx->pr) {
-        gen_load_spr(t1, SPR_UAMOR);
-    } else {
-        gen_load_spr(t1, SPR_AMOR);
-    }
-
-    /* Mask new bits into t2 */
-    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
-
-    /* Load AMR and clear new bits in t0 */
-    gen_load_spr(t0, SPR_AMR);
-    tcg_gen_andc_tl(t0, t0, t1);
-
-    /* Or'in new bits and write it out */
-    tcg_gen_or_tl(t0, t0, t2);
-    gen_store_spr(SPR_AMR, t0);
-    spr_store_dump_spr(SPR_AMR);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-}
-
-static void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_temp_new();
-
-    /*
-     * Note, the HV=1 case is handled earlier by simply using
-     * spr_write_generic for HV mode in the SPR table
-     */
-
-    /* Build insertion mask into t1 based on context */
-    gen_load_spr(t1, SPR_AMOR);
-
-    /* Mask new bits into t2 */
-    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
-
-    /* Load AMR and clear new bits in t0 */
-    gen_load_spr(t0, SPR_UAMOR);
-    tcg_gen_andc_tl(t0, t0, t1);
-
-    /* Or'in new bits and write it out */
-    tcg_gen_or_tl(t0, t0, t2);
-    gen_store_spr(SPR_UAMOR, t0);
-    spr_store_dump_spr(SPR_UAMOR);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-}
-
-static void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_temp_new();
-
-    /*
-     * Note, the HV=1 case is handled earlier by simply using
-     * spr_write_generic for HV mode in the SPR table
-     */
-
-    /* Build insertion mask into t1 based on context */
-    gen_load_spr(t1, SPR_AMOR);
-
-    /* Mask new bits into t2 */
-    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
-
-    /* Load AMR and clear new bits in t0 */
-    gen_load_spr(t0, SPR_IAMR);
-    tcg_gen_andc_tl(t0, t0, t1);
-
-    /* Or'in new bits and write it out */
-    tcg_gen_or_tl(t0, t0, t2);
-    gen_store_spr(SPR_IAMR, t0);
-    spr_store_dump_spr(SPR_IAMR);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-}
-#endif /* CONFIG_USER_ONLY */
 
 static void gen_spr_amr(CPUPPCState *env)
 {
@@ -1390,15 +624,6 @@ static void gen_spr_iamr(CPUPPCState *env)
 }
 #endif /* TARGET_PPC64 */
 
-#ifndef CONFIG_USER_ONLY
-static void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_helper_fixup_thrm(cpu_env);
-    gen_load_spr(cpu_gpr[gprn], sprn);
-    spr_load_dump_spr(sprn);
-}
-#endif /* !CONFIG_USER_ONLY */
-
 static void gen_spr_thrm(CPUPPCState *env)
 {
     /* Thermal management */
@@ -1766,57 +991,6 @@ static void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
 #endif
 }
 
-#if !defined(CONFIG_USER_ONLY)
-static void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-
-    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR0_DCE | L1CSR0_CPE);
-    gen_store_spr(sprn, t0);
-    tcg_temp_free(t0);
-}
-
-static void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-
-    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR1_ICE | L1CSR1_CPE);
-    gen_store_spr(sprn, t0);
-    tcg_temp_free(t0);
-}
-
-static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv t0 = tcg_temp_new();
-
-    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
-                    ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_L2LFC));
-    gen_store_spr(sprn, t0);
-    tcg_temp_free(t0);
-}
-
-static void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
-}
-
-static void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 = tcg_const_i32(sprn);
-    gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-static void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_booke_set_eplc(cpu_env, cpu_gpr[gprn]);
-}
-static void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_booke_set_epsc(cpu_env, cpu_gpr[gprn]);
-}
-
-#endif
-
 static void gen_spr_usprg3(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG3, "USPRG3",
@@ -4897,31 +4071,6 @@ POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-static void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv val = tcg_temp_new();
-    tcg_gen_ext32u_tl(val, cpu_gpr[gprn]);
-    gen_store_spr(SPR_BOOKE_MAS3, val);
-    tcg_gen_shri_tl(val, cpu_gpr[gprn], 32);
-    gen_store_spr(SPR_BOOKE_MAS7, val);
-    tcg_temp_free(val);
-}
-
-static void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
-{
-    TCGv mas7 = tcg_temp_new();
-    TCGv mas3 = tcg_temp_new();
-    gen_load_spr(mas7, SPR_BOOKE_MAS7);
-    tcg_gen_shli_tl(mas7, mas7, 32);
-    gen_load_spr(mas3, SPR_BOOKE_MAS3);
-    tcg_gen_or_tl(cpu_gpr[gprn], mas3, mas7);
-    tcg_temp_free(mas3);
-    tcg_temp_free(mas7);
-}
-
-#endif
-
 enum fsl_e500_version {
     fsl_e500v1,
     fsl_e500v2,
@@ -7625,58 +6774,6 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
 #define POWERPC970_HID5_INIT 0x00000000
 #endif
 
-static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
-                                    int bit, int sprn, int cause)
-{
-    TCGv_i32 t1 = tcg_const_i32(bit);
-    TCGv_i32 t2 = tcg_const_i32(sprn);
-    TCGv_i32 t3 = tcg_const_i32(cause);
-
-    gen_helper_fscr_facility_check(cpu_env, t1, t2, t3);
-
-    tcg_temp_free_i32(t3);
-    tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t1);
-}
-
-static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
-                                   int bit, int sprn, int cause)
-{
-    TCGv_i32 t1 = tcg_const_i32(bit);
-    TCGv_i32 t2 = tcg_const_i32(sprn);
-    TCGv_i32 t3 = tcg_const_i32(cause);
-
-    gen_helper_msr_facility_check(cpu_env, t1, t2, t3);
-
-    tcg_temp_free_i32(t3);
-    tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t1);
-}
-
-static void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
-{
-    TCGv spr_up = tcg_temp_new();
-    TCGv spr = tcg_temp_new();
-
-    gen_load_spr(spr, sprn - 1);
-    tcg_gen_shri_tl(spr_up, spr, 32);
-    tcg_gen_ext32u_tl(cpu_gpr[gprn], spr_up);
-
-    tcg_temp_free(spr);
-    tcg_temp_free(spr_up);
-}
-
-static void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv spr = tcg_temp_new();
-
-    gen_load_spr(spr, sprn - 1);
-    tcg_gen_deposit_tl(spr, spr, cpu_gpr[gprn], 32, 32);
-    gen_store_spr(sprn - 1, spr);
-
-    tcg_temp_free(spr);
-}
-
 static int check_pow_970(CPUPPCState *env)
 {
     if (env->spr[SPR_HID0] & (HID0_DEEPNAP | HID0_DOZE | HID0_NAP)) {
@@ -7976,24 +7073,6 @@ static void gen_spr_power5p_tb(CPUPPCState *env)
                     0x00000000);
 }
 
-#if !defined(CONFIG_USER_ONLY)
-static void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv hmer = tcg_temp_new();
-
-    gen_load_spr(hmer, sprn);
-    tcg_gen_and_tl(hmer, cpu_gpr[gprn], hmer);
-    gen_store_spr(sprn, hmer);
-    spr_store_dump_spr(sprn);
-    tcg_temp_free(hmer);
-}
-
-static void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
-}
-#endif /* !defined(CONFIG_USER_ONLY) */
-
 static void gen_spr_970_lpar(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -8191,18 +7270,6 @@ static void gen_spr_power6_common(CPUPPCState *env)
                  0x00000000);
 }
 
-static void spr_read_tar(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
-    spr_read_generic(ctx, gprn, sprn);
-}
-
-static void spr_write_tar(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
-    spr_write_generic(ctx, sprn, gprn);
-}
-
 static void gen_spr_power8_tce_address_control(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_TAR, "TAR",
@@ -8211,30 +7278,6 @@ static void gen_spr_power8_tce_address_control(CPUPPCState *env)
                      KVM_REG_PPC_TAR, 0x00000000);
 }
 
-static void spr_read_tm(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
-    spr_read_generic(ctx, gprn, sprn);
-}
-
-static void spr_write_tm(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
-    spr_write_generic(ctx, sprn, gprn);
-}
-
-static void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
-    spr_read_prev_upper32(ctx, gprn, sprn);
-}
-
-static void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
-    spr_write_prev_upper32(ctx, sprn, gprn);
-}
-
 static void gen_spr_power8_tm(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_TFHAR, "TFHAR",
@@ -8255,30 +7298,6 @@ static void gen_spr_power8_tm(CPUPPCState *env)
                  0x00000000);
 }
 
-static void spr_read_ebb(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
-    spr_read_generic(ctx, gprn, sprn);
-}
-
-static void spr_write_ebb(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
-    spr_write_generic(ctx, sprn, gprn);
-}
-
-static void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
-    spr_read_prev_upper32(ctx, gprn, sprn);
-}
-
-static void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
-    spr_write_prev_upper32(ctx, sprn, gprn);
-}
-
 static void gen_spr_power8_ebb(CPUPPCState *env)
 {
     spr_register(env, SPR_BESCRS, "BESCRS",
-- 
2.17.1


