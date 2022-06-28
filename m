Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44855BE2A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:28:32 +0200 (CEST)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62pz-0002Mq-UW
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jb-0001n2-Tb
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:55 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jZ-0003i0-FK
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id n12so10953124pfq.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewoMQrcRLuqtJpk7AHvndmHZpifGgijfN++hOt6mk5U=;
 b=hmlhXEz7ZlaZDgoZZ/fyNZGKrln05fNAtB6JQFL79YkQduFR2UDup2d0b73YQsqYpk
 DsS0KxIGMHNY2v0V+hHPFK1m8HHnKt56tFYBnCVg33NLn/OKZag2YmWu+KDyrZccH9nw
 v0EsfCTmgLOlNdKgAZe3Zj2R069MSbvY0RIDLcmTJP1G0nH5V/iXI5OajD2Tm5b9L9mP
 yHm1Powygo2Sbhxi4hFEcUS3QE8RBSotykokwitYupV9WT9AEtB3spVvwtH/sZ/Eho9y
 6JNzV239weLm6lunpA57z8u9IsuOZLtFX+gImnxlNKU+j+PwcfvmOGUwZ76ObBpd2EgJ
 v7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewoMQrcRLuqtJpk7AHvndmHZpifGgijfN++hOt6mk5U=;
 b=oa+Cb+u/CmCWgJVs22eRh2aaEYsfyJ/ZnvqDDupVTPoVtz4md5Zh8gO4Cg3EZywIIj
 ddgNGNL6LDBU1QlMcWRa3/8rmS7pMK4QrL3cVHaXheFk5nAl16jULLw4JNSfUD2ZpjqQ
 s5BuVx5OiL5GUuVFOqixcYOjW5oUrEokVpKhMjGzswBoRWoyDSTiat/pbTzpjszlKSe2
 CWrWRb8eY6Q/6As8XeswR9Oo3U7/0t/vKUg5HsZkSVXPYEl7bg3Z3/rgpJfyWhesqrAR
 kizBS8hcDwitPu1/A9OuhIn8Fd5Foiv5Jhz4SCTJ8LUmopUmz1v5p1WjcxrUSOPWzQPn
 uxyg==
X-Gm-Message-State: AJIora/55NIuz1rCAfnjcd2sHWn48B+v/WtVQupZBipUX+puIgEpMl+r
 HI8mGohYGlDpxjbXq0atWUBdc37TgSc6YQ==
X-Google-Smtp-Source: AGRyM1vII4zuEeO76qDxUO2BCIH/dsPGc6nUB5HsuD9VPWeE4i4wJDm8RX3sJrgSWrlBZXw4/55sKQ==
X-Received: by 2002:a63:b91c:0:b0:40c:9df7:400f with SMTP id
 z28-20020a63b91c000000b0040c9df7400fmr15295001pge.509.1656390112098; 
 Mon, 27 Jun 2022 21:21:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 13/45] target/arm: Mark LDFF1 and LDNF1 as non-streaming
Date: Tue, 28 Jun 2022 09:50:45 +0530
Message-Id: <20220628042117.368549-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index bc41aa2e2a..7a0b05cf2c 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,7 +58,5 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
-FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -10- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -100 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9c58902b6e..11874a8e77 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4805,6 +4805,7 @@ static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
@@ -4906,6 +4907,7 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
-- 
2.34.1


