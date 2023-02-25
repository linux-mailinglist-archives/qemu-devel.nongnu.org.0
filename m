Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F43A6A280A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQJ-0002Cn-Vb; Sat, 25 Feb 2023 04:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPv-00010b-B7
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:36 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPs-00058l-SD
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:30 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso8140316pjv.0
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18JmFlWEdnV+s8Kjewsq0ZcZnDUj7UiObvsTbLqqvwo=;
 b=xmDpNF1p2UWxS3Dsc0HDzIqBz0FvPxm/F6Y0YYx/Y5w19T3kKsC0iIf2PvLvZjA9He
 eGz2xTSLDwLLz+9OX/6BcVWPVuXaICd0PS4Ap0Z2dI1Dfdw+qXlenGW+R+Eq2KuXU2Zo
 9PE8QdQIv+V6HKVrkv7LGw0cXSdwvgsqZptArSdYKPWToLhfkgnk0uCi9xodwIgJ0hb1
 jNCt4wGhbJJJ91SbPaHkckjt0EgcyXUORZGG+Qd3kAQhLlxFKHDTNrJqD2kzF9UO0DJ7
 BoDjWGOl6GqEtvJX/7cJb+x6w4bLjO/z6W15zloVdPupJkc6j93dWucqtleuIkK67kJJ
 3o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18JmFlWEdnV+s8Kjewsq0ZcZnDUj7UiObvsTbLqqvwo=;
 b=ttxZaISXnuPu8C5xcM6qbdIbhHGibD81wffMWGmTkZLLiNu79RlRAysOdKHMUxL6fr
 4Ac2eUjK+VmxNqCMCez2xqsH/uAsR6LjE2d7AuLS/U68U30ZYLekBP8bC+DumpK/a97U
 4rDmmcX1d2YTuAMVtgpz5Dd/4OOW0MRgd/V71eTXwhXsO698u0QbnBl2DHi2KQSrBRRr
 MlNU8NgYmToLNh+nKBoNJ1FtiVGe5bD7BLmTF/ayVWQVmXmC9peGhdlvDeaK7GTmsKas
 4IhA+pd9SY9jIM23573hxQoDkTsIPij+oCLpmCDaXr1rAzs4mRfZEwUu/crl6dPZqnsz
 2W5A==
X-Gm-Message-State: AO0yUKX+D48i90lD0BcRX1qEAK2Da+u8fJX9JmmQZwYVQXal7ji/FyDz
 4NMdMDBt+Et+Xh7JGDzVKbRaYEgTzYyaZOh3+Pk=
X-Google-Smtp-Source: AK7set/dNdimTt99hl5ByroDfOi+FT8S/vrz6Wp11fjd9t9/u7EUYPgD1u+CgNZ3J2NKEWyydE3z4w==
X-Received: by 2002:a05:6a20:6a21:b0:cc:dd86:ca27 with SMTP id
 p33-20020a056a206a2100b000ccdd86ca27mr572048pzk.17.1677315627477; 
 Sat, 25 Feb 2023 01:00:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 26/30] target/ppc: Don't use tcg_temp_local_new
Date: Fri, 24 Feb 2023 22:59:41 -1000
Message-Id: <20230225085945.1798188-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


