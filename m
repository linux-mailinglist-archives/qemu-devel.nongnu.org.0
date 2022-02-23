Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF17D4C1E50
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:14:48 +0100 (CET)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMzuK-0000JL-2J
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:14:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMzla-0005O1-84
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:05:47 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:39960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMzlL-0005TW-Mz
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:05:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB467B821CE;
 Wed, 23 Feb 2022 22:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869DCC340E7;
 Wed, 23 Feb 2022 22:05:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bT1dqqnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645653924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a89/Lm75y4Z0GZ9X8KfFu1CUr1fh3dhCCiCALwHdE1I=;
 b=bT1dqqnJZ0Fe9h5jPfLuxQFCLCzQRHrtr6PotmddfrA9rxzPtLPBsSC06Z9X6w970kXDcj
 XqDx1UgjwEwt9yJo3LgvBQsD2UdVO62j09jEj20Rq1uMZPfz6A/B6YbLhMBirSL6sOteBx
 vS7ybKBwp8Ek2YRenF9O8nJfkw4+7uI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0f07b509
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 23 Feb 2022 22:05:23 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-crypto@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] virt: vmgenid: introduce driver for reinitializing RNG
 on VM fork
Date: Wed, 23 Feb 2022 23:04:56 +0100
Message-Id: <20220223220456.666193-3-Jason@zx2c4.com>
In-Reply-To: <20220223220456.666193-1-Jason@zx2c4.com>
References: <20220223220456.666193-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kys@microsoft.com,
 sthemmin@microsoft.com, ehabkost@redhat.com, adrian@parity.io, mst@redhat.com,
 decui@microsoft.com, haiyangz@microsoft.com, ben@skyportsystems.com,
 raduweis@amazon.com, wei.liu@kernel.org, linux@dominikbrodowski.net,
 gregkh@linuxfoundation.org, graf@amazon.com, tytso@mit.edu, jannh@google.com,
 imammedo@redhat.com, colmmacc@amazon.com, ardb@kernel.org, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VM Generation ID is a feature from Microsoft, described at
<https://go.microsoft.com/fwlink/?LinkId=260709>, and supported by
Hyper-V and QEMU. Its usage is described in Microsoft's RNG whitepaper,
<https://aka.ms/win10rng>, as:

    If the OS is running in a VM, there is a problem that most
    hypervisors can snapshot the state of the machine and later rewind
    the VM state to the saved state. This results in the machine running
    a second time with the exact same RNG state, which leads to serious
    security problems.  To reduce the window of vulnerability, Windows
    10 on a Hyper-V VM will detect when the VM state is reset, retrieve
    a unique (not random) value from the hypervisor, and reseed the root
    RNG with that unique value.  This does not eliminate the
    vulnerability, but it greatly reduces the time during which the RNG
    system will produce the same outputs as it did during a previous
    instantiation of the same VM state.

Linux has the same issue, and given that vmgenid is supported already by
multiple hypervisors, we can implement more or less the same solution.
So this commit wires up the vmgenid ACPI notification to the RNG's newly
added add_vmfork_randomness() function.

It can be used from qemu via the `-device vmgenid,guid=auto` parameter.
After setting that, use `savevm` in the monitor to save the VM state,
then quit QEMU, start it again, and use `loadvm`. That will trigger this
driver's notify function, which hands the new UUID to the RNG.

This driver builds on prior work from Adrian Catangiu at Amazon, and it
is my hope that that team can resume maintenance of this driver.

Cc: Adrian Catangiu <adrian@parity.io>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/virt/Kconfig   |   9 ++++
 drivers/virt/Makefile  |   1 +
 drivers/virt/vmgenid.c | 120 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 drivers/virt/vmgenid.c

diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 8061e8ef449f..d3276dc2095c 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -13,6 +13,15 @@ menuconfig VIRT_DRIVERS
 
 if VIRT_DRIVERS
 
+config VMGENID
+	tristate "Virtual Machine Generation ID driver"
+	default y
+	depends on ACPI
+	help
+	  Say Y here to use the hypervisor-provided Virtual Machine Generation ID
+	  to reseed the RNG when the VM is cloned. This is highly recommended if
+	  you intend to do any rollback / cloning / snapshotting of VMs.
+
 config FSL_HV_MANAGER
 	tristate "Freescale hypervisor management driver"
 	depends on FSL_SOC
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index 3e272ea60cd9..108d0ffcc9aa 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_FSL_HV_MANAGER)	+= fsl_hypervisor.o
+obj-$(CONFIG_VMGENID)		+= vmgenid.o
 obj-y				+= vboxguest/
 
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
diff --git a/drivers/virt/vmgenid.c b/drivers/virt/vmgenid.c
new file mode 100644
index 000000000000..c2255ea6be59
--- /dev/null
+++ b/drivers/virt/vmgenid.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Virtual Machine Generation ID driver
+ *
+ * Copyright (C) 2022 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
+ * Copyright (C) 2020 Amazon. All rights reserved.
+ * Copyright (C) 2018 Red Hat Inc. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/random.h>
+#include <linux/uuid.h>
+
+ACPI_MODULE_NAME("vmgenid");
+
+static struct {
+	uuid_t this_uuid;
+	uuid_t *next_uuid;
+} state;
+
+static int vmgenid_acpi_add(struct acpi_device *device)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER };
+	union acpi_object *pss;
+	phys_addr_t phys_addr;
+	acpi_status status;
+	int ret = 0;
+
+	if (!device)
+		return -EINVAL;
+
+	status = acpi_evaluate_object(device->handle, "ADDR", NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		ACPI_EXCEPTION((AE_INFO, status, "Evaluating ADDR"));
+		return -ENODEV;
+	}
+	pss = buffer.pointer;
+	if (!pss || pss->type != ACPI_TYPE_PACKAGE || pss->package.count != 2 ||
+	    pss->package.elements[0].type != ACPI_TYPE_INTEGER ||
+	    pss->package.elements[1].type != ACPI_TYPE_INTEGER) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	phys_addr = (pss->package.elements[0].integer.value << 0) |
+		    (pss->package.elements[1].integer.value << 32);
+	state.next_uuid = acpi_os_map_memory(phys_addr, sizeof(*state.next_uuid));
+	if (!state.next_uuid) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	state.this_uuid = *state.next_uuid;
+	device->driver_data = &state;
+	add_device_randomness(&state.this_uuid, sizeof(state.this_uuid));
+
+out:
+	ACPI_FREE(buffer.pointer);
+	return ret;
+}
+
+static int vmgenid_acpi_remove(struct acpi_device *device)
+{
+	if (!device || acpi_driver_data(device) != &state)
+		return -EINVAL;
+	device->driver_data = NULL;
+	if (state.next_uuid)
+		acpi_os_unmap_memory(state.next_uuid, sizeof(*state.next_uuid));
+	state.next_uuid = NULL;
+	return 0;
+}
+
+static void vmgenid_acpi_notify(struct acpi_device *device, u32 event)
+{
+	uuid_t old_uuid;
+
+	if (!device || acpi_driver_data(device) != &state)
+		return;
+	old_uuid = state.this_uuid;
+	state.this_uuid = *state.next_uuid;
+	if (!memcmp(&old_uuid, &state.this_uuid, sizeof(state.this_uuid)))
+		return;
+	add_vmfork_randomness(&state.this_uuid, sizeof(state.this_uuid));
+}
+
+static const struct acpi_device_id vmgenid_ids[] = {
+	{"VMGENID", 0},
+	{"QEMUVGID", 0},
+	{ },
+};
+
+static struct acpi_driver acpi_driver = {
+	.name = "vm_generation_id",
+	.ids = vmgenid_ids,
+	.owner = THIS_MODULE,
+	.ops = {
+		.add = vmgenid_acpi_add,
+		.remove = vmgenid_acpi_remove,
+		.notify = vmgenid_acpi_notify,
+	}
+};
+
+static int __init vmgenid_init(void)
+{
+	return acpi_bus_register_driver(&acpi_driver);
+}
+
+static void __exit vmgenid_exit(void)
+{
+	acpi_bus_unregister_driver(&acpi_driver);
+}
+
+module_init(vmgenid_init);
+module_exit(vmgenid_exit);
+
+MODULE_DEVICE_TABLE(acpi, vmgenid_ids);
+MODULE_DESCRIPTION("Virtual Machine Generation ID");
+MODULE_LICENSE("GPL v2");
-- 
2.35.1


