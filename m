Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12392EBA24
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 07:43:07 +0100 (CET)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx2XC-0005HR-OU
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 01:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Pn-0000Ql-Cc; Wed, 06 Jan 2021 01:35:27 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Pi-0006Km-Ty; Wed, 06 Jan 2021 01:35:27 -0500
Received: by mail-pg1-x52f.google.com with SMTP id n10so1544284pgl.10;
 Tue, 05 Jan 2021 22:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vUQGbC64bDqMXxpl/W2K5oV7pP0S99JpmeJuH9H8/cc=;
 b=kYw4/eTB1G6lMgphoYcEdTkE6Y3XhuX7y2Gv1Z79nxdeYmFTIvUx208b6pzhS/G4bM
 K04OygNhrCQ2C6yl/tMkHS5JJVpYjAlP1WmcGP1SSRb0uiGyZi1lS9KtnXMDWQUzC4/p
 xd5ThvHyjBDpLuQALbQdmF2M97VmVQ1HRQz+UmA0oHlLNh7ExzsiNbcSoe4RjN9Kbx7H
 BEUm8sahraxA0dYKZkr+qKxMous7CkYtur+it0qG4PxNQKq3Zi759JkV+426ihXaVvf9
 53J0AaGH7GF1APxwJoQKDV+z4NrI7RrYvBhTsnI2vIAn4v79XvzdJQd1CZa0+lnT56QO
 j10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vUQGbC64bDqMXxpl/W2K5oV7pP0S99JpmeJuH9H8/cc=;
 b=PN4q4rYEHrq08G6mkrUOJS2+Amn3s7NjVoIsOg07XInMNTAKmRSznYpE7GeXMyvAlK
 +Gllip20J95oqVp+IbHwwLkF60zTuBMJRkauKoBMsEs6r/+MCjGqvsXJrMQEayuMh4YZ
 DaLaTy+rD4qWjakIvIEeUjmlwHiTXwfaSWW/m3imhX4T2Sv6lqHO2SON4DW6Xk0Az4SD
 HAuz5WVBGxf0KpJuYsVeZ/CvYypGJKmRQvM7BfltuvGXtNQZF1T62GjktXhAwKryOQvs
 yQYMvmL+mYKQSrLVsBZbKU+mt9VIEZmk5jBrWxa/nf9/WxkLGsmFuIgheDD6OLbLBgfp
 2fng==
X-Gm-Message-State: AOAM530OBE9kHXxa/tOzkzn17EU4duvRhFFzwuHmCdFJUvM/F+vqdKcH
 MvQgmJlxHOaEBICfxY3ewFs=
X-Google-Smtp-Source: ABdhPJzor6mekBld2kLIpXbxd8gS8ZKt2oH2WYSIzudsMYA3FcnH49deBSZ2z2x5vGQH1RzhRWQL0w==
X-Received: by 2002:a05:6a00:14d1:b029:19d:d135:bacf with SMTP id
 w17-20020a056a0014d1b029019dd135bacfmr2459792pfu.12.1609914921290; 
 Tue, 05 Jan 2021 22:35:21 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id cu4sm1132976pjb.18.2021.01.05.22.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 22:35:20 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] hw/msic: imx6_ccm: Correct register value for silicon
 type
Date: Wed,  6 Jan 2021 14:35:02 +0800
Message-Id: <20210106063504.10841-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106063504.10841-1-bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
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
---

(no changes since v1)

 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7e031b6775..4c830fd89a 100644
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
2.25.1


