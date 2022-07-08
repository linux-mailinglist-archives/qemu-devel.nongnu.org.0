Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C2B56BCE8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:29:11 +0200 (CEST)
Received: from localhost ([::1]:54288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9pup-0003A4-2i
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pia-0002a3-2T
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:33 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piX-0002IT-BQ
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:31 -0400
Received: by mail-pf1-x436.google.com with SMTP id g126so9355557pfb.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eedjnu3eOCixQFi7+Gzy6ksLbMXPKA3RAkF+Pv5QpfE=;
 b=RLRqYk0b4m+zHsufuHYy7XOLtTeQ7v56+VvEl5yg+lSfw6qbJ4ilGk7ZYhdn32RK5M
 pr0wasqrkSGUrSYVhAhZxQMc7QE2B6xQFOSSDr/aapx5k/21I265MGfmvty9TLYMmGmJ
 2czn5Rj2eJlWml1W4DVmrh8dCYnyGWgPBBTWYOjKbDOqodo2HUwpSiYy4/pIqjevV6W1
 /R9tAWpvvDN0yTLjfGDmJ8aHW2ynInnTso9T/tLEt+PqA/A84CU8BbWZfo0odlCylN36
 T0AXt6IHEilZ1yYS+hndgmBcRWvT9iyA0GqOx3RzTnzqlNU2gMaeDrCSVhuzlpcINCWw
 Tx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eedjnu3eOCixQFi7+Gzy6ksLbMXPKA3RAkF+Pv5QpfE=;
 b=SNozmfF/FnvicNSGxda3bZ3jpgLlFFZHOwB34RV+BOq7ed5eTe+4Pgk54uiTB4StaR
 oMUwAKtXwOfZgQJIaP8tg8wHUnydYa3YXJC1AmdBW54sa8PQeH0ajsJeTyVwggBQ0BBg
 fAGkJ9Vbe3yXQIM62ZHu0YomQZ0uJ1UBsdwpG/Rk5dgzFJ4qGn8eeiQhA0veFXoQv4M4
 HprJLorDhGF1wYJl7BoMc6nv5cYYpCVUan8/khfLFPLS7XxpSze3DJV3zelVv+P9Uu0G
 V4+DfLhNmjh70XpiDgj4ndZslG4JDdAUmEWH5dAfzCiUs0U2JqdBUJ5WYj082ERedag/
 7lGw==
X-Gm-Message-State: AJIora/GiiG5s69tXV2/Kly6hs3R/szKuO8lzlR9+O4hlPjQd/Ox1/zg
 KN46S/1i9T2gRVDXTnCvugjw+EQ7O8V4WqM3
X-Google-Smtp-Source: AGRyM1tCdFyfjZNs3sbLOhkVQ7+vrJ8XADT2MURr0Akb/GcYly/bQukI2NkPQM+L0AFdnAK5gDZXRg==
X-Received: by 2002:a05:6a00:124a:b0:525:894b:7924 with SMTP id
 u10-20020a056a00124a00b00525894b7924mr4324990pfi.31.1657293387932; 
 Fri, 08 Jul 2022 08:16:27 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 14/45] target/arm: Mark LD1RO as non-streaming
Date: Fri,  8 Jul 2022 20:45:09 +0530
Message-Id: <20220708151540.18136-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 3 ---
 target/arm/translate-sve.c | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 2b5432bf85..47708ccc8d 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,6 +58,3 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --0- ---- ---- ---- ---- ----   # Load/store FP register (unscaled imm)
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
-
-FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
-FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5182ee4c06..96e934c1ea 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5062,6 +5062,7 @@ static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
     if (a->rm == 31) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
@@ -5076,6 +5077,7 @@ static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);
-- 
2.34.1


