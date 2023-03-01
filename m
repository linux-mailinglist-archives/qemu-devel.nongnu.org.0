Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3BC6A6623
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:02:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCii-0003Me-T0; Tue, 28 Feb 2023 22:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCic-0002my-Tm
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:27 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCia-0004G4-P4
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:26 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso10555303pjs.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18JmFlWEdnV+s8Kjewsq0ZcZnDUj7UiObvsTbLqqvwo=;
 b=jhKIk0lmPuDjiMnybMdw7u8WHhtltPQgBt6tLLdtg8nu/1ulQH3xKuUK0JVeiH0oPG
 BxfMyewbWpoaCGIH7NYAujU+ceTOuLDRFVOaPIkbxaPxIKA6WELzViFvWILIqmB4NvRR
 K8/WjFAia0gdMp1VyFaiN6ovVO8i56Kp3d7Z7rZks5xU5DwEbI+RSzYoDtdJX2hYDkTG
 nQ4j4ccwyANGiqdENoITHZiguG0/7Qx3UtvPDXd2R5E8EMAEjgQXSYJFrVR6Ol4eNlCx
 NcHYVnrxOkbW1wECRsERis2brlV12WlQM5veYExkel1ym3uIZ7GA3ktkE9X8FpOwKyVh
 IM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18JmFlWEdnV+s8Kjewsq0ZcZnDUj7UiObvsTbLqqvwo=;
 b=dIGTADIXC229UUckCGCMB8Qecp1nHyx14gSoOgdCc2MNH3v91V1d7hYL3Wrob7aa2j
 2ugv6xaYrZsY6XQsT66+3igBMB9ymIHpnIpLebiNasmCYYHa0b0Oqkec6sRo0Zxgmev4
 KSwdH9tThA0CnLwvG9Q4gECGso5OyWWuAV1mRBsnX3kBNjkMBxk5+6IYdfZaq7ICI2UQ
 cAtNWy3iqsQHTHW75UD7c9p9XpeIZNp/Fc9x/8exD2jKfzFzU/m8G3+zMf0x4FfR6VP5
 bN4us6/OfcqOlF4949Vy7nwEG3ZRKwq7gWs2R+qmZJs9IV111/JGquv0WytY4mKFIJUt
 JwAA==
X-Gm-Message-State: AO0yUKW2QMEZxDVotBNNP6WPL/zRQgJAHgAWFzVro6G1r434ZmtByMGb
 gfThrb9UZ/3g1gZ1/g03StGNqduOKv4DkCE8Oj8=
X-Google-Smtp-Source: AK7set8pvtvDIm61Z5VgWzDhCk9+Sx1pAtneDUzav8hREYO2UV9vUMz8Od3T8ErxUWni5PDuiqeTsQ==
X-Received: by 2002:a17:903:284d:b0:19c:df6e:6ada with SMTP id
 kq13-20020a170903284d00b0019cdf6e6adamr4192642plb.25.1677639683952; 
 Tue, 28 Feb 2023 19:01:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 58/62] target/ppc: Don't use tcg_temp_local_new
Date: Tue, 28 Feb 2023 16:56:39 -1000
Message-Id: <20230301025643.1227244-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


