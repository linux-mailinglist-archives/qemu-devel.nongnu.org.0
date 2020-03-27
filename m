Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3078194FBD
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 04:42:40 +0100 (CET)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHftH-0006Dy-AH
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 23:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHfsL-0005Mo-LY
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHfsK-0005dz-QZ
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:41:41 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3727 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHfsK-0005Pc-GD
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:41:40 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E619ADBEBB411B3A252A;
 Fri, 27 Mar 2020 11:41:31 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Mar 2020 11:41:22 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] fix two virtio queues memleak
Date: Fri, 27 Mar 2020 11:56:48 +0800
Message-ID: <20200327035650.2085-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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

Pan Nengyuan (2):
  virtio-blk: delete vqs on the error path in realize()
  virtio-iommu: delete vqs in unrealize to fix memleaks

 hw/block/virtio-blk.c    | 8 ++++++--
 hw/virtio/virtio-iommu.c | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.18.2


