Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E692DB8DF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:18:46 +0100 (CET)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMOr-00049e-9M
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBK-00014t-Lp
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:48 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMB5-0001Aw-Bq
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:46 -0500
Received: by mail-pl1-x632.google.com with SMTP id e2so4896012plt.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6Kmnbl2LvKvDg+RA+K4UFMXnMd4G2mem+SvR6N8NTDE=;
 b=HgzaWgAzeIqbOSZU08q/In/A3i0qW+y3OTMv98fFKAo+bxWXdw37cDbGd++2j+7tSK
 0oze3H7S66qG2p1E25Y9TIq8//f4WwjY84mHF3YKZ3HvfUSJr2UKZ9TzWEzOcN+h33tQ
 af3CqGkjdrBU+DPow2b0jCjWYMCHVuLAHgw5MBqiOFRPjWu8N9ATPkp67/r8Wn4R51dC
 h6A9BQQqayodKiV3AqYTVwSKREQnghMZ9RE248b9V/nWzLv/n+DxnEvlVCrthnIfroxM
 QCHoNBG91nuz8qKcLL8SiHhIcZHsjFyeerqBkbbUzP+fAIH5pujgRLLFjxra3W1osYFl
 bvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6Kmnbl2LvKvDg+RA+K4UFMXnMd4G2mem+SvR6N8NTDE=;
 b=LQkFdYsKuNBCZCkU03cD24AyfC1mDZH7PTh7Mj679IFjzrCRyp/lnJmH90eGoQGHvS
 jqEw5OKOR+laimZZu2Fg/QRemh+oQPkGF/xf7gGYocop+icsqwNq7jFseOJqtOGGQiva
 XOW3KDpLkRzK6SgO1vO1dSs2qomH8R9rSWWf6uiY4PZuG8iosUQ4TVv6pgXi+Pq8fdTP
 ONWjur/tvN9DKPZE6AzQ/VDDQ7z15pwsq4nVT004UFdTE24AkfwQDu5LmJOFQdgRt6ew
 1p3tSZWBAoNN0rZMgQPHzZJkoWzC1DeqJWXP5jzPs+KNZ791XNSZFi5CoatnvDMccOqG
 U68w==
X-Gm-Message-State: AOAM532z7BMkn+G8vQlUTHEKAeac72lABCAsXmuXTuFXB/CECcgGmkBo
 sntQ6YMfcivK1dY2zwHPMxBil0N76eqYKp1igUo=
X-Google-Smtp-Source: ABdhPJxkaSVpZO+zMYyStO5YZzrb0e+eir1WbogcH5dtvgmq8N2pfj1nuVPhurHtEOJbhHv8rM3s3A==
X-Received: by 2002:a17:90a:f0ce:: with SMTP id
 fa14mr1217193pjb.156.1608084269660; 
 Tue, 15 Dec 2020 18:04:29 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:04:29 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 11/15] target/riscv: rvb: generalized reverse
Date: Wed, 16 Dec 2020 10:01:36 +0800
Message-Id: <20201216020150.3157-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/bitmanip_helper.c          | 72 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  7 +++
 target/riscv/insn32-64.decode           |  2 +
 target/riscv/insn32.decode              |  2 +
 target/riscv/insn_trans/trans_rvb.c.inc | 34 ++++++++++++
 target/riscv/meson.build                |  1 +
 target/riscv/translate.c                | 32 +++++++++++
 7 files changed, 150 insertions(+)
 create mode 100644 target/riscv/bitmanip_helper.c

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
new file mode 100644
index 00000000000..716d80aab59
--- /dev/null
+++ b/target/riscv/bitmanip_helper.c
@@ -0,0 +1,72 @@
+/*
+ * RISC-V Bitmanip Extension Helpers for QEMU.
+ *
+ * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
+ * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
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
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "tcg/tcg.h"
+
+static const uint64_t adjacent_masks[] = {
+    dup_const(MO_8, 0x55),
+    dup_const(MO_8, 0x33),
+    dup_const(MO_8, 0x0f),
+    dup_const(MO_16, 0xff),
+    dup_const(MO_32, 0xffff),
+#ifdef TARGET_RISCV64
+    UINT32_MAX
+#endif
+};
+
+static inline target_ulong do_swap(target_ulong x, uint64_t mask, int shift)
+{
+    return ((x & mask) << shift) | ((x & ~mask) >> shift);
+}
+
+static target_ulong do_grev(target_ulong rs1,
+                            target_ulong rs2,
+                            int bits)
+{
+    target_ulong x = rs1;
+    int i, shift;
+
+    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
+        if (rs2 & shift) {
+            x = do_swap(x, adjacent_masks[i], shift);
+        }
+    }
+
+    return x;
+}
+
+target_ulong HELPER(grev)(target_ulong rs1, target_ulong rs2)
+{
+    return do_grev(rs1, rs2, TARGET_LONG_BITS);
+}
+
+/* RV64-only instruction */
+#ifdef TARGET_RISCV64
+
+target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_grev(rs1, rs2, 32);
+}
+
+#endif
+
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 939731c345d..a055c539fad 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -66,6 +66,13 @@ DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
 #endif
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
+/* Bitmanip */
+DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+
+#if defined(TARGET_RISCV64)
+DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#endif
+
 /* Special functions */
 DEF_HELPER_3(csrrw, tl, env, tl, tl)
 DEF_HELPER_4(csrrs, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index ac0634d754a..a355b91e399 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -102,6 +102,7 @@ slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
+grevw      0110100 .......... 101 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
@@ -109,3 +110,4 @@ sbinviw    0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
+greviw     0110100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b4677293582..fd8f4238ef7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -619,6 +619,7 @@ slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
+grev       0110100 .......... 101 ..... 0110011 @r
 
 sbseti     00101. ........... 001 ..... 0010011 @sh
 sbclri     01001. ........... 001 ..... 0010011 @sh
@@ -627,3 +628,4 @@ sbexti     01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
+grevi      01101. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 433cc7f9fc8..142e9123d68 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -219,6 +219,23 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_arith(ctx, a, &tcg_gen_rotl_tl);
 }
 
+static bool trans_grev(DisasContext *ctx, arg_grev *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, &gen_helper_grev);
+}
+
+static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_grevi(ctx, a);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -350,4 +367,21 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     return gen_shiftw(ctx, a, &gen_rolw);
 }
 
+static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_grevw);
+}
+
+static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= 32) {
+        return false;
+    }
+
+    return gen_shiftiw(ctx, a, &gen_grevw);
+}
+
 #endif
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 14a5c62dace..de530298454 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -21,6 +21,7 @@ riscv_ss.add(files(
   'gdbstub.c',
   'op_helper.c',
   'vector_helper.c',
+  'bitmanip_helper.c',
   'translate.c',
 ))
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 10b4142a3ab..b40d170c01b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -811,6 +811,32 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_not_tl(ret, ret);
 }
 
+static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2;
+
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt == (TARGET_LONG_BITS - 8)) {
+        /* rev8, byte swaps */
+#ifdef TARGET_RISCV32
+        tcg_gen_bswap32_tl(source1, source1);
+#else
+        tcg_gen_bswap64_tl(source1, source1);
+#endif
+    } else {
+        source2 = tcg_temp_new();
+        tcg_gen_movi_tl(source2, a->shamt);
+        gen_helper_grev(source1, source1, source2);
+        tcg_temp_free(source2);
+    }
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -885,6 +911,12 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free_i32(t2);
 }
 
+static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_grev(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


