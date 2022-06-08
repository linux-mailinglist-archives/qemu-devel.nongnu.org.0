Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B447754309B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 14:40:49 +0200 (CEST)
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyuzP-0007u2-Jt
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 08:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nyuqh-00008Q-Lk
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:31:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:56947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nyuqe-0005ka-2K
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654691504; x=1686227504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eHS+JL4cj7/6WeX/rU+t1brg6yvWYoTBHmJixIizj3g=;
 b=PH4rLvPbhQylMKSUmSxIqCq1KCWNsUBP/nxGPVaU/9FkZAeggSbYDppu
 JJfSgvEXJow0oUyj4Yeom/gISwyVZbVjTnwM+tchJ/dhAeAx9dMwPh3Zn
 HAG+UiGZXi5PYYPcZG6cPBEpASp+SQVWFoOUK8f3kFemaLjX+Oaq49TaN
 V3sr0OdgHc/JOCitAR6kpRT4PNn1jcUIyo5NgM7MF8mkW+/81zrkK/3fq
 4vHTL/Fsx3L+YTTBeFfpBD9vt3ZKIHF1WwXeXe0XPAlgYopnz0qc5M5vk
 +pqk+qGYNBTFYrguwe+lQYmJTVd0WX5oaSmginYHFfqSgKVPEKZM6LM+6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="363210069"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="363210069"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 05:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="670529676"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2022 05:31:39 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au, thuth@redhat.com, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, akrowiak@linux.ibm.com, pasic@linux.ibm.com,
 jjherne@linux.ibm.com, jasowang@redhat.com, kvm@vger.kernel.org,
 jgg@nvidia.com, nicolinc@nvidia.com, eric.auger@redhat.com,
 eric.auger.pro@gmail.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com, yi.y.sun@intel.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 berrange@redhat.com
Subject: [RFC v2 00/15] vfio: Adopt iommufd
Date: Wed,  8 Jun 2022 05:31:24 -0700
Message-Id: <20220608123139.19356-1-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the introduction of iommufd[1], the Linux kernel provides a generic
interface for userspace drivers to propagate their DMA mappings to kernel
for assigned devices. This series does the porting of the VFIO devices
onto the /dev/iommu uapi and let it coexist with the legacy implementation.
Other devices like vpda, vfio mdev and etc. are not considered yet.

At QEMU level, interactions with the /dev/iommu are abstracted by a new
iommufd object (compiled in with the CONFIG_IOMMUFD option).

Any QEMU device (e.g. vfio device) wishing to use /dev/iommu must be
linked with an iommufd object. In this series, the vfio-pci device is
granted with such capability:

It gets a new optional parameter named iommufd which allows to pass
an iommufd object:

    -object iommufd,id=iommufd0
    -device vfio-pci,host=0000:02:00.0,iommufd=iommufd0

Note the /dev/iommu can be externally opened by a management layer.
In such a case the fd is passed along with the iommufd object:

    -object iommufd,id=iommufd0,fd=22
    -device vfio-pci,host=0000:02:00.0,iommufd=iommufd0

If the fd parameter is not passed, the fd (/dev/iommu) is opened by QEMU.

If no iommufd option is passed to the vfio-pci device, iommufd is not
used and the end-user gets the behavior based on the legacy vfio iommu
interfaces:

    -device vfio-pci,host=0000:02:00.0

While the legacy kernel interface is group-centric, the new iommufd
interface is device-centric, relying on device fd and iommufd.

To support both interfaces in the QEMU VFIO device we reworked the vfio
container abstraction so that the generic VFIO code can use either
backend.

The VFIOContainer object becomes a base object derived into
a) the legacy VFIO container and
b) the new iommufd based container.

The base object implements generic code such as code related to
memory_listener and address space management whereas the derived
objects implement callbacks specific to either BE, legacy and
iommufd. Indeed each backend has its own way to setup secure context
and dma management interface. The below diagram shows how it looks
like with both BEs.

                    VFIO                           AddressSpace/Memory
    +-------+  +----------+  +-----+  +-----+
    |  pci  |  | platform |  |  ap |  | ccw |
    +---+---+  +----+-----+  +--+--+  +--+--+     +----------------------+
        |           |           |        |        |   AddressSpace       |
        |           |           |        |        +------------+---------+
    +---V-----------V-----------V--------V----+               /
    |           VFIOAddressSpace              | <------------+
    |                  |                      |  MemoryListener
    |          VFIOContainer list             |
    +-------+----------------------------+----+
            |                            |
            |                            |
    +-------V------+            +--------V----------+
    |   iommufd    |            |    vfio legacy    |
    |  container   |            |     container     |
    +-------+------+            +--------+----------+
            |                            |
            | /dev/iommu                 | /dev/vfio/vfio
            | /dev/vfio/devices/vfioX    | /dev/vfio/$group_id
Userspace  |                            |
===========+============================+================================
Kernel     |  device fd                 |
            +---------------+            | group/container fd
            | (BIND_IOMMUFD |            | (SET_CONTAINER/SET_IOMMU)
            |  ATTACH_IOAS) |            | device fd
            |               |            |
            |       +-------V------------V-----------------+
    iommufd |       |                vfio                  |
(map/unmap  |       +---------+--------------------+-------+
ioas_copy) |                 |                    | map/unmap
            |                 |                    |
     +------V------+    +-----V------+      +------V--------+
     | iommfd core |    |  device    |      |  vfio iommu   |
     +-------------+    +------------+      +---------------+

[Secure Context setup]
- iommufd BE: uses device fd and iommufd to setup secure context
              (bind_iommufd, attach_ioas)
- vfio legacy BE: uses group fd and container fd to setup secure context
                  (set_container, set_iommu)
[Device access]
- iommufd BE: device fd is opened through /dev/vfio/devices/vfioX
- vfio legacy BE: device fd is retrieved from group fd ioctl
[DMA Mapping flow]
- VFIOAddressSpace receives MemoryRegion add/del via MemoryListener
- VFIO populates DMA map/unmap via the container BEs
  *) iommufd BE: uses iommufd
  *) vfio legacy BE: uses container fd

Test done:
- PCI and Platform device were tested
- ccw and ap were only compile-tested
- limited device hotplug test
- vIOMMU test run for both legacy and iommufd backends (limited tests)

This series was co-developed by Eric Auger and me based on the iommufd exploration
kernel (https://github.com/luxis1999/iommufd/tree/iommufd-v5.17-rc6) which encompasses:
- Jason’s IOMMUFD Generic interface series
  <https://lore.kernel.org/kvm/0-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com/>
- Jason's vfio ccw life circle cleanup (Eric Farman has renewed it recently)
  <https://lore.kernel.org/all/0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com/
   https://lore.kernel.org/kvm/20220602171948.2790690-1-farman@linux.ibm.com/>
- Yi's move vfio_device allo/free into vfio core (not pushed to upstream yet)
- Yi's vfio device cdev (introduces device-centric interface, not pushed to upstream yet)
- Nicolin's vfio iommufd compat code (not pushed to upstream yet)

This QEMU series can be fount at https://github.com/luxis1999/qemu/tree/qemu-for-5.17-rc6-vm-rfcv2.

As iommufd kernel is in the early step (only iommufd generic interface is
in mailing list), so this series hasn't made the iommufd backend fully on
par with legacy backend w.r.t. features like:
- p2p mappings
- coherency tracking
- live migration
- vfio pci device hot reset
- and etc.

Only vfio-pci device supports iommufd BE, other types of devices still uses legacy BE.

TODOs:
- Add DMA alias check for iommufd BE (group level)
- Make pci.c to be BE agnostic. Needs kernel change as well to fix the
  VFIO_DEVICE_PCI_HOT_RESET gap
- Cleanup the VFIODevice fields as it's used in both backends
- Add device fd parameter to vfio-device in case the iommufd option is used
- Add locks
- Replace list with g_tree
- More tests

Change log:
v2:
- remove the first three patches of rfcv1
- add open cdev helper suggested by Jason
- remove the QOMification of the VFIOContainer and simply use standard ops (David)
- add "-object iommufd" suggested by Alex

v1: https://lore.kernel.org/qemu-devel/20220414104710.28534-1-yi.l.liu@intel.com/

Thanks,
Yi & Eric

Eric Auger (10):
  scripts/update-linux-headers: Add iommufd.h
  linux-headers: Import latest vfio.h and iommufd.h
  vfio/container: Introduce vfio_[attach/detach]_device
  vfio/platform: Use vfio_[attach/detach]_device
  vfio/ap: Use vfio_[attach/detach]_device
  vfio/ccw: Use vfio_[attach/detach]_device
  vfio/container-base: Introduce [attach/detach]_device container
    callbacks
  vfio/container-base: Introduce VFIOContainer reset callback
  backends/iommufd: Introduce the iommufd object
  vfio/as: Allow the selection of a given iommu backend

Yi Liu (5):
  vfio/common: Split common.c into common.c, container.c and as.c
  vfio: Add base container
  util/char_dev: Add open_cdev()
  vfio/iommufd: Implement the iommufd backend
  vfio/iommufd: Add IOAS_COPY_DMA support

 MAINTAINERS                           |   13 +
 backends/Kconfig                      |    5 +
 backends/iommufd.c                    |  265 +++
 backends/meson.build                  |    1 +
 backends/trace-events                 |   12 +
 hw/vfio/ap.c                          |   62 +-
 hw/vfio/as.c                          | 1035 +++++++++++
 hw/vfio/ccw.c                         |  118 +-
 hw/vfio/common.c                      | 2365 ++-----------------------
 hw/vfio/container-base.c              |  172 ++
 hw/vfio/container.c                   | 1298 ++++++++++++++
 hw/vfio/iommufd.c                     |  546 ++++++
 hw/vfio/meson.build                   |    6 +
 hw/vfio/migration.c                   |    5 +-
 hw/vfio/pci.c                         |   83 +-
 hw/vfio/platform.c                    |   42 +-
 hw/vfio/spapr.c                       |   22 +-
 hw/vfio/trace-events                  |   11 +
 include/hw/vfio/vfio-common.h         |  101 +-
 include/hw/vfio/vfio-container-base.h |  148 ++
 include/qemu/char_dev.h               |   16 +
 include/sysemu/iommufd.h              |   47 +
 linux-headers/linux/iommufd.h         |  223 +++
 linux-headers/linux/vfio.h            |   84 +
 qapi/qom.json                         |   16 +-
 qemu-options.hx                       |   12 +
 scripts/update-linux-headers.sh       |    2 +-
 util/chardev_open.c                   |   58 +
 util/meson.build                      |    1 +
 29 files changed, 4291 insertions(+), 2478 deletions(-)
 create mode 100644 backends/iommufd.c
 create mode 100644 hw/vfio/as.c
 create mode 100644 hw/vfio/container-base.c
 create mode 100644 hw/vfio/container.c
 create mode 100644 hw/vfio/iommufd.c
 create mode 100644 include/hw/vfio/vfio-container-base.h
 create mode 100644 include/qemu/char_dev.h
 create mode 100644 include/sysemu/iommufd.h
 create mode 100644 linux-headers/linux/iommufd.h
 create mode 100644 util/chardev_open.c

Base commit: 9b1f58854959c5a9bdb347e3e04c252ab7fc9ef5

-- 
2.27.0


