Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372244E7F47
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 07:04:25 +0100 (CET)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXzXE-00057D-0E
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 02:04:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nXzVf-00037i-BW
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 02:02:47 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nXzVc-00005n-Rt
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 02:02:47 -0400
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KQSzG0cCnzcbDR;
 Sat, 26 Mar 2022 14:02:18 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 26 Mar 2022 14:02:30 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 26 Mar 2022 14:02:29 +0800
To: <alex.williamson@redhat.com>
CC: <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
 <arei.gonglei@huawei.com>, <huangzhichao@huawei.com>, <yechuan@huawei.com>,
 Longpeng <longpeng2@huawei.com>
Subject: [PATCH v6 0/5] optimize the downtime for vfio migration
Date: Sat, 26 Mar 2022 14:02:21 +0800
Message-ID: <20220326060226.1892-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
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

Hi guys,
 
In vfio migration resume phase, the cost would increase if the
vfio device has more unmasked vectors. We try to optimize it in
this series.
 
You can see the commit message in PATCH 6 for details.
 
Patch 1-3 are simple cleanups and fixup.
Patch 4 are the preparations for the optimization.
Patch 5 optimizes the vfio msix setup path.

v5: https://lore.kernel.org/all/20211103081657.1945-1-longpeng2@huawei.com/T/

Change v5->v6:
 - remove the Patch 4("kvm: irqchip: extract kvm_irqchip_add_deferred_msi_route")
    of v5, and use KVMRouteChange API instead. [Paolo, Longpeng]

Changes v4->v5:
 - setup the notifier and irqfd in the same function to makes
   the code neater.    [Alex]

Changes v3->v4:
 - fix several typos and grammatical errors [Alex]
 - remove the patches that fix and clean the MSIX common part
   from this series [Alex]
 - Patch 6:
    - use vector->use directly and fill it with -1 on error
      paths [Alex]
    - add comment before enable deferring to commit [Alex]
    - move the code that do_use/release on vector 0 into an
      "else" branch [Alex]
    - introduce vfio_prepare_kvm_msi_virq_batch() that enables
      the 'defer_kvm_irq_routing' flag [Alex]
    - introduce vfio_commit_kvm_msi_virq_batch() that clears the
      'defer_kvm_irq_routing' flag and does further work [Alex]

Changes v2->v3:
 - fix two errors [Longpeng]

Changes v1->v2:
 - fix several typos and grammatical errors [Alex, Philippe]
 - split fixups and cleanups into separate patches  [Alex, Philippe]
 - introduce kvm_irqchip_add_deferred_msi_route to
   minimize code changes    [Alex]
 - enable the optimization in msi setup path    [Alex]

Longpeng (Mike) (5):
  vfio: simplify the conditional statements in vfio_msi_enable
  vfio: move re-enabling INTX out of the common helper
  vfio: simplify the failure path in vfio_msi_enable
  Revert "vfio: Avoid disabling and enabling vectors repeatedly in VFIO
    migration"
  vfio: defer to commit kvm irq routing when enable msi/msix

 hw/vfio/pci.c | 183 +++++++++++++++++++++++++++++++-------------------
 hw/vfio/pci.h |   2 +
 2 files changed, 115 insertions(+), 70 deletions(-)

-- 
2.23.0


