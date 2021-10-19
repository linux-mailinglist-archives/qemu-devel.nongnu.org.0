Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701B432B15
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 02:10:57 +0200 (CEST)
Received: from localhost ([::1]:40526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcciW-00032k-73
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 20:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZG-0004om-KB
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:22 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZB-0001hr-22
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:22 -0400
Received: by mail-pl1-x632.google.com with SMTP id y1so12402547plk.10
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=edH/POVbw08zofw7DVs7aX5K2Qy9VoOU3+jO1Dt/KD8=;
 b=hIrPs1TDpOsgg1x1CJH8gJOIwQo+N/4Bn9Lm2oxdtvDghlaLGnmG0jiSTOBa3UM9u7
 idiEWUgl4bWpAqdnAINX841WZOpXJWpepK21EoS6YToV7UlYkBudKNtBiZ0W15NNgar7
 fFbzxwysWPLasm1cunHch+zYw/Nks4orrhh54AISHBDgiylSsUTOxj1EIN1TcGzwabH9
 JxJXAq29aXcscFwBImqrU2T094nZI2gYFepjL+FVDXIExQcnaoKYynoesmReaFrl0QaU
 /KlrgWfJqp33IKTma6KsADpo/EZYMH1Unb21ZlcbtSHJKXwiDjMAQz82lSQqEZXrcGB5
 06sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edH/POVbw08zofw7DVs7aX5K2Qy9VoOU3+jO1Dt/KD8=;
 b=x6AlAYxTpj+2vul139BlNOn8np4I27qx/90FaakY2/HbVnfgbCRUK1kRHd0DmF2EbR
 ROuz69L07k2ghbE5+zAGfyt9FqfuO2ZN2LIrT9q57p5IKGfvHOoW/a0jK5tCJQAcCVJg
 U+355gatUhncEqozwOiSkKFOKOhTbavrCfls/lktElZlARtTXyWKY+IhgFl1qKAlNtWZ
 uXyoiFz1itPvXWhfFL4pkebaJmZCPetHewGBC++nodopy4bX48GRyfX5SGM0l7Dh9TG/
 D7/rmJohhQ/u/lLrsy4IdGWHcYyfEW8TEjYaoFw+dvoB0/Qg+MPdDVFimsGzhIEWbVql
 4llw==
X-Gm-Message-State: AOAM531vzVtpaNcjxeT37cnZaUSnfCDrF+UhWg1VJpbKwbm4DJROMK/J
 FjAX1DbF5fB6lq0Uh4vgVpOKIi8C3cB8QA==
X-Google-Smtp-Source: ABdhPJxgvK87HOOW4OEN9XWqCFaLTvMbkcPL1cfAyYyWwnr4RYUzh/LZC3zDKeq+oDpfVd6PKpOSZA==
X-Received: by 2002:a17:90b:390d:: with SMTP id
 ob13mr2366528pjb.49.1634601675516; 
 Mon, 18 Oct 2021 17:01:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/16] target/riscv: Replace is_32bit with get_xl/get_xlen
Date: Mon, 18 Oct 2021 17:01:00 -0700
Message-Id: <20211019000108.3678724-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for RV128, replace a simple predicate
with a more versatile test.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f7634c175a..3f1abbac5c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -91,16 +91,19 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 }
 
 #ifdef TARGET_RISCV32
-# define is_32bit(ctx)  true
+#define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
-# define is_32bit(ctx)  false
+#define get_xl(ctx)    MXL_RV64
 #else
-static inline bool is_32bit(DisasContext *ctx)
-{
-    return ctx->xl == MXL_RV32;
-}
+#define get_xl(ctx)    ((ctx)->xl)
 #endif
 
+/* The word size for this machine mode. */
+static inline int __attribute__((unused)) get_xlen(DisasContext *ctx)
+{
+    return 16 << get_xl(ctx);
+}
+
 /* The word size for this operation. */
 static inline int oper_len(DisasContext *ctx)
 {
@@ -257,7 +260,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+    target_ulong sd = get_xl(ctx) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
 
     if (ctx->mstatus_fs != MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
@@ -316,16 +319,16 @@ EX_SH(12)
     }                              \
 } while (0)
 
-#define REQUIRE_32BIT(ctx) do { \
-    if (!is_32bit(ctx)) {       \
-        return false;           \
-    }                           \
+#define REQUIRE_32BIT(ctx) do {    \
+    if (get_xl(ctx) != MXL_RV32) { \
+        return false;              \
+    }                              \
 } while (0)
 
-#define REQUIRE_64BIT(ctx) do { \
-    if (is_32bit(ctx)) {        \
-        return false;           \
-    }                           \
+#define REQUIRE_64BIT(ctx) do {    \
+    if (get_xl(ctx) < MXL_RV64) {  \
+        return false;              \
+    }                              \
 } while (0)
 
 static int ex_rvc_register(DisasContext *ctx, int reg)
-- 
2.25.1


