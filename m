Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A61D5F7073
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 23:38:32 +0200 (CEST)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogYZb-0008RE-6U
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 17:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWS-0002xQ-Ju
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWQ-0006la-MC
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665092113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UefVgujTJoiMAwLXoQ8QKyT7nN1XrwGX3l0FTGnXEJc=;
 b=GQgq7ZYqM/ZrsfOPkDfX+NEsQK5jb1D3jQOuv/8BcAM1nmMfCogKNpa7xBpaF2nYKq9s+X
 Ugqx2u/DAxdZ8e3dsKHLPYK/pTOWDAXyShCkLOReJ6k+VLNj1qh9n8z/Dn8scJXe+g69GV
 ggLmUsbtl54q2jYLykCGAYjAdN2qEvo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-0iytP6J5Pya0t1exkZJZUA-1; Thu, 06 Oct 2022 17:35:10 -0400
X-MC-Unique: 0iytP6J5Pya0t1exkZJZUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E0E73826A41;
 Thu,  6 Oct 2022 21:35:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 233E9405D4A8;
 Thu,  6 Oct 2022 21:35:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, sgarzare@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 integration@gluster.org, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: [PATCH v6 00/13] blkio: add libblkio BlockDriver
Date: Thu,  6 Oct 2022 17:34:54 -0400
Message-Id: <20221006213507.645402-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

v6:
- Add untested nvme-io_uring driver. Please test in your nested NVMe environment, Alberto. [Alberto]
- Map blkio mem regions only when necessary to reduce conflicts with RAM discard [Alberto]
- Reduce duplication by having a single blkio_virtio_blk_common_open() function [Alberto]
- Avoid duplication in BlockDriver definitions using a macro [Alberto]
- Avoid ram block registrar segfault [Stefano]
- Use QLIST_FOREACH_SAFE() in ram block notifier code so callbacks can remove themselves
v5:
- Drop "RFC" since libblkio 1.0 has been released and the library API is stable
- Disable BDRV_REQ_REGISTERED_BUF if we run out of blkio_mem_regions. The
  bounce buffer slow path is taken when there are not enough blkio_mem_regions
  to cover guest RAM. [Hanna & David Hildenbrand]
- Call ram_block_discard_disable() when mem-region-pinned property is true or
  absent [David Hildenbrand]
- Use a bounce buffer pool instead of allocating/freeing a buffer for each
  request. This reduces the number of blkio_mem_regions required for bounce
  buffers to 1 and avoids frequent blkio_mem_region_map/unmap() calls.
- Switch to .bdrv_co_*() instead of .bdrv_aio_*(). Needed for the bounce buffer
  pool's CoQueue.
v4:
- Patch 1:
  - Add virtio-blk-vhost-user driver [Kevin]
  - Drop .bdrv_parse_filename() and .bdrv_needs_filename for virtio-blk-vhost-vdpa [Stefano]
  - Add copyright and license header [Hanna]
  - Drop .bdrv_parse_filename() in favor of --blockdev or json: [Hanna]
  - Clarify that "filename" is always non-NULL for io_uring [Hanna]
  - Check that virtio-blk-vhost-vdpa "path" option is non-NULL [Hanna]
  - Fix virtio-blk-vhost-vdpa cache.direct=off logic [Hanna]
  - Use macros for driver names [Hanna]
  - Assert that the driver name is valid [Hanna]
  - Update "readonly" property name to "read-only" [Hanna]
  - Call blkio_detach_aio_context() in blkio_close() [Hanna]
  - Avoid uint32_t * to int * casts in blkio_refresh_limits() [Hanna]
  - Remove write zeroes and discard from the todo list [Hanna]
  - Use PRIu32 instead of %d for uint32_t [Hanna]
  - Fix error messages with buf-alignment instead of optimal-io-size [Hanna]
  - Call map/unmap APIs since libblkio alloc/free APIs no longer do that
  - Update QAPI schema QEMU version to 7.2
- Patch 5:
  - Expand the BDRV_REQ_REGISTERED_BUF flag passthrough and drop assert(!flags)
    in drivers [Hanna]
- Patch 7:
  - Fix BLK->BDRV typo [Hanna]
  - Make BlockRAMRegistrar handle failure [Hanna]
- Patch 8:
  - Replace memory_region_get_fd() approach with qemu_ram_get_fd()
- Patch 10:
  - Use (void)ret; to discard unused return value [Hanna]
  - libblkio's blkio_unmap_mem_region() API no longer has a return value
  - Check for registered bufs that cross RAMBlocks [Hanna]
- Patch 11:
  - Handle bdrv_register_buf() errors [Hanna]
v3:
- Add virtio-blk-vhost-vdpa for vdpa-blk devices including VDUSE
- Add discard and write zeroes support
- Rebase and adopt latest libblkio APIs
v2:
- Add BDRV_REQ_REGISTERED_BUF to bs.supported_write_flags [Stefano]
- Use new blkioq_get_num_completions() API
- Implement .bdrv_refresh_limits()

This patch series adds a QEMU BlockDriver for libblkio
(https://gitlab.com/libblkio/libblkio/), a library for high-performance block
device I/O. This work was presented at KVM Forum 2022 and slides are available
here:
https://static.sched.com/hosted_files/kvmforum2022/8c/libblkio-kvm-forum-2022.pdf

The second patch adds the core BlockDriver and most of the libblkio API usage.
Three libblkio drivers are included:
- io_uring
- virtio-blk-vhost-user
- virtio-blk-vhost-vdpa

The remainder of the patch series reworks the existing QEMU bdrv_register_buf()
API so virtio-blk emulation efficiently map guest RAM for libblkio - some
libblkio drivers require that I/O buffer memory is pre-registered (think VFIO,
vhost, etc).

Vladimir requested performance results that show the effect of the
BDRV_REQ_REGISTERED_BUF flag. I ran the patches against qemu-storage-daemon's
vhost-user-blk export with iodepth=1 bs=512 to see the per-request overhead due
to bounce buffer allocation/mapping:

Name                                   IOPS   Error
bounce-buf                          4373.81 ± 0.01%
registered-buf                     13062.80 ± 0.67%

The BDRV_REQ_REGISTERED_BUF optimization version is about 3x faster.

See the BlockDriver struct in block/blkio.c for a list of APIs that still need
to be implemented. The core functionality is covered.

Regarding the design: each libblkio driver is a separately named BlockDriver.
That means there is an "io_uring" BlockDriver and not a generic "libblkio"
BlockDriver. This way QAPI and open parameters are type-safe and mandatory
parameters can be checked by QEMU.

Stefan Hajnoczi (13):
  coroutine: add flag to re-queue at front of CoQueue
  blkio: add libblkio block driver
  numa: call ->ram_block_removed() in ram_block_notifer_remove()
  block: pass size to bdrv_unregister_buf()
  block: use BdrvRequestFlags type for supported flag fields
  block: add BDRV_REQ_REGISTERED_BUF request flag
  block: return errors from bdrv_register_buf()
  numa: use QLIST_FOREACH_SAFE() for RAM block notifiers
  block: add BlockRAMRegistrar
  exec/cpu-common: add qemu_ram_get_fd()
  stubs: add qemu_ram_block_from_host() and qemu_ram_get_fd()
  blkio: implement BDRV_REQ_REGISTERED_BUF optimization
  virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint

 MAINTAINERS                                 |    7 +
 meson_options.txt                           |    2 +
 qapi/block-core.json                        |   75 +-
 meson.build                                 |    9 +
 include/block/block-common.h                |    9 +
 include/block/block-global-state.h          |   10 +-
 include/block/block_int-common.h            |   15 +-
 include/exec/cpu-common.h                   |    1 +
 include/hw/virtio/virtio-blk.h              |    2 +
 include/qemu/coroutine.h                    |   15 +-
 include/sysemu/block-backend-global-state.h |    4 +-
 include/sysemu/block-ram-registrar.h        |   37 +
 block.c                                     |   14 +
 block/blkio.c                               | 1007 +++++++++++++++++++
 block/blkverify.c                           |    4 +-
 block/block-backend.c                       |    8 +-
 block/block-ram-registrar.c                 |   58 ++
 block/crypto.c                              |    4 +-
 block/file-posix.c                          |    1 -
 block/gluster.c                             |    1 -
 block/io.c                                  |  101 +-
 block/mirror.c                              |    2 +
 block/nbd.c                                 |    1 -
 block/nvme.c                                |   20 +-
 block/parallels.c                           |    1 -
 block/qcow.c                                |    2 -
 block/qed.c                                 |    1 -
 block/raw-format.c                          |    2 +
 block/replication.c                         |    1 -
 block/ssh.c                                 |    1 -
 block/vhdx.c                                |    1 -
 hw/block/virtio-blk.c                       |   39 +-
 hw/core/numa.c                              |   26 +-
 qemu-img.c                                  |    6 +-
 softmmu/physmem.c                           |    5 +
 stubs/physmem.c                             |   13 +
 tests/qtest/modules-test.c                  |    3 +
 util/qemu-coroutine-lock.c                  |    9 +-
 util/vfio-helpers.c                         |    5 +-
 block/meson.build                           |    2 +
 scripts/meson-buildoptions.sh               |    3 +
 stubs/meson.build                           |    1 +
 42 files changed, 1432 insertions(+), 96 deletions(-)
 create mode 100644 include/sysemu/block-ram-registrar.h
 create mode 100644 block/blkio.c
 create mode 100644 block/block-ram-registrar.c
 create mode 100644 stubs/physmem.c

-- 
2.37.3


