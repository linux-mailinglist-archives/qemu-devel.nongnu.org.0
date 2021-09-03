Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B84001E9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:20:17 +0200 (CEST)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAzI-0004Og-S7
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAty-0004cw-1y
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtv-0007PY-3c
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:44 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b6so8692642wrh.10
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12HaYXUuKoS6T5PuKGowDR0/v6+2hx1VPdfHK6j3uyM=;
 b=gLo448uVa127kt9ci4nDcabjel7q1SrgbziE/oxAZlGYy3DproYUQF+hrFuQAlPfNq
 smRqyzX7asHgMrPCOzXCF3UaD4s7yUsJ3oduFRt30tmLzQ4ivFQQoWglsZHF9nP+jwYm
 t5E4zh4nChELj0DgRJEN31xqbJDgNPO3iQpG9/JnntidqC/aFBxrNCtzArdd+LMZn09+
 Xl5eOQShrjPW0wvBC4KHKc3YUfO2+lFAfMXpRWbOGNpBAiWXCLLrqfmzopS0AknekwFF
 tKiyfcWxfT8y9Ux1smDLDS1cqBTfZdc0vgXAIga2QmkjKM/18Tg0pOMyeTfAPUM5o/0X
 8uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12HaYXUuKoS6T5PuKGowDR0/v6+2hx1VPdfHK6j3uyM=;
 b=hKtZ7ui2HOvtgRfalL9iB74mQQGV5whxf+jfYG3zYysvfvqYIuEaskB5Lv+Nvsz7vI
 xTFwy4ALBHfpE3up7WeGB6fEXRJJ6p5hT1xlg/gHpjSbSSPUyKGu52igA+Hl6Ixjcodj
 b6QYMHP8olWX1hyo6IE+V5AVwyGWqBnTsZYkl/TRhwZ39ty4Pbg5JqE9e1AA06xVCzV+
 8SXgw6GMgdqOtcTPaLnGEY0pWmULqx5YZxv8JF/EG5NhnyQsWJbibKL/BuEaMJ4cdL+e
 HC3hTxERUfWl1qdxdNsjSSLkCWLTdYrAjJAcjM4/H9YOq+RXW6pAC25PrftMhXstV4PF
 t3mw==
X-Gm-Message-State: AOAM532U5oE5PVE9WXtcH/5qz96xMMelJQ+VwHgkCaGTgYCMcyy4kOP2
 jYYMEPCq2yxJtlM0xpV9G5UP6g==
X-Google-Smtp-Source: ABdhPJwOnbLBIT3lHS8UYzDUFb1DAm/CTurMyO5Esmism8XtsF64JQX2QAmhaKDDX7RYxyXEamfWZg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr4857297wrr.382.1630682081522; 
 Fri, 03 Sep 2021 08:14:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y21sm4737780wmc.11.2021.09.03.08.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:14:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/arm/mps2-tz.c: Mark internal-only I2C buses as 'full'
Date: Fri,  3 Sep 2021 16:14:34 +0100
Message-Id: <20210903151435.22379-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903151435.22379-1-peter.maydell@linaro.org>
References: <20210903151435.22379-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
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


