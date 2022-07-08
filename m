Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262A656BCD9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:21:37 +0200 (CEST)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9pnU-0003He-3S
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi8-0002Ap-Ld
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:05 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi7-00026i-1G
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:04 -0400
Received: by mail-pf1-x42b.google.com with SMTP id j3so11128631pfb.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pHHLspKH8W4B5YilQ8WrGPBQ+uTIDLVeEbSmBurKp7U=;
 b=LymeUmereyzsWgRmarJbmGBzZH0FYFvLJpiuGxJzP7qhTADbJGJx4ohnYrI9DyDmDn
 fAhoCLjdIAIp/L9AbN7d+RSWI8Rpa1y6rD0F5naxbIof+zgNEmZhgBsDtvimWNUSZ106
 NIr9AzSlae4cghM9W3RqRqQEEa5365cwtKpmFChLSTOGSDAycF0lziNjYQ0GSLmx6+S/
 3Swwc4PAJZq8088nEysmWcyuwdVmQglkgZ/ufWyBdHceJ29NPavDzuWaOslIhSWvNOYK
 5Z4NJo8PkUrRS8fKIcJm6q83VhvskP0G//lOr6jwF5RzkMJAyT5ecUyAQlCzbK7FmA+E
 We4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pHHLspKH8W4B5YilQ8WrGPBQ+uTIDLVeEbSmBurKp7U=;
 b=V9L9Ks1bHe+PbgR3gnrXTOt9ZvrujiDa+86DWPVlsWvyCyKBNUV8g/UGlFyBYBfDW5
 N3bQluy5Z40Z3ACeeeHEp3yFs9fgiQLf5eIDjIRhpA/VNMXi5/MFbv0N/sPn0c90dYNa
 zIb8D/CiB6oY9wbVI4aKXKU63HE33JxdYyver5xWbH0+Er5mIayhSJHDcd1F/5DF3r6+
 VRqvIW1Q4fQwAc4V14WxHOzZIXH49eTAzz5L2vHeRKoPfFAZEhJG4WmfRSQtjlau1Rfl
 1qEDR/G7Ey6ufecbEiZqFoYv0trKn1p7fMezp0SzckZvgQtnVDbotD72b7W0y8BUihhA
 X7Nw==
X-Gm-Message-State: AJIora/Uj5oJxsTligaL/IVrpqAYQSG3DBCwS0enncXYOdxhjVM5NtNz
 +aQe4Mk9Z/1mZ6uCg6QB273t+x4yohds9+2f
X-Google-Smtp-Source: AGRyM1tALuRNY8SBqjNwza8h783NMt5ff0HQw4KSW0G4G/m+Jp7rTVGHhxRVDPzWFcVJ3bLTOMaNOg==
X-Received: by 2002:a65:6048:0:b0:412:73c7:cca9 with SMTP id
 a8-20020a656048000000b0041273c7cca9mr3873181pgp.257.1657293361529; 
 Fri, 08 Jul 2022 08:16:01 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 05/45] target/arm: Mark RDFFR, WRFFR,
 SETFFR as non-streaming
Date: Fri,  8 Jul 2022 20:45:00 +0530
Message-Id: <20220708151540.18136-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 9 ++++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 73c71abc46..fa2b5cbf1a 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -61,8 +61,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 
 FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
 FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
-FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
-FAIL    0010 0101 --10 1--- 1001 ---- ---- ----   # WRFFR, SETFFR
 FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
 FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
 FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5d1db0d3ff..d6faec15fe 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1785,7 +1785,8 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
 TRANS_FEAT(PTRUE, aa64_sve, do_predset, a->esz, a->rd, a->pat, a->s)
 
 /* Note pat == 31 is #all, to set all elements.  */
-TRANS_FEAT(SETFFR, aa64_sve, do_predset, 0, FFR_PRED_NUM, 31, false)
+TRANS_FEAT_NONSTREAMING(SETFFR, aa64_sve,
+                        do_predset, 0, FFR_PRED_NUM, 31, false)
 
 /* Note pat == 32 is #unimp, to set no elements.  */
 TRANS_FEAT(PFALSE, aa64_sve, do_predset, 0, a->rd, 32, false)
@@ -1799,11 +1800,13 @@ static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
         .rd = a->rd, .pg = a->pg, .s = a->s,
         .rn = FFR_PRED_NUM, .rm = FFR_PRED_NUM,
     };
+
+    s->is_nonstreaming = true;
     return trans_AND_pppp(s, &alt_a);
 }
 
-TRANS_FEAT(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
-TRANS_FEAT(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
+TRANS_FEAT_NONSTREAMING(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
+TRANS_FEAT_NONSTREAMING(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
 
 static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
                             void (*gen_fn)(TCGv_i32, TCGv_ptr,
-- 
2.34.1


