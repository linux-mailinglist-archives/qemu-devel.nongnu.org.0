Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91341962AA
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 01:42:41 +0100 (CET)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHzYe-0003hC-Mn
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 20:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHzXl-0002rC-Om
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHzXk-0003Ho-QF
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:41:45 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3217 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHzXk-0003Cq-Fy
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:41:44 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 780487685D50C946785E;
 Sat, 28 Mar 2020 08:41:40 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Sat, 28 Mar 2020 08:41:31 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 0/2] fix two virtio queues memleak
Date: Sat, 28 Mar 2020 08:57:03 +0800
Message-ID: <20200328005705.29898-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: euler.robot@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 zhang.zhanghailiang@huawei.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fix two vqs leak:
1. Do delete vqs on the error path in virtio_blk_device_realize().
2. Do delete vqs in virtio_iommu_device_unrealize() to fix another leaks.

v2->v1:
- Fix incorrect free in virtio_blk_device_realize, it will cause a uaf.

v3->v2:
- Also clean 's->as_by_busptr' hash table in virtio_iommu_device_unrealize.(Suggested by Stefano Garzarella)

v4->v3:
- update patch2/2 subject message and move g_hash_table_destroy() at the beggining of unrealize().

Pan Nengyuan (2):
  virtio-blk: delete vqs on the error path in realize()
  virtio-iommu: avoid memleak in the unrealize

 hw/block/virtio-blk.c    | 3 +++
 hw/virtio/virtio-iommu.c | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.18.2


