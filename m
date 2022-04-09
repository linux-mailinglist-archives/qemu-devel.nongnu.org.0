Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186144FA074
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:09:56 +0200 (CEST)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyfr-0003d5-4u
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydx-0008Ub-9P
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:58 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydv-0003Ue-OM
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:57 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b2-20020a17090a010200b001cb0c78db57so7966677pjb.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NUApV7x1eW6JanJ9cXe7CSNy/ZAx/ZG1Cq9BgRTELmQ=;
 b=Gt2CXFXF30KiLt0/W5zjehS0Fj4PnPoedIauhr9xKRoUZIwlbJfzN92cCyTwlfDwHo
 ZHRFx4eRyrvuiGphqaCcKto5ZypyMhMHNrDd9Faswm/xLvyrdrlNQ7c+OIJi4oXWxxyP
 MXU9qv4rJyGWRITqwFsJ91rSDjKUuvmMdLbxUCqKWY0VoRRuRfh5ygAV7gbN3WEbPhnU
 PpQqHGTLzIOVlljhBRnD92AFmKp33D9Tq1zkbk6dA4Zoy7vpsykGlUZUGvGOoUC4H6/2
 fkCm8LkUj19zQ786Afj18EVrFwnHw+MSqziRHGGsCX77iEhXlTosEMjxlAHGYFSpDtER
 XM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NUApV7x1eW6JanJ9cXe7CSNy/ZAx/ZG1Cq9BgRTELmQ=;
 b=H0ycOXs21u8Y8FmAHXtXRt8988Ybk/pCEqaN6PY6/qp/HSDLXuE1V71OKm/4KAqRHj
 kEBYb6CGBrIy1YwTvkWBi3atSgziCvXqZ9rVWv+RBJAkM6Zj1mOuwh54Xp/T8HS+EbBO
 nzQMup/kTagzfV6rW7oYMyeI22K6JJYZPvlGpCeCtaUkrmvtGzzwlinNJIUJzhbwVbDB
 hLuxYdH8cDMc2vrMSgRFKuYZ7810euGiKeqUqYzHT08QIMULf31ZPx6KZX8pC7hqZarP
 k6hKjh6U2UIlSbnXzSikVBXkkb+pvjjGXZKCC4Zvtih6gA76nF7BviO3KbGfpXWnp5we
 SBVQ==
X-Gm-Message-State: AOAM533gIlB54dgi3S0FAQk3xdH/hNjBGaOfPsGL3H03rtWIJaF3hdbI
 xzO5HNs8gi4+ljqHxBqH1+7dcHjDjL6T7Q==
X-Google-Smtp-Source: ABdhPJwgmbEjhur16T5nlp/4TP7ai2JIfx3HsURvRhCkIhnDJoBaTvXCS7cLl28N8lWxMxP4IVWCNA==
X-Received: by 2002:a17:903:4052:b0:155:fc0b:48fb with SMTP id
 n18-20020a170903405200b00155fc0b48fbmr21514473pla.27.1649462874409; 
 Fri, 08 Apr 2022 17:07:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/16] target/arm: Enable SCR and HCR bits for RAS
Date: Fri,  8 Apr 2022 17:07:38 -0700
Message-Id: <20220409000742.293691-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable writes to the TERR and TEA bits when RAS is enabled.
These bits are otherwise RES0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 01f8558fca..2f6b02af7e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1765,6 +1765,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         valid_mask &= ~SCR_NET;
 
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= SCR_TLOR;
         }
@@ -1779,6 +1782,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
+        if (cpu_isar_feature(aa32_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -5289,6 +5295,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_vh, cpu)) {
             valid_mask |= HCR_E2H;
         }
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= HCR_TERR | HCR_TEA;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= HCR_TLOR;
         }
-- 
2.25.1


