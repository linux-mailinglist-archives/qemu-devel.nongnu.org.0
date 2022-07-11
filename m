Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D22570618
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:47:54 +0200 (CEST)
Received: from localhost ([::1]:43822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuhV-0003Tb-9m
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvV-0006Yv-On
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0002pU-4W
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 d13-20020a05600c34cd00b003a2dc1cf0b4so3078943wmq.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3Y3RKAb9EKRHz85QQ1SBe15QE606OXLqE7AmpOCzWmo=;
 b=ojPJK69pXcjj9Qx3XC6fosp2s9RE60jftDViFEhWa4zHXBkiSXVB1me8xADcHj2KTM
 JRtAg6gunRN6qGe1AGYiHYo3VEytaf+x/EpC2IIsYszi8L1jwb4EjsBvgirYU6vWUDUO
 LD7bGXp3FWcflegWMN2XfAFjKUFEBpJXzdMfXvwv+jWx6Cewb0PyQ1kDo7QeDH7Cu/ge
 ivXDmrkvZsup+d9oVKOwigWk1ssnC+NU25tli9mV4jwg6YOHIbyGWIzO4gxsSEjmH2wZ
 EYw5iVEl1UmMtuVqXTNo0WCvnstnWQY7r2dryadiYfhaLzOEae7rSK/Yb1GxODul1BQK
 xOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Y3RKAb9EKRHz85QQ1SBe15QE606OXLqE7AmpOCzWmo=;
 b=C1IOUZsPtUalfU7UdsWjoNYdkvIG+hIFWxTb51mfSmOivJTRssBjXgHcWUdAVQ8872
 I9a8pID0zO08Q/qSrO0RikaYDPreX4KH+d889rhCPDBqQWww4OkxElc2crCSkY4xdThK
 ul8MpJRAoXIcDEPJjIhLXETcrZOr7sF6YInBOb8iHBFfIU3Pjucv4O7Fg6KGXSqhNMTU
 +HXzh0iNvFPGyLRteXkL6e4xWdkXqydDbha8mAjsmA3o5gChLGH39kgN2TIBHy+lftrW
 94zWFI2mPSbVA+7K9Ox7WQvyETFwn8xOuX1ZyGlyPVJTWzRMmPmLyzK8J3KEzVgvwfZs
 xqaQ==
X-Gm-Message-State: AJIora9abviXLzT6G6lLdMiOxk2FnTMWdHSLELF7PpKKQO35g/CMywzw
 AuXKbktSa55FW39sgR/UeebkFI+OR+KQ+g==
X-Google-Smtp-Source: AGRyM1uwT4+BfbYvyfn34msQT2OhEMu6KiyX+wObyzGd5VrZDLZ1gMFfQPiuFXPy5HbttAfB2xXhAQ==
X-Received: by 2002:a05:600c:3553:b0:3a0:519b:4b96 with SMTP id
 i19-20020a05600c355300b003a0519b4b96mr15516751wmq.61.1657547882788; 
 Mon, 11 Jul 2022 06:58:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/45] target/arm: Mark LDFF1 and LDNF1 as non-streaming
Date: Mon, 11 Jul 2022 14:57:18 +0100
Message-Id: <20220711135750.765803-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 7d4c33fb5b8..2b5432bf856 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,5 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
-FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bbf3bf2119a..5182ee4c068 100644
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
2.25.1


