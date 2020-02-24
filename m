Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3711169CCF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 04:59:13 +0100 (CET)
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j64tk-00030M-Ft
	for lists+qemu-devel@lfdr.de; Sun, 23 Feb 2020 22:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j64so-0001cS-7R
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 22:58:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j64sn-00065f-3G
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 22:58:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2723 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j64sk-00062h-Kt; Sun, 23 Feb 2020 22:58:10 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 73BBE9F20DF0C0539B1F;
 Mon, 24 Feb 2020 11:58:02 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Feb 2020 11:57:53 +0800
From: <pannengyuan@huawei.com>
To: <mst@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: [PATCH v2 0/2] delete virtio queues in vhost-user-blk-unrealize
Date: Mon, 24 Feb 2020 12:13:34 +0800
Message-ID: <20200224041336.30790-1-pannengyuan@huawei.com>
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
Cc: Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

This series patch fix memleaks when detaching vhost-user-blk device.
1. use old virtio_del_queue to fix memleaks, it's easier for stable branches to merge.
   As the discussion in https://lists.nongnu.org/archive/html/qemu-devel/2020-01/msg02903.html

2. convert virtio_del_queue to the new one(virtio_delete_queue).

v2->v1: rename vqs to vhost_vqs to avoid confusing with virtqs (suggented by Stefan Hajnoczi)

Pan Nengyuan (2):
  vhost-user-blk: delete virtioqueues in unrealize to fix memleaks
  vhost-use-blk: convert to new virtio_delete_queue

 hw/block/vhost-user-blk.c          | 23 +++++++++++++++++------
 include/hw/virtio/vhost-user-blk.h |  3 ++-
 2 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.18.2


