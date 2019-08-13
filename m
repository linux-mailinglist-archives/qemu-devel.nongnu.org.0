Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21F8C35A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 23:12:35 +0200 (CEST)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxe5r-00031Q-26
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 17:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41903)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1J-00053t-Rq
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 17:07:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1I-0001Yc-Ht
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 17:07:53 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33900 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1E-0001RA-Tp; Tue, 13 Aug 2019 17:07:49 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E23D4E12C927C458684F;
 Wed, 14 Aug 2019 05:07:46 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.94.0) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 05:07:40 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 13 Aug 2019 22:05:37 +0100
Message-ID: <20190813210539.31164-11-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.94.0]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-devel] [PATCH-for-4.2 v9 10/12] docs/specs: Add ACPI GED
 documentation
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Documents basic concepts of ACPI Generic Event device(GED)
and interface between QEMU and the ACPI BIOS.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 docs/specs/acpi_hw_reduced_hotplug.txt | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 docs/specs/acpi_hw_reduced_hotplug.txt

diff --git a/docs/specs/acpi_hw_reduced_hotplug.txt b/docs/specs/acpi_hw_reduced_hotplug.txt
new file mode 100644
index 0000000000..46839be5ff
--- /dev/null
+++ b/docs/specs/acpi_hw_reduced_hotplug.txt
@@ -0,0 +1,60 @@
+QEMU<->ACPI BIOS Generic Event Device interface
+
+The ACPI Generic Event Device (GED) is a HW reduced platform
+specific device introduced in ACPI v6.1 that handles all platform
+events, including the hotplug ones. GED is modelled as a device
+in the namespace with a _HID defined to be ACPI0013. This document
+describes the interface between QEMU and the ACPI BIOS.
+
+GED allows HW reduced platforms to handle interrupts in ACPI ASL
+statements. It follows a very similar approach like the _EVT method
+from GPIO events. All interrupts are listed in  _CRS and the handler
+is written in _EVT method. However, Qemu implementation uses a single
+interrupt for the GED device, relying on IO memory region to communicate
+the type of device affected by the interrupt. This way, we can support
+up to 32 events with a unique interrupt.
+
+Here is an example.
+
+Device (\_SB.GED)
+{
+    Name (_HID, "ACPI0013")
+    Name (_UID, Zero)
+    Name (_CRS, ResourceTemplate ()
+    {
+        Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
+        {
+            0x00000029,
+        }
+    })
+    OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)
+    Field (EREG, DWordAcc, NoLock, WriteAsZeros)
+    {
+        ESEL,   32
+    }
+    Method (_EVT, 1, Serialized)
+    {
+        Local0 = ESEL // ESEL = IO memory region which specifies the
+                      // device type.
+        If (((Local0 & One) == One))
+        {
+            MethodEvent1()
+        }
+        If ((Local0 & 0x2) == 0x2)
+        {
+            MethodEvent2()
+        }
+        ...
+    }
+}
+
+GED IO interface (4 byte access):
+read access:
+    [0x0-0x3] Event selector bit field(32 bit) set by Qemu.
+    bits:
+        1:  Memory hotplug event
+        2:  System power down event
+     3-31:  Reserved
+
+write_access:
+    Nothing is expected to be written into GED IO memory
-- 
2.17.1



