Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526A3F504C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:21:42 +0200 (CEST)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEZp-0004wf-3z
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQJ-0006UD-98
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:51 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQB-0008MW-2e
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:50 -0400
Received: by mail-lf1-x12d.google.com with SMTP id p38so39797439lfa.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wsJr9nLoFEUekZ/kqHAsJpheTUl+lfs51E+CUbk0OEo=;
 b=jehntlGMahCyn0JXqk8IuovNMKvJOA69DrY5BhuzyMPBRnsC0mdzZ0rRBGLbPAzZbi
 YYwkRW2FSGMMsml9AdYJkc50KxgbTusnYEyip7NgyUnd7SUOj8l9Nk9k1x4JO2jRUKR0
 13WhUfgJV1v4rmTPIMJpeXgueYO1DCwmdfo5f4C1NxXxZ8u8fKrNBxMmp1f3betQTQ0m
 GEI7tdX0lz5nubLJvX+f9q3KFPzF1bIgTJub9JthmQK0AqtJXkKEtaTKDlf06YEqOUN4
 2plt6Zd7dnasTQUh9EZEkRBx4dWPPhxqNddlLDKmlg25qG+KGvd2ae8HHnq4gw4rlKsf
 CnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wsJr9nLoFEUekZ/kqHAsJpheTUl+lfs51E+CUbk0OEo=;
 b=sPVzlZDnNOXxOR6k3bjMWGKKKYPAv6KXvQ3/iSU8MW31+LDav5dth/I14FUSslOX6C
 WtGCtuyiyGG91v1nJr9kfp4h67gPVrxf5xDCn581bE6/yvXuxxUNo3TKBMCZpTAmJDlu
 W3h7DeFmGUWGtMFxp6q+4OgYMmpjRB4r7iy/sybqCioosL1F38TT865zVzUXsncfl3yV
 ApGzCoH4HhBDvKc5NcbGzJ9KfN0X3p3pPh+XE1uMCynRhtEYC7icXFxqJD1082jbas9T
 cFLQf8kJFt9PMEZ8rkBkjuOHJCJW26HG2pqw48AVu6DqejfAyRqIkm4fE+VGRE1wdEyM
 DPEA==
X-Gm-Message-State: AOAM532qaU/WzKaBLgMRrqgiJ7xdULCFBsHiiJGvQTovUy2SEoJ8x+ir
 CHM5NvXdMOQS0/H+FTpZMRzH1U7sEEBDrNAR
X-Google-Smtp-Source: ABdhPJzbVjvCkjIXCglLFcTM9yDpID8N32mj/Ek77Xen1OlE36GJBuJwJVCqvc6uuqCcAdlFnmazXw==
X-Received: by 2002:a05:6512:a8f:: with SMTP id
 m15mr25627255lfu.1.1629742301363; 
 Mon, 23 Aug 2021 11:11:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id w26sm1511739lfk.223.2021.08.23.11.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:11:41 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/14] target/riscv: Add instructions of the Zbc-extension
Date: Mon, 23 Aug 2021 20:11:25 +0200
Message-Id: <20210823181132.2205367-8-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
References: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following instructions are part of Zbc:
 - clmul
 - clmulh
 - clmulr

Note that these instructions were already defined in the pre-0.93 and
the 0.93 draft-B proposals, but had not been omitted in the earlier
addition of draft-B to QEmu.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

(no changes since v3)

Changes in v3:
- This adds the Zbc instructions as a spearate commit.
- Uses a helper for clmul/clmulr instead of inlining the calculation of
  the result (addressing a comment from Richard Henderson).

 target/riscv/bitmanip_helper.c          | 27 ++++++++++++++++++
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  5 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 37 ++++++++++++++++++++++++-
 4 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index 5b2f795d03..73be5a81c7 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
+ * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -88,3 +89,29 @@ target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
 {
     return do_gorc(rs1, rs2, 32);
 }
+
+target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
+{
+    target_ulong result = 0;
+
+    for (int i = 0; i < TARGET_LONG_BITS; i++) {
+        if ((rs2 >> i) & 1) {
+            result ^= (rs1 << i);
+        }
+    }
+
+    return result;
+}
+
+target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
+{
+    target_ulong result = 0;
+
+    for (int i = 0; i < TARGET_LONG_BITS; i++) {
+        if ((rs2 >> i) & 1) {
+            result ^= (rs1 >> (TARGET_LONG_BITS - i - 1));
+        }
+    }
+
+    return result;
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 415e37bc37..c559c860a7 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -63,6 +63,8 @@ DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
 DEF_HELPER_3(csrrw, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1166e7f648..04711111c8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -713,6 +713,11 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
 
+# *** RV32 Zbc Standard Extension ***
+clmul      0000101 .......... 001 ..... 0110011 @r
+clmulh     0000101 .......... 011 ..... 0110011 @r
+clmulr     0000101 .......... 010 ..... 0110011 @r
+
 # *** RV32 Zbs Standard Extension ***
 bclr       0100100 .......... 001 ..... 0110011 @r
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 21d713df27..92c31ea1e6 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the RVB draft Zb[as] Standard Extension.
+ * RISC-V translation routines for the Zb[acs] Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -24,6 +24,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_ZBC(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_ZBS(ctx) do {                    \
     if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
         return false;                            \
@@ -357,3 +363,32 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
     tcg_temp_free(source1);
     return true;
 }
+
+static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, gen_helper_clmul);
+}
+
+static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
+{
+    REQUIRE_ZBC(ctx);
+
+    /* Perform a clmulr ... */
+    gen_arith(ctx, a, gen_helper_clmulr);
+
+    /* ... then shift the result 1 bit to the right. */
+    TCGv dst = tcg_temp_new();
+    gen_get_gpr(dst, a->rd);
+    tcg_gen_shri_tl(dst, dst, 1);
+    gen_set_gpr(a->rd, dst);
+    tcg_temp_free(dst);
+
+    return true;
+}
+
+static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, gen_helper_clmulr);
+}
-- 
2.25.1


