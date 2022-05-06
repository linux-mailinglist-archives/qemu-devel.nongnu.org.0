Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A873B51DF0F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:22:47 +0200 (CEST)
Received: from localhost ([::1]:41082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2bG-0008Hq-KT
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IJ-0005xr-S5
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:15 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:45546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IH-0003sN-O6
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:11 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so7965018fac.12
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
 b=igzE6ZVstxe+YSXa7OJlktNKrEuARDLIG7h/HIbOSjjoE+yGqX2cjxsIUmrRwC1O4b
 INAkI+jo45+9MqatTMSuVkIBwxbZuF/knTKElGlEq92KllSRFXEYwMSur9ZdDhvIJXzt
 p0gOQIdBEhh5Z/uGCiW5XXt3c41QXRHAeAj1k4/4Lzeeg4o0nfrkXebzBJsNkziMMKW/
 SzT6eYswgeD81yPEg+OlurnjRQQFd+kxOYK9zg/ejsXqUVPgClamxeSMqZVqCe6mXr9c
 rzaQ7W4PSLwRRlEJpM4vL6EkqTaRp6SWoQ8GvILFLHOoQHDGiUGl1RpeMjUbZeTSKo1Y
 LmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
 b=Pc9CV56nzPMtJ2Gz+vXIQV1/5e5VkBoSh2rIpRB31oNt7BqCFOESaSeH6CXOaMoSNr
 EZA8xmRifM6I8FMqqgdF10JdtH02kPpenrPUsr4EFfIhnfdKFmBjtf5Q2AIQz8NkFo74
 O0N+JekkG9/vHw6roTfUk65kMLG9GIXX48wyqUIhVHg8ddzaMph+yO62UYpCTpr6QsIe
 3EzzidMAVsPfZaC+v+x6YRd45sc9BZjTFYiHkm89N+hw7ONfZeFg+a21rHB0Y3er2cNs
 O0oYISSzSupbVDKM00+qNuD4uuAGjgQFE4TQIgZCcPAJzXRRtH9v98w5ZThXTID82HZj
 s8jA==
X-Gm-Message-State: AOAM530BUbHECONRh2R3tVdFRxM2FpuNWjW+0a+XJNq/zAMefF+w+2/i
 eqomdN4Gm/HjGONHct7Wb7F6ybp616DYYGYW
X-Google-Smtp-Source: ABdhPJz8N0pZ3Qiy1D3FK4+hDTQ7Z5vkJ2J9EbY1Vs/pFwea9YvsGKSL00A46Z8eNl0jutYpTruI9w==
X-Received: by 2002:a05:6870:796:b0:da:3d6a:101d with SMTP id
 en22-20020a056870079600b000da3d6a101dmr1863301oab.20.1651860188493; 
 Fri, 06 May 2022 11:03:08 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 14/24] target/arm: Enable SCR and HCR bits for RAS
Date: Fri,  6 May 2022 13:02:32 -0500
Message-Id: <20220506180242.216785-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
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

Enable writes to the TERR and TEA bits when RAS is enabled.
These bits are otherwise RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37c5e42bc0..b6faebf4a7 100644
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


