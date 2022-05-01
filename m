Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F751624B
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:49:42 +0200 (CEST)
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3Om-0007oX-UA
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2UB-000771-4G
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:13 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U8-0001QE-CH
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:10 -0400
Received: by mail-pg1-x52f.google.com with SMTP id k14so9534269pga.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WvXcqJE+bSJxjY0PJJiNeF+EUgDHhL7U//iKcka87g=;
 b=WjSJ8SGhGuV0j3T/FqKFlwFd86Omn0G872y3B0J6WEsSHHidU0l5Z36rJBRZ2JtcY3
 JjPKtHTwe5O+F4R03uM4H/97PP24ibTky4Sk99vn/yfD6lEKPKul8BsekHRPXohS6n3Q
 oopRdqh1RlLTZfOUF8ME3uQbaof2U3eArWSUbbiUzCOZHYMUaJVqgCp65o3p+QNw9wHa
 EVJOjLY1s5Woq/qmu5vnEAP0D5Ivscgi10O7uqbBdc36lxAdcGkm22+x7i+mad7Rqu8p
 WA0zXzO5vARiIf0rjacORF+9FldOTNiLCnsW/YfrXeU4P9HdaxqUy/lbV85yZOb4hoMv
 5ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0WvXcqJE+bSJxjY0PJJiNeF+EUgDHhL7U//iKcka87g=;
 b=xG6ge0fa/jnnis1v+SyZgxyxgW0mPYq29kgHAETjo+x8x0f1qyEZxFlRu3fs/bkIzB
 raW1NI1lLFa2bS2HaMvnMczxJxFSEO/OGrJJgFDH+naJld6sytmqb1C7//thbVpetGdn
 J1il7iBDPHnu2sfemgCNxdBpFbTUeDM3EDY2MakRi4Vwi/BFkrXyfa17Lx7zazp2yO/Q
 Q8oJmkz2SZfWa2Dem9J5N7Fz2slcYfHKdV1wq1MNS81AfCvKpS5ViR+Xhln+7ypJLJuH
 ZQ6nezkwFjKlBoa+3OC7Be7PGAKxlrwUGyEagJL87CbZf/oBDTca4cOmX3ji87GbD4bf
 kS9g==
X-Gm-Message-State: AOAM533aXAMZ0XydeakkMj4LqT+GVzRfPc1+ipaG3BirIlVayzJaoyee
 Ij4GL/MUXTmdDFoBsmq1ojUFxEAWPlzT8g==
X-Google-Smtp-Source: ABdhPJz4fwXm9akcYbal7diaG5yya1XisyeutTFDcLIMheKtG0W2GedMtsaLNAPYxJHmQg2/a+LFFg==
X-Received: by 2002:a05:6a00:23c4:b0:50d:e8b0:6108 with SMTP id
 g4-20020a056a0023c400b0050de8b06108mr74455pfc.76.1651384263779; 
 Sat, 30 Apr 2022 22:51:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 35/45] target/arm: Enable SCR and HCR bits for RAS
Date: Sat, 30 Apr 2022 22:50:17 -0700
Message-Id: <20220501055028.646596-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
index b4bdd4a4a6..f6f26766e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1755,6 +1755,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         valid_mask &= ~SCR_NET;
 
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= SCR_TLOR;
         }
@@ -1769,6 +1772,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
+        if (cpu_isar_feature(aa32_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -5126,6 +5132,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
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
2.34.1


