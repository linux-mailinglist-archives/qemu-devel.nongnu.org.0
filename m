Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0375FE366
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:38:40 +0200 (CEST)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj4yV-0000dt-PT
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1oj4t1-0001PX-LL; Thu, 13 Oct 2022 16:32:59 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:42520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1oj4sz-00025e-8o; Thu, 13 Oct 2022 16:32:59 -0400
Received: from dev006.ch-qa.sw.ru ([172.29.1.11])
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1oj4pq-00Bba4-VA; Thu, 13 Oct 2022 22:32:33 +0200
To: stefanha@redhat.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com,
 andrey.drobyshev@virtuozzo.com
Subject: [RFC PATCH v2 0/1] block: vhost-blk backend
Date: Thu, 13 Oct 2022 23:31:29 +0300
Message-Id: <20221013203130.690327-1-andrey.zhadchenko@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=andrey.zhadchenko@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-to:  Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
From:  Andrey Zhadchenko via <qemu-devel@nongnu.org>

Sending second version of this patchset as @stefanha requested.
The main difference from the previous version is added vhost
multithreading support.

Also I must note currently there are several problems which
I intend to reconsider/fix later:
 - vmsd is present but migration is not supported
 - BlockConf is used but block layer is actually bypassed
 - posix BlockDriver internal state guessing

---

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
v2: https://lore.kernel.org/kvm/20221013151839.689700-1-andrey.zhadchenko@virtuozzo.com/

test setups and results:
fio --direct=1 --rw=randread  --bs=4k  --ioengine=libaio --iodepth=128
QEMU options: cache=none, iothread, aio=threads
filesystem: xfs

SSD:
               | randread, IOPS  | randwrite, IOPS |
Host           |      95.8k	 |	85.3k	   |
QEMU virtio    |      61.5k	 |	79.9k	   |
QEMU vhost-blk |      95.6k	 |	84.3k	   |

RAMDISK (vq == vcpu == numjobs):
                 | randread, IOPS | randwrite, IOPS |
virtio, 1vcpu    |	133k	  |	 133k       |
virtio, 2vcpu    |	305k      |	 306k       |
virtio, 4vcpu    |	310k	  |	 298k       |
virtio, 8vcpu    |	271k      |	 252k       |
vhost-blk, 1vcpu |	110k	  |	 113k       |
vhost-blk, 2vcpu |	247k	  |	 252k       |
vhost-blk, 4vcpu |	558k	  |	 556k       |
vhost-blk, 8vcpu |	576k	  |	 575k       | *single kernel thread
vhost-blk, 8vcpu |      803k      |      779k       | *two kernel threads

Andrey Zhadchenko (1):
  block: add vhost-blk backend

 hw/block/Kconfig              |   5 +
 hw/block/meson.build          |   4 +
 hw/block/vhost-blk.c          | 403 ++++++++++++++++++++++++++++++++++
 hw/virtio/meson.build         |   3 +
 hw/virtio/vhost-blk-pci.c     | 102 +++++++++
 include/hw/virtio/vhost-blk.h |  52 +++++
 meson.build                   |   6 +
 meson_options.txt             |   2 +
 scripts/meson-buildoptions.sh |   3 +
 9 files changed, 580 insertions(+)
 create mode 100644 hw/block/vhost-blk.c
 create mode 100644 hw/virtio/vhost-blk-pci.c
 create mode 100644 include/hw/virtio/vhost-blk.h

-- 
2.31.1


