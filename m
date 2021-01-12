Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFF32F390F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:42:55 +0100 (CET)
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOd4-0007dv-JE
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWq-0001oR-Bv; Tue, 12 Jan 2021 13:36:28 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWm-0007UX-Et; Tue, 12 Jan 2021 13:36:27 -0500
Received: by mail-ej1-x629.google.com with SMTP id f4so3840454ejx.7;
 Tue, 12 Jan 2021 10:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UUrqq49b0H8vT1YH+cv+uaCjRkYF+aPQPM0uhg4pceE=;
 b=EJJMRxbbJxh8UJwD7/C898SYLP5gBXoO4/wgs1dvDaZnTWJuXj2ATH9mQEW4gy7pAW
 EsE4BG1osS3BWvEDnKmmVpsJlm5PkjrhCkD8pNTcHfG8MpleSoWlNBrG7/fYEuuOkayV
 p5CGVDXtiB/MWb0JF2hkkau8XqI7lTFAc+TyMJJ5Fwv2XPOR6Skpt3o41isDM7Xt2ztt
 Egkchq+1lLr1RLF+K7HD/ajsyudnSufvwgtHHm8CqrvXh+r8DgkZ0UdL46srdnOj49lg
 HHPsdVpRc3tNSz5doC4fHaFD51nIVYrlYbXMJEoM8kWt/Diroi3njSvErLYqO1/0y2iO
 kujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UUrqq49b0H8vT1YH+cv+uaCjRkYF+aPQPM0uhg4pceE=;
 b=qiseRPbuUMHtXZkeDooCq3ZC9EX02ZQx1GRxfdM3zipWFYbHkPxu3zuXl7qL/cNoQL
 gU/9IQOjsfXUJVeeUTsOyN/X3dCaWrY0/HIjNb0wbgB4s24vIqHoh23xdYNmdRMNr47n
 ScgT0eiM8Q68fY1aOV11BV07SH+7p+zqrv4aTfLtDx8V6ozthHOPWhDbniLZ5NRHhTns
 D3yLKyKZGtK6B7kM6+KpHt8uptOYvlSCvKA4AAq9tcDFx921luHkttDIkx7BzAKFYj1/
 PjuphdqB630QyzEBKV0yM+t73u+SqzmpzvTZiZJ+etQzJeatVlaJCGSrPNQ3JJqw1eUg
 2Xcg==
X-Gm-Message-State: AOAM531V9k3VnXxRnK08C2ca/xo6aC5ZSzbdOcgVLQuTvOnlBWzfrfvV
 6+eMuDQd6uawG1XqF1FqYPo=
X-Google-Smtp-Source: ABdhPJznm2QYUQ6cpnSpv5X4F2y1tDvJrjYXJC9L5neUa8ZZ7s69gJ6ar8bMbCxEjjQ9D4bPIfPhWA==
X-Received: by 2002:a17:906:878d:: with SMTP id
 za13mr98547ejb.395.1610476582574; 
 Tue, 12 Jan 2021 10:36:22 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id r21sm1779423eds.91.2021.01.12.10.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 07/11] hw/ssi: imx_spi: Rework imx_spi_write() to
 handle block disabled
Date: Tue, 12 Jan 2021 19:35:25 +0100
Message-Id: <20210112183529.2011863-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the block is disabled, only the ECSPI_CONREG register can
be modified. Setting the EN bit enabled the device, clearing it
"disables the block and resets the internal logic with the
exception of the ECSPI_CONREG" register.

Move the imx_spi_is_enabled() check earlier.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 7ac9da0f1d2..801daa5cbfa 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -321,6 +321,20 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
     trace_imx_spi_write(index, imx_spi_reg_name(index), value);
 
+    if (!imx_spi_is_enabled(s)) {
+        /* Block is disabled */
+        if (index != ECSPI_CONREG) {
+            /* Ignore access */
+            return;
+        }
+        s->regs[ECSPI_CONREG] = value;
+        if (value & ECSPI_CONREG_EN) {
+            /* Keep disabled */
+            return;
+        }
+        /* Enable the block */
+        imx_spi_reset(DEVICE(s));
+    }
 
     switch (index) {
     case ECSPI_RXDATA:
@@ -328,10 +342,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
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
@@ -357,12 +368,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     case ECSPI_CONREG:
         s->regs[ECSPI_CONREG] = value;
 
-        if (!imx_spi_is_enabled(s)) {
-            /* device is disabled, so this is a reset */
-            imx_spi_reset(DEVICE(s));
-            return;
-        }
-
         if (imx_spi_channel_is_master(s)) {
             uint32_t change_mask = s->regs[index] ^ value;
             int i;
-- 
2.26.2


