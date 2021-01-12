Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB3C2F2EE6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:20:26 +0100 (CET)
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIev-0003CQ-B7
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=639db6d60=acatan@amazon.com>)
 id 1kzIbu-0001q7-Sp
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:17:22 -0500
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:21319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=639db6d60=acatan@amazon.com>)
 id 1kzIbh-0001I6-OG
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1610453825; x=1641989825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EOW6juggGEXAs6hvV4WJ47XDoCr9RDgvKznLdz0LphA=;
 b=WXpSbC2LDnJQRo/mWyXrwjY+vzJAjZBsW5EgH3ofB1fXBtg9ps6E7nZx
 0HmXjEuccJhM9kb4AsgSPwWoAgGoWCeLPO2TZxIB0X55/4vuVXi2LR6eM
 hOY3soP+lFDiSsHCSys/+cMp5Wgr4Md3Vk0x5qG6XCbKAojV6H/rILR3e w=;
X-IronPort-AV: E=Sophos;i="5.79,341,1602547200"; d="scan'208";a="77011827"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 12 Jan 2021 12:17:00 +0000
Received: from EX13D08EUB004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2965EA1DB6; Tue, 12 Jan 2021 12:16:57 +0000 (UTC)
Received: from uf6ed9c851f4556.ant.amazon.com (10.43.161.68) by
 EX13D08EUB004.ant.amazon.com (10.43.166.158) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 12 Jan 2021 12:16:43 +0000
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <linux-s390@vger.kernel.org>
Subject: [PATCH v4 2/2] drivers/virt: vmgenid: add vm generation id driver
Date: Tue, 12 Jan 2021 14:16:00 +0200
Message-ID: <1610453760-13812-3-git-send-email-acatan@amazon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610453760-13812-1-git-send-email-acatan@amazon.com>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.68]
X-ClientProxiedBy: EX13D50UWC001.ant.amazon.com (10.43.162.96) To
 EX13D08EUB004.ant.amazon.com (10.43.166.158)
Precedence: Bulk
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=639db6d60=acatan@amazon.com; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -120
X-Spam_score: -12.1
X-Spam_bar: ------------
X-Spam_report: (-12.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason@zx2c4.com, dgunigun@redhat.com, mst@redhat.com, ghammer@redhat.com,
 vijaysun@ca.ibm.com, 0x7f454c46@gmail.com, mhocko@kernel.org,
 oridgar@gmail.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 corbet@lwn.net, mpe@ellerman.id.au, rafael@kernel.org, ebiggers@kernel.org,
 borntraeger@de.ibm.com, sblbir@amazon.com, bonzini@gnu.org, arnd@arndb.de,
 jannh@google.com, raduweis@amazon.com, asmehra@redhat.com,
 Adrian Catangiu <acatan@amazon.com>, graf@amazon.com, rppt@kernel.org,
 luto@kernel.org, gil@azul.com, colmmacc@amazon.com, tytso@mit.edu,
 gregkh@linuxfoundation.org, areber@redhat.com, ebiederm@xmission.com,
 ovzxemul@gmail.com, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Adrian Catangiu <acatan@amazon.com>
From: Adrian Catangiu via <qemu-devel@nongnu.org>

- Background

The VM Generation ID is a feature defined by Microsoft (paper:
http://go.microsoft.com/fwlink/?LinkId=260709) and supported by
multiple hypervisor vendors.

The feature can be used to drive the `sysgenid` mechanism required in
virtualized environments by software that works with local copies and
caches of world-unique data such as random values, uuids, monotonically
increasing counters, etc.

- Solution

The VM Generation ID is a hypervisor/hardware provided 128-bit unique
ID that changes each time the VM is restored from a snapshot. It can be
used to differentiate between VMs or different generations of the same
VM.
This VM Generation ID is exposed through an ACPI device by multiple
hypervisor vendors.

The `vmgenid` driver uses ACPI events to be notified by hardware
changes to the 128-bit Vm Gen Id HW UUID. The UUID is not exposed to
userspace, it is added by the driver as device randomness to improve
kernel entropy following VM snapshot events.

This driver also acts as a backend for the `sysgenid` kernel module
(`drivers/misc/sysgenid.c`, `Documentation/misc-devices/sysgenid.rst`)
to drive changes to the "System Generation Id" which is further exposed
to userspace as a system-wide monotonically increasing counter.

This patch builds on top of Or Idgar <oridgar@gmail.com>'s proposal
https://lkml.org/lkml/2018/3/1/498

- Future improvements

Ideally we would want the driver to register itself based on devices'
_CID and not _HID, but unfortunately I couldn't find a way to do that.
The problem is that ACPI device matching is done by
'__acpi_match_device()' which exclusively looks at
'acpi_hardware_id *hwid'.

There is a path for platform devices to match on _CID when _HID is
'PRP0001' - but this is not the case for the Qemu vmgenid device.

Guidance and help here would be greatly appreciated.

Signed-off-by: Adrian Catangiu <acatan@amazon.com>
---
 Documentation/virt/vmgenid.rst |  34 +++++++++
 drivers/virt/Kconfig           |  14 ++++
 drivers/virt/Makefile          |   1 +
 drivers/virt/vmgenid.c         | 153 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 202 insertions(+)
 create mode 100644 Documentation/virt/vmgenid.rst
 create mode 100644 drivers/virt/vmgenid.c

diff --git a/Documentation/virt/vmgenid.rst b/Documentation/virt/vmgenid.rst
new file mode 100644
index 0000000..2106354
--- /dev/null
+++ b/Documentation/virt/vmgenid.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======
+VMGENID
+=======
+
+The VM Generation ID is a feature defined by Microsoft (paper:
+http://go.microsoft.com/fwlink/?LinkId=260709) and supported by
+multiple hypervisor vendors.
+
+The feature is required in virtualized environments by applications
+that work with local copies/caches of world-unique data such as random
+values, UUIDs, monotonically increasing counters, etc.
+Such applications can be negatively affected by VM snapshotting when
+the VM is either cloned or returned to an earlier point in time.
+
+The VM Generation ID is a simple concept meant to alleviate the issue
+by providing a unique ID that changes each time the VM is restored
+from a snapshot. The hardware provided UUID value can be used to
+differentiate between VMs or different generations of the same VM.
+
+The VM Generation ID is exposed through an ACPI device by multiple
+hypervisor vendors. The driver for it lives at
+``drivers/virt/vmgenid.c``
+
+The ``vmgenid`` driver uses ACPI events to be notified by hardware
+changes to the 128-bit Vm Gen Id UUID. This UUID is not exposed to
+userspace, it is added by the driver as device randomness to improve
+kernel entropy following VM snapshot events.
+
+This driver also acts as a backend for the ``sysgenid`` kernel module
+(``drivers/misc/sysgenid.c``, ``Documentation/misc-devices/sysgenid.rst``)
+to drive changes to the "System Generation Id" which is further exposed
+to userspace as a monotonically increasing counter.
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 80c5f9c1..4771633 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -13,6 +13,20 @@ menuconfig VIRT_DRIVERS
 
 if VIRT_DRIVERS
 
+config VMGENID
+	tristate "Virtual Machine Generation ID driver"
+	depends on ACPI && SYSGENID
+	default N
+	help
+	  The driver uses the hypervisor provided Virtual Machine Generation ID
+	  to drive the system generation counter mechanism exposed by sysgenid.
+	  The vmgenid changes on VM snapshots or VM cloning. The hypervisor
+	  provided 128-bit vmgenid is also used as device randomness to improve
+	  kernel entropy following VM snapshot events.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called vmgenid.
+
 config FSL_HV_MANAGER
 	tristate "Freescale hypervisor management driver"
 	depends on FSL_SOC
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index f28425c..889be01 100644
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
index 0000000..d9d089a
--- /dev/null
+++ b/drivers/virt/vmgenid.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Virtual Machine Generation ID driver
+ *
+ * Copyright (C) 2018 Red Hat Inc. All rights reserved.
+ *
+ * Copyright (C) 2020 Amazon. All rights reserved.
+ *
+ *	Authors:
+ *	  Adrian Catangiu <acatan@amazon.com>
+ *	  Or Idgar <oridgar@gmail.com>
+ *	  Gal Hammer <ghammer@redhat.com>
+ *
+ */
+#include <linux/acpi.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/random.h>
+#include <linux/uuid.h>
+#include <linux/sysgenid.h>
+
+#define DEV_NAME "vmgenid"
+ACPI_MODULE_NAME(DEV_NAME);
+
+struct vmgenid_data {
+	uuid_t uuid;
+	void *uuid_iomap;
+};
+static struct vmgenid_data vmgenid_data;
+
+static int vmgenid_acpi_map(struct vmgenid_data *priv, acpi_handle handle)
+{
+	int i;
+	phys_addr_t phys_addr;
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	union acpi_object *pss;
+	union acpi_object *element;
+
+	status = acpi_evaluate_object(handle, "ADDR", NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		ACPI_EXCEPTION((AE_INFO, status, "Evaluating ADDR"));
+		return -ENODEV;
+	}
+	pss = buffer.pointer;
+	if (!pss || pss->type != ACPI_TYPE_PACKAGE || pss->package.count != 2)
+		return -EINVAL;
+
+	phys_addr = 0;
+	for (i = 0; i < pss->package.count; i++) {
+		element = &(pss->package.elements[i]);
+		if (element->type != ACPI_TYPE_INTEGER)
+			return -EINVAL;
+		phys_addr |= element->integer.value << i * 32;
+	}
+
+	priv->uuid_iomap = acpi_os_map_memory(phys_addr, sizeof(uuid_t));
+	if (!priv->uuid_iomap) {
+		pr_err("Could not map memory at 0x%llx, size %u\n",
+			   phys_addr,
+			   (u32) sizeof(uuid_t));
+		return -ENOMEM;
+	}
+
+	memcpy_fromio(&priv->uuid, priv->uuid_iomap, sizeof(uuid_t));
+
+	return 0;
+}
+
+static int vmgenid_acpi_add(struct acpi_device *device)
+{
+	int ret;
+
+	if (!device)
+		return -EINVAL;
+	device->driver_data = &vmgenid_data;
+
+	ret = vmgenid_acpi_map(device->driver_data, device->handle);
+	if (ret < 0) {
+		pr_err("vmgenid: failed to map acpi device\n");
+		device->driver_data = NULL;
+	}
+
+	return ret;
+}
+
+static int vmgenid_acpi_remove(struct acpi_device *device)
+{
+	if (!device || acpi_driver_data(device) != &vmgenid_data)
+		return -EINVAL;
+	device->driver_data = NULL;
+
+	if (vmgenid_data.uuid_iomap)
+		acpi_os_unmap_memory(vmgenid_data.uuid_iomap, sizeof(uuid_t));
+	vmgenid_data.uuid_iomap = NULL;
+
+	return 0;
+}
+
+static void vmgenid_acpi_notify(struct acpi_device *device, u32 event)
+{
+	uuid_t old_uuid;
+
+	if (!device || acpi_driver_data(device) != &vmgenid_data) {
+		pr_err("VMGENID notify with unexpected driver private data\n");
+		return;
+	}
+
+	/* update VM Generation UUID */
+	old_uuid = vmgenid_data.uuid;
+	memcpy_fromio(&vmgenid_data.uuid, vmgenid_data.uuid_iomap, sizeof(uuid_t));
+
+	if (memcmp(&old_uuid, &vmgenid_data.uuid, sizeof(uuid_t))) {
+		/* HW uuid updated */
+		sysgenid_bump_generation();
+		add_device_randomness(&vmgenid_data.uuid, sizeof(uuid_t));
+	}
+}
+
+static const struct acpi_device_id vmgenid_ids[] = {
+	{"VMGENID", 0},
+	{"QEMUVGID", 0},
+	{"", 0},
+};
+
+static struct acpi_driver acpi_vmgenid_driver = {
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
+	return acpi_bus_register_driver(&acpi_vmgenid_driver);
+}
+
+static void __exit vmgenid_exit(void)
+{
+	acpi_bus_unregister_driver(&acpi_vmgenid_driver);
+}
+
+module_init(vmgenid_init);
+module_exit(vmgenid_exit);
+
+MODULE_AUTHOR("Adrian Catangiu");
+MODULE_DESCRIPTION("Virtual Machine Generation ID");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("0.1");
-- 
2.7.4




Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.


