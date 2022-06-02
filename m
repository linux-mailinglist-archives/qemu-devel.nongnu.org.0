Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37B53C091
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:04:48 +0200 (CEST)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsvv-0002Hr-RD
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgk-0004aL-QJ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:06 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgi-0008WS-H2
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id 187so5791686pfu.9
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=bywEvkmnIb7r7ZyRdZI97F7nc/D52jZRCdOtDo6VwfxJrbCe1kBxIg8dYCSiI5CXcr
 RfdnG0flMby4SkyKS/d8FYOalskgszDFWbv+OeQHNE8vXYRB/q6Q3UNoCgUY9EqmwBIG
 lLU0rZaFk58qNMNQMZJfvDb+bXwnhg6ijKs6FidUiL/MDb0RQn5q432DjvKz+7eINLzy
 IUVaExTTYxUdgVDhZ4E/jvap0NuWA1RmIiYVZElJadWbr1FAGg1mXDpsKXoCm5S7eXUs
 doTipSrO2Hp/NIehwvlOGatB27eeC34fJEO6fC+aKlfHLlqRJow7bSrlpBUtQhEzvbly
 cHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=8Q6jvEmqyLJubv0Ws8AxViM/wiD0A4uq2xBjzbvXS+fVFXqFu4LgCzwHze2hQgfKm+
 GaGMnjAF1ubzUDRyyGzCUYURd2DtrGqZY615w7yeP4IMN4+RDvw7fQIh/iL2bkcBDXQc
 tFr1piyTq5xPhV5BaSfYuBHP899f1jZduSDiIL31eBlb25L3wVwZBHjPwl6NUBQKpx8k
 RLSk5ia9ceJKSQRao3Sf9AUnWsoB9rDp1QNB2mGTNWYaocQimiSUvkTBz70qIs+bboZL
 yrU6pkPVdIIDLspmDnaWGXYyeYg9xqGs+f/+LAjMNFCIEzXi+Gv8GY+g0IyP27ygiAMq
 9ysA==
X-Gm-Message-State: AOAM532OUdeIfSnlg1jf/13re8iY4kiRarI5vfNWFTX8qSpC6tyjbtPU
 3oDdyxkj0XlpV0prCwfoKtx4uugHZ9BINQ==
X-Google-Smtp-Source: ABdhPJyPjEsVHkV7FwTFNCOtO9cD+g+uQXtAdnV8rIrzOJfxaGrhSLG4LkqCowoz0tyYr8UrMblQhA==
X-Received: by 2002:a63:44b:0:b0:3fc:cd1c:49e8 with SMTP id
 72-20020a63044b000000b003fccd1c49e8mr6061503pge.172.1654206542235; 
 Thu, 02 Jun 2022 14:49:02 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/71] target/arm: Do not use aarch64_sve_zcr_get_valid_len in
 reset
Date: Thu,  2 Jun 2022 14:47:51 -0700
Message-Id: <20220602214853.496211-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
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

We don't need to constrain the value set in zcr_el[1],
because it will be done by sve_zcr_len_for_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2bd74c2ed..0621944167 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
                                          CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] =
-                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
+            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.34.1


