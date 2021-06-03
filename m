Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33739A593
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:16:05 +0200 (CEST)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq0q-0000UG-Ml
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkr-0000t8-TS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkp-000788-E0
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i94so1346581wri.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WtEpVmIvsaRaNzylpQMHyWPaveoMgdHxl+rJ1pUl7k8=;
 b=UvcCHVrKNejoF//0gp+aGw5BHufs8FRKS4pX+yTzC24hNRmaXkHa7WsvdX7gGNZprp
 X7GUlULBwujkarqqRQsqvmGi891CNXs4+Esjizevboysu1Sj1nzrUwryChJ5tURk6lRr
 bnZa1sR3tAcv1b04zcT0DmVaU7jy0eIKhXT3Vy20UJ6LpXMeDbWPOmbqTy2loWsSP61G
 U1Y8sChGU6zN/4l2CdAcZ5vI8tTa8Ac3IK3TCSnoIpru0rFDEeQ9ZjyT5Dm4sKvqPeZV
 jMSC1KZdSxRNHp9sU29Xq8oMQcPBt81+cntPpE/cW8VFBY/QaF/zkOTs/wXj86KJbmCs
 AU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WtEpVmIvsaRaNzylpQMHyWPaveoMgdHxl+rJ1pUl7k8=;
 b=WOLBsBDHdVrM3c/LjWeb3PHK+iVCK4/SLa5bAWykkCRFpSstDbWQBHvhJcMqZyMWp6
 3JJAME8yxY6tCBHDm2Pp7eXbJoyGtL8kYGrI+i2045uwtioL1k0RukmLj63RRFO6N1NX
 x7h4wj6CgUSJz51fcB4/ix33pg5Ob+tA59OCQt0KhuuIiUylX92uL+t4PTxoZw9BJtRF
 IOuzb6QE/GW5EgefpLNKQ04IyqrpHUNlNiW/UyMbjugjyoxstOjPTxLePWBd7GAFNusF
 fCAQhKRLwMIOReJP+3WWdqDUv5rshnCLpkxTP/Fsf99MtVLg4lSD2WT5E7cfhqioSYun
 NmQA==
X-Gm-Message-State: AOAM532/1mjMglA7wHHrhl0C0UGKRyiHfNC/NdKtxL/td2iVrV25Go1H
 M4uahV++GDbq+j6WTKIcAU8nzDa55++HBTIg
X-Google-Smtp-Source: ABdhPJwfGX74wlYCDUeb/O7ppLEhv6kGhEmCfGcCi0EQSRQSQpO3UXasXQVhdhU/Mg84rRuG68j/Zw==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr683638wrv.100.1622735970127;
 Thu, 03 Jun 2021 08:59:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/45] linux-user/aarch64: Enable hwcap bits for bfloat16
Date: Thu,  3 Jun 2021 16:58:45 +0100
Message-Id: <20210603155904.26021-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525225817.400336-12-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1ab97e38e08..17ab06f612d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -659,7 +659,9 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
     GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
     GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
+    GET_FEATURE_ID(aa64_sve_bf16, ARM_HWCAP2_A64_SVEBF16);
     GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
+    GET_FEATURE_ID(aa64_bf16, ARM_HWCAP2_A64_BF16);
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
-- 
2.20.1


