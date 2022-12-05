Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020B64250B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 09:52:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p27CA-0005lY-FK; Mon, 05 Dec 2022 03:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p27Az-0005k1-B9
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:50:20 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p27Av-00087n-EE
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:50:13 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NQcfS5T9dzRpkb;
 Mon,  5 Dec 2022 16:49:04 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Dec 2022 16:49:51 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [PATCH v10 0/5] add generic vDPA device support
Date: Mon, 5 Dec 2022 16:49:38 +0800
Message-ID: <20221205084943.2259-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

Hi guys,

With the generic vDPA device, QEMU won't need to touch the device
types any more, such like vfio.

We can use the generic vDPA device as follow:
  -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X
  Or
  -M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
  vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x

Changes v10 -> v9:
    - optimize the doc [Jason]

Changes v9 -> v8:
    - rename vhost-vdpa-device.rst to vhost-vdpa-generic-device.rst [Jason, Stefano]
    - emphasize the vhost-vDPA generic device in doc [Jason]

Changes v8 -> v7:
    - add migration blocker. [Michael]

Changes v6 -> v7:
    (v6: https://mail.gnu.org/archive/html/qemu-devel/2022-05/msg02821.html)
    - rebase. [Jason]
    - add documentation . [Stefan]

Changes v5 -> v6:
  Patch 2:
    - Turn to the original approach in the RFC to initialize the
      virtio_pci_id_info array. [Michael]
	  https://lore.kernel.org/all/20220105005900.860-2-longpeng2@huawei.com/
  Patch 3:
    - Fix logical error of exception handler around the post_init.
      [Stefano]
    - Fix some coding style warnings. [Stefano]
  Patch 4:
    - Fix some coding style warnings. [Stefano]

Changes v4 -> v5:
  Patch 3:
    - remove vhostfd [Jason]
    - support virtio-mmio [Jason]

Changes v3 -> v4:
  v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg877015.html
  - reorganize the series [Stefano]
  - fix some typos [Stefano]
  - fix logical error in vhost_vdpa_device_realize [Stefano]

Changes v2 -> v3
  Patch 4 & 5:
    - only call vdpa ioctls in vdpa-dev.c [Stefano, Longpeng]
    - s/VQS_NUM/VQS_COUNT  [Stefano]
    - check both vdpa_dev_fd and vdpa_dev [Stefano]
  Patch 6:
    - move all steps into vhost_vdpa_device_unrealize. [Stefano]

Changes RFC -> v2
  Patch 1:
    - rename 'pdev_id' to 'trans_devid'  [Michael]
    - only use transitional device id for the devices
      listed in the spec  [Michael]
    - use macros to make the id_info table clearer  [Longpeng]
    - add some modern devices in the id_info table  [Longpeng]
  Patch 2:
    - remove the GET_VECTORS_NUM command  [Jason]
  Patch 4:
    - expose vdpa_dev_fd as a QOM preperty  [Stefan]
    - introduce vhost_vdpa_device_get_u32 as a common
      function to make the code clearer  [Stefan]
    - fix the misleading description of 'dc->desc'  [Stefano]
  Patch 5:
    - check returned number of virtqueues  [Stefan]
  Patch 6:
    - init s->num_queues  [Stefano]
    - free s->dev.vqs  [Stefano]

Longpeng (Mike) (5):
  virtio: get class_id and pci device id by the virtio id
  vdpa: add vdpa-dev support
  vdpa: add vdpa-dev-pci support
  vdpa-dev: mark the device as unmigratable
  docs: Add generic vhost-vdpa device documentation

 .../devices/vhost-vdpa-generic-device.rst     |  66 +++
 hw/virtio/Kconfig                             |   5 +
 hw/virtio/meson.build                         |   2 +
 hw/virtio/vdpa-dev-pci.c                      | 102 +++++
 hw/virtio/vdpa-dev.c                          | 377 ++++++++++++++++++
 hw/virtio/virtio-pci.c                        |  88 ++++
 include/hw/virtio/vdpa-dev.h                  |  43 ++
 include/hw/virtio/virtio-pci.h                |   5 +
 8 files changed, 688 insertions(+)
 create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
 create mode 100644 hw/virtio/vdpa-dev-pci.c
 create mode 100644 hw/virtio/vdpa-dev.c
 create mode 100644 include/hw/virtio/vdpa-dev.h

-- 
2.23.0


