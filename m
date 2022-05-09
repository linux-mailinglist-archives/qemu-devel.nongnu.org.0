Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6CF51FCFB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:33:54 +0200 (CEST)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2aH-0004ft-L6
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22h-0007i3-20
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:11 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22f-0001Kn-D6
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id b19so19092384wrh.11
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XpvaNYf3N2LXESEBCGwFXMc1KzcepH0wfVYS4gErJ5s=;
 b=QGVeTiZ2s5Pokafrg3gkaW2/8XM8++JXnXbbVh2kEoXRv09KoV0pR4M/ei1pipang+
 nLdEPMv14Ud13sed276zQfP38qDisMH/wFOV5nJSrOsoXpE8VfJtrODMn3CXPxlMyaGC
 q/3XygSUlMCuiQLqARgSMgsIbUXcxtIgiDX9RKHV93HWGyESyO2UTNIkGUyuC35NG9Rc
 jUuOBEf1p31VdZt2q6qH8eL9aBvB3npYHV6bEp97xBjHW7ju0XqiD9bzyAtLaPirmVM9
 KwCCYXAuxb7IK592w1hmATvuFg3FofsUagqU/DMVDhQIuDM34G/Ml02NBcBjUpy5dqzy
 UUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XpvaNYf3N2LXESEBCGwFXMc1KzcepH0wfVYS4gErJ5s=;
 b=vkvyBVKsiu1TVCSngh3Hd/zjYaR5AheB/12CQ7zlYhB6ecnv+TLU/B3v6Eg9ztgxHg
 PJJxQhQDFPuV3vIq39CSpg1M5fS+O5wNlB2S2+TSAB3+o/izNUa1HGXROfkgEr5OAtri
 6upiWul2Iz0MsMmS3n0lhwFCvYZMNkFQeQNZa7E78e4IVAvTqW8C8E9FSuk+SocnFtDC
 NrgQkqYYdQ+mTPC+SrL5p75evgt1X/rFLj7oMLtEZx1Q0M5c2vpoXDolZhiVXm+3FzG/
 ceDO7UPqQheVzFxU3dOOensU0DUN3OkEt6NOD8AYjo+R5fLf+nQbg9qeesSGHHlcPWe9
 +uIg==
X-Gm-Message-State: AOAM533TCGiSTIkOzrtNBDI3jjKYxckxKfKPmDyw8nRziJsweQPi/HPB
 1WQ32eyUzXulZLjIXhxXowWZg7584AClRw==
X-Google-Smtp-Source: ABdhPJwfschSLve547eBVWPdOC0axP9AaQciwdLeIms6HEHIOGYv7+xoLgP10za2g/M7Ze3rUL8o0g==
X-Received: by 2002:a5d:45d0:0:b0:20a:d002:b80e with SMTP id
 b16-20020a5d45d0000000b0020ad002b80emr13475809wrs.447.1652097548178; 
 Mon, 09 May 2022 04:59:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/32] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Mon,  9 May 2022 12:58:38 +0100
Message-Id: <20220509115848.3521805-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-22-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 9765ee3eaf6..48522b8e1cd 100644
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
index 07b44a62bef..40f77defb51 100644
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
index 762b9617073..ea4eccddc35 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -74,6 +74,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.25.1


