Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A7C3C2778
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:23:36 +0200 (CEST)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tHr-0003Aq-5R
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t59-0001in-Lq
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t50-0000yU-0r
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id n33so6652617wms.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zIGcHABe/pzobGUgmxz+iMJPc2gByN1I1kKPS8O7gyo=;
 b=MO0EaRCRPZVwEWNA+smiUPNqdWCKWw7JhqN/neuKo8shBVkkY2J31ZcGgkDUwIZa89
 5ttqyObCp/c2I3vxyBpUYvafM0ZozX+rNs1bKQ5PBQXWw7nyOqYURsspc0s728meQVND
 OzBl8lDjsbCImeEHcF+BMZoBUb/t/NV2JnNyb/wj9qGdw4pVkXcVbT/kAgVB/0z0NB9/
 Rm0jlETTUFnRh7iOXaeLl7O9yAjN2/sGcPSDCxmjKcqmR2+xOV6rIAHI2Xo6F5QcMnSP
 lesN0A9pJr8TTT1guu0FmG+hTPHDzGXG2ExPSGu/vY+t0+EQVOTrBMHMfYimbSzxlTTy
 4tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIGcHABe/pzobGUgmxz+iMJPc2gByN1I1kKPS8O7gyo=;
 b=BzfN6vBOD7VqToUo2IMlTdzsk5oodTScTtZpdY7DIN1A+TsnwxcxLpCDaIf2E7yq24
 AMIKMhd4fz3Uk7cYuluY7t5ScJlVguS1IYqF7LopAzLDfnrSlXZYAMJPrWKREDwwDHY+
 3OPcfAhIgz3T+DRVJB4+utGCu8NXVUMkm1Ur0/wxJs8urHRlHoa9MQoj+53MjTdyJvHA
 TKBXAM6dGXOrF1raARB2jXjkB5LjxpZ2Xt+DI8OcBZugSglIWaynMQ14ZfbNGkvJfou0
 7YHFQ+4lUV+r+r25xIrw/+FhMW6U6Oj4yceIr0yETQd3ELu57ykrIQXbKSYgUN2LNfip
 0lKg==
X-Gm-Message-State: AOAM532FrbqIkb4S6hyR/APCyzxzeRYgOzRDyUe5WW6/ghrl8X6SAjCM
 ylGpFWJcZ/5GyeX23Y+FbUHj06+nf+FyrRZQ
X-Google-Smtp-Source: ABdhPJyukfB+3SFRuzAiI237LOkgI6innDnGe3cLGZf44XBsP+3xUf/dABDEQ6PidWftA3vQwrCGUg==
X-Received: by 2002:a7b:c4ca:: with SMTP id g10mr12871021wmk.148.1625847016387; 
 Fri, 09 Jul 2021 09:10:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/17] target/arm: Correct the encoding of MDCCSR_EL0 and
 DBGDSCRint
Date: Fri,  9 Jul 2021 17:10:02 +0100
Message-Id: <20210709161003.25874-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: "hnick@vmware.com" <hnick@vmware.com>

Signed-off-by: Nick Hudson <hnick@vmware.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a66c1f0b9eb..910ace42741 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6326,11 +6326,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
       .resetvalue = 0 },
-    /* MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
+    /*
+     * MDCCSR_EL0[30:29] map to EDSCR[30:29].  Simply RAZ as the external
+     * Debug Communication Channel is not implemented.
+     */
+    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
+      .access = PL0_R, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
+     * it is unlikely a guest will care.
      * We don't implement the configurable EL0 access.
      */
-    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
+    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
+      .cp = 14, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
       .type = ARM_CP_ALIAS,
       .access = PL1_R, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
-- 
2.20.1


