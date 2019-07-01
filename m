Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844D314377
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 03:56:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNSrQ-00066L-PU
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 21:56:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yan.y.zhao@intel.com>) id 1hNSqO-0005j0-Ds
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yan.y.zhao@intel.com>) id 1hNSqM-0006lu-JX
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:55:04 -0400
Received: from mga02.intel.com ([134.134.136.20]:2406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
	id 1hNSqM-0006lW-AI
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:55:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2019 18:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,435,1549958400"; d="scan'208";a="141618245"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
	by orsmga006.jf.intel.com with ESMTP; 05 May 2019 18:54:55 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Date: Sun,  5 May 2019 21:49:04 -0400
Message-Id: <20190506014904.3621-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506014514.3555-1-yan.y.zhao@intel.com>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH v2 1/2] vfio/mdev: add version attribute for
 mdev device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
	Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
	qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
	yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
	mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
	arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
	kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
	dgilbert@redhat.com, zhenyuw@linux.intel.com,
	dinechin@redhat.com, alex.williamson@redhat.com,
	changpeng.liu@intel.com, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
	jonathan.davies@nutanix.com, shaopeng.he@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

version attribute is used to check two mdev devices' compatibility.

The key point of this version attribute is that it's rw.
User space has no need to understand internal of device version and no
need to compare versions by itself.
Compared to reading version strings from both two mdev devices being
checked, user space only reads from one mdev device's version attribute.
After getting its version string, user space writes this string into the
other mdev device's version attribute. Vendor driver of mdev device
whose version attribute being written will check device compatibility of
the two mdev devices for user space and return success for compatibility
or errno for incompatibility.
So two readings of version attributes + checking in user space are now
changed to one reading + one writing of version attributes + checking in
vendor driver.
Format and length of version strings are now private to vendor driver
who can define them freely.

             __ user space
              /\          \
             /             \write
            / read          \
     ______/__           ___\|/___
    | version |         | version |-->check compatibility
    -----------         -----------
    mdev device A       mdev device B

This version attribute is optional. If a mdev device does not provide
with a version attribute, this mdev device is incompatible to all other
mdev devices.

Live migration is able to take advantage of this version attribute.
Before user space actually starts live migration, it can first check
whether two mdev devices are compatible.

v2:
1. added detailed intent and usage
2. made definition of version string completely private to vendor driver
   (Alex Williamson)
3. abandoned changes to sample mdev drivers (Alex Williamson)
4. mandatory --> optional (Cornelia Huck)
5. added description for errno (Cornelia Huck)

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Erik Skultety <eskultet@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: "Wang, Zhi A" <zhi.a.wang@intel.com>
Cc: Neo Jia <cjia@nvidia.com>
Cc: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Christophe de Dinechin <dinechin@redhat.com>

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 Documentation/vfio-mediated-device.txt | 140 +++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/Documentation/vfio-mediated-device.txt b/Documentation/vfio-mediated-device.txt
index c3f69bcaf96e..013a764968eb 100644
--- a/Documentation/vfio-mediated-device.txt
+++ b/Documentation/vfio-mediated-device.txt
@@ -202,6 +202,7 @@ Directories and files under the sysfs for Each Physical Device
   |     |   |--- available_instances
   |     |   |--- device_api
   |     |   |--- description
+  |     |   |--- version
   |     |   |--- [devices]
   |     |--- [<type-id>]
   |     |   |--- create
@@ -209,6 +210,7 @@ Directories and files under the sysfs for Each Physical Device
   |     |   |--- available_instances
   |     |   |--- device_api
   |     |   |--- description
+  |     |   |--- version
   |     |   |--- [devices]
   |     |--- [<type-id>]
   |          |--- create
@@ -216,6 +218,7 @@ Directories and files under the sysfs for Each Physical Device
   |          |--- available_instances
   |          |--- device_api
   |          |--- description
+  |          |--- version
   |          |--- [devices]
 
 * [mdev_supported_types]
@@ -246,6 +249,143 @@ Directories and files under the sysfs for Each Physical Device
   This attribute should show the number of devices of type <type-id> that can be
   created.
 
+* version
+
+  This attribute is rw, and is optional.
+  It is used to check device compatibility between two mdev devices and is
+  accessed in pairs between the two mdev devices being checked.
+  The intent of this attribute is to make an mdev device's version opaque to
+  user space, so instead of reading two mdev devices' version strings and
+  comparing in userspace, user space should only read one mdev device's version
+  attribute, and writes this version string into the other mdev device's version
+  attribute. Then vendor driver of mdev device whose version attribute being
+  written would check the incoming version string and tell user space whether
+  the two mdev devices are compatible via return value. That's why this
+  attribute is writable.
+
+  when reading this attribute, it should show device version string of
+  the device of type <type-id>.
+
+  This string is private to vendor driver itself. Vendor driver is able to
+  freely define format and length of device version string.
+  e.g. It can use a combination of pciid of parent device + mdev type.
+
+  When writing a string to this attribute, vendor driver should analyze this
+  string and check whether the mdev device being identified by this string is
+  compatible with the mdev device for this attribute. vendor driver should then
+  return written string's length if it regards the two mdev devices are
+  compatible; vendor driver should return negative errno if it regards the two
+  mdev devices are not compatible.
+
+  User space should treat ANY of below conditions as two mdev devices not
+  compatible:
+  (1) any one of the two mdev devices does not have a version attribute
+  (2) error when read from one mdev device's version attribute
+  (3) error when write one mdev device's version string to the other mdev
+  device's version attribute
+
+  User space should regard two mdev devices compatible when ALL of below
+  conditions are met:
+  (1) success when read from one mdev device's version attribute.
+  (2) success when write one mdev device's version string to the other mdev
+  device's version attribute
+
+  Errno:
+  If vendor driver wants to claim a mdev device incompatible to all other mdev
+  devices, it should not register version attribute for this mdev device. But if
+  a vendor driver has already registered version attribute and it wants to claim
+  a mdev device incompatible to all other mdev devices, it needs to return
+  -ENODEV on access to this mdev device's version attribute.
+  If a mdev device is only incompatible to certain mdev devices, write of
+  incompatible mdev devices's version strings to its version attribute should
+  return -EINVAL;
+
+  This attribute can be taken advantage of by live migration.
+  If user space detects two mdev devices are compatible through version
+  attribute, it can start migration between the two mdev devices, otherwise it
+  should abort its migration attempts between the two mdev devices.
+
+  Example Usage:
+  case 1:
+  source side mdev device is of uuid 5ac1fb20-2bbf-4842-bb7e-36c58c3be9cd,
+  its mdev type is i915-GVTg_V5_4. pci id of parent device is 8086-193b.
+  target side mdev device is if of uuid 882cc4da-dede-11e7-9180-078a62063ab1,
+  its mdev type is i915-GVTg_V5_4. pci id of parent device is 8086-193b.
+
+  # readlink /sys/bus/pci/devices/0000\:00\:02.0/\
+  5ac1fb20-2bbf-4842-bb7e-36c58c3be9cd/mdev_type
+  ../mdev_supported_types/i915-GVTg_V5_4
+
+  # readlink /sys/bus/pci/devices/0000\:00\:02.0/\
+  882cc4da-dede-11e7-9180-078a62063ab1/mdev_type
+  ../mdev_supported_types/i915-GVTg_V5_4
+
+  (1) read source side mdev device's version.
+  #cat \
+    /sys/bus/pci/devices/0000\:00\:02.0/5ac1fb20-2bbf-4842-bb7e-36c58c3be9cd/\
+    mdev_type/version
+  8086-193b-i915-GVTg_V5_4
+
+  (2) write source side mdev device's version string into target side mdev
+  device's version attribute.
+  # echo 8086-193b-i915-GVTg_V5_4 >
+   /sys/bus/pci/devices/0000\:00\:02.0/882cc4da-dede-11e7-9180-078a62063ab1/\
+  mdev_type/version
+  # echo $?
+  0
+
+  in this case, user space's write to target side mdev device's version
+  attribute returns success to indicate the two mdev devices are compatible.
+
+  case 2:
+  source side mdev device is of uuid 5ac1fb20-2bbf-4842-bb7e-36c58c3be9cd,
+  its mdev type is i915-GVTg_V5_4. pci id of parent device is 8086-193b.
+  target side mdev device is if of uuid 882cc4da-dede-11e7-9180-078a62063ab1,
+  its mdev type is i915-GVTg_V5_4. pci id of parent device is 8086-191b.
+
+  # readlink /sys/bus/pci/devices/0000\:00\:02.0/\
+  5ac1fb20-2bbf-4842-bb7e-36c58c3be9cd/mdev_type
+  ../mdev_supported_types/i915-GVTg_V5_4
+
+  # readlink /sys/bus/pci/devices/0000\:00\:02.0/\
+  882cc4da-dede-11e7-9180-078a62063ab1/mdev_type
+  ../mdev_supported_types/i915-GVTg_V5_4
+
+  (1) read source side mdev device's version.
+  #cat \
+    /sys/bus/pci/devices/0000\:00\:02.0/5ac1fb20-2bbf-4842-bb7e-36c58c3be9cd/\
+    mdev_type/version
+  8086-193b-i915-GVTg_V5_4
+
+  (2) write source side mdev device's version string into target side mdev
+  device's version attribute.
+  # echo 8086-193b-i915-GVTg_V5_4 >
+   /sys/bus/pci/devices/0000\:00\:02.0/882cc4da-dede-11e7-9180-078a62063ab1/\
+  mdev_type/version
+  -bash: echo: write error: Invalid argument
+
+  in this case, user space's write to target side mdev device's version
+  attribute returns error to indicate the two mdev devices are incompatible.
+  (incompatible because pci ids of the two mdev devices' parent devices are
+  different).
+
+  case 3:
+  source side mdev device is of uuid 5ac1fb20-2bbf-4842-bb7e-36c58c3be9cd,
+  its mdev type is i915-GVTg_V5_4. pci id of parent device is 8086-193b.
+  But vendor driver does not provide version attribute for this device.
+
+  (1) read source side mdev device's version.
+  #cat \
+    /sys/bus/pci/devices/0000\:00\:02.0/5ac1fb20-2bbf-4842-bb7e-36c58c3be9cd/\
+    mdev_type/version
+  cat: '/sys/bus/pci/devices/0000:00:02.0/5ac1fb20-2bbf-4842-bb7e-36c58c3be9cd/\
+  mdev_type/version': No such file or directory
+
+  in this case, user space reads source side mdev device's version attribute
+  which does not exist however. user space regards the two mdev devices as not
+  compatible and will not start migration between the two mdev devices.
+
+
 * [device]
 
   This directory contains links to the devices of type <type-id> that have been
-- 
2.17.1


