Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ACA490926
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:07:08 +0100 (CET)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Rj0-0004hm-19
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:07:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n9RMM-0005v4-Kc
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:43:44 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n9RMK-00022y-9X
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:43:42 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Jcs4H1zWGz9sGL;
 Mon, 17 Jan 2022 20:42:23 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 20:43:35 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 20:43:35 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <pbonzini@redhat.com>, <arei.gonglei@huawei.com>, <yechuan@huawei.com>,
 <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>, Longpeng
 <longpeng2@huawei.com>
Subject: [PATCH v2 00/10] add generic vDPA device support
Date: Mon, 17 Jan 2022 20:43:21 +0800
Message-ID: <20220117124331.1642-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

Hi guys,

This patchset tries to support the generic vDPA device, the previous
disscussion can be found here [1].

With the generic vDPA device, QEMU won't need to touch the device
types any more, such like vfio.

We can use the generic vDPA device as follow:
  -device vhost-vdpa-device-pci,vdpa-dev=/dev/vhost-vdpa-X

I've done some simple tests on Huawei's offloading card (net, 0.95)
and vdpa_sim_blk (1.0);

The kernel part:
  https://lkml.org/lkml/2022/1/17/239

Changes RFC -> v1
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

Longpeng (Mike) (10):
  virtio: get class_id and pci device id by the virtio id
  update linux headers
  vdpa: add the infrastructure of vdpa-dev
  vdpa-dev: implement the instance_init/class_init interface
  vdpa-dev: implement the realize interface
  vdpa-dev: implement the unrealize interface
  vdpa-dev: implement the get_config/set_config interface
  vdpa-dev: implement the get_features interface
  vdpa-dev: implement the set_status interface
  vdpa-dev: mark the device as unmigratable

 hw/virtio/Kconfig            |   5 +
 hw/virtio/meson.build        |   2 +
 hw/virtio/vdpa-dev-pci.c     |  99 ++++++++++
 hw/virtio/vdpa-dev.c         | 357 +++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-pci.c       |  77 ++++++++
 hw/virtio/virtio-pci.h       |   5 +
 include/hw/virtio/vdpa-dev.h |  29 +++
 linux-headers/linux/vhost.h  |   7 +
 8 files changed, 581 insertions(+)
 create mode 100644 hw/virtio/vdpa-dev-pci.c
 create mode 100644 hw/virtio/vdpa-dev.c
 create mode 100644 include/hw/virtio/vdpa-dev.h

-- 
2.23.0


