Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D8F55BE97
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:06:32 +0200 (CEST)
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64Mp-00007n-HW
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62no-0000YS-Lq
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:16 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nm-0004N8-Pg
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:16 -0400
Received: by mail-pf1-x435.google.com with SMTP id bo5so10908529pfb.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VC8ZWzxnyu6yTnDCbARNM0LQoo/mTr0TQhi66jhQlAA=;
 b=EnF7Soo7x/yp9bK5HX2/N5c8/ae7rAWSAvvf48wBuBAa16sm4m/zZIBCa08cnwnLrM
 viJqn7+Lwggj2ntuIQ+WUfeFVGtUBBHh86vRAUyYLVsnVJX8GMXzO2Y47QlO0JjuqHzY
 0ne9PYmovpPihskoDNx/mHtRJJolNZ1TWrQeuct/Y90M77bDK0qzNsEA7HomKXzdCbUZ
 7LAc9aapWyQyYOJQiVW0ZA6ZHL06yiByKAB8b2ds/Znb97h8ctid430Cxt54/BPqoRWO
 ulidfXaB6DJtZYayxq8l6X4JT+pCMdUfZ9MHuKZ80S/GJsOKNFzTTGiEKZrxtPH3k7/J
 bURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VC8ZWzxnyu6yTnDCbARNM0LQoo/mTr0TQhi66jhQlAA=;
 b=mUPSChW3tpkqFh8RO5hfaY3ySXXYnc/KmdOS+OqXkCaUk3ds+6cSmcn7gzPokUUD7E
 sD84sQqc34DLsBaAfQOKLZKxI1PVvv26OM3rq9cLhR0HrrkU2oAxnhTvvHdyM/x/hqoQ
 GNPIKuM1tyB5U5Q5ze3tNa0S/9jnIZTHwi50kBKXj+25JOIwlz+xwUt9/4mzG71+r3kW
 hE1okxcyZFMPlRit8d3OzCmnc+G42xc6nSXP803ib/gniWWMr0OmouMFx7rYGQUkhOTu
 ptV1FMz3+/9U5eWWZV4uDIAuvCXtXq9v0SwNqXyVRao1y5C54JdJWsdPfySLC3bmR8BG
 lzUg==
X-Gm-Message-State: AJIora8XxENkALBi4/QBPedbr0a7oVG0YR/ET4NlvW58SwS8VxhQWm1j
 30HG91LjN9saabnNrO+KLe4yHALBxHCX8Q==
X-Google-Smtp-Source: AGRyM1vmH6Znx0Axapkde/ElA2i64xiW3vWzaylGxSm786yIVE9sy/zUKniI6kdYQVKNDR53yrHirg==
X-Received: by 2002:a05:6a00:278c:b0:525:65c0:6415 with SMTP id
 bd12-20020a056a00278c00b0052565c06415mr1455052pfb.33.1656390374005; 
 Mon, 27 Jun 2022 21:26:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 k26-20020aa7821a000000b0052517150777sm8160565pfi.41.2022.06.27.21.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:26:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 45/45] linux-user/aarch64: Add SME related hwcap entries
Date: Tue, 28 Jun 2022 09:51:17 +0530
Message-Id: <20220628042117.368549-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
index 163fc8a1ee..a496c37855 100644
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


