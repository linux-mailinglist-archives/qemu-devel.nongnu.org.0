Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D7A3F15F9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:16:30 +0200 (CEST)
Received: from localhost ([::1]:60380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGeA1-0007DQ-2M
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzT-0006iA-NP
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:35 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzR-0000NO-VG
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:35 -0400
Received: by mail-pg1-x52a.google.com with SMTP id n18so5279439pgm.12
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DWW2ruvxat8p1EH7ZMnPGDRTm0cWRkZcMbECwmLW2qs=;
 b=QuV2Onfs2Hc8E/09/5Z2RGIZH2kpone/NX6PopvZIJ6wX/0VRFW/LSyCWARkCa1jWY
 p85Dru+xAG0hmspD+Pro60TfeMiWBIgj4wMTKMONAA4cT86mhjj38UBSRwk2zChIBFld
 C0LyJu0GgOz7wRpFMMbIeK8KMyZgRqDfPR23nO8QVMUMysvLuBQDh7qrDjnAvKZHZZkI
 EGdoYf3k0oX5Nb5jX+C/5F+/GJyEeDk8yxbevElZ8Cz0s/QFY51b6J2flIzzp9Unhvkh
 +ix3cDFNAywgBV5XVYuWYo13aMEc4NO4xZfubFP+5u1L7GqUsJh4rCD3nbZCmTCXr03O
 GD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DWW2ruvxat8p1EH7ZMnPGDRTm0cWRkZcMbECwmLW2qs=;
 b=GBtvXE1fTmtkpKWhiadcvMB13bp9oJVR9MyANtfHXanGvirltzh18iAHc11hxVSfXY
 pMDv59A++zOTac/IX6xgW4DhTq5hkCIOrBtXDCOe37zAFlt0Due9Ki5LT58RhTOfMPUe
 lj7rsBiEhtH7CjjyiMxpQkwHtenCv4GhIiRan0DGf8LQisBhWJTkxz3pVuWNLrukdaFO
 4yBWQwe5+GhUyYae76rt3irZmh2i6xh7uzylM6AxnlY57RgRiThGepyTPYDz6GNYW9Dy
 j+cSz81QAxjV0YdxoF45DeCU97ObCsKInYCDVdZlsFvqSE/wLnCq9P0MYoa5TS3c/mD2
 xI5A==
X-Gm-Message-State: AOAM531QmRz29cJ3mAn9AsufegJmbk2jmq1znswJWsPs5lVzzpMPCRc+
 R2nvvgpt0nO5gIPfwZUW1U3p/7PasChS2A==
X-Google-Smtp-Source: ABdhPJwFGohTcl/jT03SYPLSVj+NhF2R3UmhQaNcGZklavb1qprrGR7dnrKt1YaMwx7sbUQDb4WUXA==
X-Received: by 2002:a63:fd12:: with SMTP id d18mr13141080pgh.129.1629363932640; 
 Thu, 19 Aug 2021 02:05:32 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/21] target/riscv: Use gen_shift_imm_fn for slli_uw
Date: Wed, 18 Aug 2021 23:04:58 -1000
Message-Id: <20210819090502.428068-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index af7694ed29..d5a036b1f3 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -647,21 +647,18 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
 }
 
+static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
+{
+    if (shamt < 32) {
+        tcg_gen_deposit_z_tl(dest, src, shamt, 32);
+    } else {
+        tcg_gen_shli_tl(dest, src, shamt);
+    }
+}
+
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-
-    TCGv source1 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-
-    if (a->shamt < 32) {
-        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
-    } else {
-        tcg_gen_shli_tl(source1, source1, a->shamt);
-    }
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
-- 
2.25.1


