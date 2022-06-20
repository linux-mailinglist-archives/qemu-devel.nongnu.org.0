Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2261E5523E7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:32:15 +0200 (CEST)
Received: from localhost ([::1]:52898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3MC6-0003d5-0T
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdU-0002xf-CR
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdO-00024o-II
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:25 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so1812006pjj.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DykCJozY64Fe8oG2Osy4GtewqpVyxda/M4nkZEjhEDk=;
 b=bv2n6EXYCxrlxuN2gN+Ilv1eZdnxsj4EywpuE7OnnJymUdAMo0FbbZ/tqXP0Awc1IV
 q/qB2Fw0+as0yH6zDf+hPYbkKiuJtZxQ9OniXedpHBeXFhBchew7tsv3LF8KSX0RwWpv
 5IIC4C9TY+m9HlzU9hoBhdQCIufHot3m0Z1iv2/+4pgDpbWPEywfIo+q5CUmBwbnTjhJ
 MiRvt1WW8FnySA/KjKzZw4lmoFDf60+8IZXKAU52JZDNNJvmle5VlYD0BnZoWdxQUIqD
 CmB2Hbur2XUskTUbB30hkg7dbVcJ0VkeHORQXSo/5KYAl0ibAetFDvuB30udx3puxQcW
 Yfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DykCJozY64Fe8oG2Osy4GtewqpVyxda/M4nkZEjhEDk=;
 b=0h9uGauE04PdBs8ZuH85cEPKquocRZMHQBEm9d1Km+BuG7Tm5W9TraRVpYowM6QHoY
 kWVagwHdDRaw6tc+kNqlgBzdXC5Y9jZ1rSUqpjju2iJcR8aYvDtHcQhDZDS+bV8d5p5x
 ZL1abq12IoCr4Ne+Scj3y5M79bkUDvK6vLcPtnR8Y5Wr6F2hJ+K6Z3QowDyyllKMfHIm
 1N6sQ0+OEOzsam/4H2vJzFplzoB17R9Q3CdxYcHO9A+G66gQFM5Sj7KGlQ7U4igqiBEo
 prJo4Gpy6DiAuK0LPZSitytIO4aMgv4Qt+lzbsMBaSjL2+WJsrtPduDEnyLsllixBnaR
 pXaA==
X-Gm-Message-State: AJIora+Z5zcdbeNil4gWXmmLLeiWeAUHkDNIZpYgQCM0UHxzb7dzo5te
 6E0vQFoyKUbgQvZjjOEOZyQ355xGtukt4w==
X-Google-Smtp-Source: AGRyM1tgtb22djyE8geR+EYgWiG/JSK+C7DlKXXjNeQ7viZZK42urGnTwxDvRLMBMUWbMYq2dppUgw==
X-Received: by 2002:a17:90b:3143:b0:1ec:be03:e0a5 with SMTP id
 ip3-20020a17090b314300b001ecbe03e0a5mr1887383pjb.30.1655747781275; 
 Mon, 20 Jun 2022 10:56:21 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 51/51] linux-user/aarch64: Add SME related hwcap entries
Date: Mon, 20 Jun 2022 10:52:35 -0700
Message-Id: <20220620175235.60881-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


