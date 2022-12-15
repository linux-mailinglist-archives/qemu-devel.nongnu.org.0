Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB264DBD4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:59:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngx-0006lw-FQ; Thu, 15 Dec 2022 07:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngv-0006jj-9m
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:25 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngs-00047E-R8
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:25 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1755741wmo.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5/Zq4XCg0nK4f+CPKGhxaJKU8gkK5Z/SgaPEaxtwj2c=;
 b=qLQPYdvez0Bf/bTRUMjWPz+Wfb5N9aupMI0iiku/J85BdBp8ReeJO5/SNxaVi85oH3
 OqW5YFwIRRrNPKxTNSJ/oR8SaMqpCVBNIzarC6d31BeGmzN3J2C0mgdLLDzI2wyHWsBg
 ertDoceiXmn9KiWXZTo9NM99Vt9wFKaZxcqOlt6HNz4nADY8AXgnN1Z/SdacLLVAJHmR
 8KBwK5z4NcMT/bLs2kNpyjT4d2tx+jXmkTCEDs9nOwgg9gsot5XKSzmCt1W+5XLeMwwj
 +z7vS4S97jIszZHS/Ja2IQmVTzL/PfV/6ghCBGZIA/LStoO9LFx+XgVZLyst+NbNhHmo
 jTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5/Zq4XCg0nK4f+CPKGhxaJKU8gkK5Z/SgaPEaxtwj2c=;
 b=p8LevIFsqrfkKX3j6micRjuad/cguOq3cGYG2yYhzmmr0CcJtzffs5m22GZg4HGeeg
 /HK6+op4s6w4W6UE/5gPd3BbBVvAErvsJzuFnk5aawGhbDg7DYaObofaSSp/H6glP6jO
 Fkk9coE7H/YoBliqZ/dlWYknoEi2tzV8cbB9jY6sb6IcdNHZ+YUfssXsR16nNvhTPLja
 xDKMhSEo8zRyARSPngJMwDljEnGVm9CritjcphCPMOknRMf9zdPjogcyV8AF3fmrPNjL
 p8ojEbxPoATK8y2cdecEPJ1UCUHkfHWwoP5+93yVvzLJMvgLQjEOp1PgS2efm3e1zCCJ
 Z9Mg==
X-Gm-Message-State: ANoB5pmJvs6P762qfmpVTQEPqzZrTF8PefV0yHuOeauVqfQWAHupLNdd
 jUMO1w5ynCN4vVRWdVd5yqWioLV0aarqNPPo
X-Google-Smtp-Source: AA0mqf6eYE1nIsgv81yGBIH2+7n6Pd6+pbLkjZOhPljbEWy3ZTvReK4i2kOwP6/fPywM2nYx5MPGQA==
X-Received: by 2002:a05:600c:19c7:b0:3d0:8722:a145 with SMTP id
 u7-20020a05600c19c700b003d08722a145mr22146237wmq.40.1671108621186; 
 Thu, 15 Dec 2022 04:50:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/29] hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber
 advertisement
Date: Thu, 15 Dec 2022 12:49:50 +0000
Message-Id: <20221215125009.980128-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Luke Starrett <lukes@xsightlabs.com>

The ARM GICv3 TRM describes that the ITLinesNumber field of GICD_TYPER
register:

"indicates the maximum SPI INTID that the GIC implementation supports"

As SPI #0 is absolute IRQ #32, the max SPI INTID should have accounted
for the internal 16x SGI's and 16x PPI's.  However, the original GICv3
model subtracted off the SGI/PPI.  Cosmetically this can be seen at OS
boot (Linux) showing 32 shy of what should be there, i.e.:

    [    0.000000] GICv3: 224 SPIs implemented

Though in hw/arm/virt.c, the machine is configured for 256 SPI's.  ARM
virt machine likely doesn't have a problem with this because the upper
32 IRQ's don't actually have anything meaningful wired. But, this does
become a functional issue on a custom use case which wants to make use
of these IRQ's.  Additionally, boot code (i.e. TF-A) will only init up
to the number (blocks of 32) that it believes to actually be there.

Signed-off-by: Luke Starrett <lukes@xsightlabs.com>
Message-id: AM9P193MB168473D99B761E204E032095D40D9@AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index eea03681187..d599fefcbcf 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -390,9 +390,9 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
          * MBIS == 0 (message-based SPIs not supported)
          * SecurityExtn == 1 if security extns supported
          * CPUNumber == 0 since for us ARE is always 1
-         * ITLinesNumber == (num external irqs / 32) - 1
+         * ITLinesNumber == (((max SPI IntID + 1) / 32) - 1)
          */
-        int itlinesnumber = ((s->num_irq - GIC_INTERNAL) / 32) - 1;
+        int itlinesnumber = (s->num_irq / 32) - 1;
         /*
          * SecurityExtn must be RAZ if GICD_CTLR.DS == 1, and
          * "security extensions not supported" always implies DS == 1,
-- 
2.25.1


