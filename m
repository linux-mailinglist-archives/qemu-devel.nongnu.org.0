Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECFF49FDE4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:19:30 +0100 (CET)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTyD-0002oz-JF
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:19:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDP-0002Hx-8E
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:07 -0500
Received: from [2a00:1450:4864:20::436] (port=44890
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDK-0006JY-SP
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:06 -0500
Received: by mail-wr1-x436.google.com with SMTP id k18so11533494wrg.11
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6TNsa+9vU96PmnK49D4r+sw0Gbh6DRvow5OiVFqQM9A=;
 b=I2IlkuAs0VgoOHsZy86QqzWCqA8Kvswrt0Uv2hZvmrfVjNg/NANb0X6oVjtFWePqim
 QRJO/Z9Pbb4XYthPB9Du953vk3OAgvo5DYV/yv1y/zYginR2aiWIkLU2pX5DkwgP/7Qy
 DzehgFu2DbsHoQG/1sLPH/+YKCs1cotjznLYzaHq6GmLrshkEqBmDRzLt/5J4HcwR6ZS
 +xq/iRCj6o9FJCGUFfo3/OAQZKOC4arU4wc2stu3bfh9rVpQF4HJ+qZVU4DIWvLenPdv
 YJlN3I5XjDKnzPTUcpTZwzeS5IJQ49OlXTO1PP1LJXgMa5e2LtMAkWrXL13pttsaPN0C
 KOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6TNsa+9vU96PmnK49D4r+sw0Gbh6DRvow5OiVFqQM9A=;
 b=m4XRSG3UzH4POcCmP0f5roQweiqfHcTsF1oHvEBXw0Z+U1LbawCkAF/9phuZTSoCEp
 sTLrftUQK9AUX8xXWCUZ8jY4PWhBfKes+A4yEQKKjI0mIaPNP1/nCo3BPH9lJpxRqY58
 pjsK8SF9TViCXVW7sWKlhme4kQz9CcpcV7ZFtI5joRDA40tug/tpwWxpBS2jc9kARpOO
 RWoKg52W/xRo3ThkaXt/eoY/RfjL3SEnY+zwnJw1aVloAKBfDeCCKysqmNMzDfRsoPbC
 9G/upBXPdNerrQo4C9EMkYw0Q90ns6AN1+dnDYoxVWcv8GH3fqyhbLf/lADZEAHuRTeo
 GwbA==
X-Gm-Message-State: AOAM531HnrPBbI1DesRfRjMz7qkbkb+gMWWwP7obhym81ITTCKXwsrm/
 XnBuuDKuTjp9XAcML1uMczMT/HygJyUXEw==
X-Google-Smtp-Source: ABdhPJzMZvtXCvuq1Fj/16saUuXGMVH4tSiKoZtGaTh09hCandY8xxR2Uk8sRlSzcgHj4CjEtd9eEA==
X-Received: by 2002:adf:f582:: with SMTP id f2mr7613899wro.161.1643383816240; 
 Fri, 28 Jan 2022 07:30:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/32] hw/armv7m: Fix broken VMStateDescription
Date: Fri, 28 Jan 2022 15:29:39 +0000
Message-Id: <20220128153009.2467560-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In commit d5093d961585f02 we added a VMStateDescription to
the TYPE_ARMV7M object, to handle migration of its Clocks.
However a cut-and-paste error meant we used the wrong struct
name in the VMSTATE_CLOCK() macro arguments. The result was
that attempting a 'savevm' might result in an assertion
failure.

Cc: qemu-stable@nongnu.org
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/803
Fixes: d5093d961585f02
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220120151609.433555-1-peter.maydell@linaro.org
---
 hw/arm/armv7m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8d08db80be8..ceb76df3cd4 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -520,8 +520,8 @@ static const VMStateDescription vmstate_armv7m = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_CLOCK(refclk, SysTickState),
-        VMSTATE_CLOCK(cpuclk, SysTickState),
+        VMSTATE_CLOCK(refclk, ARMv7MState),
+        VMSTATE_CLOCK(cpuclk, ARMv7MState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.25.1


