Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D15FA08C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:53:56 +0200 (CEST)
Received: from localhost ([::1]:57946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuAF-0006dw-FZ
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl4-0006Oy-R1
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:47075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl3-0005YG-BH
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bk15so17272320wrb.13
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e+zdmXfTwEDKvAlf77ndTlEHPt6WHX1xALzzxaa3N9s=;
 b=ejz0ZKUE+LTWQYhuCAky/l7DTK+nGsvHtU879SaczMpzHEkrUaI74uJBoq0VCxWu1j
 VSH1maV/IWQzlRVm79Tix7ssYaCtHxTHSBYrVM3ZRmJlfGPOWqgyi7IE+2NPW8thQ+Hq
 0XMpRAxMuKdBIdOW4C1PfxrAKfA4jWQgjFMandKG9BmhvqkCz8DPd4VfZbwYJxaZ3apO
 uOEGJ/Dy4vrfGpvoj+weC2H24Oaqg8lvjlij8aZ4PQA5+3kr+sX//0c2J9hIes9e1CV8
 PRD07Xm7ENOH6RG5DWaT3fvc6GExZDoDQjDDOcWqt3bUiiAZ9fltNYTGm9Qx+5jNAAV+
 2/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+zdmXfTwEDKvAlf77ndTlEHPt6WHX1xALzzxaa3N9s=;
 b=4IZ015v11+0UogtUi3pSAAvL5kh3QDlbeZlTX7ww9jnaBEEgB82SOvRZ+YAzP6Xom+
 TfYRx6EKyMeZfMK3E+kYw2/xZv1LKHo2cuFJuXap9I+aFPnKEUskEisuG1b8HV1aaEHC
 t4K+tycANSQ33/+JaSHgw3eovwhQsIfH7uxuXYH5T6YmBHxsyOJeGDCihlIkW48mEB7F
 4DxQlZKY1AWKDapeWu3D/VeH/nQ+l1HHEOsKHTPAMkTR7non03xtHtsYjOENeQAtjLXi
 NUs6FmmxyIJsUIExez4HZKkUTTQUixBxkQF99NSC3PAMMzHWyKJRmMUvGOJx49s+YuHw
 tX7g==
X-Gm-Message-State: ACrzQf1YsUadncHRKv93XzHrOFvKcIhb7IDFQdXOz501ArF23eBZz6Fa
 S7kE71jDX+45+mQVZrLp+O34jxWpTweFog==
X-Google-Smtp-Source: AMsMyM5GA75bYC1afDS1zWMgbdGWARaZb5saaPitAsrUJ5YNhopGjUunUgJjCDLv8uUghlHGSafhyA==
X-Received: by 2002:a5d:648c:0:b0:22e:63be:be09 with SMTP id
 o12-20020a5d648c000000b0022e63bebe09mr11554333wri.159.1665412072465; 
 Mon, 10 Oct 2022 07:27:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/28] target/arm: Remove env argument from combined_attrs_fwb
Date: Mon, 10 Oct 2022 15:27:21 +0100
Message-Id: <20221010142730.502083-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This value is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221001162318.153420-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b40b4586f87..7d607c2e7b5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2172,8 +2172,7 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
  * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
  * combined attributes in MAIR_EL1 format.
  */
-static uint8_t combined_attrs_fwb(CPUARMState *env,
-                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
+static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     switch (s2.attrs) {
     case 7:
@@ -2246,7 +2245,7 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
 
     /* Combine memory type and cacheability attributes */
     if (arm_hcr_el2_eff(env) & HCR_FWB) {
-        ret.attrs = combined_attrs_fwb(env, s1, s2);
+        ret.attrs = combined_attrs_fwb(s1, s2);
     } else {
         ret.attrs = combined_attrs_nofwb(env, s1, s2);
     }
-- 
2.25.1


