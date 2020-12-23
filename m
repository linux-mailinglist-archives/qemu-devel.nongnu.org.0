Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD9D2E1922
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:55:04 +0100 (CET)
Received: from localhost ([::1]:55098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kry35-00008r-Ug
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbP-0005zh-Qn; Wed, 23 Dec 2020 01:26:27 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:44133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbN-0001yK-9w; Wed, 23 Dec 2020 01:26:27 -0500
Received: by mail-qk1-x72f.google.com with SMTP id v126so9658772qkd.11;
 Tue, 22 Dec 2020 22:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DCIWK+aD2rcUTLX8Xe1vpC8bvXJfU6/9urzDpXpoTaM=;
 b=hTkXtHzcgqIcj1Sk2RhZbeu1WiCuNPJ8bzXLA6jWqxibRuMyiLsFp4xzjCmAnjrUdd
 FML7AqN1qgzFEA7H1bpHYYjvrMk953jls6TYeq7QVGV9OkMkZc71wTBE/3YsIDxBDeV/
 c7QE7Qk93EdvumGmldLRKxUHYTI4zcJaINZlUhMG0JyG38h+MucgQuTZDBbbjPiQ5c31
 Z3xhyK2qzysXnWITix3mEg/SoScOiM4Gy8lMpKrCvMowNRoAMmtf/W4FSa/89NvfAqj2
 3tVt44w96XFGe1NSA9cUz8VPquT9YqoofoJx/wL39hbev5sKe1NjvB7omHLYOQjc5ClK
 TUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DCIWK+aD2rcUTLX8Xe1vpC8bvXJfU6/9urzDpXpoTaM=;
 b=Ae9WhzrHTmNacNJxKrPD1+nXlDP3DidKJSCRjuZU8TuXFoZvQMYAeWKBPYs7z2nTgl
 h87Bv9YO+7Dpo+Qv9BA4Z4j8U7TGPUCKzi+zDg/8lHJawskt/j4RbR2vzBjw3SG2UnwW
 Ve/yLDrIQfdgPIJKy5wfNMAuIJNA2zyP09c7yQ0DTFNJTIYSAGtcymcGZNwKRlCr7XXV
 ofGS7p5Sryq6LKuJtG1k0nYQj/eWfauTzNjriIForsrLCvis1C9Rn0tJDRVZA5Ui+hWM
 YwkDJAq8+SFi6E9XINoePozPKcHnJcZ8IL5w9LEwB9pAe0N0s90GPUYdvXS1ahHFRGop
 VDAA==
X-Gm-Message-State: AOAM532mTXU/kmtYDaZJ8ATQxltf/YGkVFW8WWH6/qrKAgBfU7Tk0MIl
 v2gecTF3kE1cRXU+O0BzVcc=
X-Google-Smtp-Source: ABdhPJz/yDowmIqzEiXwzLmWrq8V+Pp2snPybwU+AFYDi9hLGU55bXFh6hPKiBPa6qvMyiPQG0gLzw==
X-Received: by 2002:a37:b983:: with SMTP id
 j125mr13606637qkf.418.1608704784000; 
 Tue, 22 Dec 2020 22:26:24 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 22:26:23 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/msic: imx6_ccm: Correct register value for silicon
 type
Date: Wed, 23 Dec 2020 14:26:05 +0800
Message-Id: <1608704767-9317-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
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
---

(no changes since v1)

 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7e031b6..4c830fd 100644
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
2.7.4


