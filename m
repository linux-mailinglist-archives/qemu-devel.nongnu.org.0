Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E714375
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 03:53:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNSpC-00050W-Jh
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 21:53:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yan.y.zhao@intel.com>) id 1hNSoE-0004hd-9a
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yan.y.zhao@intel.com>) id 1hNSoD-0005ms-Ct
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:52:50 -0400
Received: from mga01.intel.com ([192.55.52.88]:63085)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
	id 1hNSoD-0005kK-3D
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:52:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2019 18:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,435,1549958400"; d="scan'208";a="140310192"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
	by orsmga008.jf.intel.com with ESMTP; 05 May 2019 18:52:35 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Date: Sun,  5 May 2019 21:45:14 -0400
Message-Id: <20190506014514.3555-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-devel] [PATCH v2 0/2] introduction of version attribute for
 VFIO live migration
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

This patchset introduces a version attribute under sysfs of VFIO Mediated
devices.

This version attribute is used to check whether two mdev devices are
compatible.
user space software can take advantage of this version attribute to
determine whether to launch live migration between two mdev devices.

Patch 1 defines version attribute in Documentation/vfio-mediated-device.txt

Patch 2 uses GVT as an example to show how to expose version attribute and
check device compatibility in vendor driver.


v2:
1. renamed patched 1
2. made definition of device version string completely private to vendor
   driver
3. abandoned changes to sample mdev drivers
4. described intent and usage of version attribute more clearly.

Yan Zhao (2):
  vfio/mdev: add version attribute for mdev device
  drm/i915/gvt: export mdev device version to sysfs for Intel vGPU

 Documentation/vfio-mediated-device.txt    | 135 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/Makefile         |   2 +-
 drivers/gpu/drm/i915/gvt/device_version.c |  84 ++++++++++++++
 drivers/gpu/drm/i915/gvt/gvt.c            |  51 ++++++++
 drivers/gpu/drm/i915/gvt/gvt.h            |   6 +
 5 files changed, 277 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/gvt/device_version.c

-- 
2.17.1


