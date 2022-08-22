Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC659CB66
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:27:29 +0200 (CEST)
Received: from localhost ([::1]:54804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQFtH-0007EH-Ry
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqB-0001DL-VE
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFq7-0004XP-Vc
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661207050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S8etYsJJwWcTykpshtXz0DTyNavQ4Pr3jNKqwdDnldA=;
 b=gaqtfWCKQBLSbUkLZpWUHerKpDLpgvrUuFq2LZEJijtnzlXqcPWESEIfh2AE0uE0k607ae
 LIgukDVHeUVU7ZGXt28IQbB2SLziF4iRi68wsCPsVDalyO+zEEKL5dPDEL5qq/s0LlrgcG
 bT3xrF229D0PtIV7GQV0H7ZeYdEf/7w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-3tumRKgUPG-wJmLN0M2bsg-1; Mon, 22 Aug 2022 18:24:07 -0400
X-MC-Unique: 3tumRKgUPG-wJmLN0M2bsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEB0B811E75;
 Mon, 22 Aug 2022 22:24:06 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDDD3C15BC3;
 Mon, 22 Aug 2022 22:24:03 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Peter Xu <peterx@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Alberto Faria <afaria@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Xie Changlong <xiechanglong.d@gmail.com>
Subject: [RFC v4 00/11] blkio: add libblkio BlockDriver
Date: Mon, 22 Aug 2022 18:23:51 -0400
Message-Id: <20220822222402.176088-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
device I/O.

The first patch adds the core BlockDriver and most of the libblkio API usage.
Three libblkio drivers are included:
- io_uring
- virtio-blk-vhost-user
- virtio-blk-vhost-vdpa

The remainder of the patch series reworks the existing QEMU bdrv_register_buf()
API so virtio-blk emulation efficiently map guest RAM for libblkio - some
libblkio drivers require that I/O buffer memory is pre-registered (think VFIO,
vhost, etc).

This block driver is functional enough to boot guests. The libblkio 1.0 release
is expected soon and I will drop the "RFC" once the API is stable.

See the BlockDriver struct in block/blkio.c for a list of APIs that still need
to be implemented. The core functionality is covered.

Regarding the design: each libblkio driver is a separately named BlockDriver.
That means there is an "io_uring" BlockDriver and not a generic "libblkio"
BlockDriver. This way QAPI and open parameters are type-safe and mandatory
parameters can be checked by QEMU.

Stefan Hajnoczi (11):
  blkio: add libblkio block driver
  numa: call ->ram_block_removed() in ram_block_notifer_remove()
  block: pass size to bdrv_unregister_buf()
  block: use BdrvRequestFlags type for supported flag fields
  block: add BDRV_REQ_REGISTERED_BUF request flag
  block: return errors from bdrv_register_buf()
  block: add BlockRAMRegistrar
  exec/cpu-common: add qemu_ram_get_fd()
  stubs: add qemu_ram_block_from_host() and qemu_ram_get_fd()
  blkio: implement BDRV_REQ_REGISTERED_BUF optimization
  virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint

 MAINTAINERS                                 |   7 +
 meson_options.txt                           |   2 +
 qapi/block-core.json                        |  53 +-
 meson.build                                 |   9 +
 include/block/block-common.h                |   9 +
 include/block/block-global-state.h          |  10 +-
 include/block/block_int-common.h            |  15 +-
 include/exec/cpu-common.h                   |   1 +
 include/hw/virtio/virtio-blk.h              |   2 +
 include/sysemu/block-backend-global-state.h |   4 +-
 include/sysemu/block-ram-registrar.h        |  37 +
 block.c                                     |  14 +
 block/blkio.c                               | 861 ++++++++++++++++++++
 block/blkverify.c                           |   4 +-
 block/block-backend.c                       |   8 +-
 block/block-ram-registrar.c                 |  54 ++
 block/crypto.c                              |   4 +-
 block/file-posix.c                          |   1 -
 block/gluster.c                             |   1 -
 block/io.c                                  | 101 ++-
 block/mirror.c                              |   2 +
 block/nbd.c                                 |   1 -
 block/nvme.c                                |  20 +-
 block/parallels.c                           |   1 -
 block/qcow.c                                |   2 -
 block/qed.c                                 |   1 -
 block/raw-format.c                          |   2 +
 block/replication.c                         |   1 -
 block/ssh.c                                 |   1 -
 block/vhdx.c                                |   1 -
 hw/block/virtio-blk.c                       |  39 +-
 hw/core/numa.c                              |  17 +
 qemu-img.c                                  |   6 +-
 softmmu/physmem.c                           |   5 +
 stubs/physmem.c                             |  13 +
 tests/qtest/modules-test.c                  |   3 +
 util/vfio-helpers.c                         |   5 +-
 block/meson.build                           |   2 +
 scripts/meson-buildoptions.sh               |   3 +
 stubs/meson.build                           |   1 +
 40 files changed, 1236 insertions(+), 87 deletions(-)
 create mode 100644 include/sysemu/block-ram-registrar.h
 create mode 100644 block/blkio.c
 create mode 100644 block/block-ram-registrar.c
 create mode 100644 stubs/physmem.c

-- 
2.37.2


