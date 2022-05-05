Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900351C986
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:49:03 +0200 (CEST)
Received: from localhost ([::1]:55346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhTC-0001yz-8N
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYl-0003Eo-6h
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:43 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:42543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYi-0004aO-Br
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:42 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 s12-20020a0568301e0c00b00605f30530c2so3507084otr.9
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=JV1nr+9Alv23LjDksJM/oDNw/xp44i5ghLG1RdRQq63bl7PAN1kUiO+j2+MAB4T8KK
 c1eAl3/GOaBt/z2v92XJ56IGMp48Q7q8tQMp7+Xo1nW5ok2JG6W46m1MYxx7K3W9Y+2z
 DBRtLmMFuil6Y8sfo/uZZlXKjT0YHni6QYMTP2H0WmWaLG6ORKggsMb1E8P83DLZQg42
 27UXecI+IQ2/2Y5X6x/Ft624ARqzZmol0vHShozUpgiH/mKD3Yaq4zn+5r+GIvswkcEt
 Sc9gucDGUuJlTYdbxRXvf1JMbj3jqiI9ACFTgpS+qtEFSwX80EqohnPLa1s/0kKq2tV5
 B7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=GtKoFeAUS5qfi0VG4/7K3J9YSr72z5RCEtTvlPCIQFzMwmweh1dxIG+rXkx0tapssq
 VwsWBGjP4Hdj7rHlfz39ukvbhHclfcl3PCPfyWavgzMmvsDB1KJT3QouuFN5d1FvkVnP
 +OvZyXf5SjMzxZATSjFnnxRY8D/hgoaNvY1D0th2kfh5a50zhEdeFZ4ZTSgCurqQCyrP
 PDQMps/IhmW5rUX9pvcLlnfRHQk7bDgAceHqhSFrrQRyEsSAbMiIneMv211XtD1Ubtol
 FKwLY8+xva13nntG3bcRv14CuOCgXGEPiCYYEKvNSMWGZ/rry22QfCYntvcrPcyh3ddG
 3dsg==
X-Gm-Message-State: AOAM533Co3vUP0zgalWf/NtV1tw6F45wfY4OdkIiAzfarbud306yIXjk
 0KsgDVMByfDSzsOxakiAE+dSSLhyu9C++/Wp
X-Google-Smtp-Source: ABdhPJwuNC0bmKufW/PO3gJ7YclB+PJGxrt9INz1Jc24iUatTp4vET4jP/MWDkKKSBKYuVZBE07OIA==
X-Received: by 2002:a05:6830:448:b0:606:35a:55f9 with SMTP id
 d8-20020a056830044800b00606035a55f9mr9742850otc.84.1651776639349; 
 Thu, 05 May 2022 11:50:39 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 21/24] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Thu,  5 May 2022 13:50:03 -0500
Message-Id: <20220505185006.200555-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
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

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 9765ee3eaf..48522b8e1c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -16,6 +16,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 07b44a62be..40f77defb5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -749,6 +749,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 762b961707..ea4eccddc3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -74,6 +74,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.34.1


