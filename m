Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BC55FA047
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:37:22 +0200 (CEST)
Received: from localhost ([::1]:56576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtuD-0000OR-Dj
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtku-000689-PV
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:44 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtks-0005Yg-70
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:44 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so7246642wmr.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d+uOzEPtiTSHwDyxaSMMYXFTDRv7DD1JfLQ5SIWNG1Y=;
 b=EiaP5NxYkMJ0qLzXCKFD9y91xCzb4qsovwnjwbkuwJODufc6Xlh7w2gn9FS02kTIzN
 Yxut4O6WlLOF8LynTeZnjgNfp+AJrjZp2KuZdhiyQjXdaGsfK0P64WG5sEGqXvlCun+w
 Svuc1xTkzIBKqpgKmwF/dvc65E8DgvU0psFKO8r1sP1athzdJ0lwj2AyKAwrouBHLH3H
 surmIEseup4qM4mVJu0/cawPKh6jZ0MMrmY/AoHlcXLHAR2LHZBOSgvRrF8xsvufdFSs
 Vcmnp3w7aUFYWVtHmkYzbCCqkUw5wrhkcT1RORX8GkTaw9sQPGyIXMWNDxbpeLzbbjjv
 F99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+uOzEPtiTSHwDyxaSMMYXFTDRv7DD1JfLQ5SIWNG1Y=;
 b=O0Xg++xbDxC04e+k29mFBUhoBEVj88Zh2XBv/wvxV7bzy6H30mBk3Vd3LgYlUGmNkz
 b8YPDfRaNs/3Nbc0Zci83NS7XUKM2BvO7ACFoGXcL4PLsjd+QpWlxh48I5wBz3mw4TJh
 a/4n+f+M1oG2jvyC3deK3x1ldrvmG/7BO5Y8DifqqrGk/uTCXO3OhKg+LJ5Hx/x9mKUP
 hGohxooLa4Q/DS799de+HV3g1hBYVZ6RYfbLYWsYT9CR2a4sf5Uh3IYZrrZQDc/4+D+H
 Ye2VqnN6IviNxWt9cskNkk8KdzFbmRQsbatA1S8I2FtHwpbeaczpdIi7cxwZUdBDCYsM
 YfQg==
X-Gm-Message-State: ACrzQf1hm2K9D/DpNBkJ6pftP4Y93EaZpVU1m01qaN2LCWsHIFixAyL7
 NHExNsdUNfPSLtRVILX1wozIpPQ+lasMUg==
X-Google-Smtp-Source: AMsMyM6lvJqv0VZfNZ+DVV0oSm0zngl8Hyylb6V5HhdeBLlJMp7KSdLzdWHq16e04gzrljAf2n3hsQ==
X-Received: by 2002:a05:600c:a05:b0:3b9:cecc:9846 with SMTP id
 z5-20020a05600c0a0500b003b9cecc9846mr19809372wmp.3.1665412060206; 
 Mon, 10 Oct 2022 07:27:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/28] target/arm: Fix S2 disabled check in S1_ptw_translate
Date: Mon, 10 Oct 2022 15:27:09 +0100
Message-Id: <20221010142730.502083-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Pass the correct stage2 mmu_idx to regime_translation_disabled,
which we computed afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221001162318.153420-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 96ed8e13afc..631d1e25f15 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -200,10 +200,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                hwaddr addr, bool *is_secure,
                                ARMMMUFaultInfo *fi)
 {
+    ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
-                                          : ARMMMUIdx_Stage2;
+        !regime_translation_disabled(env, s2_mmu_idx)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
-- 
2.25.1


