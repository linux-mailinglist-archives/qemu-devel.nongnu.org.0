Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9D65F2A9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:29:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMf-0001M0-Ua; Thu, 05 Jan 2023 11:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMJ-0000oG-Dg
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:51 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMF-0007Pb-1r
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m3so19556073wmq.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0uX5qcSlWxkIv6XFcZG4vEVBT2aV30N7UKGbpRe6IA0=;
 b=o+90ALjoozOnofJKn5PdDOdOKiJRyPHwHIvFdCUomRnMG8Jg/3KyxxBOqWdooRQiwp
 3+0fjKYSNcVJdw4dvJnmGuHatud6KE0nlqAZb18wyvKyx7uHG504M4qjmiVIAeqWnWnH
 YPZlhF+RYsNHSOQi9/dcTOnhW77uzWWi7TtjdmUBSwIniCvt+8kAvpiPX40p5hmzU5e5
 9Q+VLKwNM4RdyTFDxzz4k2mapbCZw93n2dA89MqRxo8gxQMlo1wNjwA69bhhmPaX/+l0
 aEcEJw8b1RLcu8elRX+rXwlwBcZJ4gb4I4VmOrFtdbZFjMC4JigFn+BnMTd16VBqXtEE
 YvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0uX5qcSlWxkIv6XFcZG4vEVBT2aV30N7UKGbpRe6IA0=;
 b=FD2A6Sfm5mIqJ43iAIzhTKEzr0r9hv32GL3nTPfhoOQO/jopjoDQ3wvK2JC7XFUgdt
 NsZE+GefTHxCcHu78hZA5NrguWYl7Te4cJiJcs9XWXoj3E/P9yjfSMtV8iZTA+g+SCYb
 wSZepFPY2fhemVkiACPqbLMcuw1q61x6OS6Ad3EaxBYg2pYbdYltx+Bk9NzZmo1XHRG5
 S47B+RP686txZvTz1D/H9Z3aZ/7ikDIFn4CJhNzNq9Q5NaNmZKO0bcqxOOKe1k54g0qc
 rkmYz/7EgG10cvbKNW9bzCbAzNdD8DG3bwh9McMIwc/K71PdB3s5W3hNvslbk29CgIrr
 Am/Q==
X-Gm-Message-State: AFqh2krb8FXt1CxO65SG1TqVlzYCSFjd96XJZz5nCX+2VsGMCQs+Z824
 mUW/sxxLHBbdCPVYhDawuwnTDe1VQR6JdGis
X-Google-Smtp-Source: AMrXdXteTzm5D3Cr9rSEGmEjVilx7vzd/oaGJfDqxIz7aI2MpHrNrsxZKqTHEGFAsT+ZUFrXuPoMyw==
X-Received: by 2002:a05:600c:1f11:b0:3d0:57ea:319c with SMTP id
 bd17-20020a05600c1f1100b003d057ea319cmr36874405wmb.13.1672937084993; 
 Thu, 05 Jan 2023 08:44:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/34] i.MX7D: Compute clock frequency for the fixed frequency
 clocks.
Date: Thu,  5 Jan 2023 16:44:14 +0000
Message-Id: <20230105164417.3994639-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Jean-Christophe Dubois <jcd@tribudubois.net>

CCM derived clocks will have to be added later.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/imx7_ccm.c | 49 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
index 075159e497b..f135ec7b7e4 100644
--- a/hw/misc/imx7_ccm.c
+++ b/hw/misc/imx7_ccm.c
@@ -16,6 +16,10 @@
 #include "hw/misc/imx7_ccm.h"
 #include "migration/vmstate.h"
 
+#include "trace.h"
+
+#define CKIH_FREQ 24000000 /* 24MHz crystal input */
+
 static void imx7_analog_reset(DeviceState *dev)
 {
     IMX7AnalogState *s = IMX7_ANALOG(dev);
@@ -219,16 +223,43 @@ static const VMStateDescription vmstate_imx7_ccm = {
 static uint32_t imx7_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
 {
     /*
-     * This function is "consumed" by GPT emulation code, however on
-     * i.MX7 each GPT block can have their own clock root. This means
-     * that this functions needs somehow to know requester's identity
-     * and the way to pass it: be it via additional IMXClk constants
-     * or by adding another argument to this method needs to be
-     * figured out
+     * This function is "consumed" by GPT emulation code. Some clocks
+     * have fixed frequencies and we can provide requested frequency
+     * easily. However for CCM provided clocks (like IPG) each GPT
+     * timer can have its own clock root.
+     * This means we need additionnal information when calling this
+     * function to know the requester's identity.
      */
-    qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Not implemented\n",
-                  TYPE_IMX7_CCM, __func__);
-    return 0;
+    uint32_t freq = 0;
+
+    switch (clock) {
+    case CLK_NONE:
+        break;
+    case CLK_32k:
+        freq = CKIL_FREQ;
+        break;
+    case CLK_HIGH:
+        freq = CKIH_FREQ;
+        break;
+    case CLK_IPG:
+    case CLK_IPG_HIGH:
+        /*
+         * For now we don't have a way to figure out the device this
+         * function is called for. Until then the IPG derived clocks
+         * are left unimplemented.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Clock %d Not implemented\n",
+                      TYPE_IMX7_CCM, __func__, clock);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: unsupported clock %d\n",
+                      TYPE_IMX7_CCM, __func__, clock);
+        break;
+    }
+
+    trace_ccm_clock_freq(clock, freq);
+
+    return freq;
 }
 
 static void imx7_ccm_class_init(ObjectClass *klass, void *data)
-- 
2.25.1


