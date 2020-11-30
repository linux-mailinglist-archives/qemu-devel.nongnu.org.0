Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B92C7D89
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 05:07:36 +0100 (CET)
Received: from localhost ([::1]:54438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjaTP-00081R-Kk
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 23:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjaRZ-0006rw-KD; Sun, 29 Nov 2020 23:05:41 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:34312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjaRX-0001Wh-Uw; Sun, 29 Nov 2020 23:05:41 -0500
Received: by mail-io1-xd43.google.com with SMTP id d7so1569716iok.1;
 Sun, 29 Nov 2020 20:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k1CUnjUfljP81x5s+TL3hAeI4K2slELeAubuU78Kg0k=;
 b=H6W8Yu65nOQA7J4510CRy4qYdgrp8+YfRhHW3N0yCflF9Ubl7aHy+Mmaq4zKU3BLjT
 yVZIffDAFo6AaxkE2/AVn0CsF0sJCkgPJsTes5e3rSs0wfzzpPi98AFl/zZoe8mgFiU4
 8vBhBPP0ngnpsZFNRTAQjSenkiP1MgboMTWNReFS71W5sUQgilL4rkhBlRT+w8zHk9pb
 McZ+o+hqTdJjKWI8FKvwTMrCBE+iawqMUUFy1EyBERRJnferrBFD90QmS/27wztjM706
 cJCEorimS+fDasOa/G1yKT2sr0f3pdMFh70j5orJ4Lwls3q4kfjtAB8yEXyA/09NOVwZ
 kYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=k1CUnjUfljP81x5s+TL3hAeI4K2slELeAubuU78Kg0k=;
 b=cfzKq4uK98qr9b2UcUCIgL8F2bPDKsytBS2Xivu4dHu8Qn25vHqkTQ75YUMHX3LYwS
 yuPKLioo+aFH+F6/Lm9skkf/fD78bkE3IRGyocOTcUC28eqI2ezsW1zAKpmLKfh0D3f5
 4883H7F8HxY5UxdShMLnzeQdpoj6kiqXIhdksv6z+5swuZ4s3qAmYTyy2pN8qeP5UUsS
 zUP9U55K8UbvuFYhbNOicBBDugo17hSQOHpgLoypOlj8jlyLwYVuWnEfr/OJD2zeFEsl
 rHWrJrMFA/WHG1jCQ82A9kzaTm91YT9LRysu32XYhvOtIbQKduL72qXVWZoCGMafIbnF
 8WVw==
X-Gm-Message-State: AOAM5314LCfjluWfS06bzqTO92B5gf7Y7vca9kzIeiCcMaCbiqfH2JZR
 JbLUD4HWVj9SXGshA001drM=
X-Google-Smtp-Source: ABdhPJz1Zp1lNvy6OTY/IQlf1ebGp6NinsAcQqIrWHe9MTGiyBQpSaDEqZ9uP95mp01DyI3gcPMh4w==
X-Received: by 2002:a5d:8344:: with SMTP id q4mr14250390ior.38.1606709138545; 
 Sun, 29 Nov 2020 20:05:38 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id p18sm2119828ile.27.2020.11.29.20.05.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Nov 2020 20:05:38 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/ssi: imx_spi: Disable chip selects in imx_spi_reset()
Date: Mon, 30 Nov 2020 12:05:24 +0800
Message-Id: <1606709124-80741-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606709124-80741-1-git-send-email-bmeng.cn@gmail.com>
References: <1606709124-80741-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd43.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_reset() is called to reset the controller, during which CS
lines should have been disabled, otherwise the state machine of any
devices (e.g.: SPI flashes) connected to the SPI master is stuck to
its last state and responds incorrectly to any follow-up commands.

Fixes c906a3a01582: ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/ssi/imx_spi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049..85c172e 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -231,6 +231,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 static void imx_spi_reset(DeviceState *dev)
 {
     IMXSPIState *s = IMX_SPI(dev);
+    int i;
 
     DPRINTF("\n");
 
@@ -243,6 +244,10 @@ static void imx_spi_reset(DeviceState *dev)
 
     imx_spi_update_irq(s);
 
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
+
     s->burst_length = 0;
 }
 
-- 
2.7.4


