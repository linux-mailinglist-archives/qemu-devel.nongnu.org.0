Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD042F8674
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:17:05 +0100 (CET)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VWq-00029G-AY
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSA-0005lM-Nh
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:14 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VS9-0008Fo-0H
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:14 -0500
Received: by mail-wr1-x430.google.com with SMTP id a12so10468946wrv.8
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTWJIJzyn/d0f9c+f8XIvnchNfg5WqrGoOxuJbOhu5Q=;
 b=D0uQ59eXKZOhx+K/zSQh1FEawYj/m1Qu8m4pE2PJ9FR+KxDom+MVM3EpOCqZ1NpPX/
 X2ZG7rx6f8vgsRiabCkjEljxtdSvKT0hhek/RX6faLHHGSUoDXA/pAgmbUQ5WhuWSMFP
 uBdGJ4QyFvEYfCiAv3kg8kFb/wzHRh2lECfrik6uSBDdX/GR9XJjam1dwumXe4PU9om+
 ErbUz4t0MT3OdIVj4lMzHyTxuvbExYhF3ISHXmudyqaoT62RgTWCxjDj0Kar6s364+NA
 TrEnQHN/Hgilw7cWBc2STR/AfDAVZb9TuTHCy5aP6cjJdp77jrqhLxDQm+5nPsOiQTZI
 EcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTWJIJzyn/d0f9c+f8XIvnchNfg5WqrGoOxuJbOhu5Q=;
 b=b9gC1VEKvUVXsKARoS7p1v2BvhsHOFLdTs1CfnD2QGSGbaJlVddFYwV30xnDmuTqzT
 27fCwO3DmToaPP6QGPqiomcIUUM8xKiWlP8paHRdXqyLm1DnQhHO5BKHQDzlxuw6usr7
 7uoiExxFpNBWZjgaP/yonMCcp2dthgh7fydrJOaMGVa51qfFSZXD/6iF37eXdskJbsxe
 efT3AgRe3d/yUG/udvAqPAIzmowitjHY5cmaWKryMz4zojGXCO9dqmTlo6r/s/CBy9rV
 4S58IO0FNIyY/+pL73qbDZJDrYTX/IWj7lHGdEaHSctQhD6caXmmG9gHpXph/xOESJwM
 dBQQ==
X-Gm-Message-State: AOAM531Y35mcFYmOZR8YJYOq2e+Q7NKiuX6viTTcXjAVo36hzhp1M1ib
 qmQjZlUKUrZi34fADeyI+lX0HHd21wbm6A==
X-Google-Smtp-Source: ABdhPJz12d4A7Q7157T8a5zPQjWZDtiiZreBtyQwTAfmes+ccNEnjy9AHaziztRGJjZsCnPEAA71eQ==
X-Received: by 2002:a5d:4104:: with SMTP id l4mr15266186wrp.340.1610741531220; 
 Fri, 15 Jan 2021 12:12:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] hw/m68k/next-cube: Move register/interrupt
 functionality into a device
Date: Fri, 15 Jan 2021 20:11:57 +0000
Message-Id: <20210115201206.17347-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the next-cube board code open-codes a lot of handling of
interrupts and some miscellaneous registers.  Move this into a proper
QOM device.

In the real hardware this functionality seems to be the
responsibility of the Peripheral Controller (PC) chip, so name the
device that.

There are several different things that will need to be moved into
this device:
 * the mmio_iops register set
 * the scr_ops register set
 * the next_irq IRQ handling

To ease review, we structure the change as a sequence of commits: in
this first commit we create the skeleton of the NeXTPC device with no
content, but with a backdoor pointer to the NeXTState machine's state
struct so we can move parts of the code and still have refactored and
non-refactored code using the same struct data fields.  Further
commits will move functionality into the new device piece by piece.
At the end we will be able to remove the backdoor pointer because all
the data fields will be in the NeXTPC struct and not the NeXTState
struct.

We'll add the VMState for the new device at the end of all that; this
is in theory a migration compatibility break but this machine does
not currently support migration at all anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/next-cube.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index f622d6589c8..dccf3eb4313 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -90,6 +90,16 @@ struct NeXTState {
     NextRtc rtc;
 };
 
+#define TYPE_NEXT_PC "next-pc"
+OBJECT_DECLARE_SIMPLE_TYPE(NeXTPC, NEXT_PC)
+
+struct NeXTPC {
+    SysBusDevice parent_obj;
+
+    /* Temporary until all functionality has been moved into this device */
+    NeXTState *ns;
+};
+
 /* Thanks to NeXT forums for this */
 /*
 static const uint8_t rtc_ram3[32] = {
@@ -857,6 +867,31 @@ static void next_escc_init(M68kCPU *cpu)
     sysbus_mmio_map(s, 0, 0x2118000);
 }
 
+static void next_pc_reset(DeviceState *dev)
+{
+}
+
+static void next_pc_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void next_pc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NeXT Peripheral Controller";
+    dc->realize = next_pc_realize;
+    dc->reset = next_pc_reset;
+    /* We will add the VMState in a later commit */
+}
+
+static const TypeInfo next_pc_info = {
+    .name = TYPE_NEXT_PC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NeXTPC),
+    .class_init = next_pc_class_init,
+};
+
 static void next_cube_init(MachineState *machine)
 {
     M68kCPU *cpu;
@@ -871,6 +906,7 @@ static void next_cube_init(MachineState *machine)
     const char *bios_name = machine->firmware ?: ROM_FILE;
     NeXTState *ns = NEXT_MACHINE(machine);
     DeviceState *dev;
+    DeviceState *pcdev;
 
     /* Initialize the cpu core */
     cpu = M68K_CPU(cpu_create(machine->cpu_type));
@@ -884,6 +920,12 @@ static void next_cube_init(MachineState *machine)
     env->vbr = 0;
     env->sr  = 0x2700;
 
+    /* Peripheral Controller */
+    pcdev = qdev_new(TYPE_NEXT_PC);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(pcdev), &error_fatal);
+    /* Temporary while we refactor this code */
+    NEXT_PC(pcdev)->ns = ns;
+
     /* Set internal registers to initial values */
     /*     0x0000XX00 << vital bits */
     ns->scr1 = 0x00011102;
@@ -978,6 +1020,7 @@ static const TypeInfo next_typeinfo = {
 static void next_register_type(void)
 {
     type_register_static(&next_typeinfo);
+    type_register_static(&next_pc_info);
 }
 
 type_init(next_register_type)
-- 
2.20.1


