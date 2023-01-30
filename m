Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD78681C36
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:04:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGN-0000OQ-SQ; Mon, 30 Jan 2023 16:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGF-00005o-JW
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:20 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGD-0005US-IN
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:19 -0500
Received: by mail-pg1-x532.google.com with SMTP id q9so8581637pgq.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=92cLwvWKpQSlnRj9OzB9tWYtr/L5m9d1YA/FHn+sjqo=;
 b=xdcW8QLWnmxTxboqg15p60L59Cc4sfusbOM2jNmCz9dOwtsxdSON19E1N/4x/+R6G+
 dDcTKO61zN0HkCh/SRkNUNO+Tv/Q85IJim/7HQNRdrquWzR/3ItKE+t67cD7Wihq6Lfh
 GBEv/IXoffPFFiJXDUBiTu/iA3k2hZYXfHWBhy6wTvNzvYmFehlj7o/Zxq5mc0DE0uRy
 ++IesUJd9dcT9PweJAICzM5O2oDn5FnckUBZo01ibE+HLzANzbEd4O2+2v3753D59ouk
 7LYo8GBMFb/elHbhudUobvB50Tdg78u7jcMVFTaEB3WAfArn2bgxLMtb81qg9Lxf1QRg
 hsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=92cLwvWKpQSlnRj9OzB9tWYtr/L5m9d1YA/FHn+sjqo=;
 b=Apl/+OOxnBEcabfQz8tFPN+hrkzB1Kem7/BnwvdP1oJ+HS4o+fcrN6wMHu6LYdpF/B
 Hqgb0klx8hnUp6/oFhhHAUakW+Vg8kXENt7QG2e07EFci78KE8899CMxy+cExGBj/Glw
 77oco/ZpRc67PH8adhqGRTuT0kJBmRfVLwqDWaQBRQjdNiZuSSFi+ZJMJv5KHkODoaer
 bKGYiXPjNL6RZ61N+7Tvc7rZT3tKUh5BzPfCKVnfhWmFayaCuu47Z1S5f1hG2wsodE8U
 HTe3Asn8dAs9WH8SFh15QLhFGOqnJYS6dy6uhVn/t2JlFMmYmm4it7T+W1x5rfB4uwBJ
 2uIQ==
X-Gm-Message-State: AO0yUKXETYWWHbVCTq/wcF5m/HkH2QSzVjYTDqdYjs2JpqYcGb0/feEp
 /8eBBrJwUNmwTosq/xkW9M6Ci7mcwtlvz38U
X-Google-Smtp-Source: AK7set8aCwuHQFktxS7BF48ma4/7BpvGQfucIF3l7+5ks4+xmkr8xWmwltUHxJWQpkfFZt0zwmO5IA==
X-Received: by 2002:a05:6a00:1d02:b0:593:d7fd:aaf7 with SMTP id
 a2-20020a056a001d0200b00593d7fdaaf7mr2206152pfx.16.1675112416042; 
 Mon, 30 Jan 2023 13:00:16 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 22/27] target/mips: Don't use tcg_temp_local_new
Date: Mon, 30 Jan 2023 10:59:30 -1000
Message-Id: <20230130205935.1157347-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since tcg_temp_new is now identical, use that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c              | 57 ++++++------------------
 target/mips/tcg/nanomips_translate.c.inc |  4 +-
 2 files changed, 16 insertions(+), 45 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 6dbd262ebc..d01a337541 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2401,7 +2401,7 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
     switch (opc) {
     case OPC_ADDI:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2435,7 +2435,7 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
 #if defined(TARGET_MIPS64)
     case OPC_DADDI:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2631,7 +2631,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
     switch (opc) {
     case OPC_ADD:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2667,7 +2667,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_SUB:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2708,7 +2708,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
 #if defined(TARGET_MIPS64)
     case OPC_DADD:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2742,7 +2742,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_DSUB:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -3760,26 +3760,8 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
         return;
     }
 
-    switch (opc) {
-    case OPC_MULT_G_2E:
-    case OPC_MULT_G_2F:
-    case OPC_MULTU_G_2E:
-    case OPC_MULTU_G_2F:
-#if defined(TARGET_MIPS64)
-    case OPC_DMULT_G_2E:
-    case OPC_DMULT_G_2F:
-    case OPC_DMULTU_G_2E:
-    case OPC_DMULTU_G_2F:
-#endif
-        t0 = tcg_temp_new();
-        t1 = tcg_temp_new();
-        break;
-    default:
-        t0 = tcg_temp_local_new();
-        t1 = tcg_temp_local_new();
-        break;
-    }
-
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
     gen_load_gpr(t0, rs);
     gen_load_gpr(t1, rt);
 
@@ -3956,21 +3938,10 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
     TCGCond cond;
 
     opc = MASK_LMMI(ctx->opcode);
-    switch (opc) {
-    case OPC_ADD_CP2:
-    case OPC_SUB_CP2:
-    case OPC_DADD_CP2:
-    case OPC_DSUB_CP2:
-        t0 = tcg_temp_local_new_i64();
-        t1 = tcg_temp_local_new_i64();
-        break;
-    default:
-        t0 = tcg_temp_new_i64();
-        t1 = tcg_temp_new_i64();
-        break;
-    }
-
     check_cp1_enabled(ctx);
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
     gen_load_fpr64(ctx, t0, rs);
     gen_load_fpr64(ctx, t1, rt);
 
@@ -8651,7 +8622,7 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
                      int u, int sel, int h)
 {
     int other_tc = env->CP0_VPEControl & (0xff << CP0VPECo_TargTC);
-    TCGv t0 = tcg_temp_local_new();
+    TCGv t0 = tcg_temp_new();
 
     if ((env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) == 0 &&
         ((env->tcs[other_tc].CP0_TCBind & (0xf << CP0TCBd_CurVPE)) !=
@@ -8879,7 +8850,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
                      int u, int sel, int h)
 {
     int other_tc = env->CP0_VPEControl & (0xff << CP0VPECo_TargTC);
-    TCGv t0 = tcg_temp_local_new();
+    TCGv t0 = tcg_temp_new();
 
     gen_load_gpr(t0, rt);
     if ((env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) == 0 &&
@@ -11410,7 +11381,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
     case OPC_ALNV_PS:
         check_ps(ctx);
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv_i32 fp = tcg_temp_new_i32();
             TCGv_i32 fph = tcg_temp_new_i32();
             TCGLabel *l1 = gen_new_label();
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 812c111e3c..faf6d679bd 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -1017,8 +1017,8 @@ static void gen_llwp(DisasContext *ctx, uint32_t base, int16_t offset,
 static void gen_scwp(DisasContext *ctx, uint32_t base, int16_t offset,
                     uint32_t reg1, uint32_t reg2, bool eva)
 {
-    TCGv taddr = tcg_temp_local_new();
-    TCGv lladdr = tcg_temp_local_new();
+    TCGv taddr = tcg_temp_new();
+    TCGv lladdr = tcg_temp_new();
     TCGv_i64 tval = tcg_temp_new_i64();
     TCGv_i64 llval = tcg_temp_new_i64();
     TCGv_i64 val = tcg_temp_new_i64();
-- 
2.34.1


