Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9F46C1E2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 18:34:02 +0100 (CET)
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mueLp-0004nz-Av
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 12:34:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mueDq-0001Cv-I4
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:25:46 -0500
Received: from [2a00:1450:4864:20::433] (port=38681
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mueDk-0002sr-Am
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:25:44 -0500
Received: by mail-wr1-x433.google.com with SMTP id q3so30981026wru.5
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 09:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WOvboszOk6X+DuFeJ6cNHXTo+LaaTm0H0HRRbAGFH48=;
 b=h4Jen9At+PJT8sMmbHiK/swTOF8RVuasfKfSxsINBUuB6clfX369dvF/rjyNojz2lm
 lk6wbVDFex4go6qQrEuZZDdv+yPUCyTLOVilAPQX4T+2GuROS9Ny536oenjak5lGEiK/
 PBIRcHvzmB8w4u0dVNyw4UaxvfpCExcHTXgZw47rZxfcp2b3kAIDojl4WqYt0xTX9hj1
 Z4teuj6aUf2+dXJlOo0ma5x+pfXbALUBNW4dsoVb01VP8KBhNz22dm4D692LhpbIxdUJ
 p6PfrA56qmZac+sL4CgQhQSKZPojI7NnoRgod9+G/9zJLEhRnNBQm9QxPfHR0FSBrXiW
 ifwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WOvboszOk6X+DuFeJ6cNHXTo+LaaTm0H0HRRbAGFH48=;
 b=PGwigDsdljDjErojHUY5vOdm7FMG2KhmB06HdEr7pAHiP1f1ACp0veqL7BFxiqMDul
 aLZtfvK3+Ye902TETycND4nBGVduP7L1/IKbugoq8K3BKBNyPyzK3Oy9QRHt2eVg1Hfs
 AMnsXN3uqi7j4Pj+yIu2gNg3X2Cj0vb3RUp0TT29rG8yagVUuJ77C48wqh5suIyFcgo5
 Yvm8djixZRdzgmKADAdWguFFFtxTVcaX2ZeCPcaNN2BMtoWUcXYMRVw8X/DEZa32Wff9
 NfEP8iDNBBhjRw0CEK3CQtGaHdZ0BR1Bl1WVNKs0/iU/N2eNoqaZ8meQtbHiWNh4gvMS
 OM8g==
X-Gm-Message-State: AOAM531JzUkmh6D/8ErWXY/mV8WW7EMOudJYpjO6iEDveve1C2LGiZcT
 DfX7rbIL4Vi3CN7l1LDD3t1XEsfgVlKrew==
X-Google-Smtp-Source: ABdhPJz+83Ao1uzFXbBxgC6ZeivLk1XSVCXfCtBYgRd5tR/gxul0xzXXgDDz+VvhKGgX2RNcGxwAsQ==
X-Received: by 2002:adf:e0c3:: with SMTP id m3mr52685733wri.546.1638897935875; 
 Tue, 07 Dec 2021 09:25:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id bg34sm3556060wmb.47.2021.12.07.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 09:25:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] gicv3: fix ICH_MISR's LRENP computation
Date: Tue,  7 Dec 2021 17:25:33 +0000
Message-Id: <20211207172533.1410205-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207172533.1410205-1-peter.maydell@linaro.org>
References: <20211207172533.1410205-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Damien Hedde <damien.hedde@greensocs.com>

According to the "Arm Generic Interrupt Controller Architecture
Specification GIC architecture version 3 and 4" (version G: page 345
for aarch64 or 509 for aarch32):
LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE==1 and
ICH_HCR.EOIcount is non-zero.

When only LRENPIE was set (and EOI count was zero), the LRENP bit was
wrongly set and MISR value was wrong.

As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
the maintenance interrupt was constantly fired. It happens since patch
9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or 1")
which fixed another bug about maintenance interrupt (most significant
bits of misr, including this one, were ignored in the interrupt trigger).

Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system registers")
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20211207094427.3473-1-damien.hedde@greensocs.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 7fba9314508..85fc369e550 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -351,7 +351,8 @@ static uint32_t maintenance_interrupt_state(GICv3CPUState *cs)
     /* Scan list registers and fill in the U, NP and EOI bits */
     eoi_maintenance_interrupt_state(cs, &value);
 
-    if (cs->ich_hcr_el2 & (ICH_HCR_EL2_LRENPIE | ICH_HCR_EL2_EOICOUNT_MASK)) {
+    if ((cs->ich_hcr_el2 & ICH_HCR_EL2_LRENPIE) &&
+        (cs->ich_hcr_el2 & ICH_HCR_EL2_EOICOUNT_MASK)) {
         value |= ICH_MISR_EL2_LRENP;
     }
 
-- 
2.25.1


