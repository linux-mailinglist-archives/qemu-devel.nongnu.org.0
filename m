Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E1484BE7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 02:01:59 +0100 (CET)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ugf-0002CU-RJ
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 20:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue2-0007rP-9X
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:14 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4udz-0007uw-Om
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:13 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JT9zK5dxPz8wFt;
 Wed,  5 Jan 2022 08:56:29 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:04 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:03 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [RFC 00/10] add generic vDPA device support
Date: Wed, 5 Jan 2022 08:58:50 +0800
Message-ID: <20220105005900.860-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Note:
  the kernel part does not send out yet, I'll send it as soon as possible.

[1] https://lore.kernel.org/all/20211208052010.1719-1-longpeng2@huawei.com/

Longpeng (Mike) (10):
  virtio: get class_id and pci device id by the virtio id
  vhost: add 3 commands for vhost-vdpa
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
 hw/virtio/vdpa-dev-pci.c     | 127 +++++++++++++
 hw/virtio/vdpa-dev.c         | 355 +++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-pci.c       |  93 +++++++++
 hw/virtio/virtio-pci.h       |   4 +
 include/hw/virtio/vdpa-dev.h |  26 +++
 linux-headers/linux/vhost.h  |  10 +
 8 files changed, 622 insertions(+)
 create mode 100644 hw/virtio/vdpa-dev-pci.c
 create mode 100644 hw/virtio/vdpa-dev.c
 create mode 100644 include/hw/virtio/vdpa-dev.h

-- 
2.23.0


