Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2582F1EAA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:09:52 +0100 (CET)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2Zb-0004iU-M8
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Ru-00066f-Fm
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:56 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rd-0006RS-Fg
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:51 -0500
Received: by mail-pg1-x52b.google.com with SMTP id v19so248674pgj.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9xtb+ptQ+2FmtaEsBjHPl225W/jJkhKr+UDtc5NzbLQ=;
 b=ghTHlB3AKLnw5BwdMC4s99hJGi7DeX9MFTsiDssviiLVkX4UfhFLfxyqRRcm863Il9
 a893BR6xkjSrvLIN5YB0th5dSrjNXLbcukzrhRRuhkOCX9qecSYKRfgPBDjPZkDdpjoM
 Jugs2qBSQpJH3CulZtSwrjRTUTk7Xe1Vpnp8eGTAZaFm/HljV/Ldjjomy+CEulJQv1Zs
 /8nRGfAFYOygm7mL2euGu40kMgDZhJVLqxJtQEPJD6aqxKmOHFoACNVrXL5CH+UfqYTT
 y3TYNBZgXJsaj8lgAn9aqLhYdRRfnRkQEqECjza3AE7ieebrN0zu9zSHUD+v51yObhDw
 Nlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9xtb+ptQ+2FmtaEsBjHPl225W/jJkhKr+UDtc5NzbLQ=;
 b=AaZhRHfZwP9E3qDEgpqkocm6Af5ndBOH9AQOvCCpPp2vnKzTmZMUk4Y5G2StHR3V82
 Xf+gWaSbRPvF2lh+dLwophXiTdmifOHvKxN5qyukE9cx+Y9Y/u0Zt+JdQetp0dvqbwQh
 mu5dvf6GKn6W6/TGARi9msbo87aGoF+H0eNJq2PL7ctspjIm5gAMcs2o14vZqu0Cpq88
 VTR6rn08t1VXDw6oBXQwUlngxw1ilWGcviuUbasURanABXWSneedJQsZJOIOZj6trK9h
 5IR61X8BJWRaE8QNJtfsMYFCxEirv1GHlLSTlCWKHAalp89gB9nNdKsrVbiztz5FTwzH
 QwMg==
X-Gm-Message-State: AOAM533BFdgBtbOaJ4sm0UPuEBMyvgyb2MteRsiQw+jehcVEJs2LppQR
 MSwyCqumM6OVn2DRpciuf3NDaOxPgwaPoA==
X-Google-Smtp-Source: ABdhPJwNBr5n3mfEdioyA8LlN161AtvdbM64KxFCEUzpXu3QnRH3mx5w9eWfK66nTYvd0OLIdIdKDw==
X-Received: by 2002:aa7:8d86:0:b029:19e:cb57:2849 with SMTP id
 i6-20020aa78d860000b029019ecb572849mr821632pfr.54.1610391695729; 
 Mon, 11 Jan 2021 11:01:35 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/30] target/arm: Merge gen_aa32_frob64 into
 gen_aa32_ld_i64
Date: Mon, 11 Jan 2021 09:00:54 -1000
Message-Id: <20210111190113.303726-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the only caller.  Adjust some commentary to talk
about SCTLR_B instead of the vanishing function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8e6f8dd57a..efcb393b99 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -975,20 +975,17 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
-{
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-}
-
 static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
-    gen_aa32_frob64(s, val);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+
     tcg_temp_free(addr);
 }
 
@@ -4957,16 +4954,13 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv_i32 tmp2 = tcg_temp_new_i32();
         TCGv_i64 t64 = tcg_temp_new_i64();
 
-        /* For AArch32, architecturally the 32-bit word at the lowest
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. That means we don't want to do a
-         * gen_aa32_ld_i64(), which invokes gen_aa32_frob64() as if
-         * for an architecturally 64-bit access, but instead do a
-         * 64-bit access using MO_BE if appropriate and then split
-         * the two halves.
-         * This only makes a difference for BE32 user-mode, where
-         * frob64() must not flip the two halves of the 64-bit data
-         * but this code must treat BE32 user-mode like BE32 system.
+         * gen_aa32_ld_i64(), which checks SCTLR_B as if for an
+         * architecturally 64-bit access, but instead do a 64-bit access
+         * using MO_BE if appropriate and then split the two halves.
          */
         TCGv taddr = gen_aa32_addr(s, addr, opc);
 
@@ -5026,14 +5020,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 n64 = tcg_temp_new_i64();
 
         t2 = load_reg(s, rt2);
-        /* For AArch32, architecturally the 32-bit word at the lowest
+
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. Since we're going to treat this as a
          * single 64-bit BE store, we need to put the two halves in the
          * opposite order for BE to LE, so that they end up in the right
-         * places.
-         * We don't want gen_aa32_frob64() because that does the wrong
-         * thing for BE32 usermode.
+         * places.  We don't want gen_aa32_st_i64, because that checks
+         * SCTLR_B as if for an architectural 64-bit access.
          */
         if (s->be_data == MO_BE) {
             tcg_gen_concat_i32_i64(n64, t2, t1);
-- 
2.25.1


