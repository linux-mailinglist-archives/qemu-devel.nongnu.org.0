Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE63F50BD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:50:19 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIF1X-0006J5-1A
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuU-0000Zi-P3
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:43:02 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:35429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuQ-0004TN-Up
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:43:02 -0400
Received: by mail-lf1-x134.google.com with SMTP id i28so39901272lfl.2
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qCJPHfJc2PdXFUog78wZ71Lnp65SMLGeF/rw+aiaCVU=;
 b=aKieOs3LYGA/F1UeF1OYkd39RyKHfj7lLQm46LpXWBFBkwGLcBnavx1x65LAFbxSse
 /6fXDvgC4tMkiMpekOX9/yz6x8oP5MbON/0gXpfy6fEdfaWjXaP/PH6YQeYCXt+Mqru2
 UHEDg6PSQy3STWI/nbes9pDB0AhytSV1ItudozcAULmvJHXWj+HDOfwGTHIqdKvPBN7G
 DWqQHbzc+moWBYMdHrXEBcEKwWi/OVhSaJkivgc59J8AwFX39gn1ytENc6JePGitkiXk
 ljBEIH5lPuLOcb1MBE9fCtIN4piP3/peTdDmgAPF5fGRTOBK+ErjQXFBjil267ubNAHG
 3uPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qCJPHfJc2PdXFUog78wZ71Lnp65SMLGeF/rw+aiaCVU=;
 b=P15Hzd1PrxYK2kaJxcm1URB/zG/ZXk0y1ZeelZuf8ZDIbOuTs2I/cZoil1uF6ZiYgY
 ApWQs6Zek4r9lIvkr2kF/FFd7NEdeQ+crZQEob3gsdmKcSvT7cG7uarQ7cfldx6f/Ovt
 +GckpkbiVn4mP8JLgC2zxVTbw4mQQ7Eyn0zP7Kk7opLl2UDlzMmIJ8ngo8SgwLSCMxC2
 Fca1I89JJyy75QrXBCrJbi80yAaIjX5H5S32pDSf3fgB8xJ1kfJ+yFAGA6gypYV4rQ0W
 vmv0Fm5nf9gerUbtVfEzRb0fAsLNCVtCn8sE4CiUcrIjlAdd+IPB4YvXrWKktXrElG8N
 mPOg==
X-Gm-Message-State: AOAM530Jp65OjnWrxtkQhASoCY1+vkq3EE5L55l8JiybF9G7MfvIWrzp
 RQgiCHjPIEj9PQerwvXVgTkO9BK+I3vqdCVZ
X-Google-Smtp-Source: ABdhPJxrUiP4WL2ZbqbqNmK/5ohO47KTYA19FiMbmGnIPzUO+PedNiB4Zf6L8H4FUkYTmd7RepjMbg==
X-Received: by 2002:a05:6512:3e26:: with SMTP id
 i38mr26714148lfv.29.1629744177023; 
 Mon, 23 Aug 2021 11:42:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 25sm1443794ljw.31.2021.08.23.11.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:42:56 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/14] target/riscv: Add instructions of the Zbc-extension
Date: Mon, 23 Aug 2021 20:42:41 +0200
Message-Id: <20210823184248.2209614-8-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
References: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x134.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
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

Changes in v5:
- Introduce gen_clmulh (as suggested by Richard H) and use to simplify
  trans_clmulh().

Changes in v3:
- This adds the Zbc instructions as a spearate commit.
- Uses a helper for clmul/clmulr instead of inlining the calculation of
  the result (addressing a comment from Richard Henderson).

 target/riscv/bitmanip_helper.c          | 27 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  5 +++++
 target/riscv/insn_trans/trans_rvb.c.inc | 27 ++++++++++++++++++++++++-
 target/riscv/translate.c                |  6 ++++++
 5 files changed, 66 insertions(+), 1 deletion(-)

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
index 21d713df27..89700117c4 100644
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
@@ -357,3 +363,22 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
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
+
+static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, gen_clmulh);
+}
+
+static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, gen_helper_clmulr);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fc22ae82d0..32a067dcd2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -739,6 +739,12 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_add_tl(ret, arg1, arg2);
 }
 
+static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
+{
+     gen_helper_clmulr(dst, src1, src2);
+     tcg_gen_shri_tl(dst, dst, 1);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.25.1


