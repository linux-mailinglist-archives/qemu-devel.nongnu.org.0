Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF5C2EF535
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:55:41 +0100 (CET)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu72-0007eB-2r
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtor-00053S-Rs
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoq-0002zD-9m
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id 91so9427029wrj.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q+9hde3K1MBMpA3NU0diSpudMf3Bp4YMA1COVKFBOoc=;
 b=VWBwQWrmGUtzXWYXm/70ZhZ++M1nrYD26GpkCfKa7SgmijRudr8fjjECH+1GpY/iQC
 0W+J0/kQlemcsqryUQ4K24YauDCgCl7w3QVh6JD/XvYT0Uc75McLGeFGy8892qsl5hhK
 LkXKnSC8yfTAFDPogE0xoOpWLVXYqiMDSb92nhPsL9y1C1FndiWll+VIxvt6PqI1+Nw/
 40gXF2XAKRAyYXb5q/JJVjU5T6s/KHwgXb0j9DjbYyNL5O7n7UKf9czRcCLCo6TIbDD0
 4eEZqv7krrswewqnNqVJCFTQV/AsknhnzOtL1Is71iohV+XZ0C8546069hRj6aFWIEvC
 HutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q+9hde3K1MBMpA3NU0diSpudMf3Bp4YMA1COVKFBOoc=;
 b=eh9GooZaylLvNLpDXlsjDyo7KFwQdYmIdwUvkxIXq0wiZnooLNrTkIn0n5HkVjPWyU
 hPhvilkjbu6yUNXlc7kMSMRGnGs+go2Gj34Z2+onNi5gH/fkjeOhxIsNDt2y+RTQY2jC
 a8pe6cLMi5R4JVUohO7KsGaCurC4Wer3tZ8XBwYHtehggRDUchhKlc0WsMzccgzlo+WD
 8Irqmu5hFKCoKp5Ee6/LXsznsm6iqBsb5DNsXIUsdqWjbTCWavU4L22f8/rdVI+l94yk
 ZzWgYYCAAFnNxQ5MmFHNR/BMJaZ6f8ox5qFxu9ONtx6pN9v+wMMoatiaIGe9UW+TTGNy
 x+Nw==
X-Gm-Message-State: AOAM532Tof3FRRHRJYN4VUYrJ8Qg1odqNWf0YTZHS2dfTDda1HsC2Y+N
 I8JcO/NuGOQshSLGhQRQ9UH6QRs2m/vM1Q==
X-Google-Smtp-Source: ABdhPJygxDyZRzRM2Kk7Sqljsuwmj5NlfLSi2c7/hi49frMqWzha5zIGhXAePiiVld3TrTNOfqFBgA==
X-Received: by 2002:adf:e443:: with SMTP id t3mr4193108wrm.366.1610120210789; 
 Fri, 08 Jan 2021 07:36:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] hw/msic: imx6_ccm: Correct register value for silicon
 type
Date: Fri,  8 Jan 2021 15:36:19 +0000
Message-Id: <20210108153621.3868-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Bin Meng <bin.meng@windriver.com>

Currently when U-Boot boots, it prints "??" for i.MX processor:

  CPU:   Freescale i.MX?? rev1.0 at 792 MHz

The register that was used to determine the silicon type is
undocumented in the latest IMX6DQRM (Rev. 6, 05/2020), but we
can refer to get_cpu_rev() in arch/arm/mach-imx/mx6/soc.c in
the U-Boot source codes that USB_ANALOG_DIGPROG is used.

Update its reset value to indicate i.MX6Q.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210106063504.10841-3-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7e031b67757..4c830fd89ae 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -462,7 +462,7 @@ static void imx6_ccm_reset(DeviceState *dev)
     s->analog[USB_ANALOG_USB2_VBUS_DETECT] = 0x00000004;
     s->analog[USB_ANALOG_USB2_CHRG_DETECT] = 0x00000000;
     s->analog[USB_ANALOG_USB2_MISC] = 0x00000002;
-    s->analog[USB_ANALOG_DIGPROG] = 0x00000000;
+    s->analog[USB_ANALOG_DIGPROG] = 0x00630000;
 
     /* all PLLs need to be locked */
     s->analog[CCM_ANALOG_PLL_ARM]   |= CCM_ANALOG_PLL_LOCK;
-- 
2.20.1


