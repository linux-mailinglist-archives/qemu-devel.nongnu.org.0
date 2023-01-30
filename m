Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B6681C19
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGS-0000Sm-UW; Mon, 30 Jan 2023 16:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGG-000084-SM
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:21 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGE-0005Gu-Qq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:20 -0500
Received: by mail-pg1-x52d.google.com with SMTP id v3so8583698pgh.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=To6atv+Obg0cImM5ldna6ZejhtwXEvl+wmUMgROvfPg=;
 b=m15OleTD8IDlPx7rwSwocA1rgG5QmtbGcBCfC5t0LlO21SEYi+rT5PxVZJS5m7tYX5
 9EJlIdWiKCIxBtzJhZt21iQfbdgifD3H3AClSB9ZjkOaJ8Dtga/TT6IHnks2O8laGz9+
 OQgmY4AC4TByPOSmG3ZbhV/cTTw85eTiORvNVjqxx9PcBi9EkuWNUoB6aSGJw/s324/u
 TgErLmucm8/erwkZrXuCiXngW7bzf+h3uvxv3O85vfKnjDHgtWWLgSoGP2ihL8rtKzE8
 ch9SF0z1+jODgrbrGIW5VpFiDp3/hk6RnWvxooBQML1vIfeNa2LtUwvW89GnDd4A5h5o
 DMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=To6atv+Obg0cImM5ldna6ZejhtwXEvl+wmUMgROvfPg=;
 b=4YGeuSvLwHAqE+q4EDE4tEQPdp4rcm/gufj7F5fARUQsJW9GGMO2B7hqEySEUMQQKP
 CA0d+53tx0vp8jaIzlfUVSxrvQD5Z00Dev9abIQqfBQJkc3OFYtQOdnJoIl/BdILyodF
 Ojeqv/RKOzo8Kj2XbjR1bhMYsnR3GMZWcDLV7GocE2T6LH12fbfSMoChlePdJfvBGaqt
 GVnYSIV9b18Iusv4Xo9y0NEK96TUGPy7VUokpWsR8nc3a5JobSU6yyq98E80MNqdja9B
 oHIyoh7ItBsR/EQLVxUMZ1rIru/mvYahQh0TPZMeKD1lzR8N69z5ibDG/mhc22vttUam
 QA/Q==
X-Gm-Message-State: AO0yUKVprooVpk2ZvpShSQq5gDt1V9brozj+mIlWM4HBnQVOTLea3zYK
 GHeCizM7KVHdEBR5QgMLqC8YH9ov3luRjc6n
X-Google-Smtp-Source: AK7set+37qDIMWCpfv8+E0s41gO/1Ko5J+7OUht+RDJ8FpGaXDNd+eu7PaWzbZsCA9aSFscv4JEr6g==
X-Received: by 2002:a05:6a00:114a:b0:590:cef2:a632 with SMTP id
 b10-20020a056a00114a00b00590cef2a632mr7869903pfm.30.1675112417660; 
 Mon, 30 Jan 2023 13:00:17 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 23/27] target/ppc: Don't use tcg_temp_local_new
Date: Mon, 30 Jan 2023 10:59:31 -1000
Message-Id: <20230130205935.1157347-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 target/ppc/translate.c              | 6 +++---
 target/ppc/translate/spe-impl.c.inc | 8 ++++----
 target/ppc/translate/vmx-impl.c.inc | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5fe6aa641e..2956021e89 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4415,7 +4415,7 @@ static void gen_bcond(DisasContext *ctx, int type)
     TCGv target;
 
     if (type == BCOND_LR || type == BCOND_CTR || type == BCOND_TAR) {
-        target = tcg_temp_local_new();
+        target = tcg_temp_new();
         if (type == BCOND_CTR) {
             tcg_gen_mov_tl(target, cpu_ctr);
         } else if (type == BCOND_TAR) {
@@ -5594,8 +5594,8 @@ static inline void gen_405_mulladd_insn(DisasContext *ctx, int opc2, int opc3,
 {
     TCGv t0, t1;
 
-    t0 = tcg_temp_local_new();
-    t1 = tcg_temp_local_new();
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
 
     switch (opc3 & 0x0D) {
     case 0x05:
diff --git a/target/ppc/translate/spe-impl.c.inc b/target/ppc/translate/spe-impl.c.inc
index 2e6e799a25..bd8963db2b 100644
--- a/target/ppc/translate/spe-impl.c.inc
+++ b/target/ppc/translate/spe-impl.c.inc
@@ -168,7 +168,7 @@ static inline void gen_op_evsrwu(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
-    TCGv_i32 t0 = tcg_temp_local_new_i32();
+    TCGv_i32 t0 = tcg_temp_new_i32();
 
     /* No error here: 6 bits are used */
     tcg_gen_andi_i32(t0, arg2, 0x3F);
@@ -185,7 +185,7 @@ static inline void gen_op_evsrws(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
-    TCGv_i32 t0 = tcg_temp_local_new_i32();
+    TCGv_i32 t0 = tcg_temp_new_i32();
 
     /* No error here: 6 bits are used */
     tcg_gen_andi_i32(t0, arg2, 0x3F);
@@ -202,7 +202,7 @@ static inline void gen_op_evslw(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
-    TCGv_i32 t0 = tcg_temp_local_new_i32();
+    TCGv_i32 t0 = tcg_temp_new_i32();
 
     /* No error here: 6 bits are used */
     tcg_gen_andi_i32(t0, arg2, 0x3F);
@@ -378,7 +378,7 @@ static inline void gen_evsel(DisasContext *ctx)
     TCGLabel *l2 = gen_new_label();
     TCGLabel *l3 = gen_new_label();
     TCGLabel *l4 = gen_new_label();
-    TCGv_i32 t0 = tcg_temp_local_new_i32();
+    TCGv_i32 t0 = tcg_temp_new_i32();
 
     tcg_gen_andi_i32(t0, cpu_crf[ctx->opcode & 0x07], 1 << 3);
     tcg_gen_brcondi_i32(TCG_COND_EQ, t0, 0, l1);
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 7741f2eb49..2dd17ab106 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1508,8 +1508,8 @@ static bool do_vcmpq(DisasContext *ctx, arg_VX_bf *a, bool sign)
     REQUIRE_INSNS_FLAGS2(ctx, ISA310);
     REQUIRE_VECTOR(ctx);
 
-    vra = tcg_temp_local_new_i64();
-    vrb = tcg_temp_local_new_i64();
+    vra = tcg_temp_new_i64();
+    vrb = tcg_temp_new_i64();
     gt = gen_new_label();
     lt = gen_new_label();
     done = gen_new_label();
-- 
2.34.1


