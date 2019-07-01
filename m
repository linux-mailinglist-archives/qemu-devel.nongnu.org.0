Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8591305F3
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 02:52:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWVmA-0008U8-Bx
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 20:52:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yan.y.zhao@intel.com>) id 1hWVl2-0007uV-F9
	for qemu-devel@nongnu.org; Thu, 30 May 2019 20:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yan.y.zhao@intel.com>) id 1hWVl1-0004r7-J1
	for qemu-devel@nongnu.org; Thu, 30 May 2019 20:50:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:30285)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
	id 1hWVl1-0004SN-BF
	for qemu-devel@nongnu.org; Thu, 30 May 2019 20:50:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 May 2019 17:50:46 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
	by orsmga001.jf.intel.com with ESMTP; 30 May 2019 17:50:40 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Date: Thu, 30 May 2019 20:44:38 -0400
Message-Id: <20190531004438.24528-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [PATCH v4 0/2] introduction of migration_version
 attribute for VFIO live migration
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
	felipe@nutanix.com, Ken.Xue@amd.com, kevin.tian@intel.com,
	Yan Zhao <yan.y.zhao@intel.com>, dgilbert@redhat.com,
	zhenyuw@linux.intel.com, dinechin@redhat.com,
	alex.williamson@redhat.com, changpeng.liu@intel.com,
	berrange@redhat.com, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
	jonathan.davies@nutanix.com, shaopeng.he@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset introduces a migration_version attribute under sysfs of VFIO
Mediated devices.

This migration_version attribute is used to check migration compatibility
between two mdev devices of the same mdev type.

Patch 1 defines migration_version attribute in
Documentation/vfio-mediated-device.txt

Patch 2 uses GVT as an example to show how to expose migration_version
attribute and check migration compatibility in vendor driver.

v4:
1. fixed indentation/spell errors, reworded several error messages
2. added a missing memory free for error handling in patch 2

v3:
1. renamed version to migration_version
2. let errno to be freely defined by vendor driver
3. let checking mdev_type be prerequisite of migration compatibility check
4. reworded most part of patch 1
5. print detailed error log in patch 2 and generate migration_version
string at init time

v2:
1. renamed patched 1
2. made definition of device version string completely private to vendor
driver
3. reverted changes to sample mdev drivers
4. described intent and usage of version attribute more clearly.


Yan Zhao (2):
  vfio/mdev: add migration_version attribute for mdev device
  drm/i915/gvt: export migration_version to mdev sysfs for Intel vGPU

 Documentation/vfio-mediated-device.txt       | 113 +++++++++++++
 drivers/gpu/drm/i915/gvt/Makefile            |   2 +-
 drivers/gpu/drm/i915/gvt/gvt.c               |  39 +++++
 drivers/gpu/drm/i915/gvt/gvt.h               |   5 +
 drivers/gpu/drm/i915/gvt/migration_version.c | 168 +++++++++++++++++++
 drivers/gpu/drm/i915/gvt/vgpu.c              |  13 +-
 6 files changed, 337 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gvt/migration_version.c

-- 
2.17.1


