Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2192F7FBC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:38:18 +0100 (CET)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RB3-0005vu-51
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4O-0005ua-Nw; Fri, 15 Jan 2021 10:31:25 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R4L-00018Q-87; Fri, 15 Jan 2021 10:31:23 -0500
Received: by mail-ej1-x62f.google.com with SMTP id hs11so11525743ejc.1;
 Fri, 15 Jan 2021 07:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SxhCah3PmIN+C/eYAy1fbYSX9RyZywJv9Y2BedeIMA4=;
 b=B7Ew6UQ0RIIhXfw5JWZyCgyfv6JzI0u8GkIUkbS2Tavn72KrWeWPPGr54aSfMiqIFO
 Tw+8qE0JZ9UeMYEcmR5xQ9B9z58yyP9gPyj1cmWSJtnO+8ZWWmW4R9uJc/0BuvmCJpTX
 XKLPC4enAEkyiDnwQEc4ep8diYjiPGvpkj6+acZKC3pirPA7gGC9qmy1GhALebI43zRU
 emzN/iFh+dzjTjjjtJ6hWb/2wG0N1/NhuDSnnxAyERvmZPVSDgIgpidx8jkVIXgBuuzt
 okPFgDjmzfSP1jsUFq/z0iQEgUCdUJYmw9W4KvFSeW3v/dycXvGPsQjKvQCR5OkNe0ay
 VdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SxhCah3PmIN+C/eYAy1fbYSX9RyZywJv9Y2BedeIMA4=;
 b=gASe99hTLrgMavSkNiv/6Vg4+tMjCdsu621WKs/kkfsY+TD3qLtN7kbLCeyDVMtOim
 wmYqxVa/AQlvfI40oEr4p6cB0crdTH2KfmyaEmkTaJmv0KmfZmfhVwZQ7P2DJT8Byx6y
 0mOMlzHO+RpJectk1EqC0D+YGeXyt+GdI0114nukk0SuDop22OTvkaX3PuRap5zO1yHh
 O7DK3D1Q71XomWrJwyvvcf304RC8gVvjEs+RHy+S2naXTXI1QhYGDKj0wqHzin17JCvE
 oBrrWDVoF+rUqmT+Jop5Tkj9ERl0tAQoGd5K9RN1mGOuE2PFjtbKUNTjbEPz3YVHvWb4
 qvSQ==
X-Gm-Message-State: AOAM533Q3S12KCNP9iei1O+94X7JKpFft4OgVALavC2yYA2N5VW/cLib
 0hQWglc+ALIoTwDrTgYifDYgPqxBDXQ=
X-Google-Smtp-Source: ABdhPJxXYhqdUdkvzzKw92zvZjxCWt45x8RkhUoVXTm82QO+bxKujJljmA7/W7DUvRL3IFF4WYbdUA==
X-Received: by 2002:a17:906:d98:: with SMTP id
 m24mr5373690eji.428.1610724679246; 
 Fri, 15 Jan 2021 07:31:19 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r23sm3672540ejd.56.2021.01.15.07.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:31:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 5/9] hw/ssi: imx_spi: Rework imx_spi_write() to handle
 block disabled
Date: Fri, 15 Jan 2021 16:30:45 +0100
Message-Id: <20210115153049.3353008-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
References: <20210115153049.3353008-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 hw/ssi/imx_spi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index ba7d3438d87..f06bbf317e2 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -322,6 +322,21 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx_spi_reg_name(index),
             (uint32_t)value);
 
+    if (!imx_spi_is_enabled(s)) {
+        /* Block is disabled */
+        if (index != ECSPI_CONREG) {
+            /* Ignore access */
+            return;
+        }
+        s->regs[ECSPI_CONREG] = value;
+        if (!(value & ECSPI_CONREG_EN)) {
+            /* Keep disabled */
+            return;
+        }
+        /* Enable the block */
+        imx_spi_reset(DEVICE(s));
+    }
+
     change_mask = s->regs[index] ^ value;
 
     switch (index) {
@@ -330,10 +345,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
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
@@ -359,12 +371,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     case ECSPI_CONREG:
         s->regs[ECSPI_CONREG] = value;
 
-        if (!imx_spi_is_enabled(s)) {
-            /* device is disabled, so this is a reset */
-            imx_spi_reset(DEVICE(s));
-            return;
-        }
-
         if (imx_spi_channel_is_master(s)) {
             int i;
 
-- 
2.26.2


