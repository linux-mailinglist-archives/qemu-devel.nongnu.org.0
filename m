Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7994F6A5603
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 10:41:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWwSn-0002Ki-Mq; Tue, 28 Feb 2023 04:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pWwSl-0002Ka-2h
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:39:59 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pWwSi-0003Bd-Be
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:39:58 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PQsdv4LSnzKmQF;
 Tue, 28 Feb 2023 17:34:43 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Feb 2023 17:39:40 +0800
To: <mst@redhat.com>, <jasowang@redhat.com>, <pbonzini@redhat.com>
CC: <arei.gonglei@huawei.com>, <yechuan@huawei.com>, <eperezma@redhat.com>,
 <alex.williamson@redhat.com>, <mtosatti@redhat.com>, <clg@redhat.com>,
 <qemu-devel@nongnu.org>, Longpeng <longpeng2@huawei.com>
Subject: [PATCH v1 0/3] virtio-pci: optimize set_guest_notifier
Date: Tue, 28 Feb 2023 17:39:34 +0800
Message-ID: <20230228093937.2515-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
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

This patchset optimizes the time-consuming operation in virtio_pci_set_guest_notifier,
especially for the vhost-vdpa migration, the time spend on set_guest_notifier can
reduce 87% in some cases.

Longpeng (Mike) (3):
  virtio-pci: submit msi route changes in batch
  kvm-irqchip: use KVMRouteChange API to update msi route
  virtio-pci: defer to commit kvm irq routing when enable msi/msix

 accel/kvm/kvm-all.c        |  10 +--
 accel/stubs/kvm-stub.c     |   2 +-
 hw/intc/ioapic.c           |   5 +-
 hw/misc/ivshmem.c          |   6 +-
 hw/vfio/pci.c              |   5 +-
 hw/virtio/virtio-pci.c     | 140 ++++++++++++++++++++++++++++++++-----
 include/hw/virtio/virtio.h |   1 +
 include/sysemu/kvm.h       |   2 +-
 target/i386/kvm/kvm.c      |   6 +-
 9 files changed, 145 insertions(+), 32 deletions(-)

-- 
2.23.0


