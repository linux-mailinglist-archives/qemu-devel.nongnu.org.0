Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0551556BE10
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:16:42 +0200 (CEST)
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qem-0006dt-3Q
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pn1-0003qm-U1
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:21:07 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pn0-0003JW-Av
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:21:07 -0400
Received: by mail-pl1-x634.google.com with SMTP id f11so4055476plr.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
 b=xgquYLXYJXsW1UdcvjlI689LtEmJcoi3Hr7/dyoIlSxt75FzcYeh8n6q5oqoVq7jiM
 bnn+CpvLDm4RRA7cKilyTkHndqjIruzjPAJZDzZVZa+ktu79asB5pjTzdT3QyWnJPrPY
 vkUm6ZrfFg8/jiwajXZyBaJvPUV7UN3IpzVDqJQ8IpU4Zbod5h6t1oUSuqpiV54rVOXe
 M9a5Wtnnrwrx+habCsi3qxjLPspeXVtqjm/NKWyHi6IHyqkysnvLuxeXnCbnlGb0xt+5
 0drSnI7tYK9i1QyQKlKfbzqmBCsHFKnI/JML9Aul+4PoeLS23o2+qoSJFG7YMdtodHvc
 0geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
 b=cWxefQuHCzFU6Ycf5AqW3cEz599lRFX9VyisxU2mICZvncDt0QcOvOyt8Aw92/xdQu
 8anApUVI2kvlWaHewL2my5Uo0UxxOHGQdo1eEUXLLt10foT4s9Ac7/N53uw7vXEkfNlG
 dd5g3LCBF1R1ce/RpGk8LZwn9jTd1H4mQnL8y8II5ch4rGAd+wGoxbqV35J1dvSa+YW4
 HJ0qIJe4KvSPDEY+P8E87Wi2FqNpOfa863WG3REaDSove0/z1g2KuzVT6fNAeyS58kFw
 6d8zYj01Dsrg+I6puBYxhkL3nkRwLwGk/KZoXLoHKw1JE/2Y1ROjohS0bXyLXAPjWNV4
 XCCg==
X-Gm-Message-State: AJIora9zvK7QnNj9BK7lYXqeh3NjoH5opoaOoJawBHS9Hl99RRf+kLVy
 GBYWlPTy2bniJjdZ6NvrWyxJRTHrRGDAdYNH
X-Google-Smtp-Source: AGRyM1s2TQsHBNDcTnokgrOaaCK8nMfva+py7DwicVtwuGa3tJYEnD/kZKrmOPolEx9e81mAJWgFQg==
X-Received: by 2002:a17:902:e84f:b0:16c:76c:561d with SMTP id
 t15-20020a170902e84f00b0016c076c561dmr4301208plg.119.1657293665113; 
 Fri, 08 Jul 2022 08:21:05 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b0015e8d4eb1d7sm30067741plb.33.2022.07.08.08.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:21:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 45/45] linux-user/aarch64: Add SME related hwcap entries
Date: Fri,  8 Jul 2022 20:45:40 +0530
Message-Id: <20220708151540.18136-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1de77c7959..ce902dbd56 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -605,6 +605,18 @@ enum {
     ARM_HWCAP2_A64_RNG          = 1 << 16,
     ARM_HWCAP2_A64_BTI          = 1 << 17,
     ARM_HWCAP2_A64_MTE          = 1 << 18,
+    ARM_HWCAP2_A64_ECV          = 1 << 19,
+    ARM_HWCAP2_A64_AFP          = 1 << 20,
+    ARM_HWCAP2_A64_RPRES        = 1 << 21,
+    ARM_HWCAP2_A64_MTE3         = 1 << 22,
+    ARM_HWCAP2_A64_SME          = 1 << 23,
+    ARM_HWCAP2_A64_SME_I16I64   = 1 << 24,
+    ARM_HWCAP2_A64_SME_F64F64   = 1 << 25,
+    ARM_HWCAP2_A64_SME_I8I32    = 1 << 26,
+    ARM_HWCAP2_A64_SME_F16F32   = 1 << 27,
+    ARM_HWCAP2_A64_SME_B16F32   = 1 << 28,
+    ARM_HWCAP2_A64_SME_F32F32   = 1 << 29,
+    ARM_HWCAP2_A64_SME_FA64     = 1 << 30,
 };
 
 #define ELF_HWCAP   get_elf_hwcap()
@@ -674,6 +686,14 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
+    GET_FEATURE_ID(aa64_sme, (ARM_HWCAP2_A64_SME |
+                              ARM_HWCAP2_A64_SME_F32F32 |
+                              ARM_HWCAP2_A64_SME_B16F32 |
+                              ARM_HWCAP2_A64_SME_F16F32 |
+                              ARM_HWCAP2_A64_SME_I8I32));
+    GET_FEATURE_ID(aa64_sme_f64f64, ARM_HWCAP2_A64_SME_F64F64);
+    GET_FEATURE_ID(aa64_sme_i16i64, ARM_HWCAP2_A64_SME_I16I64);
+    GET_FEATURE_ID(aa64_sme_fa64, ARM_HWCAP2_A64_SME_FA64);
 
     return hwcaps;
 }
-- 
2.34.1


