Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE44339F68
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:14:52 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7ql-0007Ot-NE
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7o3-0005Ds-Ez; Sat, 13 Mar 2021 12:12:03 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7o1-0001yp-Ly; Sat, 13 Mar 2021 12:12:03 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l11so6478226wrp.7;
 Sat, 13 Mar 2021 09:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ILzbG17lCVPuLCHWvX7YzhIgO/cLMrw9CngCTsxuDAc=;
 b=lUy5NDNffUnQ2Q04PzbI+041CkFPR8eg8QiH5O43FgJeBDSXIyhVjZrb0wzZcP8R0K
 055zhUsFofp/ALrQ6gOyb8MXHM9wANvLY/SKFhI3B+GVuwYce2RrzhggSf0NWyfUJklU
 h1cDbV8lbtCayOTdwU4Stj1FiryJsZEBZY1YOU9Sba7gFjTIlWfQMg8mxX7R9j+Dvkfd
 h9C1j2O3ciEQtLIPzkDWep2NbFDzSI0h6v3AR0SZJFuJ3OLJVZyI0+RYtgpVoYKrIBpF
 nNKENbAJo7lbEV8/rcLg1p2qRZ2tqvlzgAJjBga6nPuh3NPZt3xZbxy0l2THArLbqOoQ
 y4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ILzbG17lCVPuLCHWvX7YzhIgO/cLMrw9CngCTsxuDAc=;
 b=JQSPCRnFILZcnBTs3HdhU21qd7RXhgvbWXnAwxngtBrha2l6YIhDXTLBWtamd3HgeS
 cDTjEh/s6dKAAplmP8SnJ/Oja0lcCcs6FDFcnQ0xeIT7o/FhZePRZ3Zv+xYlhdCWXCFP
 SsKmIWFrxGokXRK5GEI31aeEV6uu1+PHAqSZLNFnKE5+cAeN9xf3IK+YyINVk76Asuun
 FK11hPqY9V2kfVpWgu6ufHSSWbNgI23q9O/tdEGe4wQlFpAF+GmurEpWQJWQ+4H1l0Zr
 N2JW3HxfCpzMN2QOBF2SHxOXXGw4hIOLIGFvFQwDR2k6YJLLkA5RrqjrKbsOqQJfzMVD
 NWtA==
X-Gm-Message-State: AOAM530m6x7H6OCPF3nk93/i2c8q2ZYzTF+xAk/7TlWNbKJQMyfhyS1P
 WOhwcyYIcflfRTpqTMQQub2g3wDlAucCdQ==
X-Google-Smtp-Source: ABdhPJzwDpXI4zMf8HmoqpSFJJiUVrFFMiCRdIqi7t0FR3MRD3pAe8bI+k5tKFEkqx5IpDwJX+cdIg==
X-Received: by 2002:a5d:468e:: with SMTP id u14mr19873299wrq.359.1615655518314; 
 Sat, 13 Mar 2021 09:11:58 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i10sm12232500wrs.11.2021.03.13.09.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 09:11:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/arm: Constify VMStateDescription
Date: Sat, 13 Mar 2021 18:11:48 +0100
Message-Id: <20210313171150.2122409-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313171150.2122409-1-f4bug@amsat.org>
References: <20210313171150.2122409-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/highbank.c   | 2 +-
 hw/arm/pxa2xx_pic.c | 2 +-
 hw/arm/spitz.c      | 4 ++--
 hw/arm/strongarm.c  | 2 +-
 hw/arm/z2.c         | 4 ++--
 hw/dma/pxa2xx_dma.c | 4 ++--
 hw/misc/mst_fpga.c  | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index bf886268c57..5afdd28b35c 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -170,7 +170,7 @@ struct HighbankRegsState {
     uint32_t regs[NUM_REGS];
 };
 
-static VMStateDescription vmstate_highbank_regs = {
+static const VMStateDescription vmstate_highbank_regs = {
     .name = "highbank-regs",
     .version_id = 0,
     .minimum_version_id = 0,
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index cf6cb2a373a..ed032fed548 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -301,7 +301,7 @@ DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
     return dev;
 }
 
-static VMStateDescription vmstate_pxa2xx_pic_regs = {
+static const VMStateDescription vmstate_pxa2xx_pic_regs = {
     .name = "pxa2xx_pic",
     .version_id = 0,
     .minimum_version_id = 0,
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 6b3bf9828bc..b45a929cbd9 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -1134,7 +1134,7 @@ static bool is_version_0(void *opaque, int version_id)
     return version_id == 0;
 }
 
-static VMStateDescription vmstate_sl_nand_info = {
+static const VMStateDescription vmstate_sl_nand_info = {
     .name = "sl-nand",
     .version_id = 0,
     .minimum_version_id = 0,
@@ -1170,7 +1170,7 @@ static const TypeInfo sl_nand_info = {
     .class_init    = sl_nand_class_init,
 };
 
-static VMStateDescription vmstate_spitz_kbd = {
+static const VMStateDescription vmstate_spitz_kbd = {
     .name = "spitz-keyboard",
     .version_id = 1,
     .minimum_version_id = 0,
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index c7ca54bceaa..e3e3ea61634 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -207,7 +207,7 @@ static int strongarm_pic_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static VMStateDescription vmstate_strongarm_pic_regs = {
+static const VMStateDescription vmstate_strongarm_pic_regs = {
     .name = "strongarm_pic",
     .version_id = 0,
     .minimum_version_id = 0,
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 5099bd83802..9c1e876207b 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -162,7 +162,7 @@ static void zipit_lcd_realize(SSIPeripheral *dev, Error **errp)
     z->pos = 0;
 }
 
-static VMStateDescription vmstate_zipit_lcd_state = {
+static const VMStateDescription vmstate_zipit_lcd_state = {
     .name = "zipit-lcd",
     .version_id = 2,
     .minimum_version_id = 2,
@@ -268,7 +268,7 @@ static uint8_t aer915_recv(I2CSlave *slave)
     return retval;
 }
 
-static VMStateDescription vmstate_aer915_state = {
+static const VMStateDescription vmstate_aer915_state = {
     .name = "aer915",
     .version_id = 1,
     .minimum_version_id = 1,
diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index b3707ff3de2..fa896f7edf7 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -525,7 +525,7 @@ static bool is_version_0(void *opaque, int version_id)
     return version_id == 0;
 }
 
-static VMStateDescription vmstate_pxa2xx_dma_chan = {
+static const VMStateDescription vmstate_pxa2xx_dma_chan = {
     .name = "pxa2xx_dma_chan",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -540,7 +540,7 @@ static VMStateDescription vmstate_pxa2xx_dma_chan = {
     },
 };
 
-static VMStateDescription vmstate_pxa2xx_dma = {
+static const VMStateDescription vmstate_pxa2xx_dma = {
     .name = "pxa2xx_dma",
     .version_id = 1,
     .minimum_version_id = 0,
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index edfc35d5f0f..2aaadfa9668 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -222,7 +222,7 @@ static void mst_fpga_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-static VMStateDescription vmstate_mst_fpga_regs = {
+static const VMStateDescription vmstate_mst_fpga_regs = {
     .name = "mainstone_fpga",
     .version_id = 0,
     .minimum_version_id = 0,
-- 
2.26.2


