Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953B56B151
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 06:21:30 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9fUe-0005pY-R8
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 00:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSk-0003UG-Rs
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSg-0000KG-Vy
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657253965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7Gk5g1rAZ6B2iu5djYGz+mYbugtTY7H7QzBE1Bu5GGU=;
 b=UONU7Mz93xF8WCuvsmmopJF3x1jIy/Fh9rihBIK2RAWhJIOJ9xeFpJrND+wjjISsh7B50d
 gsWAD4MY+++fbhqZvQJPVobJw9DyH5AI1UfRw1KI23Y/u5mjfIs1hK3wTHNyFF8HJMfY3b
 Zp6VTlrK7CPiVpOGJwREbMT2sZq+yVs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-L7g9HafiMQWOwCaSe5w6Ng-1; Fri, 08 Jul 2022 00:19:22 -0400
X-MC-Unique: L7g9HafiMQWOwCaSe5w6Ng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFD90811E75;
 Fri,  8 Jul 2022 04:19:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B26A400DFC9;
 Fri,  8 Jul 2022 04:19:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [RFC v3 0/8] blkio: add libblkio BlockDriver
Date: Fri,  8 Jul 2022 05:17:29 +0100
Message-Id: <20220708041737.1768521-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
device I/O. Currently libblkio has io_uring and virtio-blk-vhost-vdpa support
with additional drivers in development.

The first patch adds the core BlockDriver and most of the libblkio API usage.
The remainder of the patch series reworks the existing QEMU bdrv_register_buf()
API so virtio-blk emulation efficiently map guest RAM for libblkio - some
libblkio drivers require that I/O buffer memory is pre-registered (think VFIO,
vhost, etc).

This block driver is functional enough to boot guests. The libblkio 1.0 release
is expected soon and I will drop the "RFC" once the API is stable.

See the BlockDriver struct in block/blkio.c for a list of APIs that still need
to be implemented.

Regarding the design: each libblkio driver is a separately named BlockDriver.
That means there is an "io_uring" BlockDriver and not a generic "libblkio"
BlockDriver. This way QAPI and open parameters are type-safe and mandatory
parameters can be checked by QEMU.

Stefan Hajnoczi (8):
  blkio: add io_uring block driver using libblkio
  numa: call ->ram_block_removed() in ram_block_notifer_remove()
  block: pass size to bdrv_unregister_buf()
  block: add BDRV_REQ_REGISTERED_BUF request flag
  block: add BlockRAMRegistrar
  stubs: add memory_region_from_host() and memory_region_get_fd()
  blkio: implement BDRV_REQ_REGISTERED_BUF optimization
  virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint

 MAINTAINERS                                 |   7 +
 meson_options.txt                           |   2 +
 qapi/block-core.json                        |  37 +-
 meson.build                                 |   9 +
 include/block/block-common.h                |   9 +
 include/block/block-global-state.h          |   5 +-
 include/block/block_int-common.h            |   2 +-
 include/hw/virtio/virtio-blk.h              |   2 +
 include/sysemu/block-backend-global-state.h |   2 +-
 include/sysemu/block-ram-registrar.h        |  30 +
 block/blkio.c                               | 757 ++++++++++++++++++++
 block/blkverify.c                           |   4 +-
 block/block-backend.c                       |   4 +-
 block/block-ram-registrar.c                 |  39 +
 block/crypto.c                              |   2 +
 block/io.c                                  |  36 +-
 block/mirror.c                              |   2 +
 block/nvme.c                                |   2 +-
 block/raw-format.c                          |   2 +
 hw/block/virtio-blk.c                       |  13 +-
 hw/core/numa.c                              |  17 +
 qemu-img.c                                  |   4 +-
 stubs/memory.c                              |  13 +
 tests/qtest/modules-test.c                  |   3 +
 util/vfio-helpers.c                         |   5 +-
 block/meson.build                           |   2 +
 scripts/meson-buildoptions.sh               |   3 +
 stubs/meson.build                           |   1 +
 28 files changed, 987 insertions(+), 27 deletions(-)
 create mode 100644 include/sysemu/block-ram-registrar.h
 create mode 100644 block/blkio.c
 create mode 100644 block/block-ram-registrar.c
 create mode 100644 stubs/memory.c

-- 
2.36.1


