Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4D541B42
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:44:27 +0200 (CEST)
Received: from localhost ([::1]:46958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygzy-0001bW-Fh
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfx2-0007jf-TM
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:20 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwv-0008DU-5e
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:20 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d22so15786850plr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
 b=zADOhNo9A4xia2NWmohK53fkDMn9otAZ+9BOR2nwpwHn530Pf8cRakwQO06goIg3Vk
 mBDFwuyxtdtjve9WZK0s+Wu6VG+5s7j677zMgv2jNPhRAfm32DuEFeG0cR7rdXDSTxIH
 F6k4jCXLi10KA+bTZXKhjmM1/y5zSqezMJKEB7lJG8DbiEv2oZ6QSqvB7hra68SWjnyj
 aCbnsPjJEaDUTk/1MLZWVCzsNRs1qsVNEdP1VMeWPAxjvrzf/k8d5t4tJIjZoHeROclj
 DXlZ7NHsqsOO4sj0fFN+dZSR7dQMB7bD4MlzJKDNQrgqqjg3bVMNj30XvWWO3xpqrgJt
 wibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
 b=DFwNcwIKZBob5X25QGY5NpLUo+T04aefspJ+V1qOiSGpkOtlZt7fBX7Q2bN17lrE/Q
 XY1lafM/GwhzDNbi4X89yZYPTiYIO2xQIUFwJTx27WqAOgrPRnpQXgWa6S7Buc+3khoo
 75Jt4I5aO8tvle745T8ajhwdaq4cKuRySUGurUdcBFRoyta1cgk04NPYzYlaeavNUxEy
 b4p2GETVYpixdoN8T3Ko32j9kOcrNu/vekTAdK8z5iLvyaWcWOpu+dY09NXmMIvvidL+
 PICVLNv3HTwgRgaAGn6SdlBx1Lz73lRsEyfncwsy0wJ2klqGHXUutSYHRuHVjfollGJC
 +HCA==
X-Gm-Message-State: AOAM533HqEwkX/TyKN/JSAVYpWKdg3WBlIsqhHrzvHsp4rNjvP8BLKoD
 9QK3tedAXMW7M3bMRoQ1aQYcPc4KRdE8dg==
X-Google-Smtp-Source: ABdhPJypCmXWOrdJLgE5AksW0rGIa2c3ezGVwUOgW3DdCFU8tUOYnrdYxC+VFggcuQyjbDXx/J2XRw==
X-Received: by 2002:a17:903:2312:b0:163:daf7:83a9 with SMTP id
 d18-20020a170903231200b00163daf783a9mr30791150plh.160.1654634232387; 
 Tue, 07 Jun 2022 13:37:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 70/71] target/arm: Enable SME for user-only
Date: Tue,  7 Jun 2022 13:33:05 -0700
Message-Id: <20220607203306.657998-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Enable SME, TPIDR2_EL0, and FA64 if supported by the cpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5cb9f9f02c..13b008547e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -209,6 +209,17 @@ static void arm_cpu_reset(DeviceState *dev)
                                              CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
+        /* and for SME instructions, with default vector length, and TPIDR2 */
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            env->cp15.sctlr_el[1] |= SCTLR_EnTP2;
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, SMEN, 3);
+            env->vfp.smcr_el[1] = cpu->sme_default_vq - 1;
+            if (cpu_isar_feature(aa64_sme_fa64, cpu)) {
+                env->vfp.smcr_el[1] = FIELD_DP64(env->vfp.smcr_el[1],
+                                                 SMCR, FA64, 1);
+            }
+        }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
-- 
2.34.1


