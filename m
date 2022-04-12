Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343F84FCABC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:53:39 +0200 (CEST)
Received: from localhost ([::1]:58830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4mo-0007CO-9w
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tc-0001vA-F6
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:51 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TU-0001rO-Rg
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:44 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 b2-20020a17090a010200b001cb0c78db57so1052073pjb.2
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T/yvSxxK5KUGQ/GUB85StZPpHbnwQifk0lCtMvXSxOk=;
 b=IqTYOljpLcLx600eEcM+SBXVNMKLMTeLJ5LCHJrVFaUzv4+27whshnUcjijCTzHnXm
 lliGMWE6IbABrtZIl1fTRskQtDNh3VOPrATnYgJ5L6VkVYU+UvQB5xVxeBZnDsIkMRAg
 rTYU6aHt39Gpx0mmsFyO4IXcG1jnI9eUI+YzXdh2e25K1lFM+NgzTyWXaP6CZtQNojaw
 Eszs8auULG0Jh6CObAJrlLYylgmVCRjlY42OWTc8GGzMf3y1p0SoSID9p0lfZFFDveBs
 bEDCnoKib+rl82ZsXmrAwtPvby+K/3Rw9bCU794jWsrqNzCoH9q7zY9oEjFqlVeS/TQq
 ZqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T/yvSxxK5KUGQ/GUB85StZPpHbnwQifk0lCtMvXSxOk=;
 b=p7D8Qm5h88+cz0zhqIjfdkURWlJmdDf66pVmlI2Scv17QESE23RVBvU0BAXCxnhZCN
 W/jMaxYTlVbtqhhs0uT8d+bMsT97/XJ3pbuvPHgYt+AWMma3JImAqk9v/XYyZrR/NroW
 IMWDXZCl3NraEZdp1zSYuIQXYm6/Z83ivAPIEK1cq/7b/BE4NOwrU3q6DvKSaNfN81/7
 MA2lmH5chBqhg0kPkPsIvs/s3pUMq72ZNU6xeotmN69mtBXmNsLjffBFY4fL75E1Yy2a
 +hqBt0cYbQrabIsP4hCgn2ips+pqnLH8/qwK6qCHxijx7WaKS/yC5s6J9DQ2tFWjs/xk
 zkYw==
X-Gm-Message-State: AOAM533eK1Sx+plxf7DvXkcLBFJTeF1zJIn6UM9nNB+zBIbi+6seK317
 EoH4fzmNeiawhggyA01+4XdUtXYhY9fXag==
X-Google-Smtp-Source: ABdhPJymEK4e8vye9K9zZ8Ztv+4XmZNUNNhWvgQX06jFRTuG3Plj+KurMd/JS1vlAGnxv7Ku9QSQGw==
X-Received: by 2002:a17:903:11c7:b0:154:b936:d1d4 with SMTP id
 q7-20020a17090311c700b00154b936d1d4mr35073116plh.78.1649723619571; 
 Mon, 11 Apr 2022 17:33:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/24] target/arm: Enable SCR and HCR bits for RAS
Date: Mon, 11 Apr 2022 17:33:15 -0700
Message-Id: <20220412003326.588530-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable writes to the TERR and TEA bits when RAS is enabled.
These bits are otherwise RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b066a86f04..aa05a15e5c 100644
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


