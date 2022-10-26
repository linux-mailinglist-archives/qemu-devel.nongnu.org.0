Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1560E895
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:09:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlcx-0007XK-6M; Wed, 26 Oct 2022 14:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcu-0007M5-N9
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcs-00071g-U7
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+cMUqz3GnXATVGGENC5rpF1sgO3VFbstR1MnIzMRLts=;
 b=Pm4zom/7Yv7IVa66buspuSMxrLI9rBJ8rEJgnzfQIsJQlSkJZBSWf3651KQycZ84V2om/q
 5fD++DcmtIXv1aFzIeL3iM9R3Yba9+cyFI72Ffsl6sgldbBPj7C/D5VteC+HCf56FnAAcR
 moUmctSXj13MmTQ6WS9uYWQzqPdOinU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-wO_2lKSkNs6UlagKDN4sfQ-1; Wed, 26 Oct 2022 14:59:38 -0400
X-MC-Unique: wO_2lKSkNs6UlagKDN4sfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9407185A78B;
 Wed, 26 Oct 2022 18:59:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1C4917595;
 Wed, 26 Oct 2022 18:59:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Thomas Huth <thuth@redhat.com>,
 integration@gluster.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Xie Changlong <xiechanglong.d@gmail.com>,
 Jeff Cody <codyprime@gmail.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Subject: [PULL 00/13] Block patches
Date: Wed, 26 Oct 2022 14:58:33 -0400
Message-Id: <20221026185846.120544-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 79fc2fb685f35a5e71e23629760ef4025d6aba31:

  Merge tag 'trivial-branch-for-7.2-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-10-25 11:37:17 -0400)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to baf422684d73c7bf38e2c18815e18d44fcf395b6:

  virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint (2022-10-26 14:56:42 -0400)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

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
 qapi/block-core.json                        |   77 +-
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
 block/blkio.c                               | 1008 +++++++++++++++++++
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
 42 files changed, 1435 insertions(+), 96 deletions(-)
 create mode 100644 include/sysemu/block-ram-registrar.h
 create mode 100644 block/blkio.c
 create mode 100644 block/block-ram-registrar.c
 create mode 100644 stubs/physmem.c

-- 
2.37.3


