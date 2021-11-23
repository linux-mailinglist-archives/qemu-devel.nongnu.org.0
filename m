Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B019245A9BF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:12:37 +0100 (CET)
Received: from localhost ([::1]:38156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZLQ-0006gb-AD
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:12:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpZJX-0005Yr-HE
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:10:39 -0500
Received: from [2a00:1450:4864:20::336] (port=44932
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpZJV-0000OC-KA
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:10:39 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so2590466wms.3
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+pnw4UnWSsaFCtOoB/ZU0sfK7/yij1QM8IDECVNjnXI=;
 b=y0fD/qHFU+9JHlV4W0LexMJRUdxnqv70ox/YUhioRuRzsH7/cikhiadgYoTn4JHNHp
 ZwMlNeMI3X9m0L4EiI+AVvZ7uaTI/MrXGyZWbpLUj0LHMnnTCiKnlVs944c55EQtEmVX
 P6U2MFRki61pck+HgmII2dRcBaH/2Z8itrUq47bbf7BFl1/dIyzNesqoBZRZ8Irb0GSp
 j+fTfr+agNxaV6pCY3tt5i4u1iU2ynI2f7WMU/E9HOJ3jZqsCmI5CtRjrbNVLxshuqBM
 p3MUFqhrkyqcrjkaMPaZjyPZE8qSz6ApjjWrOhRE2qIPxQ7AWD61zEuRuBW5N/9GJ7eo
 GOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+pnw4UnWSsaFCtOoB/ZU0sfK7/yij1QM8IDECVNjnXI=;
 b=jSSsGB/7VsUtrKcIvfJEuGNI7mGhSqCDJ+yygvzCMy99/gkjiCZKFb9FSGB3t5Grw/
 J5szqgw4rg5o80VXfCnEiR6N2O5OlwkJSJcVV6tktL0vR/CcH06AqrbEuA9n/c17RgHc
 h5ivZmnAVWQ2qFulopYzFECgg6VrEy/4yF3sHFC1QwrM4LU1IIFTNYZdvUs85sR1NkJa
 cqr5t0iF/ifvY7E0WilTD6xkqRBwxRUEFJFqMbLR9opyGopwE30WSP1XZesSEZqfDYks
 1p7OYHoS1bZSIR/xwcWL+IDpYCZ/xPuxFWsibdAIlN860qKyCMdsd+ZgrmT1YqORQsJ1
 ntMA==
X-Gm-Message-State: AOAM533pHQPP3vM+4L/BVykRXGlWctldZkCeazmgE1Qq4q8qKpQoqUy4
 mAaADqycXBAXnsGO8Z7Lv+cBZA==
X-Google-Smtp-Source: ABdhPJxHsj1cMP47DGGpHMIzILbPme4oARjvMtdR4jho1bOaLU0qL6HYETlE4Aq7hS7Gmx/KI8Ml+A==
X-Received: by 2002:a05:600c:2f10:: with SMTP id
 r16mr4985542wmn.141.1637687433489; 
 Tue, 23 Nov 2021 09:10:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id g18sm2479262wmq.4.2021.11.23.09.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:10:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [for-6.2] hw/intc/arm_gicv3: Update cached state after acknowledging
 LPI
Date: Tue, 23 Nov 2021 17:10:31 +0000
Message-Id: <20211123171031.975367-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In gicv3_redist_lpi_pending() we update cs->hpplpi to indicate the
new highest priority pending LPI after changing the requested LPI
pending bit.  However the overall highest priority pending interrupt
information won't be updated unless we call gicv3_redist_update().
We do that from the callsite in gicv3-redist_process_lpi(), but not
from the callsite in icc_activate_irq().  The effect is that when the
guest acknowledges an LPI by reading ICC_IAR1_EL1, we mark it as not
pending in the data structure but still leave it in cs->hppi so will
offer it to the guest again.

The effect is that if we are using an emulated GICv3 and ITS and
using devices which use LPIs (ie PCI devices) then Linux will
complain "irq 54: nobody cared" and then hang (probably because the
stale bogus interrupt info meant we never tried to deliver some other
real interrupt).

Add the missing gicv3_redist_update() call.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Marked for-6.2 because this is a bug fix to the ITS support
which is new in this release. At least for me this is necessary
to boot Debian on the virt board, since the ITS is default-enabled.
The failure seemed to be somewhat intermittent; I haven't bothered
to try to work out why.

 hw/intc/arm_gicv3_cpuif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 3fe5de8ad7d..2d9f2ad2b6c 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -906,6 +906,7 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
         gicv3_update(cs->gic, irq, 1);
     } else {
         gicv3_redist_lpi_pending(cs, irq, 0);
+        gicv3_redist_update(cs);
     }
 }
 
-- 
2.25.1


