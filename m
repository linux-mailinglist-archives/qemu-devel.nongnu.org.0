Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF96156823C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:58:37 +0200 (CEST)
Received: from localhost ([::1]:35788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90rk-00018k-MW
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LA-00060b-BP
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:56 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90L6-0000Ii-Vo
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:55 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso6604094pjk.3
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eedjnu3eOCixQFi7+Gzy6ksLbMXPKA3RAkF+Pv5QpfE=;
 b=H01LvzvOYZW3CFGR7dq3rf9nEaKtAXvhRucok/5cHA2o4e/5WHcn88277RBxXFdqEW
 yluoA5U7vF42pgTiJ/DMVwC2hn0h3IvMil1V2KKAEH3qnkQNhtvpPRw+eEyXelXbYcbr
 4CDVh+6jWo0uT805IPW01Hg3EyUc8mIx6Mg1EnK5T5XWunbykkZnuZYa0b7iv/i2xYB+
 sxQ03OFt4A8LYZ5LBzNq5IWgIJH8PZ05zGTO95c7PQoy95Ee75HEnzOYs9IZwbZkWNFN
 aJKYCiBynJX6c7DVh/2Eb4eQrzCasO4b8Tzn/qcBUV7Va36ZHWEm5KwzlxyZaHzq4dEa
 x7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eedjnu3eOCixQFi7+Gzy6ksLbMXPKA3RAkF+Pv5QpfE=;
 b=zSrtVYEOSKaYNGwRccVGXWdE6B+W/iV5jXvhTOhaxuWw8NjxER5N6hUjxG1lZgOSgs
 S4Pz06T/fFrsf2SlwSC6siJMDf/S+z8lOT70V4VO+24SbGUxEaK6MzMlgTHF8eorvlo5
 0uxQ9jwe+HnQUadO/b8/rz/4jS2FDFQ+iTJsGymh/zIUf3cjCIHreuxFliC+m8e0jErR
 S3Z4vPXUsMXe4oo8ua26XaDIoUsfzEqgC92klRQH7G77H81t7HjdPnVORYuikrhle1dY
 UVBq3taJPKzb6L9NLt0dvsDrMfJyNvwXYRSqrt3G6cIdTG37kRqq23usTf2XBFUocyvv
 P0Vw==
X-Gm-Message-State: AJIora8G87oDJd+jVL6gGr9J7qQnCSnUTBcoB1cxH5CepvcMhWBQ6jSU
 hAmoyoVaaAQj+QQhVKNaSt5ThINnX8NIzDhM
X-Google-Smtp-Source: AGRyM1sZd8V//TACKRYfWCTnzAi8/2TlIIo11HSg4jPTnp7VWvwATpcY1MtOQgB32Dt9GvbSTPbasw==
X-Received: by 2002:a17:90b:4ac9:b0:1ec:9bd1:92ff with SMTP id
 mh9-20020a17090b4ac900b001ec9bd192ffmr46198081pjb.178.1657095892266; 
 Wed, 06 Jul 2022 01:24:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 14/45] target/arm: Mark LD1RO as non-streaming
Date: Wed,  6 Jul 2022 13:53:40 +0530
Message-Id: <20220706082411.1664825-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


