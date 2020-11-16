Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6462B4A90
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:18:04 +0100 (CET)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehCd-0007qQ-79
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3a-0008M0-Ur
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:42 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3W-0007oI-RK
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:42 -0500
Received: by mail-wm1-x342.google.com with SMTP id h2so24250155wmm.0
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1E4/N3ngk9+sSJeoqjEEgug8EpMJh/6B7re7b8qvv04=;
 b=Sb3nrN35EVnFe9mcgvWo0J33bwUJzveB6RdE74FyMIyw4/gglb7KGiaTlMlcnE3Qda
 /qEMzMftj3MG0iBYOlzAnGS2srbtlV8ZLZI8KZh+oVgKK6V9yslU9/Z8YiGTICgePfyS
 BWPtUjxgL0XcfrtC6ZDMW7w3Yc8MGRheBcLXeRg7ayhfRzO6yqyfHsITFj9ugX8ia+dE
 JpXlMYcEAzAxAjBM8y4lz5R0+hVRzD3kvJK+t2Sf8XFkAt+g9dNTznlwYPrTYXan6FuN
 IdTaC8uMm9I1A5sOESzySaKLcG944O9/xhNq0qBA0/8oQ/xMg71XWVAA/Shv9oERB8i1
 CHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1E4/N3ngk9+sSJeoqjEEgug8EpMJh/6B7re7b8qvv04=;
 b=IMIEHS5ar7solYatciaJKyjXpll91KOO2IAPYO6HyOCOw+KcZwE5YjFL49B5jwaH6t
 VJznpHyjA0T1N0PwVZ9zvj6ecn89xqmCBz/nONvu+uqGxgvzZK9JD+iP1tyXcnPXKhfS
 2xFQYX6WA08ZCrD4tFpUtMslurLajlLcOCssThJ7z7HnfdFMc7djicaSDFD15viqKwDO
 /vGD4fqI9AzdSHmGqIgJGRmtaLK56Q657FIqr8qY0ppNeWEGzfX2xI6IxHG6mf9ufOUY
 /Y5xjNKADZLR6af0fojt2QIxW9opckkuuval741Vaz+QhitBIkSTlotX1SxGBLo1cejX
 mgyg==
X-Gm-Message-State: AOAM531NDFrIhWul36juidsrWtVWJW90hNBwx8WtawUwc4WooossKhdU
 3s/b9G1ZhS1LOrHnbG1aeQ2d0A==
X-Google-Smtp-Source: ABdhPJwRr34rxkf0lBYRr0rzMR+PIQ0aHtne0SHeYoCZlP4q/Eh/lMZzcQoNGsgDsT8QHXfMQOiNzw==
X-Received: by 2002:a1c:2e48:: with SMTP id u69mr8327523wmu.30.1605542917115; 
 Mon, 16 Nov 2020 08:08:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/15] target/arm: Don't clobber ID_PFR1.Security on M-profile
 cores
Date: Mon, 16 Nov 2020 16:08:19 +0000
Message-Id: <20201116160831.31000-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

In arm_cpu_realizefn() we check whether the board code disabled EL3
via the has_el3 CPU object property, which we create if the CPU
starts with the ARM_FEATURE_EL3 feature bit.  If it is disabled, then
we turn off ARM_FEATURE_EL3 and also zero out the relevant fields in
the ID_PFR1 and ID_AA64PFR0 registers.

This codepath was incorrectly being taken for M-profile CPUs, which
do not have an EL3 and don't set ARM_FEATURE_EL3, but which may have
the M-profile Security extension and so should have non-zero values
in the ID_PFR1.Security field.

Restrict the handling of the feature flag to A/R-profile cores.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07492e9f9a4..40f3f798b2b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1674,7 +1674,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (!cpu->has_el3) {
+    if (!arm_feature(env, ARM_FEATURE_M) && !cpu->has_el3) {
         /* If the has_el3 CPU property is disabled then we need to disable the
          * feature.
          */
-- 
2.20.1


