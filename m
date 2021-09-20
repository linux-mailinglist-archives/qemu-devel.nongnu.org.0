Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE241292B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:06:58 +0200 (CEST)
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSNF-0003bS-4x
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mSSIo-0005HX-0N
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:02:22 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mSSIl-0004bI-19
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:02:21 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HD0R165c5z1DH88;
 Tue, 21 Sep 2021 07:01:01 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 21 Sep 2021 07:02:09 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 21 Sep 2021 07:02:09 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <philmd@redhat.com>, <pbonzini@redhat.com>, 
 <marcel.apfelbaum@gmail.com>, <mst@redhat.com>
Subject: [PATCH v3 0/9] optimize the downtime for vfio migration
Date: Tue, 21 Sep 2021 07:01:53 +0800
Message-ID: <20210920230202.1439-1-longpeng2@huawei.com>
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
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenjiashang@huawei.com, "Longpeng\(Mike\)" <longpeng2@huawei.com>,
 arei.gonglei@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi guys,

In vfio migration resume phase, the cost would increase if the
vfio device has more unmasked vectors. We try to optimize it in
this series.

You can see the commit message in PATCH 9 for details.

Patch 1-5 are simple cleanups and fixup.
Patch 6-8 are the preparations for the optimization.
Patch 9 optimizes the vfio msix setup path.

Changes v2->v3:
 - fix two errors [Longpeng]

Changes v1->v2:
 - fix several typos and grammatical errors [Alex, Philippe]
 - split fixups and cleanups into separate patches  [Alex, Philippe]
 - introduce kvm_irqchip_add_deferred_msi_route to
   minimize code changes    [Alex]
 - enable the optimization in msi setup path    [Alex]

Longpeng (Mike) (9):
  vfio: simplify the conditional statements in vfio_msi_enable
  vfio: move re-enabling INTX out of the common helper
  vfio: simplify the failure path in vfio_msi_enable
  msix: simplify the conditional in msix_set/unset_vector_notifiers
  msix: reset poll_notifier to NULL if fail to set notifiers
  kvm: irqchip: extract kvm_irqchip_add_deferred_msi_route
  vfio: add infrastructure to commit the deferred kvm routing
  Revert "vfio: Avoid disabling and enabling vectors repeatedly in VFIO
    migration"
  vfio: defer to commit kvm irq routing when enable msi/msix

 accel/kvm/kvm-all.c  |  15 +++++-
 hw/pci/msix.c        |   7 ++-
 hw/vfio/pci.c        | 126 ++++++++++++++++++++++++++++---------------
 hw/vfio/pci.h        |   1 +
 include/sysemu/kvm.h |   6 +++
 5 files changed, 106 insertions(+), 49 deletions(-)

-- 
2.23.0


