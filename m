Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A5F409952
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:33:51 +0200 (CEST)
Received: from localhost ([::1]:47938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoty-0001T8-0d
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoZ0-0001Fd-OF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYv-0008Hp-Jk
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u16so15554818wrn.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eNgBTqHB+fi0Y+oESbrufAW/CqyPi3d87ouK5WTfuQs=;
 b=O1Py2peuEhWUQ3h2WTGKkH6HNDF2BAMAOnkm7QFF2sZwsbJXcQMvihdKY8mAWiLLIQ
 IkzuKBxecGRRbCSX0ebw9CtBe4HrGzfXeMMtmavpQFu46sQMbwPrwu6Lg2UuOZvuVzve
 RIm0rEh2s5dMSP465AuP4Ak3VRdAfzKdpoZblIS4mDK/WAgWZ+F/sdmsWdkeQ2UKBiCo
 eaUsbrgdMFIm26HWRLfJKclt53pyDdRnzoDhV3fRpIuZiIEP0Ul+uEA5GRK+VuwhyE1j
 uhkLsjzBtPkJA/f4dcQ3dQ09hw9ipvntl2pEn6+DgYnqs7YJERePDn1v5hRLoezS9Hsx
 L0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eNgBTqHB+fi0Y+oESbrufAW/CqyPi3d87ouK5WTfuQs=;
 b=Ptg4XYVbya54hPlNWZSJ6g3DTvP1Bomqy11A+6jFsSlu5RN4Bval0m9p70uRUFMq1o
 NkAjux1efqpVEpQiYnrNbSIfiQ4IjHmpCwSe+dtBTkt+CuxffFk4TC2M9VNhyBbCbooD
 6PO8/ClKuouy/9FXMkU9975u4iwyBPMaaPNwOGE6YVV8r+1ExKVlf3A6Lhw7i2kl1giW
 gAz3RfNrGHgkkRH+k981lGfSLZCrGDFlZBHp28hAtaD8mEY9ei1vtH2ZF/8B/2uWQygT
 Oeq2xn97/ZYmjzT8iZk+gPf1KEoKV5jzlZfRPIjm4bIxoTUL8AThNr1qU+s07mx/UaLI
 Th5g==
X-Gm-Message-State: AOAM532V79iEW9VxsrdvS5pwg7cJ448IpmwVIseAqG1yt48qPXuScP1a
 PJGhOMF16xTlt+fHmY2jJ0GUGaWVB3u/iA==
X-Google-Smtp-Source: ABdhPJyrhkJn/hVd8yW2TPXWV1v15gvjYbWOkrW3oFRlxSOtymQ/VJIrQjnfiKCewEBL2dLVVKnZXQ==
X-Received: by 2002:a5d:4eca:: with SMTP id s10mr1064346wrv.116.1631549524245; 
 Mon, 13 Sep 2021 09:12:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.12.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:12:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/23] hw/arm/mps2-tz.c: Mark internal-only I2C buses as 'full'
Date: Mon, 13 Sep 2021 17:11:43 +0100
Message-Id: <20210913161144.12347-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The various MPS2 boards have multiple I2C buses: typically a bus
dedicated to the audio configuration, one for the LCD touchscreen
controller, one for a DDR4 EEPROM, and two which are connected to the
external Shield expansion connector.  Mark the buses which are used
only for board-internal devices as 'full' so that if the user creates
i2c devices on the commandline without specifying a bus name then
they will be connected to the I2C controller used for the Shield
connector, where guest software will expect them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210903151435.22379-4-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 57 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 746ba3cc59e..f40e854dec7 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -375,6 +375,7 @@ static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
 
 /* Union describing the device-specific extra data we pass to the devfn. */
 typedef union PPCExtraData {
+    bool i2c_internal;
 } PPCExtraData;
 
 /* Most of the devices in the AN505 FPGA image sit behind
@@ -711,6 +712,20 @@ static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
     object_initialize_child(OBJECT(mms), name, i2c, TYPE_ARM_SBCON_I2C);
     s = SYS_BUS_DEVICE(i2c);
     sysbus_realize(s, &error_fatal);
+
+    /*
+     * If this is an internal-use-only i2c bus, mark it full
+     * so that user-created i2c devices are not plugged into it.
+     * If we implement models of any on-board i2c devices that
+     * plug in to one of the internal-use-only buses, then we will
+     * need to create and plugging those in here before we mark the
+     * bus as full.
+     */
+    if (extradata->i2c_internal) {
+        BusState *qbus = qdev_get_child_bus(DEVICE(i2c), "i2c");
+        qbus_mark_full(qbus);
+    }
+
     return sysbus_mmio_get_region(s, 0);
 }
 
@@ -921,10 +936,14 @@ static void mps2tz_common_init(MachineState *machine)
                 { "uart2", make_uart, &mms->uart[2], 0x40202000, 0x1000, { 36, 37, 44 } },
                 { "uart3", make_uart, &mms->uart[3], 0x40203000, 0x1000, { 38, 39, 45 } },
                 { "uart4", make_uart, &mms->uart[4], 0x40204000, 0x1000, { 40, 41, 46 } },
-                { "i2c0", make_i2c, &mms->i2c[0], 0x40207000, 0x1000 },
-                { "i2c1", make_i2c, &mms->i2c[1], 0x40208000, 0x1000 },
-                { "i2c2", make_i2c, &mms->i2c[2], 0x4020c000, 0x1000 },
-                { "i2c3", make_i2c, &mms->i2c[3], 0x4020d000, 0x1000 },
+                { "i2c0", make_i2c, &mms->i2c[0], 0x40207000, 0x1000, {},
+                  { .i2c_internal = true /* touchscreen */ } },
+                { "i2c1", make_i2c, &mms->i2c[1], 0x40208000, 0x1000, {},
+                  { .i2c_internal = true /* audio conf */ } },
+                { "i2c2", make_i2c, &mms->i2c[2], 0x4020c000, 0x1000, {},
+                  { .i2c_internal = false /* shield 0 */ } },
+                { "i2c3", make_i2c, &mms->i2c[3], 0x4020d000, 0x1000, {},
+                  { .i2c_internal = false /* shield 1 */ } },
             },
         }, {
             .name = "apb_ppcexp2",
@@ -965,15 +984,20 @@ static void mps2tz_common_init(MachineState *machine)
         }, {
             .name = "apb_ppcexp1",
             .ports = {
-                { "i2c0", make_i2c, &mms->i2c[0], 0x41200000, 0x1000 },
-                { "i2c1", make_i2c, &mms->i2c[1], 0x41201000, 0x1000 },
+                { "i2c0", make_i2c, &mms->i2c[0], 0x41200000, 0x1000, {},
+                  { .i2c_internal = true /* touchscreen */ } },
+                { "i2c1", make_i2c, &mms->i2c[1], 0x41201000, 0x1000, {},
+                  { .i2c_internal = true /* audio conf */ } },
                 { "spi0", make_spi, &mms->spi[0], 0x41202000, 0x1000, { 52 } },
                 { "spi1", make_spi, &mms->spi[1], 0x41203000, 0x1000, { 53 } },
                 { "spi2", make_spi, &mms->spi[2], 0x41204000, 0x1000, { 54 } },
-                { "i2c2", make_i2c, &mms->i2c[2], 0x41205000, 0x1000 },
-                { "i2c3", make_i2c, &mms->i2c[3], 0x41206000, 0x1000 },
+                { "i2c2", make_i2c, &mms->i2c[2], 0x41205000, 0x1000, {},
+                  { .i2c_internal = false /* shield 0 */ } },
+                { "i2c3", make_i2c, &mms->i2c[3], 0x41206000, 0x1000, {},
+                  { .i2c_internal = false /* shield 1 */ } },
                 { /* port 7 reserved */ },
-                { "i2c4", make_i2c, &mms->i2c[4], 0x41208000, 0x1000 },
+                { "i2c4", make_i2c, &mms->i2c[4], 0x41208000, 0x1000, {},
+                  { .i2c_internal = true /* DDR4 EEPROM */ } },
             },
         }, {
             .name = "apb_ppcexp2",
@@ -1015,15 +1039,20 @@ static void mps2tz_common_init(MachineState *machine)
         }, {
             .name = "apb_ppcexp1",
             .ports = {
-                { "i2c0", make_i2c, &mms->i2c[0], 0x49200000, 0x1000 },
-                { "i2c1", make_i2c, &mms->i2c[1], 0x49201000, 0x1000 },
+                { "i2c0", make_i2c, &mms->i2c[0], 0x49200000, 0x1000, {},
+                  { .i2c_internal = true /* touchscreen */ } },
+                { "i2c1", make_i2c, &mms->i2c[1], 0x49201000, 0x1000, {},
+                  { .i2c_internal = true /* audio conf */ } },
                 { "spi0", make_spi, &mms->spi[0], 0x49202000, 0x1000, { 53 } },
                 { "spi1", make_spi, &mms->spi[1], 0x49203000, 0x1000, { 54 } },
                 { "spi2", make_spi, &mms->spi[2], 0x49204000, 0x1000, { 55 } },
-                { "i2c2", make_i2c, &mms->i2c[2], 0x49205000, 0x1000 },
-                { "i2c3", make_i2c, &mms->i2c[3], 0x49206000, 0x1000 },
+                { "i2c2", make_i2c, &mms->i2c[2], 0x49205000, 0x1000, {},
+                  { .i2c_internal = false /* shield 0 */ } },
+                { "i2c3", make_i2c, &mms->i2c[3], 0x49206000, 0x1000, {},
+                  { .i2c_internal = false /* shield 1 */ } },
                 { /* port 7 reserved */ },
-                { "i2c4", make_i2c, &mms->i2c[4], 0x49208000, 0x1000 },
+                { "i2c4", make_i2c, &mms->i2c[4], 0x49208000, 0x1000, {},
+                  { .i2c_internal = true /* DDR4 EEPROM */ } },
             },
         }, {
             .name = "apb_ppcexp2",
-- 
2.20.1


