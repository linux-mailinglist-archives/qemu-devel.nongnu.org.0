Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD92D94E6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 10:21:37 +0100 (CET)
Received: from localhost ([::1]:42878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kok2x-00066h-ND
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 04:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kok0k-00042O-GI; Mon, 14 Dec 2020 04:19:18 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:46842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kok0g-0000hZ-Ov; Mon, 14 Dec 2020 04:19:18 -0500
Received: by mail-il1-x141.google.com with SMTP id 75so3135772ilv.13;
 Mon, 14 Dec 2020 01:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DV0c3pyoNGT5sIeSz5IuliOodrMyib3z4vKyf0X1S5U=;
 b=C+F9wp0Wd2OjK71FYNyxtcAfNhNXiSKiAc3nRpPBBwvpOOe0/1n/5cFXKb+xEI2RXQ
 r28iWHGQ4qMmTZQC379KdkhlGXm1KFNavY4RilJz/6hlP4ApGOpFMf/RXy5czJ7iJJ+h
 of240g16Vo9hUerxhEnMxBMSuAivtUxYEXHpCTuP1NyAugp3baCENE8smcRoTs2uyJtO
 kA3b9R/pYKP5h8or0aJuppZNKRpuLjkdgzIcZRJmRLxkoVTqbitI+uvdS+02T1tQjhIY
 x2aoJv64ox5unSvTgRG9QNRYMkoAh9R/TfWuHx0FUZo9Z6BaESy2Mn1f4gZqDyzaDvkP
 jMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DV0c3pyoNGT5sIeSz5IuliOodrMyib3z4vKyf0X1S5U=;
 b=bhsIr5ubpwF3FwOTxBy5d0DyluN3apfxkmKHwmoEuQf7xuxi0ctouSjd8jEKyg6twa
 Wy2Bf9+R4splPJlfqbzwbpzkeduwSPjeQ9tfoaYduiNDAgnXL1AD8WgLiCY0TrURjZcA
 fETymiD05gvIGwYuOV5M/nBbxcufkDwXTrk5+vMId6sqG2EORv/zWc3enONmXe457Ok3
 uMbGlQfX07T8hsnNTebmmumpu0wugiChN6Tm6d3HffxQGai+uez4Q2ZcBzTB7Dlrjvy0
 XDpm4z4iuVzON2nlePsB+AtRm8HfcBAyZxJWRexemMBRZL86Jnwb7uhzMd0Tz9FLmLsa
 g2vQ==
X-Gm-Message-State: AOAM531E5AVt63uZhlQa51PC+yYWzGiHGWm8Gw5ht63KaUDKfv5gInzq
 PhVkR0+x7XgFcH0YQrYZFCGHk5PoZWI=
X-Google-Smtp-Source: ABdhPJxziMzohrBHtnB506bcLswYX4DZov3dbaLzYXNK2gHxRmUnWxV4kIveVq5aXasK4iB+ObUvGQ==
X-Received: by 2002:a92:ba96:: with SMTP id t22mr33969321ill.262.1607937552610; 
 Mon, 14 Dec 2020 01:19:12 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id o10sm11618094ili.82.2020.12.14.01.19.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Dec 2020 01:19:12 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/msic: imx6_ccm: Correct register value for silicon type
Date: Mon, 14 Dec 2020 17:18:57 +0800
Message-Id: <1607937538-69471-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=bmeng.cn@gmail.com; helo=mail-il1-x141.google.com
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


