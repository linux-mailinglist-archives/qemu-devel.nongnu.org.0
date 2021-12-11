Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF447143D
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 15:29:16 +0100 (CET)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw3ND-0007Bg-Jy
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 09:29:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mw3LK-0004OC-LC
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 09:27:18 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:3209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mw3LH-0007K2-Rv
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 09:27:18 -0500
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JB95l6zLgz90gK;
 Sat, 11 Dec 2021 22:24:59 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 22:27:09 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 22:27:08 +0800
To: <pbonzini@redhat.com>, <alex.williamson@redhat.com>, <mst@redhat.com>,
 <mtosatti@redhat.com>
CC: <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>, <arei.gonglei@huawei.com>, 
 Longpeng <longpeng2@huawei.com>
Subject: [PATCH 0/2] kvm/msi: do explicit commit when adding msi routes
Date: Sat, 11 Dec 2021 22:27:01 +0800
Message-ID: <20211211142703.1941-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This patchset moves the call to kvm_irqchip_commit_routes() out of
kvm_irqchip_add_msi_route(). An optimization of vfio migration [1]
depends on this changes.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00968.html

Longpeng (Mike) (2):
  kvm-irqchip: introduce new API to support route change
  kvm/msi: do explicit commit when adding msi routes

 accel/kvm/kvm-all.c    |  7 ++++---
 accel/stubs/kvm-stub.c |  2 +-
 hw/misc/ivshmem.c      |  5 ++++-
 hw/vfio/pci.c          |  5 ++++-
 hw/virtio/virtio-pci.c |  4 +++-
 include/sysemu/kvm.h   | 23 +++++++++++++++++++++--
 target/i386/kvm/kvm.c  |  4 +++-
 7 files changed, 40 insertions(+), 10 deletions(-)

-- 
2.23.0


