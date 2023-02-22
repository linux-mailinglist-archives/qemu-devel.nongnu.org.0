Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7E569FF86
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:31:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWq-0000qU-B8; Wed, 22 Feb 2023 18:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWf-0000W8-B2
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:53 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWd-0005I3-Jl
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:53 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i3so342564plg.6
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18JmFlWEdnV+s8Kjewsq0ZcZnDUj7UiObvsTbLqqvwo=;
 b=xW0QGwcYCs1CUZ1MEbEHxN3yctmL3q6GWB9T2B5wRmIoozECjl+FxZ1tsjYi1KWIgF
 D+srZw0z6dX1mxNZo4u/3/OzlKkRSBwfd1k6Rv3d1iKTKSC0otnB1JVcwpHzW5GY2Com
 RduAW5Ev+/+v6VMTum6BB8tHxMmt/FsXhWWPJu77Q84KnaJoKXzFCWHw31jua8CWj4jI
 8E8YmcJpOeiHkiujkdgRTx8fHwuWLwtIo3jCoxfPSsjXMm06SZ9xHg5sjghaVsFdfRyW
 i0AOfeQ5A561yo77ZKf8Ek38LnlMXevLKjGUFaFwooq1oGEuhfnTs1sxtSq0JqRgnI0A
 42Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18JmFlWEdnV+s8Kjewsq0ZcZnDUj7UiObvsTbLqqvwo=;
 b=uf0xgD4lZ7nM79UOFOi6seayNZnevoB+Vkf5Bkuy7hVlP+cWvmMD3oCImBqvN5kU8i
 wEVc7IUFSvWowqzlCcZeUDtc+wn74Tn5LXx/FK8SiVa5Sgf2uOJ4zLN9AxLxncNEWbHQ
 6RjzKKvcPEi92Kx51J3HHbP7b0p67mrP7/3XxBKnZvdQ0H1pU1xV1UqgDEWaUFLnG0+D
 NQ95ZgG9JWjV8tYJVIrpo/F3WIWP/ziDfVYZymCDqX5nif0wc9AR35N0xNEtJi0s4M82
 mB6TtD384heDnx5vKtN5DBFL4jdSN62knrHxCxHdsK/ADKZRxxd13b+KHtcBq7w2bNyA
 qIyg==
X-Gm-Message-State: AO0yUKWJHGctxaOyOFKeu+GQkQK9NtGylco7xCMAEz2QQWWCI/Fa8jJ2
 Ypjs9AjekxrCER2PXTWijJHASAPMMwr4GftlA3A=
X-Google-Smtp-Source: AK7set9OmgabrsjSUug9gqJl0NiunBxsPBe3YCewPTipkleDGDofgES26fXharza7TfPDBZGyWH/fA==
X-Received: by 2002:a17:90b:38c2:b0:234:9229:535e with SMTP id
 nn2-20020a17090b38c200b002349229535emr10544092pjb.23.1677108470843; 
 Wed, 22 Feb 2023 15:27:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 23/28] target/ppc: Don't use tcg_temp_local_new
Date: Wed, 22 Feb 2023 13:27:10 -1000
Message-Id: <20230222232715.15034-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


