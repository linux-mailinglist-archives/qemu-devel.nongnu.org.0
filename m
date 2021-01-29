Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8002730895C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 14:36:29 +0100 (CET)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Twq-00056a-I2
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 08:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5TlM-0004M4-GI; Fri, 29 Jan 2021 08:24:36 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5TlK-00087N-TP; Fri, 29 Jan 2021 08:24:36 -0500
Received: by mail-pj1-x102c.google.com with SMTP id d2so349483pjs.4;
 Fri, 29 Jan 2021 05:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYYrdLg8vwL1EwiAwyU49IXmkoVufUhG59tZxDTUReI=;
 b=PMe3wFhDhgPzoDfad4eKyVep97acC75SIQEExp6Jj+Vc3sqFul7qCtxdbCnfPAq9Ir
 78AvJJ44Lov7iaoW5cAtW+Ty/NX4VqLxk3XLgIDpVlT0rxF229no3Gkab29cSi00VZPX
 IYnXWbu7L6H4YwN6hQBya5RCUK/mwwUSIzuXTg5s5V+rUqGm/BHC8XD1Gk7f1z8u1F5x
 0Mt6zWdJ5Bh7c+cKdWw0/0Uo9LwRhHZcPLQl5FhZ/WgL4TerJucN4mJ7hvpqnhY/GPbA
 yjNhMDvAVSG8obxsIetjjoBqkSYQvOLo3fgJ5JfjHEnO/Sa1Ey7gDegpYo2lI3rDncYn
 5i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYYrdLg8vwL1EwiAwyU49IXmkoVufUhG59tZxDTUReI=;
 b=ReGpJLfR8ByHwcO+j76RHC2+FKwvWiJYQCLU8SFxyjx+l0jxTBsT00GfUzptWNI3cc
 8GBtlYwsfX3438xs90BQnzE3yScpSzqQBXAt0SBsxSNUd0I516AFHqfOYkX4XixlUkQD
 Kl4FHAzLlMH3It+r/h/Ltxw0hzs7Ilf4deZR3+rog97hw8NFXTQjgI9L5mwGnbUigJ2Q
 GO3umgv7mlw2/ChqvqAPVZ4VAzcGqT8X6xw5EH1ZqsuykVSl1z5KIDB2IV4NQWc67KTb
 nGZlDPRYZo9dRUIkGABhDu8uBCi6WZX3cd3p+8Atz4mQk+sQ/3kD46wolHZD8azJ5j1W
 m2BA==
X-Gm-Message-State: AOAM531k9fXaxdBYks0T/txGl/oSMWROYhnsHxIqGxzJ2/lELQxef7vE
 WCgNQq3CX/DXr9XQM/J24bA=
X-Google-Smtp-Source: ABdhPJx7683h5kyDUCY3JNpP/22LqpFP9fj3vAM4rO5zJi36v7/7QQUGC9/CwkaFUhQYghahsMhqwg==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr4558026pjb.166.1611926673237; 
 Fri, 29 Jan 2021 05:24:33 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:24:32 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 06/10] hw/ssi: imx_spi: Rework imx_spi_write() to handle
 block disabled
Date: Fri, 29 Jan 2021 21:23:19 +0800
Message-Id: <20210129132323.30946-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When the block is disabled, only the ECSPI_CONREG register can
be modified. Setting the EN bit enabled the device, clearing it
"disables the block and resets the internal logic with the
exception of the ECSPI_CONREG" register.

Ignore all other registers write except ECSPI_CONREG when the
block is disabled.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210115153049.3353008-6-f4bug@amsat.org>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

(no changes since v8)

Changes in v8:
- keep the controller disable logic in the ECSPI_CONREG case
  in imx_spi_write()

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] rework imx_spi_write() to handle block disabled

 hw/ssi/imx_spi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 21e2c9dea3..4cfbb73e35 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -332,6 +332,14 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx_spi_reg_name(index),
             (uint32_t)value);
 
+    if (!imx_spi_is_enabled(s)) {
+        /* Block is disabled */
+        if (index != ECSPI_CONREG) {
+            /* Ignore access */
+            return;
+        }
+    }
+
     change_mask = s->regs[index] ^ value;
 
     switch (index) {
@@ -340,10 +348,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
                       TYPE_IMX_SPI, __func__);
         break;
     case ECSPI_TXDATA:
-        if (!imx_spi_is_enabled(s)) {
-            /* Ignore writes if device is disabled */
-            break;
-        } else if (fifo32_is_full(&s->tx_fifo)) {
+        if (fifo32_is_full(&s->tx_fifo)) {
             /* Ignore writes if queue is full */
             break;
         }
-- 
2.25.1


