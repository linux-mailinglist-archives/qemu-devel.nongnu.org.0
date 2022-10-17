Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A30600D7F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:14:33 +0200 (CEST)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okO4m-0005Ox-7F
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvy-0001S0-TY
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:27 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:54278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvq-0001IH-G2
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:24 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 785FE60E7D;
 Mon, 17 Oct 2022 13:54:30 +0300 (MSK)
Received: from dellarbn.yandex.net (unknown
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 PrI3KDUSQF-sS7Kd5R0; Mon, 17 Oct 2022 13:54:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1666004069; bh=43QDqg/hxytt/fGiR7Qd1qh7ZB1ECiEMYfrGwAdxma4=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=tY2RPaCzypziMhqW5U2ov/+u4r2r6x7E14xvhmp//DWc3nfcoPREAlNPHTVVx+x0+
 aRWUYdn/gwoX4E2QpROE0t9XXLurBAyY2pwKKA3diNL7umIUenyDgwtlubzfY2+ABy
 aR2S8SwCMVekaobHt1vMcQKkjLaicwvDWugvWcQQ=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
From: Andrey Ryabinin <arbn@yandex-team.com>
To: qemu-devel@nongnu.org
Cc: Steve Sistare <steven.sistare@oracle.com>, yc-core@yandex-team.ru,
 Andrey Ryabinin <arbn@yandex-team.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 4/4] tests/avocado/vfio: add test for vfio devices
Date: Mon, 17 Oct 2022 13:54:07 +0300
Message-Id: <20221017105407.3858-5-arbn@yandex-team.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017105407.3858-1-arbn@yandex-team.com>
References: <20221017105407.3858-1-arbn@yandex-team.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add avocado test for vfio subsystem. The test uses pci-tesdev as a source
PCI device for vfio. So the test supposed to be launched inside QEMU
guest launched with '-device pci-testdev' devices.

The test creates VFIO container&group, launches QEMU and passes
container/group/device to it.

Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
---
 tests/avocado/vfio.py | 156 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 tests/avocado/vfio.py

diff --git a/tests/avocado/vfio.py b/tests/avocado/vfio.py
new file mode 100644
index 00000000000..fa0d2b65dc7
--- /dev/null
+++ b/tests/avocado/vfio.py
@@ -0,0 +1,156 @@
+# tests for QEMU's vfio subsystem
+#
+# Copyright (c) 2022 Yandex N.V.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+
+from avocado.utils import wait
+from avocado import skipUnless
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import run_cmd
+import os
+import sys
+import subprocess
+from fcntl import ioctl
+from ctypes import *
+import struct
+
+
+VFIO_CMD_PREFIX = ord(';') << (4*2)
+VFIO_GET_API_VERSION = VFIO_CMD_PREFIX | 100
+VFIO_CHECK_EXTENSION = VFIO_CMD_PREFIX | 101
+VFIO_SET_IOMMU = VFIO_CMD_PREFIX | 102
+VFIO_GROUP_GET_STATUS = VFIO_CMD_PREFIX | 103
+VFIO_GROUP_SET_CONTAINER = VFIO_CMD_PREFIX | 104
+VFIO_GROUP_GET_DEVICE_FD = VFIO_CMD_PREFIX | 106
+
+VFIO_TYPE1_IOMMU = 1
+VFIO_SPAPR_TCE_IOMMU = 2
+VFIO_TYPE1v2_IOMMU = 3
+VFIO_SPAPR_TCE_v2_IOMMU = 7
+
+VFIO_API_VERSION = 0
+VFIO_TYPE1_IOMMU = 1
+PCI_VENDOR_ID=0x1b36
+PCI_DEV_ID=0x0005
+
+class vfio_group_status(Structure):
+    _fields_ = [("argsz", c_uint32),
+                ("flags", c_uint32)]
+
+class vfio_container(object):
+    def open(self):
+        self.container_fd = os.open("/dev/vfio/vfio", os.O_RDWR)
+        if ioctl(self.container_fd, VFIO_GET_API_VERSION) != VFIO_API_VERSION:
+            raise Exception("VFIO_GET_API_VERSION: unexpected vfio api version")
+        iommu_types = [ VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
+                          VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU ];
+        for iommu_type in iommu_types:
+            if ioctl(self.container_fd, VFIO_CHECK_EXTENSION, iommu_type):
+                self.iommu_type = iommu_type
+        if not self.iommu_type:
+            raise Exception("No available IOMMU models");
+
+    def set_iommu(self):
+            ioctl(self.container_fd, VFIO_SET_IOMMU, self.iommu_type);
+
+class vfio_group(object):
+    def __init__(self, container, group_num):
+        self.ct = container
+        self.group_num = group_num
+    def open(self):
+        self.group_fd = os.open("/dev/vfio/%d" % self.group_num, os.O_RDWR)
+        status = vfio_group_status(0, 0)
+        ioctl(self.group_fd, VFIO_GROUP_GET_STATUS, pointer(status))
+        ioctl(self.group_fd, VFIO_GROUP_SET_CONTAINER,
+              c_int(self.ct.container_fd));
+
+class vfio_device(object):
+    def __init__(self, dev, group):
+        self.dev = dev
+        self.group = group
+
+def pci_testdev_exists():
+    for dev in next(os.walk('/sys/bus/pci/devices'))[1]:
+        with open("/sys/bus/pci/devices/%s/vendor" % dev) as f:
+            if f.read() != '0x%x\n' % PCI_VENDOR_ID:
+                continue
+        with open("/sys/bus/pci/devices/%s/device" % dev) as f:
+            if f.read() != '0x%.4x\n' % PCI_DEV_ID:
+                continue
+        return True
+    return False
+
+class VFIOIOMMUTest(QemuSystemTest):
+    devices = []
+    groups = []
+    timeout = 900
+    ct = vfio_container()
+
+    def add_group(self, dev):
+        tmp = os.readlink("/sys/bus/pci/devices/%s/iommu_group" % dev)
+        group_num = int(tmp.split('/')[-1])
+
+        for g in self.groups:
+            if g.group_num == group_num:
+                return g
+        group = vfio_group(self.ct, group_num)
+        self.groups.append(group)
+        return group
+
+    def setUp(self):
+        super().setUp()
+        run_cmd(('modprobe', 'vfio-pci'))
+        try:
+            f = open("/sys/bus/pci/drivers/vfio-pci/new_id", "a")
+            f.write("%x %x" % (PCI_VENDOR_ID, PCI_DEV_ID))
+        except PermissionError:
+            pass
+        except FileExistsError:
+            pass
+        for dev in next(os.walk('/sys/bus/pci/devices'))[1]:
+            with open("/sys/bus/pci/devices/%s/vendor" % dev) as f:
+                if f.read() != '0x%x\n' % PCI_VENDOR_ID:
+                    continue
+            with open("/sys/bus/pci/devices/%s/device" % dev) as f:
+                if f.read() != '0x%.4x\n' % PCI_DEV_ID:
+                    continue
+
+            self.devices.append(vfio_device(dev, self.add_group(dev)))
+
+    def open_dev_fds(self):
+        self.ct.open()
+        for group in self.groups:
+            group.open()
+        self.ct.set_iommu()
+
+    def close_fds(self):
+        for group in self.groups:
+            os.close(group.group_fd)
+        os.close(self.ct.container_fd)
+
+    def hotplug_devices(self, vm):
+        vm._qmp.send_fd_scm(self.devices[0].group.ct.container_fd)
+        vm.command("getfd", fdname="ct")
+        vm.command("object-add", qom_type="vfio-container", id="ct", fd="ct")
+
+        for group in self.groups:
+            vm._qmp.send_fd_scm(group.group_fd)
+            vm.command("getfd", fdname="group_fd")
+            vm.command("object-add", qom_type="vfio-group",
+                       id="group%d" % group.group_num,
+                       fd="group_fd", container="ct")
+
+        for i in range(len(self.devices)):
+            vm.command("device_add", driver="vfio-pci",
+                       host=self.devices[i].dev, id="dev%d" % i,
+                       group="group%d" % self.devices[i].group.group_num)
+
+    @skipUnless(pci_testdev_exists(), "no pci-testdev found")
+    def test_vfio(self):
+        self.open_dev_fds()
+        self.vm.add_args('-nodefaults')
+        self.vm.launch()
+        self.hotplug_devices(self.vm)
+        self.close_fds()
-- 
2.37.3


