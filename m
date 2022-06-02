Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CFE53C117
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:54:42 +0200 (CEST)
Received: from localhost ([::1]:34000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtiC-0003xn-Od
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskV-0001jB-MH
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:53:03 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskT-0000uo-A7
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso5911054pjg.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DykCJozY64Fe8oG2Osy4GtewqpVyxda/M4nkZEjhEDk=;
 b=mRnDmgP++ifXN/MW014dfaGCMya65kA+ZThMcQz/YjIaDsE7mfwI2Hi/EsIUSUgs0u
 AoiMdY+mig/N3OlaPZXd7RAUwbuqH+eDyNa7bfBgZmCoqLZ2aNZWHZqY90ciAi/QXDjy
 xpj5245XQjrN72rj/F4K5QagSQGcf34bFB8cS71TaS7FljRs7Ji/8w2bhiOSlDHj+tY6
 kgBPuTbr9KDSLUy27ygDC3XhAJcwGvsWaRA7vSKlvIq6ns4WsPIWUCHcPyUB1pUsyuva
 HVDi99XbaBv4LW6iFv5RLjwj6GZzZIzb7OfGVXBg9c0Grq33Cx56Cvac7/8QRIKMWcoR
 L91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DykCJozY64Fe8oG2Osy4GtewqpVyxda/M4nkZEjhEDk=;
 b=HPC0H8A1W976pmlCgKGoSQXS+BLqLTVIKKlp+Ovb33KXrPsGpvm5CQFoNdMKf1l+XX
 ag91n3sleE3SYIYoYYGV4aIYbv4vWdyCVglXzXO5nwbN2ga+MkD/iphuh3QkXFJIYVCZ
 oo3YfSCt/6yUUANh4PRwFhTf1omUYvKpX2l5K8UtlGWtB84xvWE8RXwCiT5hsvbI/BFT
 ELm2gL3sPA/X1gXjQscnv7E9dDPW5j5sFSXkES3PNaDLfawjywR3S+DrHmMIu9WeRZrs
 FoknXdJ5TCnvQj6pDmEwM8HASa5AzCZvhYgN0wQS1Pw3KFrDkKupldGVwJj2hkvm32eU
 TGrg==
X-Gm-Message-State: AOAM533PgNpUyn0IO8Z7ishJ5lAaBwHh+ML6W+55bthbZ7SBgK13x/oE
 QOcjVEE8sPZo73aJDaCBGA3qkufG6Fif9Q==
X-Google-Smtp-Source: ABdhPJzu6VmXiz7XI9OoyX5NvZtg/8lbLVUYga3DgMHxrbFWet1JfnWDRGKG0owwa9X7bWeyHMU79Q==
X-Received: by 2002:a17:902:7d8e:b0:162:22ff:495b with SMTP id
 a14-20020a1709027d8e00b0016222ff495bmr6997877plm.1.1654206776513; 
 Thu, 02 Jun 2022 14:52:56 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 71/71] linux-user/aarch64: Add SME related hwcap entries
Date: Thu,  2 Jun 2022 14:48:53 -0700
Message-Id: <20220602214853.496211-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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


