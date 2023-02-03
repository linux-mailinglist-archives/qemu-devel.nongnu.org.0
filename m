Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88280689BA4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5Y-0000Sq-GG; Fri, 03 Feb 2023 09:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4i-0006tr-Lc
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:30:00 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4f-00053Z-R0
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:30:00 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6125856wmb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L2nnqzPfORcCpUIAV2HyeXVRQVeoYBVIUoJ05tbUvrM=;
 b=NT96SRFcdwVoomEJAZrxvJiJs9Ol0Sf83+iAGijF5aoM9Au4TEMvoZoh54e/JyuBOq
 wpIWezoU9k1i2/yATyrVbzM9BbZgD4djza81vYFcLtkf1gxrHufQDAh1bBpzSJ46hHri
 1qihFAtHD+pvYOChTwkl0JlLxij4ZyHEOT1VhzMYaFaV5mbG4CAIdPirfcivFct7tFF7
 WDG58J1Fxw68TmUzU46rbIW7umaINpwgZ82Q1bA6bprZYl55gm5tpe7y6X7hdv+kbot9
 K0qsWyyhsTD91TIhknOVHSsa1A7DmkFX0r33qLjqHIoMkOcNqsqBxvapUhHon77lXnCh
 7FRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L2nnqzPfORcCpUIAV2HyeXVRQVeoYBVIUoJ05tbUvrM=;
 b=AESzYs+4zxjwPzPT4cnjbw/d0Y/9AHeCzvFWxhF+u978CYc3Ua62Arh7iTNfM4yBve
 ibzq/x70M8dxMA+7aoJmkPgy3SDAIhYSFRemG9spC3nXPUM4TGxaIo2p0Zlu6gxpKXk7
 79elt5gs9RtYjB+yV0SqM3eKhkC4d+eygHlu3qUwbX79blkan6gQxUZ9G6aFuXAhr+WH
 dTyVi0R7CPVpXsrWJtp6L18weivV6Cp8VP2sZ+P1a5mj4y9MdsIxaYNBJjI6XF3rJIBF
 7F614J5jeHG28fInzvWusN2AVPL4sGGgM1lcFRJtp0g1arl3ffgbi96xLWxCffP7+uNe
 cR8w==
X-Gm-Message-State: AO0yUKVUtczpQBMo4UW1mCtZGEA/RwaBMjHGN54MXO//UYGQaKY/qPbE
 Z+MG8KKkUTo8mQ2jgnaDN/KjC+nedi8MgDof
X-Google-Smtp-Source: AK7set9aTC8lEUcCUUr/efS2rL3vyLbw4/36ePYPxjI2LWWXktZxzN/+MCmPHlZND2jJVdxtExmBlA==
X-Received: by 2002:a7b:cd17:0:b0:3dc:4f65:553e with SMTP id
 f23-20020a7bcd17000000b003dc4f65553emr10745119wmj.3.1675434597097; 
 Fri, 03 Feb 2023 06:29:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/33] target/arm: Enable FEAT_FGT on '-cpu max'
Date: Fri,  3 Feb 2023 14:29:27 +0000
Message-Id: <20230203142927.834793-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Update the ID registers for TCG's '-cpu max' to report the
presence of FEAT_FGT Fine-Grained Traps support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-24-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-24-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b87e064d9dc..2062d712610 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -30,6 +30,7 @@ the following architecture extensions:
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_FCMA (Floating-point complex number instructions)
+- FEAT_FGT (Fine-Grained Traps)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FRINTTS (Floating-point to integer instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb5..4066950da15 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1224,6 +1224,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, FGT, 1);       /* FEAT_FGT */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.34.1


