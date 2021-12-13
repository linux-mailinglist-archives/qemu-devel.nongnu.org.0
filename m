Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED2A473328
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 18:44:14 +0100 (CET)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwpMy-0001uW-Sp
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 12:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwpLp-0001Ee-Sq
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:43:01 -0500
Received: from [2607:f8b0:4864:20::62d] (port=42762
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwpLh-000680-IV
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:42:59 -0500
Received: by mail-pl1-x62d.google.com with SMTP id u17so11677048plg.9
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ciPxtNnzy5RQSIuGinEff8/WK2cqYqdP2QUk/Jr3dy0=;
 b=gRyTguK3cbVqcUcPGMqhNK9owb15M+fPnv0/aYQX/xTu5ILijw7VSnzV8//bWLX76m
 VSS8ZbxIDaTmruo5v7WSHIxZuQSDJ67Ts1gRmQkeis+73wDe1AGBImFOhgx+0cPQCmtP
 QXhdRy1amUxWrRtgjGeQhCDbw6SqsOc/iay6B/xw5t7Ub++IFzHBaVMYsND3O0ZDAkbQ
 3ho8WDedGAzYrJfL3wwj5iqZmYg7lFrAnRBnRe3fF4GEARDhXSpgze6EwPinUNziUFid
 2GhRh02kEvuGCUxQx0Nb3FvEgbM/EIFCC/M38RIOoqqUhRxkta4vEiffIhjjChJLBKA1
 8S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ciPxtNnzy5RQSIuGinEff8/WK2cqYqdP2QUk/Jr3dy0=;
 b=YRMF/hbBC5AariDV85vi/V4i/UUc1t8559i7uWFHJdWzFgIYSnb80hhGcVyOXBh19y
 gfekpQiTa5uU3i59CMc8twk7AE+1LxE9TMegKgz4n40SOMgikuc8GwDyxSVFvV6Nta8g
 5/0bqhHgeGlN/lXjCRLHbjGigWAQltAeqZ/jFiIuUhKRWms5S7sEAafMsfMrDpJByIdA
 xtgsCeylXVRMjmlRucGpNjTX+6hxZd/CWeCWuDopekYx22Z/Oqg9+cgZMIC2FKhY6rPy
 DH13lgmPgL2wejgjQ2LYbGdIgjSGSKtA8Du5JU+LirGV1FNbTqDb/WUVeE496hmTC5AS
 LgCw==
X-Gm-Message-State: AOAM5334udwEuQtVeubCig9mDM0dwq56EVTcuifOkTwO86f3Xa5e2O+W
 ukZ5P5UvEQ7UuBhjqD8SCQ5PFiVOheQT/Q==
X-Google-Smtp-Source: ABdhPJxhimcWfmEZDVI9+hIi223ziVn/AZ8pTlZmLpDwQ8Q5wBAnMqItdGMkM1tXpCdj48pRGS4YFw==
X-Received: by 2002:a17:902:a40f:b0:143:d470:d66d with SMTP id
 p15-20020a170902a40f00b00143d470d66dmr97179924plq.52.1639417369629; 
 Mon, 13 Dec 2021 09:42:49 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e7sm13819583pfv.156.2021.12.13.09.42.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 09:42:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/hppa: Fix deposit assert from trans_shrpw_imm
Date: Mon, 13 Dec 2021 09:42:48 -0800
Message-Id: <20211213174248.29222-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Because sa may be 0,

    tcg_gen_deposit_reg(dest, t0, cpu_gr[a->r1], 32 - sa, sa);

may attempt a zero-width deposit at bit 32, which will assert
for TARGET_REGISTER_BITS == 32.

Use the newer extract2 when possible, which itself includes the
rotri special case; otherwise mirror the code from trans_shrpw_sar,
using concat and shri.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/635
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 3b9744deb4..952027a28e 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -140,6 +140,7 @@
 #define tcg_gen_deposit_z_reg tcg_gen_deposit_z_i64
 #define tcg_gen_extract_reg  tcg_gen_extract_i64
 #define tcg_gen_sextract_reg tcg_gen_sextract_i64
+#define tcg_gen_extract2_reg tcg_gen_extract2_i64
 #define tcg_const_reg        tcg_const_i64
 #define tcg_const_local_reg  tcg_const_local_i64
 #define tcg_constant_reg     tcg_constant_i64
@@ -234,6 +235,7 @@
 #define tcg_gen_deposit_z_reg tcg_gen_deposit_z_i32
 #define tcg_gen_extract_reg  tcg_gen_extract_i32
 #define tcg_gen_sextract_reg tcg_gen_sextract_i32
+#define tcg_gen_extract2_reg tcg_gen_extract2_i32
 #define tcg_const_reg        tcg_const_i32
 #define tcg_const_local_reg  tcg_const_local_i32
 #define tcg_constant_reg     tcg_constant_i32
@@ -3204,19 +3206,22 @@ static bool trans_shrpw_imm(DisasContext *ctx, arg_shrpw_imm *a)
 
     dest = dest_gpr(ctx, a->t);
     t2 = load_gpr(ctx, a->r2);
-    if (a->r1 == a->r2) {
+    if (a->r1 == 0) {
+        tcg_gen_extract_reg(dest, t2, sa, 32 - sa);
+    } else if (TARGET_REGISTER_BITS == 32) {
+        tcg_gen_extract2_reg(dest, t2, cpu_gr[a->r1], sa);
+    } else if (a->r1 == a->r2) {
         TCGv_i32 t32 = tcg_temp_new_i32();
         tcg_gen_trunc_reg_i32(t32, t2);
         tcg_gen_rotri_i32(t32, t32, sa);
         tcg_gen_extu_i32_reg(dest, t32);
         tcg_temp_free_i32(t32);
-    } else if (a->r1 == 0) {
-        tcg_gen_extract_reg(dest, t2, sa, 32 - sa);
     } else {
-        TCGv_reg t0 = tcg_temp_new();
-        tcg_gen_extract_reg(t0, t2, sa, 32 - sa);
-        tcg_gen_deposit_reg(dest, t0, cpu_gr[a->r1], 32 - sa, sa);
-        tcg_temp_free(t0);
+        TCGv_i64 t64 = tcg_temp_new_i64();
+        tcg_gen_concat_reg_i64(t64, t2, cpu_gr[a->r1]);
+        tcg_gen_shri_i64(t64, t64, sa);
+        tcg_gen_trunc_i64_reg(dest, t64);
+        tcg_temp_free_i64(t64);
     }
     save_gpr(ctx, a->t, dest);
 
-- 
2.25.1


