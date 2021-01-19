Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7862FB672
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:45:20 +0100 (CET)
Received: from localhost ([::1]:42502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rJv-0006nt-3Y
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rF8-0002m5-Ai; Tue, 19 Jan 2021 08:40:25 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:40574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rF6-0003TX-Kc; Tue, 19 Jan 2021 08:40:22 -0500
Received: by mail-io1-xd2a.google.com with SMTP id n2so22376589iom.7;
 Tue, 19 Jan 2021 05:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CwVyKj0nLazpAlMHIq5E4YX2HLtnW6e2Pi2ImRJMI34=;
 b=ZArDqVFUHgXs7fESjXtQHhu/ckVThhSTT7nyAI/3j+djLcsETDnNhF6tBQb+ndSYYQ
 ZTWfa9RVP9kzLS+EM9s55P6Zfop+rvA5AXlrf8dTZahWZsKjXCQUzy0zp6klYqJ83jD+
 sCiRopyjfB5Mn2tXf/6lla8T/8ZgbdHJ73lD3VusnUzgY8hd5JpOBxB+6jw+pG2zvJ0P
 nPELOth0epns+G95tsmn0Mt5/YMz4QpnTf9HyLVsv2zBpW1EmhQwrpq+bvruapguabMK
 fgwp5ljzUfBYJaSr/4qMFnT87rhR6R172ZTR8jcAyrHH+OoK5/Ls8Pr1O5QFYHoRSgfO
 K6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CwVyKj0nLazpAlMHIq5E4YX2HLtnW6e2Pi2ImRJMI34=;
 b=HfWucHryNEu9wLJ7zPxyKH+oWIpM2+v0QJarkQU6NAsK+8JkDFS8UvvpeXgblhVvW5
 +SWB8SDNF85jLu9xhDcifI5P+vGy/+6wgV84GCZ60B9zSKm3b+RlolADuGflvIPa6HTZ
 yuld5oG0q4Luww7JPFdcesvC0OeJ/icVukEQpQ3ocmNXbk5Aa8obQEQfytCZ2x8uQyia
 zyoFaeDHeV2cXuVDR0gsGCHJa415E9iERLle3GyYiyMAOpoZEX6etqoP7KJkoLJuzccs
 xYjagCEzvZ6zj2YV11bcTjyq7HvNQH6l6itYKSX8yrDsdT74YX+CtfTz/xRAMe+ybvHR
 EAnA==
X-Gm-Message-State: AOAM532ZYYroF6WiWV2MUOSJIksfbp5Y0hCevsvk0SVsgZXGeJ2ZV4p5
 6hlG+AAY1yDLUNFvBCD2OceEzAftBBA=
X-Google-Smtp-Source: ABdhPJxgHn6q9c7lcmA4lyuWlxeyqCYE8qLfq6IxpXG9jWZvKtHyAS/czLgsE2qWKVkx2MSlMKe+8Q==
X-Received: by 2002:a05:6e02:12cc:: with SMTP id
 i12mr3341876ilm.113.1611063619499; 
 Tue, 19 Jan 2021 05:40:19 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:19 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 02/10] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
Date: Tue, 19 Jan 2021 21:38:58 +0800
Message-Id: <1611063546-20278-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd2a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Usually the approach is that the device on the other end of the line
is going to reset its state anyway, so there's no need to actively
signal an irq line change during the reset hook.

Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
imx_spi_soft_reset() that is called when the controller is disabled.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v5)

Changes in v5:
- rename imx_spi_hard_reset() to imx_spi_soft_reset()

Changes in v4:
- adujst the patch 2,3 order
- rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion

Changes in v3:
- new patch: remove imx_spi_update_irq() in imx_spi_reset()

 hw/ssi/imx_spi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049..4d488b1 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
 
-    imx_spi_update_irq(s);
-
     s->burst_length = 0;
 }
 
+static void imx_spi_soft_reset(IMXSPIState *s)
+{
+    imx_spi_reset(DEVICE(s));
+
+    imx_spi_update_irq(s);
+}
+
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t value = 0;
@@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         s->regs[ECSPI_CONREG] = value;
 
         if (!imx_spi_is_enabled(s)) {
-            /* device is disabled, so this is a reset */
-            imx_spi_reset(DEVICE(s));
+            /* device is disabled, so this is a soft reset */
+            imx_spi_soft_reset(s);
+
             return;
         }
 
-- 
2.7.4


