Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B3C201927
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 19:16:09 +0200 (CEST)
Received: from localhost ([::1]:35710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmKca-0003wC-Lq
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 13:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUU-00014n-U2
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:46 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUS-0004Pg-GX
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1592586464; x=1624122464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iMetX1AG2MztuekpTz0Vq0px5OhOLtHAmGALKic8XNY=;
 b=IZ/SvfJozdZxfvFZkBqgCnWsM5rMHHUWUIyB38/0MwXpIaPqUr85hsFc
 8PaDzXjcD+2gw5Q5Ygc4ptZJxYstBSDBNNJTxA6qtumLfvVryqcc4LGKa
 Qs97cS4kfVl5Ak87gMEQz8/SK7YEbRJUJStbb2TxF8WEODj1uTfzrgKYe
 PXIplDkV9r10eFzsGcSxq1bVW6C6xis1MtBHWa5p11bt/Nx8PKBeM0bps
 WNe6aiunp/6tp3vcDr5yLyvPclQDd0unSPiDIJKgJNEDzPyyzIBzxfwtH
 C485AFnWm7m7MwF9VEPuRSW/2NtQc9VD8Boh897HdsotIlkxyWoKxBZLQ w==;
IronPort-SDR: vjL4C5KfdG0f5x5pS78Yedp62UPCQ1k5B9f6JHEJdbPSC+SM762C73W4Jeb43ksouHcqNy15dA
 OzWsg1J0OKo6/j6e2L/ek+TSR/0AoaN8tcWHqe61CUSO7nLX7EEADAQ17RnkUVt1wEj5NZX5bC
 0gz2c1+aj7XnyGp4Hl4gWjUuK6LrO0/aGhYVGbUv3e+dYfz5bhoEtJCGL2aL5fZ91GWFvwlf8S
 cMKcZ3EFIMrZwR+rxWDVH/rVv4RF57q6z2nu3qBgZxTpEehOVhuhsphioGTNLjrZS8UbYBsL2v
 mvs=
X-IronPort-AV: E=Sophos;i="5.75,256,1589212800"; d="scan'208";a="144763324"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2020 01:07:23 +0800
IronPort-SDR: k/e2Fo1zYhOfmYYXZ/u6nPpTsflTbQKoKNAKgLdw1YtNy3+oCanjotWjM5ubiuNYRFzhqgACNn
 O0oUg6nHi5guVCh5WlO0GDxb1Tjv280sw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 09:56:00 -0700
IronPort-SDR: Ix1sDtiV53FPXYJwDGIvUmb/V9i0v67T11Ew2TmBf5iqKoHHrJvjxwtMTutiGdZtddXzGAfKDd
 E02lbLEhVN0A==
WDCIronportException: Internal
Received: from unknown (HELO risc6-mainframe.hgst.com) ([10.86.58.142])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Jun 2020 10:07:23 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 09/32] target/riscv: Move the hfence instructions to the rvh
 decode
Date: Fri, 19 Jun 2020 09:57:54 -0700
Message-Id: <20200619165817.4144200-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619165817.4144200-1-alistair.francis@wdc.com>
References: <20200619165817.4144200-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=4324eb4de=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 13:07:21
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also correct the name of the VVMA instruction.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode                    |  8 ++-
 .../riscv/insn_trans/trans_privileged.inc.c   | 38 -------------
 target/riscv/insn_trans/trans_rvh.inc.c       | 57 +++++++++++++++++++
 target/riscv/translate.c                      |  1 +
 4 files changed, 63 insertions(+), 41 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvh.inc.c

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b883672e63..4c8d1215ce 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -64,7 +64,7 @@
 @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
-@hfence_bvma ....... ..... .....   ... ..... ....... %rs2 %rs1
+@hfence_vvma ....... ..... .....   ... ..... ....... %rs2 %rs1
 
 @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
@@ -77,8 +77,6 @@ uret        0000000    00010 00000 000 00000 1110011
 sret        0001000    00010 00000 000 00000 1110011
 mret        0011000    00010 00000 000 00000 1110011
 wfi         0001000    00101 00000 000 00000 1110011
-hfence_gvma 0110001    ..... ..... 000 00000 1110011 @hfence_gvma
-hfence_bvma 0010001    ..... ..... 000 00000 1110011 @hfence_bvma
 sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
 sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
@@ -207,3 +205,7 @@ fcvt_w_d   1100001  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_wu_d  1100001  00001 ..... ... ..... 1010011 @r2_rm
 fcvt_d_w   1101001  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_d_wu  1101001  00001 ..... ... ..... 1010011 @r2_rm
+
+# *** RV32H Base Instruction Set ***
+hfence_gvma 0110001  .....  ..... 000 00000 1110011 @hfence_gvma
+hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index 5f26e0f5ea..2a61a853bf 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -95,41 +95,3 @@ static bool trans_sfence_vm(DisasContext *ctx, arg_sfence_vm *a)
 {
     return false;
 }
-
-static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
-{
-#ifndef CONFIG_USER_ONLY
-    if (has_ext(ctx, RVH)) {
-        /* Hpervisor extensions exist */
-        /*
-         * if (env->priv == PRV_M ||
-         *   (env->priv == PRV_S &&
-         *    !riscv_cpu_virt_enabled(env) &&
-         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
-         */
-            gen_helper_tlb_flush(cpu_env);
-            return true;
-        /* } */
-    }
-#endif
-    return false;
-}
-
-static bool trans_hfence_bvma(DisasContext *ctx, arg_sfence_vma *a)
-{
-#ifndef CONFIG_USER_ONLY
-    if (has_ext(ctx, RVH)) {
-        /* Hpervisor extensions exist */
-        /*
-         * if (env->priv == PRV_M ||
-         *   (env->priv == PRV_S &&
-         *    !riscv_cpu_virt_enabled(env) &&
-         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
-         */
-            gen_helper_tlb_flush(cpu_env);
-            return true;
-        /* } */
-    }
-#endif
-    return false;
-}
diff --git a/target/riscv/insn_trans/trans_rvh.inc.c b/target/riscv/insn_trans/trans_rvh.inc.c
new file mode 100644
index 0000000000..2c0359819d
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvh.inc.c
@@ -0,0 +1,57 @@
+/*
+ * RISC-V translation routines for the RVXI Base Integer Instruction Set.
+ *
+ * Copyright (c) 2020 Western Digital
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
+        has_ext(ctx, RVH)) {
+        /* Hpervisor extensions exist */
+        /*
+         * if (env->priv == PRV_M ||
+         *   (env->priv == PRV_S &&
+         *    !riscv_cpu_virt_enabled(env) &&
+         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
+         */
+            gen_helper_tlb_flush(cpu_env);
+            return true;
+        /* } */
+    }
+#endif
+    return false;
+}
+
+static bool trans_hfence_vvma(DisasContext *ctx, arg_sfence_vma *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
+        has_ext(ctx, RVH)) {
+        /* Hpervisor extensions exist */
+        /*
+         * if (env->priv == PRV_M ||
+         *   (env->priv == PRV_S &&
+         *    !riscv_cpu_virt_enabled(env) &&
+         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
+         */
+            gen_helper_tlb_flush(cpu_env);
+            return true;
+        /* } */
+    }
+#endif
+    return false;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 43bf7e39a6..ce71ca7a92 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -711,6 +711,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 #include "insn_trans/trans_rva.inc.c"
 #include "insn_trans/trans_rvf.inc.c"
 #include "insn_trans/trans_rvd.inc.c"
+#include "insn_trans/trans_rvh.inc.c"
 #include "insn_trans/trans_privileged.inc.c"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.27.0


