Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE02FB44E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:39:15 +0100 (CET)
Received: from localhost ([::1]:58330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mXi-0001ZM-8U
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVW-0008Hn-Pu
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:58 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:35039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVT-0003Rf-RN
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:58 -0500
Received: by mail-wm1-f44.google.com with SMTP id e15so9498902wme.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mdT/NKhm7BBrmMcwwEVr39Cma+q1XER1MJBfOZkvxpI=;
 b=FjnNrTFkxzXyKIouh+cjQHOw5JAgKkCOQhFnXnx9hh2Dyerfs5yO7lIr6gR6xiwBy2
 kpoiSYxg4vm/Q9SfmbeFnQI2RWQ7nmo85F3gE8mn32qF60jOMEGW9r4NF0cEyQBkli85
 ky/ePMsic8YaI7Udy/VWHS1xpipGq12x+EtAHFiaYugEuZr8x7Q3OVbnQhpgfanYcRnP
 pVxwuP4WQCDPx1qpRYkeBy4W+kiOdNFyK0B6Otns4toJdBS8cJKTKJGp2rx1Kl8AcVKn
 ktF7Oa7KP06oau99fRDvUxphIKk+fTV2rCZ17MQafrNpRQ8EKGi3RBVj+iLgM2ZoVARs
 RDWg==
X-Gm-Message-State: AOAM530ScvBwPHSXZ8dqCTO1qCiGv1glNZGvOmC++rIxtHdVEqaB7/ji
 oyn+NvjIAyWO7cinUH/f8SwfOVUGF6w=
X-Google-Smtp-Source: ABdhPJzjL221h+S83MRnf/c+FP9K5pdvS9nw/nBJCAMvJ6UXAz2XFx9udtUUZQox8V2npt9kBwziNA==
X-Received: by 2002:a05:600c:20c:: with SMTP id
 12mr2933323wmi.125.1611045414386; 
 Tue, 19 Jan 2021 00:36:54 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:54 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/11] hw/m68k/next-cube: Move register/interrupt functionality
 into a device
Date: Tue, 19 Jan 2021 09:36:08 +0100
Message-Id: <20210119083617.6337-3-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.44; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

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
Message-Id: <20210115201206.17347-3-peter.maydell@linaro.org>
[huth: Add a comment in front of struct NeXTPC]
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index f622d6589c..262ff4ead0 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -90,6 +90,17 @@ struct NeXTState {
     NextRtc rtc;
 };
 
+#define TYPE_NEXT_PC "next-pc"
+OBJECT_DECLARE_SIMPLE_TYPE(NeXTPC, NEXT_PC)
+
+/* NeXT Peripheral Controller */
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
@@ -857,6 +868,31 @@ static void next_escc_init(M68kCPU *cpu)
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
@@ -871,6 +907,7 @@ static void next_cube_init(MachineState *machine)
     const char *bios_name = machine->firmware ?: ROM_FILE;
     NeXTState *ns = NEXT_MACHINE(machine);
     DeviceState *dev;
+    DeviceState *pcdev;
 
     /* Initialize the cpu core */
     cpu = M68K_CPU(cpu_create(machine->cpu_type));
@@ -884,6 +921,12 @@ static void next_cube_init(MachineState *machine)
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
@@ -978,6 +1021,7 @@ static const TypeInfo next_typeinfo = {
 static void next_register_type(void)
 {
     type_register_static(&next_typeinfo);
+    type_register_static(&next_pc_info);
 }
 
 type_init(next_register_type)
-- 
2.29.2


