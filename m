Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB338F835
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:31:14 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMqf-0002xS-HI
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLbD-0006eH-5c
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:11 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb0-0005up-Cc
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:10 -0400
Received: by mail-pf1-x42b.google.com with SMTP id g18so20619353pfr.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KPcdnZuAqCJG4HBYcNFFV8xlK+AmV9NrhFUm0MsLHPQ=;
 b=QPr1qhjCoLCnXWo91jcXi/EuFp5jx+GwHMkBv6dYC4476in/lfjglA2QVcoZRIDxsk
 5qHOeXTg+INbnFyqdrJw/ci6A3k0QQNzw+N8O9YQ2faQAPu+4VXMJak3SYgHinIH3awu
 xFWhTIEae3wVeD2HYtMFU/vjEyXdLtN9q6AbogBHjDLMz55j9OpZaBm2/bFIloMfU7fq
 6iGZOSwPK/sRmLVZHupNSwQXNRTo4jDmVqwL1oMvllCTm0104lwJ4YMPzcrjBg/SqRrz
 Rp8KylJ8sCzkZ94q7eSmIapmRWrLV3KSFv5vAYbGhybklMrsQwgQDkJkWCCKYnM1y3yw
 sTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPcdnZuAqCJG4HBYcNFFV8xlK+AmV9NrhFUm0MsLHPQ=;
 b=ZERCwLstlGw4Lq1qJJ24xUwxnvc8R9PsepXAmmGzU+tTXPW9w8kfeokwItEduMidz7
 dmr4T2JAitkpzM+WzXgvYak2TtZm3Wm6FxoHAlAb5LwR+/dYKemnihMekIXXSxT331XS
 Ka5eJPzU9tO/yoqc8TyoOuaYNMPu5m1dHMnVrQVPwvMs1PNTbjGX6n3QEuqIANgHU5MC
 MM/gAuNSBr8YqDbb1xJc8tiFTH63gvEcTtyDt/VxUmsR99SLz9JGsDasP3XvEX3Su3uz
 cU8Hd+ixjOoMS2UMXZMDmWR9mHsQG9a0dqNihQg/w+owDiwmGAp0p4M0fEvpmU6DK0l/
 VtWw==
X-Gm-Message-State: AOAM530QSks43EtiM+FEIgTq+0A5gNqu5Qynr4ROfBOVfmLRfJyiqUxn
 jP27anOBdmM6yRLStqoFq3pihbc7WTP1Ww==
X-Google-Smtp-Source: ABdhPJydy9damQcqDSPJ2FMCof/IyWj6B5hhWv3z6BleQ/5iZCT6FfPUu6cxPnyJoUdcP6EdEFVz+Q==
X-Received: by 2002:a62:1a10:0:b029:28d:1590:d204 with SMTP id
 a16-20020a621a100000b029028d1590d204mr27415066pfa.78.1621905056463; 
 Mon, 24 May 2021 18:10:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 91/92] linux-user/aarch64: Enable hwcap bits for sve2 and
 related extensions
Date: Mon, 24 May 2021 18:03:57 -0700
Message-Id: <20210525010358.152808-92-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0e832b2649..1ab97e38e0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -648,8 +648,18 @@ static uint32_t get_elf_hwcap2(void)
     uint32_t hwcaps = 0;
 
     GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
+    GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
+    GET_FEATURE_ID(aa64_sve2_aes, ARM_HWCAP2_A64_SVEAES);
+    GET_FEATURE_ID(aa64_sve2_pmull128, ARM_HWCAP2_A64_SVEPMULL);
+    GET_FEATURE_ID(aa64_sve2_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
+    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
+    GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
+    GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
+    GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
+    GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
-- 
2.25.1


