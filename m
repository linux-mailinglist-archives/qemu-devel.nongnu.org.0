Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A1F58063C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 23:15:05 +0200 (CEST)
Received: from localhost ([::1]:46870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG5Ps-00019p-6q
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 17:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1oG57S-0002SL-3Q; Mon, 25 Jul 2022 16:56:02 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:51498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1oG57O-0004EB-2f; Mon, 25 Jul 2022 16:56:01 -0400
Received: from dev006.ch-qa.sw.ru ([172.29.1.11])
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1oG56S-00BzKs-OT; Mon, 25 Jul 2022 22:55:24 +0200
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com, mst@redhat.com,
 stefanha@redhat.com, den@virtuozzo.com, andrey.zhadchenko@virtuozzo.com
Subject: [RFC patch 0/1] block: vhost-blk backend
Date: Mon, 25 Jul 2022 23:55:26 +0300
Message-Id: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=andrey.zhadchenko@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 25 Jul 2022 17:12:36 -0400
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
Reply-to:  Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
From:  Andrey Zhadchenko via <qemu-devel@nongnu.org>

Although QEMU virtio-blk is quite fast, there is still some room for
improvements. Disk latency can be reduced if we handle virito-blk requests
in host kernel so we avoid a lot of syscalls and context switches.

The biggest disadvantage of this vhost-blk flavor is raw format.
Luckily Kirill Thai proposed device mapper driver for QCOW2 format to attach
files as block devices: https://www.spinics.net/lists/kernel/msg4292965.html

Also by using kernel modules we can bypass iothread limitation and finaly scale
block requests with cpus for high-performance devices. This is planned to be
implemented in next version.

Linux kernel module part:
https://lore.kernel.org/kvm/20220725202753.298725-1-andrey.zhadchenko@virtuozzo.com/

test setups and results:
fio --direct=1 --rw=randread  --bs=4k  --ioengine=libaio --iodepth=128
QEMU drive options: cache=none
filesystem: xfs

SSD:
               | randread, IOPS  | randwrite, IOPS |
Host           |      95.8k	 |	85.3k	   |
QEMU virtio    |      57.5k	 |	79.4k	   |
QEMU vhost-blk |      95.6k	 |	84.3k	   |

RAMDISK (vq == vcpu):
                 | randread, IOPS | randwrite, IOPS |
virtio, 1vcpu    |	123k	  |	 129k       |
virtio, 2vcpu    |	253k (??) |	 250k (??)  |
virtio, 4vcpu    |	158k	  |	 154k       |
vhost-blk, 1vcpu |	110k	  |	 113k       |
vhost-blk, 2vcpu |	247k	  |	 252k       |
vhost-blk, 4vcpu |	576k	  |	 567k       |

Andrey Zhadchenko (1):
  block: add vhost-blk backend

 configure                     |  13 ++
 hw/block/Kconfig              |   5 +
 hw/block/meson.build          |   1 +
 hw/block/vhost-blk.c          | 395 ++++++++++++++++++++++++++++++++++
 hw/virtio/meson.build         |   1 +
 hw/virtio/vhost-blk-pci.c     | 102 +++++++++
 include/hw/virtio/vhost-blk.h |  44 ++++
 linux-headers/linux/vhost.h   |   3 +
 8 files changed, 564 insertions(+)
 create mode 100644 hw/block/vhost-blk.c
 create mode 100644 hw/virtio/vhost-blk-pci.c
 create mode 100644 include/hw/virtio/vhost-blk.h

-- 
2.31.1


