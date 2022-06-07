Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16F353F9EB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:36:08 +0200 (CEST)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVdA-0002DG-1c
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nyV47-0007OA-An
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:59:59 -0400
Received: from mail.ispras.ru ([83.149.199.84]:39584)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nyV45-0005Ni-7A
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:59:55 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 851254142B44;
 Tue,  7 Jun 2022 08:59:30 +0000 (UTC)
Subject: [PATCH 3/3] target/mips: implement Octeon-specific arithmetic
 instructions
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 aurelien@aurel32.net, aleksandar.rikalo@syrmia.com
Date: Tue, 07 Jun 2022 11:59:30 +0300
Message-ID: <165459237035.143371.5795143736970750111.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165459235408.143371.17715826203190085295.stgit@pasha-ThinkPad-X280>
References: <165459235408.143371.17715826203190085295.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements several Octeon-specific instructions:
- BADDU
- DMUL
- EXTS/EXTS32
- CINS/CINS32
- POP/DPOP
- SEQ/SEQI
- SNE/SNEI

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 target/mips/helper.h                |    1 
 target/mips/tcg/meson.build         |    1 
 target/mips/tcg/octeon.decode       |   25 +++++
 target/mips/tcg/octeon_helper.c     |   22 ++++
 target/mips/tcg/octeon_helper.h.inc |   10 ++
 target/mips/tcg/octeon_translate.c  |  182 +++++++++++++++++++++++++++++++++++
 6 files changed, 241 insertions(+)
 create mode 100644 target/mips/tcg/octeon_helper.c
 create mode 100644 target/mips/tcg/octeon_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index de32d82e98..d68abdeac1 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -597,3 +597,4 @@ DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
 
 /* Vendor extensions */
 #include "tcg/vr54xx_helper.h.inc"
+#include "tcg/octeon_helper.h.inc"
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index 7ee969ec8f..1852366846 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -26,6 +26,7 @@ mips_ss.add(files(
 mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
   'octeon_translate.c',
+  'octeon_helper.c',
 ), if_false: files(
   'mxu_translate.c',
 ))
diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
index c06d576292..ababf59e42 100644
--- a/target/mips/tcg/octeon.decode
+++ b/target/mips/tcg/octeon.decode
@@ -12,3 +12,28 @@
 # BBIT132    111110 ..... ..... ................
 
 BBIT         11 set:1 shift:1 10 rs:5 p:5 offset:16
+
+# Arithmetic
+# BADDU rd, rs, rt
+# DMUL rd, rs, rt
+# EXTS rt, rs, p, lenm1
+# EXTS32 rt, rs, p, lenm1
+# CINS rt, rs, p, lenm1
+# CINS32 rt, rs, p, lenm1
+# DPOP rd, rs
+# POP rd, rs
+# SEQ rd, rs, rt
+# SEQI rt, rs, immediate
+# SNE rd, rs, rt
+# SNEI rt, rs, immediate
+
+@r3          ...... rs:5 rt:5 rd:5 ..... ......
+@bitfield    ...... rs:5 rt:5 lenm1:5 p:5 ..... shift:1
+
+BADDU        011100 ..... ..... ..... 00000 101000 @r3
+DMUL         011100 ..... ..... ..... 00000 000011 @r3
+EXTS         011100 ..... ..... ..... ..... 11101 . @bitfield
+CINS         011100 ..... ..... ..... ..... 11001 . @bitfield
+POP          011100 rs:5 00000 rd:5 00000 10110 dw:1
+SEQNE        011100 rs:5 rt:5 rd:5 00000 10101 ne:1
+SEQNEI       011100 rs:5 rt:5 imm:s10 10111 ne:1
diff --git a/target/mips/tcg/octeon_helper.c b/target/mips/tcg/octeon_helper.c
new file mode 100644
index 0000000000..e9650c58bd
--- /dev/null
+++ b/target/mips/tcg/octeon_helper.c
@@ -0,0 +1,22 @@
+/*
+ *  MIPS Octeon emulation helpers
+ *
+ *  Copyright (c) 2022 Pavel Dovgalyuk
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+
+target_ulong helper_pop(target_ulong arg)
+{
+    int i;
+    int res = 0;
+    for (i = 0 ; i < 64 ; ++i) {
+        res += arg & 1;
+        arg >>= 1;
+    }
+
+    return res;
+}
diff --git a/target/mips/tcg/octeon_helper.h.inc b/target/mips/tcg/octeon_helper.h.inc
new file mode 100644
index 0000000000..cfc051ef47
--- /dev/null
+++ b/target/mips/tcg/octeon_helper.h.inc
@@ -0,0 +1,10 @@
+/*
+ *  MIPS Octeon emulation helpers
+ *
+ *  Copyright (c) 2022 Pavel Dovgalyuk
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#if defined(TARGET_MIPS64)
+DEF_HELPER_1(pop, tl, tl)
+#endif
diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index bd87066b01..c4ef3e5bcb 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -51,3 +51,185 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
     tcg_temp_free(t0);
     return true;
 }
+
+static bool trans_BADDU(DisasContext *ctx, arg_BADDU *a)
+{
+    TCGv t0, t1;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    tcg_gen_add_tl(t0, t0, t1);
+    tcg_gen_andi_i64(cpu_gpr[a->rd], t0, 0xff);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_DMUL(DisasContext *ctx, arg_DMUL *a)
+{
+    TCGv t0, t1;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
+{
+    TCGv t0, t1;
+    int p;
+    TCGLabel *l1;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    p = a->p;
+    if (a->shift) {
+        p += 32;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t1, a->rs);
+
+    tcg_gen_movi_tl(t0, ((1ULL << (a->lenm1 + 1)) - 1) << p);
+    tcg_gen_and_tl(t1, t1, t0);
+    tcg_gen_movi_tl(t0, p);
+    tcg_gen_shr_tl(cpu_gpr[a->rt], t1, t0);
+
+    l1 = gen_new_label();
+    tcg_gen_movi_tl(t0, 1ULL << a->lenm1);
+    tcg_gen_and_tl(t0, cpu_gpr[a->rt], t0);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, t0, 0, l1);
+    tcg_gen_movi_tl(t0, ~((1ULL << (a->lenm1 + 1)) - 1));
+    tcg_gen_or_tl(cpu_gpr[a->rt], cpu_gpr[a->rt], t0);
+    gen_set_label(l1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_CINS(DisasContext *ctx, arg_CINS *a)
+{
+    TCGv t0, t1;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t1, a->rs);
+
+    tcg_gen_movi_tl(t0, (1ULL << (a->lenm1 + 1)) - 1);
+    tcg_gen_and_tl(t1, t1, t0);
+    tcg_gen_movi_tl(t0, a->p + a->shift ? 32 : 0);
+    tcg_gen_shl_tl(cpu_gpr[a->rt], t1, t0);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_POP(DisasContext *ctx, arg_POP *a)
+{
+    TCGv t0;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    if (!a->dw) {
+        tcg_gen_andi_i64(t0, t0, 0xffffffff);
+    }
+    gen_helper_pop(cpu_gpr[a->rd], t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_SEQNE(DisasContext *ctx, arg_SEQNE *a)
+{
+    TCGv t0, t1;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    if (a->ne) {
+        tcg_gen_setcond_tl(TCG_COND_NE, cpu_gpr[a->rd], t1, t0);
+    } else {
+        tcg_gen_setcond_tl(TCG_COND_EQ, cpu_gpr[a->rd], t1, t0);
+    }
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_SEQNEI(DisasContext *ctx, arg_SEQNEI *a)
+{
+    TCGv t0;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rs);
+
+    /* Sign-extend to 64 bit value */
+    target_ulong imm = a->imm;
+    if (a->ne) {
+        tcg_gen_setcondi_tl(TCG_COND_NE, cpu_gpr[a->rt], t0, imm);
+    } else {
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_gpr[a->rt], t0, imm);
+    }
+
+    tcg_temp_free(t0);
+
+    return true;
+}


