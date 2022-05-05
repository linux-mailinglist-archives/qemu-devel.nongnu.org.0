Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9FC51C8E0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:22:01 +0200 (CEST)
Received: from localhost ([::1]:44974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmh32-0004wQ-8Q
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYV-0002gp-8f
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:28 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYO-0004PM-PQ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:26 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-edf9ddb312so4160044fac.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=XUFAcXq82H01NZknIG9Qac0KD2ViCUzqP/vDoyL1Q8+pCSCLf5xeoq+JhfWUThlgao
 3k8PCeGFg09KIox4HyVRzy636nOiYG5aJoQJdbZSkJmiD6LJdE0U5uKoUzjD+YWIXaAO
 oI1Q45juC2Fz8N3MZ5Q6rUtLIxxBSjafpcdqLQX0hG7bo30B+UY3ebBM7GjzUcv2R/XF
 AaD9JyJ+rykJAHlm5X+B3O8HShQwA4COwtqylDChM/7MlN1ZEEcuRNObjDRSdeZHhT5s
 b0nHW+a0Kjt298weYYXwbNFwuRb1AdPlwGlygbij6PilTwQXbtaTt6nXctfadb7cC/4x
 331w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=ms2cJqxxaEDwGgcc5o7I2TWOD9bV010qXoHG7Dk0x1GPcwJVMHJ8UAa7qRvoEAPtWy
 dknFtYIBkZHiK1Tai+9DIXzgLCvBQjlJBA4S/ViyBLH+waOG042UvfG8t+0OJqXz7X2L
 4BgpTysHSeWR1a0fHcBrKeqU2+85qqWYMp2s0YA7/6fRKNYAZg6bXrkGOOFYWXPWmHUA
 owK4rtyMzmKZc5UxprlekvGFc3W2xf3zs7nlctQdymwNCwanvIDAhF2hP4f6FQB1l/go
 K0w1vgng0T6PYGAen7ARNBpd2AO66R8lFl4r8AXuGcF6nZTEsDQw0Yf3QsCQKWmiAG2L
 8z3A==
X-Gm-Message-State: AOAM533jB6opzKGDUD0CFHCdYnEJmVtf/EW6ROOjcLCRzojiwsyRrAFN
 hfNVtZ/j+FLbm9kivQpbdib/Tk54vxOVSmF7
X-Google-Smtp-Source: ABdhPJzxiiCPryFv3n/T0/bY7t+QJxnpDLD87aIcB+HSm/VUyzPSkuD/V8UOhpusLX2qJUBDfPRVkQ==
X-Received: by 2002:a05:6870:a689:b0:ed:e8f2:fe14 with SMTP id
 i9-20020a056870a68900b000ede8f2fe14mr2980724oam.199.1651776618263; 
 Thu, 05 May 2022 11:50:18 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 07/24] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Thu,  5 May 2022 13:49:49 -0500
Message-Id: <20220505185006.200555-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f9094c1752..9aa2f737c1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1084,6 +1084,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.34.1


