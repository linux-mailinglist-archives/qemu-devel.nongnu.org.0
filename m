Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12CA4003DB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:08:33 +0200 (CEST)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCg4-0001pB-Qd
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCZ1-0007PG-TX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:15 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCYy-00053o-GO
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:15 -0400
Received: by mail-lf1-x132.google.com with SMTP id l10so12990125lfg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pxdueKs5pACRF4frC+TAZoaDfUvLv6Pw06AO0YA55Iw=;
 b=mm6Obmv8xbkfEPsGXZOUFzk3uB70ouVZvmsHc07GxVyY26XeyL6aKaiZnwBW8AWyOx
 mGeXdtsZexCzMDOuAleFT8zbtsyMwUQT1HDVSs7VaW3EFcC36aZXDyycOArGffnnjWsg
 UXRSxKmUbfOQhPMC14Q9Pc3mhh3YrBocntPZqQhInZuYV71w7gU8e36yyqyc180amjzg
 cdwgdAeUp6ywKO67RWPDN3u0wUpFb8qzvNxcEesNeoDYyEK03ZUcQpoPAqLH6zsVUGQw
 0z8xDH/5qUYll3VkIpI2GhedQia13+C+4HZdb2/lzUtprm6UFBOE/jxODnKU0Etnwnw0
 otsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pxdueKs5pACRF4frC+TAZoaDfUvLv6Pw06AO0YA55Iw=;
 b=Ho4Z74HUPXlDIdU8stW6LGROHEHYDDPMJZcwbyZHxvaOqo24Rbwn1Byn+FgR0K4vYJ
 fVvsgeTjYJSO40mzowWS/H/nYgIiVeVm7k8iYMVOZmh9UZcUuRmj9jrYacrhkBc7nf/A
 4JBsKz5KtrZOJvkTvYMMoMmFBTPBETaKnWFEuE9BquLWx7eQ5Pvdfvpzogpj89X67kX5
 0SBRSrzKg8OyvVuPBjibuxMJ7BSVIJdRvkTYVXCjNTck+2+ze7TGgREXC94dOsvzjlCh
 jNKDiVVSxMSvRVueXhUHjR3awO/yaWsb3CGfKuu5DKf4WECo6kNkTFowhhveaQkaIYYF
 CuIA==
X-Gm-Message-State: AOAM530M9zti7ZMFiFvKWADkW/mJPIS+lqlPPoGk4uS+nVykgFAklvth
 EiY8kCJgvDZXugrtwSdrFFSl9HaEOIq1r9s1pPA=
X-Google-Smtp-Source: ABdhPJwluweCpK7+4U3plnwr6DTCn3wcE3MNwEc3D0A4FKlGeuxiwQbuJb8KY1qXwpa87IyDqz5vAg==
X-Received: by 2002:a19:3804:: with SMTP id f4mr3441831lfa.81.1630688470598;
 Fri, 03 Sep 2021 10:01:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c3sm628401ljj.77.2021.09.03.10.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:01:10 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/14] target/riscv: Add instructions of the Zbc-extension
Date: Fri,  3 Sep 2021 19:00:53 +0200
Message-Id: <20210903170100.2529121-8-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x132.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v9:
- Rebased to 8880cc4362.

Changes in v6:
- Move gen_clmulh to trans_rvb.c.inc, as per Richard H's request.

Changes in v5:
- Introduce gen_clmulh (as suggested by Richard H) and use to simplify
  trans_clmulh().

Changes in v3:
- This adds the Zbc instructions as a spearate commit.
- Uses a helper for clmul/clmulr instead of inlining the calculation of
  the result (addressing a comment from Richard Henderson).

 target/riscv/bitmanip_helper.c          | 27 +++++++++++++++++++++
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  5 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 32 ++++++++++++++++++++++++-
 4 files changed, 65 insertions(+), 1 deletion(-)

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
index 460eee9988..8a318a2dbc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -63,6 +63,8 @@ DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 35a3563ff4..1658bb4217 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -714,6 +714,11 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
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
index ee8bc7435f..a940441ae1 100644
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
@@ -543,3 +549,27 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
+
+static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul);
+}
+
+static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
+{
+     gen_helper_clmulr(dst, src1, src2);
+     tcg_gen_shri_tl(dst, dst, 1);
+}
+
+static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_clmulh);
+}
+
+static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr);
+}
-- 
2.25.1


