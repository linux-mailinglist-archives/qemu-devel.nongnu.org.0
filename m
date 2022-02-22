Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7564BFABE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 15:17:36 +0100 (CET)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMVyx-0004Zm-SW
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 09:17:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMVt9-0007ua-IL
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:11:35 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMVt4-0008OC-W0
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:11:35 -0500
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4K31F64DVSz1FDJN;
 Tue, 22 Feb 2022 22:06:50 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 22:11:20 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 22:11:19 +0800
To: <pbonzini@redhat.com>
CC: <qemu-devel@nongnu.org>, <alex.williamson@redhat.com>, <mst@redhat.com>,
 <mtosatti@redhat.com>, <arei.gonglei@huawei.com>, Longpeng
 <longpeng2@huawei.com>
Subject: [PATCH resend 0/2] kvm/msi: do explicit commit when adding msi routes
Date: Tue, 22 Feb 2022 22:11:14 +0800
Message-ID: <20220222141116.2091-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


