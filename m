Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1157E195446
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 10:42:59 +0100 (CET)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHlVy-00075R-3h
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 05:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHlUU-0005S9-RH
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHlUT-0000Jl-9O
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:41:26 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:59452 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHlUS-0008UE-Tw
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:41:25 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 742D66D0B783458096A8;
 Fri, 27 Mar 2020 17:41:17 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Mar 2020 17:41:11 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/2] fix two virtio queues memleak
Date: Fri, 27 Mar 2020 17:56:40 +0800
Message-ID: <20200327095642.18424-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
- Aslo clean 's->as_by_busptr' hash table in virtio_iommu_device_unrealize.(Suggested by Stefano Garzarella) 

Pan Nengyuan (2):
  virtio-blk: delete vqs on the error path in realize()
  virtio-iommu: delete vqs in unrealize to fix memleak

 hw/block/virtio-blk.c    | 3 +++
 hw/virtio/virtio-iommu.c | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.18.2


