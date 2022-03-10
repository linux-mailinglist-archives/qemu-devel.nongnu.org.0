Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A924D466D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:04:12 +0100 (CET)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHWd-0004nq-Un
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:04:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxc-00061M-Ij
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:00 -0500
Received: from [2607:f8b0:4864:20::52e] (port=42543
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxb-000807-4h
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:00 -0500
Received: by mail-pg1-x52e.google.com with SMTP id o8so4480891pgf.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O8yV5sFKZ931fgVLOgWvtxvBKBH4NQ4GdxvxJ8ycVLk=;
 b=Uusg49HLaN7UQ4M88l8vhFOywqJSuEhV9EX6T87hxr0jthadi0Dobf2qSbTqwz/aAu
 EdjUc1/518Pxa1NkOh6bayAEUlaTKEIfdaxfHU4MFrirZI42nhkLD4dxTrjY4++Zlzr1
 PgwGV1R0CBK9/nyICcxRbuOTytfyuAKMv1j8VShbhcYVFzVrQ/bVdS5xzdBbBbMz2Sbz
 nk0MGTCbA4YCd3kHPQLQ3rJMYcuy9zxAFYhdGJvTAagLRbNl8PQfKZXHciAmpsSMNkq3
 DAmMCInKS6NAmOwQmZEMsOasH/tEgY/zJK3CxgN7PBdSebSJNwIacY6gjs58ur3Wwd4A
 tt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O8yV5sFKZ931fgVLOgWvtxvBKBH4NQ4GdxvxJ8ycVLk=;
 b=YFSjpD2m81tjnqaoIayRNH5S5jyuHgCCwf0Vio4Xxs51CgDutRdKYYlmG/O6e5qVlQ
 ZtZqQNYtKdtJjvAQ6uVjlHYbphRL+cl7xkotQ/eZq4SqfDpVW5DHvH0VpDYqcEue8B6U
 I4Ad9BuWY2I4x9Mce7YYIYonYxpS00KcDsqihh/y8tRV6dciZU+zJiYGMPvAN+FMHT6r
 GI0hNeMm70Uh+e59mGGjH45pwbAVfUp7No76EBAM4YRbdY+8sKnTZ5dqmRZw4S49agW2
 OMIEAwS++DvBa56vhzUkt+flnIB6kUOsHfRNslmTGJDwtfTuikI4AftdiZXm7JvvWLTu
 WVcA==
X-Gm-Message-State: AOAM530aTepBTQLzxuLJdGQlyCT8NIQhQA8fHR8f78r+9R6x+2YuY9hG
 TUHIETSTYCYjWFnSwdIZh8Mct8eTvhjuFw==
X-Google-Smtp-Source: ABdhPJwJtAo+93UmfurvFx01FaJbhKtiiQ1IpPP4dZ5dMqMsFJYOJpUfBiS8MBKYcdfx1tcjJ2gTxw==
X-Received: by 2002:a63:7c5c:0:b0:380:7412:341b with SMTP id
 l28-20020a637c5c000000b003807412341bmr3701409pgn.38.1646911677833; 
 Thu, 10 Mar 2022 03:27:57 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/48] target/nios2: Implement cpuid
Date: Thu, 10 Mar 2022 03:27:04 -0800
Message-Id: <20220310112725.570053-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy the existing cpu_index into the space reserved for CR_CPUID.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index ce2b0c6493..d491360973 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -163,6 +163,7 @@ static ObjectClass *nios2_cpu_class_by_name(const char *cpu_model)
 static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
+    Nios2CPU *cpu = NIOS2_CPU(cs);
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
@@ -175,6 +176,9 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
+    /* We have reserved storage for cpuid; might as well use it. */
+    cpu->env.ctrl[CR_CPUID] = cs->cpu_index;
+
     ncc->parent_realize(dev, errp);
 }
 
-- 
2.25.1


