Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A9551DEF9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:18:30 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2X7-000794-Qi
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IR-000625-TB
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:21 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IP-0003qH-H8
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:18 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 k25-20020a056830169900b00605f215e55dso5407065otr.13
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=cvFabjusyDYtYvLDBIguxD4+mL6yFsulBytm0WpGIPvS4/opCcsgQGv+XyhkdrtFtf
 DAJMJGmF5qxWb/U7etAXdT+vckIy0GmnkD0rW5wzAjnsgiYDoagPZYFZ1IWNQ57EaWwp
 F7QowXRqrYT+TIph9KeyZPU15qK/fXgdP0mNI/IEQox6+nN7779Qrj07xMIKZjGG5/9H
 v5mmg4GPyBcH6CfjIuiG21Sg+f9S/yeYIbBnLsqcGpGA9h5rzfEqAVClKy4Szw0K4Hag
 2iqmAvMY3n058oS2gjlJs+oeIfeiy15+Y18PjtaJAyeIfWHPbMTcT78QsvFzyWaBsXaB
 nqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=PFC0U1ssao3UbVTVJnWI5eTdvxH5U1DqywRXbg7fB7KLkVNRQN3nrSYuO542CyCruo
 eCggGQnUFBTrKErpEVN3XkKONKFKn8mdWHR7UE0RVooQt1CoFSduW/C4IKbbM/Fgatlx
 yCXQdGAMRGRSnHMCE5HhhmdUTLYzSUfYs+K9953D0YTbgDJe4iRJY+LfEwu3wPI6ddrU
 37iwfcD7cZ9WrU/2taJGrWGRFd5poi02LOVUAkEHYdIOCk6SICkF2lDjDNon62NQN8Fc
 sgWBvjSuCHyJRpYJgA8PwhrD1muVZiaLwejW2oIB7FenyL0IBiB6+FSM7xI/JElvI5XF
 j7Pw==
X-Gm-Message-State: AOAM5329az20xwGeE6eKEAbsrEDHtIRvBMimA1briJbegj2gHdeCiK0C
 nlWwnTVyqHoiWo85m4s//TNCOw5jsRZs2tDW
X-Google-Smtp-Source: ABdhPJxvX8XsVsDLKL9IgB4DAwrwCPfXOqcvjgdu79yVbaZMIvtmJ0KLzAnw5dPwrmSfvMItLDiQPg==
X-Received: by 2002:a05:6830:4420:b0:606:64a6:1deb with SMTP id
 q32-20020a056830442000b0060664a61debmr1095139otv.236.1651860195231; 
 Fri, 06 May 2022 11:03:15 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 18/24] target/arm: Enable FEAT_IESB for -cpu max
Date: Fri,  6 May 2022 13:02:36 -0500
Message-Id: <20220506180242.216785-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8110408000..b200012d89 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -25,6 +25,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_IESB (Implicit error synchronization event)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 35881c74b2..10410619f9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-- 
2.34.1


