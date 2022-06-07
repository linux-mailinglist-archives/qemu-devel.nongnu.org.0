Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ED3541B78
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:47:41 +0200 (CEST)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyh36-0007U1-HD
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfx2-0007jZ-Sv
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:20 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfww-0008EU-1P
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id d13so141128plh.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DykCJozY64Fe8oG2Osy4GtewqpVyxda/M4nkZEjhEDk=;
 b=Z0m5xHf+DRD4UJ0qaaSDvgJGpGOcx4m/xuR7GjwfhLP3Ixln8ajd27uiWKElFu1s2A
 R3i3Ydfaxr4u29M99ZCits9L6RRFmuZZtmVT61SBpO/cLrG4RRQkIAXCfZfxpAH/D3MO
 YAqpxxdBt8ojd83qEaXtaE5fsfJhuhbH6ut4EqdKkQolSTVQIB6Ph39bZMTu+ec9EcdX
 8sBQ4rhV6voSLxWVUzQqs7LQLSXfxYOCPq/sOPJibTuYU/7hh2AOb0x6w8xmX6A5655M
 qwtkXTdXbm36sj6imtHixjp7nf1yKzARgFBEYYHhBcamS7WLJG/oTocerDIf8e0FORjO
 ysnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DykCJozY64Fe8oG2Osy4GtewqpVyxda/M4nkZEjhEDk=;
 b=KzUe6oiE7tY7YEtBdESXTTEWRosBQQJMWkJpfl1Wvzu20TXYxmWydIinJH7Z7cO75N
 rVFXMfVAAsSYpNEP5KkPXV5C7kjQbq5WymU7Um6OwV0qJ8jy/ggXMb/Lhoap7OojqD7h
 R6+SQu2TDC9YMKRgnqE3gl5uHU3arAQNtAXofZjVbwBP91mx6+RnXYognbPD4WKiTPn3
 OHrjhckyeOlgbgvwOpcqE+vjbTylEDRbULU6nAuwd+muErIz+pI5S3SnuzMV/y3jFCDc
 9wUJy7qsHWYKS5tzFkRvmCGFJOIZGOz73fZ7myPiES7Y96OYKAjVryTpBOjc7st8cdes
 fBSg==
X-Gm-Message-State: AOAM530QTbwZbdaydgeOKXx707riSfKMsQCGbdhaAmjKdNwwqngSXeH+
 EJFHVfL2mKkoTfKsP3fuC/OryGMJ7fUkTQ==
X-Google-Smtp-Source: ABdhPJwTkzJnOhhhQNXmfRDN87MB6UMipr91qDJnsb4uMsEV6TD3bbt1ct8Lh8TJKsMOnRNptBv5Bg==
X-Received: by 2002:a17:90a:ae14:b0:1e0:51fa:5182 with SMTP id
 t20-20020a17090aae1400b001e051fa5182mr68270983pjq.60.1654634233259; 
 Tue, 07 Jun 2022 13:37:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 71/71] linux-user/aarch64: Add SME related hwcap entries
Date: Tue,  7 Jun 2022 13:33:06 -0700
Message-Id: <20220607203306.657998-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f7eae357f4..8135960305 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -601,6 +601,18 @@ enum {
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
@@ -670,6 +682,14 @@ static uint32_t get_elf_hwcap2(void)
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


