Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF15568419
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:53:28 +0200 (CEST)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91ip-00030n-Je
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PX-00010k-7S
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PS-0001GM-Ki
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id o15so10084072pjh.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
 b=Qy062rT5xiCcqd1nA9P6hms0CJQdmJhYfq0hImy7ZKbvwJfmdOqUSO9m7lKSQKmW1/
 wNImjGohUMpXZhePoQzSOws6sP3Q4CUNn5FjlpffoqhF8UzeYP7MRDBFeeWnpazh8jrd
 /iZy0aTnykm/qOyfhj0hYXFkEMherXCjXBSpaKqU6Je1MoIwsWAshiINThoJMfjuvEx3
 aKVzxBlbJYR5SgIglmzrfxhUAuDAVkI0oaGINn8h15bE5+83UNSoPn0VbBIYOxG0eVY7
 KpzPhqPuPbF+b9U4MCjG0YZRo/bCevOzWIR3YdOWB1b0qlYoMND77pGUF2czVWSCnMLd
 rP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
 b=OznQB8PcwMyyIHqmCvwxlHan58ybW+T3zmwksO7MLwvN7DKLjfXc0pGKr+2jINsMBA
 6vSXhar989BSjfxIdNCMFV+08uOsa+rut0lHEGWEgGerOpyd1dc6z0f8ol2T1V2Redwi
 MyGnu2vQnfAvJqyfo+I/vTpAdrN5RuRTZnIbjp1HXAHDs08hPbr+C6hgG0Qcl/NwXhgG
 hbG3r1l6enTzvGNTY/WBAN/0vhwUf7GnIkvPA3aztqXmO/ks2zqe8k20il5J/22V0+ti
 11+S8v/+riiFDJfluH644YReUADVYjdfn6/fGVZY8bncBtNvpH6JGHUIw1PC7BOxoPEr
 c/Ww==
X-Gm-Message-State: AJIora9ttmRqdGtWGHtP96IAJJ34l6+hCT5za2/NBR3Ys4M+e9qT45H8
 q24GlzS2cTOKWMAu6XmLgwxPCChjJb04BEF/
X-Google-Smtp-Source: AGRyM1t/yMHG12+m/G+iCHXMbKNYKDqed+tOHxRv639/G8DDHecP5k5w7kh4CZ7DumWk6O1XidXmxw==
X-Received: by 2002:a17:902:a60a:b0:168:b5f7:4148 with SMTP id
 u10-20020a170902a60a00b00168b5f74148mr47174952plq.47.1657096161222; 
 Wed, 06 Jul 2022 01:29:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016bdf53b303sm6700529plh.205.2022.07.06.01.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:29:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 45/45] linux-user/aarch64: Add SME related hwcap entries
Date: Wed,  6 Jul 2022 13:54:11 +0530
Message-Id: <20220706082411.1664825-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


