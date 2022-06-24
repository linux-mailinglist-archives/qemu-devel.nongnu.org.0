Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB1B559D90
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:45:41 +0200 (CEST)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lV4-0005K1-3v
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR0-0005wq-4b
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lQr-0000ng-1e
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QuoYQeE/zrxI/CN50YN56uKH5wB6DcdsMk+1lEU0qdM=;
 b=gsX6o6EI1YzUCRhfWTmTQJUu/KPcppvCd0kcNS16C2TEngZhzSpGvfSoQP5KyE7IIGQStK
 C/YlbinkjaCpUsdh6S8KeLqoPLlqxkRG6Qx1bBEGw8s5uZTi5YvcoCGm/VESgO2n60W03F
 mN4V2QmPE5XWbW6GFycwwc4R30joets=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-moYVtTT3MJ-bv7EiQ2H-YQ-1; Fri, 24 Jun 2022 11:41:14 -0400
X-MC-Unique: moYVtTT3MJ-bv7EiQ2H-YQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90B68185A7B2;
 Fri, 24 Jun 2022 15:41:14 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE20C492CA6;
 Fri, 24 Jun 2022 15:41:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 00/20] Block layer patches
Date: Fri, 24 Jun 2022 17:40:43 +0200
Message-Id: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 3a821c52e1a30ecd9a436f2c67cc66b5628c829f:

  Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-06-23 14:52:30 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 779d82e1d305f2a9cbd7f48cf6555ad58145e04a:

  vduse-blk: Add name option (2022-06-24 17:07:06 +0200)

----------------------------------------------------------------
Block layer patches

- Add vduse-blk export
- Dirty bitmaps: Fix and improve bitmap merge
- gluster: correctly set max_pdiscard
- rbd: report a better error when namespace does not exist
- aio_wait_kick: add missing memory barrier
- Code cleanups

----------------------------------------------------------------
Emanuele Giuseppe Esposito (1):
      aio_wait_kick: add missing memory barrier

Eric Blake (1):
      nbd: Drop dead code spotted by Coverity

Fabian Ebner (1):
      block/gluster: correctly set max_pdiscard

Stefan Hajnoczi (3):
      block: drop unused bdrv_co_drain() API
      block: get rid of blk->guest_block_size
      qsd: document vduse-blk exports

Stefano Garzarella (1):
      block/rbd: report a better error when namespace does not exist

Vladimir Sementsov-Ogievskiy (3):
      block: block_dirty_bitmap_merge(): fix error path
      block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
      block: simplify handling of try to merge different sized bitmaps

Xie Yongji (10):
      block: Support passing NULL ops to blk_set_dev_ops()
      block/export: Fix incorrect length passed to vu_queue_push()
      block/export: Abstract out the logic of virtio-blk I/O process
      linux-headers: Add vduse.h
      libvduse: Add VDUSE (vDPA Device in Userspace) library
      vduse-blk: Implement vduse-blk export
      vduse-blk: Add vduse-blk resize support
      libvduse: Add support for reconnecting
      vduse-blk: Add serial option
      vduse-blk: Add name option

 qapi/block-export.json                      |   29 +-
 docs/tools/qemu-storage-daemon.rst          |   22 +
 meson_options.txt                           |    4 +
 block/export/vduse-blk.h                    |   20 +
 block/export/virtio-blk-handler.h           |   37 +
 include/block/aio-wait.h                    |    2 +
 include/block/block-io.h                    |    1 -
 include/block/block_int-io.h                |    2 +-
 include/qemu/hbitmap.h                      |   15 +-
 include/sysemu/block-backend-io.h           |    1 -
 linux-headers/linux/vduse.h                 |  306 ++++++
 subprojects/libvduse/include/atomic.h       |    1 +
 subprojects/libvduse/include/compiler.h     |    1 +
 subprojects/libvduse/libvduse.h             |  247 +++++
 block/backup.c                              |    6 +-
 block/block-backend.c                       |   12 +-
 block/dirty-bitmap.c                        |   26 +-
 block/export/export.c                       |    6 +
 block/export/vduse-blk.c                    |  374 ++++++++
 block/export/vhost-user-blk-server.c        |  263 +----
 block/export/virtio-blk-handler.c           |  240 +++++
 block/gluster.c                             |    2 +-
 block/io.c                                  |   15 -
 block/monitor/bitmap-qmp-cmds.c             |   40 +-
 block/nbd.c                                 |    8 +-
 block/rbd.c                                 |   24 +
 hw/block/virtio-blk.c                       |    1 -
 hw/block/xen-block.c                        |    1 -
 hw/ide/core.c                               |    1 -
 hw/scsi/scsi-disk.c                         |    1 -
 hw/scsi/scsi-generic.c                      |    1 -
 storage-daemon/qemu-storage-daemon.c        |   10 +
 subprojects/libvduse/libvduse.c             | 1375 +++++++++++++++++++++++++++
 util/aio-wait.c                             |   16 +-
 util/hbitmap.c                              |   25 +-
 MAINTAINERS                                 |    9 +
 block/export/meson.build                    |    7 +-
 meson.build                                 |   34 +
 scripts/meson-buildoptions.sh               |    7 +
 scripts/update-linux-headers.sh             |    2 +-
 subprojects/libvduse/linux-headers/linux    |    1 +
 subprojects/libvduse/meson.build            |   10 +
 subprojects/libvduse/standard-headers/linux |    1 +
 43 files changed, 2852 insertions(+), 354 deletions(-)
 create mode 100644 block/export/vduse-blk.h
 create mode 100644 block/export/virtio-blk-handler.h
 create mode 100644 linux-headers/linux/vduse.h
 create mode 120000 subprojects/libvduse/include/atomic.h
 create mode 120000 subprojects/libvduse/include/compiler.h
 create mode 100644 subprojects/libvduse/libvduse.h
 create mode 100644 block/export/vduse-blk.c
 create mode 100644 block/export/virtio-blk-handler.c
 create mode 100644 subprojects/libvduse/libvduse.c
 create mode 120000 subprojects/libvduse/linux-headers/linux
 create mode 100644 subprojects/libvduse/meson.build
 create mode 120000 subprojects/libvduse/standard-headers/linux


