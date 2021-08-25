Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F763F70CF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:59:37 +0200 (CEST)
Received: from localhost ([::1]:41722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInop-00066q-W7
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmL-0007Xd-5R
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:56:57 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmI-0005cs-Iq
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:56:56 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GvdZt13Brz1DDHH;
 Wed, 25 Aug 2021 15:56:06 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:39 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:31 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>
Subject: [PATCH 0/5] optimize the downtime for vfio migration
Date: Wed, 25 Aug 2021 15:56:15 +0800
Message-ID: <20210825075620.2607-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In vfio migration resume phase, the cost would increase if the
vfio device has more unmasked vectors. We try to optimize it in
this series.

Patch 1 & 2 are simple code cleanups.
Patch 3 defers to set irqs to vfio core.
Patch 4 & 5 defer to commit the route to KVM core. 

The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
we mesure the cost of the vfio_msix_enable for each one, and
we can see the total cost can be significantly reduced.

        Origin         Apply Patch 3     Apply Patch 3/4/5   
1st     8              4                 2
2nd     15             11                2
3rd     22             18                2
4th     24             25                3
5th     36             33                2
6th     44             40                3
7th     51             47                3
8th     58             54                4
Total   258ms          232ms             21ms


Longpeng (Mike) (5):
  vfio: use helper to simplfy the failure path in vfio_msi_enable
  msix: simplfy the conditional in msix_set/unset_vector_notifiers
  vfio: defer to enable msix in migration resume phase
  kvm: irqchip: support defer to commit the route
  vfio: defer to commit kvm route in migraiton resume phase

 accel/kvm/kvm-all.c    | 10 +++--
 accel/stubs/kvm-stub.c |  3 +-
 hw/misc/ivshmem.c      |  2 +-
 hw/pci/msix.c          |  7 ++--
 hw/vfio/pci.c          | 99 ++++++++++++++++++++++++++++++++++++++------------
 hw/vfio/pci.h          |  1 +
 hw/virtio/virtio-pci.c |  2 +-
 include/sysemu/kvm.h   |  4 +-
 target/i386/kvm/kvm.c  |  2 +-
 9 files changed, 95 insertions(+), 35 deletions(-)

-- 
1.8.3.1


