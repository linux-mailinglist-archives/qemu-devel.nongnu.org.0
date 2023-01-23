Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFE2677CB3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:39:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx0f-0006li-PN; Mon, 23 Jan 2023 08:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzl-000617-67
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzi-0002Ud-Cy
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:20 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m15so9026345wms.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Er8X565bqDdOiGqHEEKq8jrV5bcDZFCydYLQznUV95Q=;
 b=akkEyr4b9blvXEMbcQ2a3DasgX2qj8P/tP+u9F3rctAmz8JwEzLzzRMWB+Gx93y9+u
 O7it3T/ub+xxm8j+9sDsOft0pXFAuYuUQ+RJGrxwzRkDL0pk8hNdwLIbelGqOfd/7Xca
 XA6e+TCL1SdDawHrEyu6FIjjyT5MtYDU+DXCG7aIsr5c+rPvMvkW2YDWffdZsIy9bSEi
 C4HzWv2MIlPRMTvr+pkFjgLH/pAO888jVy5vO/yZrjo0hX6O7CB0jClQoFPPDq5Z5S1K
 iR6z+RTQ1kpUNwoozQIZSGCiYWVacr/49SkRqxhpVgPSI4RGLY4LFt7vqJkeJtMxv+vS
 B2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Er8X565bqDdOiGqHEEKq8jrV5bcDZFCydYLQznUV95Q=;
 b=xXjDEho9La0fXGt+4A3YXBLx9T8RpkwOCsf3fONDu9HwPTc9mWL5K7wBl8E+WhoQ92
 xZ/xrywBSrKvQDXSvfvPaFOlRd2mQMmq4VoEZde6vrBx0CcFYviU8oj1j15Tj8x2/TUt
 CUUGiGjePpeDMY1oIej42aFgv6qr4Zju6NrQ+bk3oQ9QMrgaEFMte3jrTs1oIiKNYPNl
 Gq6aQ8YVu/GB/7lMY8GV3eBz5VC0dTU+Nohn0MnunSu8zEe84cX3d/LP3PR2jrFTod0R
 swZPxmh6OV024CrO9zvvIk9KIiEaJCgSd2Qqt+VsOXKrLiy8sa5MGekEt5loLjxFMXsX
 ZoAA==
X-Gm-Message-State: AFqh2koz6bkRcbXaXWCWf/tviwAK8KH1EDFHiPrU4wGF6mZuxsoaBp+g
 4YroQdIbUyDNJ5JrxPAfsRdO8flsaOVtus1s
X-Google-Smtp-Source: AMrXdXugVpHWTmRcnBSOMvGTLGp15OkuyR331i79W0mZf929Indkt6oBnD6lSvWjwyTVf/pvkdEyYg==
X-Received: by 2002:a05:600c:5488:b0:3db:1ab:b91b with SMTP id
 iv8-20020a05600c548800b003db01abb91bmr25106678wmb.15.1674480977047; 
 Mon, 23 Jan 2023 05:36:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/26] target/arm: provide stubs for more external debug
 registers
Date: Mon, 23 Jan 2023 13:35:51 +0000
Message-Id: <20230123133553.2171158-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

Qemu doesn't implement Debug Communication Channel, as well as the rest
of external debug interface. However, Microsoft Hyper-V in tries to
access some of those registers during an EL2 context switch.

Since there is no architectural way to not advertise support for external
debug, provide RAZ/WI stubs for OSDTRRX_EL1, OSDTRTX_EL1 and OSECCR_EL1
registers in the same way the rest of DCM is currently done. Do account
for access traps though with access_tda.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230120155929.32384-3-eiakovlev@linux.microsoft.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index f95a73329db..cced3f168d0 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -682,6 +682,27 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
       .access = PL0_R, .accessfn = access_tda,
       .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * OSDTRRX_EL1/OSDTRTX_EL1 are used for save and restore of DBGDTRRX_EL0.
+     * It is a component of the Debug Communications Channel, which is not implemented.
+     */
+    { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * OSECCR_EL1 provides a mechanism for an operating system
+     * to access the contents of EDECCR. EDECCR is not implemented though,
+     * as is the rest of external device mechanism.
+     */
+    { .name = "OSECCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
      * it is unlikely a guest will care.
-- 
2.34.1


