Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A300368CB86
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 01:58:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCIJ-0002eK-VS; Mon, 06 Feb 2023 19:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCIC-0002dw-PS
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:57:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCIA-0003Yh-8t
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675731420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=beZ5hYezpg1eaD+EamOXUKFXISgfutVwDb5m1qp0Cgo=;
 b=HRa1r2gaGyPhJHGO984xEO/54PgSYD8Ry2CoYRB7/32nJC1TQwIphTAjxX1Il266j2Ta0Z
 udd6Hq4WK341LoJJAOrdHY3uNHjIHaa2NZZBlV2KAweoIYIrAh/skkOSiyq+RjcZEkVhdk
 4D0jqub4fUV23i/yrGKO8wJ3VH1lDkc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-3_cE7ZEANHKr0fcmT_11hQ-1; Mon, 06 Feb 2023 19:56:57 -0500
X-MC-Unique: 3_cE7ZEANHKr0fcmT_11hQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 695713815F62;
 Tue,  7 Feb 2023 00:56:56 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29944492C3C;
 Tue,  7 Feb 2023 00:56:50 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>
Subject: [PULL 00/30] Migration 20230206 patches
Date: Tue,  7 Feb 2023 01:56:20 +0100
Message-Id: <20230207005650.1810-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b:

  Merge tag 'pull-ppc-20230205' of https://gitlab.com/danielhb/qemu into staging (2023-02-05 16:49:09 +0000)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230206-pull-request

for you to fetch changes up to 1b1f4ab69c41279a45ccd0d3178e83471e6e4ec1:

  migration: save/delete migration thread info (2023-02-06 19:22:57 +0100)

----------------------------------------------------------------
Migration Pull request

In this try
- rebase to latest upstream
- same than previous patch
- fix compilation on non linux (userfaultfd.h) (me)
- query-migrationthreads (jiang)
- fix race on reading MultiFDPages_t.block (zhenzhong)
- fix flush of zero copy page send reuest  (zhenzhong)

Please apply.

Previous try:
It includes:
- David Hildenbrand fixes for virtio-men
- David Gilbert canary to detect problems
- Fix for rdma return values (Fiona)
- Peter Xu uffd_open fixes
- Peter Xu show right downtime for postcopy
- manish.mishra msg fix fixes
- my vfio changes.

Please apply.

----------------------------------------------------------------

David Hildenbrand (13):
  migration/ram: Fix populate_read_range()
  migration/ram: Fix error handling in ram_write_tracking_start()
  migration/ram: Don't explicitly unprotect when unregistering uffd-wp
  migration/ram: Rely on used_length for uffd_change_protection()
  migration/ram: Optimize ram_write_tracking_start() for
    RamDiscardManager
  migration/savevm: Move more savevm handling into vmstate_save()
  migration/savevm: Prepare vmdesc json writer in
    qemu_savevm_state_setup()
  migration/savevm: Allow immutable device state to be migrated early
    (i.e., before RAM)
  migration/vmstate: Introduce VMSTATE_WITH_TMP_TEST() and
    VMSTATE_BITMAP_TEST()
  migration/ram: Factor out check for advised postcopy
  virtio-mem: Fail if a memory backend with "prealloc=on" is specified
  virtio-mem: Migrate immutable properties early
  virtio-mem: Proper support for preallocation with migration

Dr. David Alan Gilbert (2):
  migration: Add canary to VMSTATE_END_OF_LIST
  migration: Perform vmsd structure check during tests

Fiona Ebner (1):
  migration/rdma: fix return value for qio_channel_rdma_{readv,writev}

Jiang Jiacheng (2):
  migration: Introduce interface query-migrationthreads
  migration: save/delete migration thread info

Juan Quintela (4):
  migration: No save_live_pending() method uses the QEMUFile parameter
  migration: Split save_live_pending() into state_pending_*
  migration: Remove unused threshold_size parameter
  migration: simplify migration_iteration_run()

Peter Xu (3):
  migration: Fix migration crash when target psize larger than host
  util/userfaultfd: Add uffd_open()
  migration: Show downtime during postcopy phase

Zhenzhong Duan (3):
  migration/dirtyrate: Show sample pages only in page-sampling mode
  multifd: Fix a race on reading MultiFDPages_t.block
  multifd: Fix flush of zero copy page send request

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 docs/devel/migration.rst                      |   18 +-
 docs/devel/vfio-migration.rst                 |    4 +-
 .../x86_64-quintela-devices.mak               |    7 +
 .../x86_64-quintela2-devices.mak              |    6 +
 qapi/migration.json                           |   29 +
 include/hw/virtio/virtio-mem.h                |    8 +
 include/io/channel.h                          |    6 +
 include/migration/misc.h                      |    4 +-
 include/migration/register.h                  |   17 +-
 include/migration/vmstate.h                   |   35 +-
 include/qemu/userfaultfd.h                    |   12 +
 migration/channel.h                           |    5 +
 migration/migration.h                         |    4 +
 migration/multifd.h                           |    2 +-
 migration/postcopy-ram.h                      |    2 +-
 migration/savevm.h                            |   10 +-
 migration/threadinfo.h                        |   28 +
 chardev/char-socket.c                         |    4 +-
 hw/core/machine.c                             |    4 +-
 hw/s390x/s390-stattrib.c                      |   11 +-
 hw/vfio/migration.c                           |   20 +-
 hw/virtio/virtio-mem.c                        |  144 +-
 io/channel-buffer.c                           |    1 +
 io/channel-command.c                          |    1 +
 io/channel-file.c                             |    1 +
 io/channel-null.c                             |    1 +
 io/channel-socket.c                           |   19 +-
 io/channel-tls.c                              |    1 +
 io/channel-websock.c                          |    1 +
 io/channel.c                                  |   16 +-
 migration/block-dirty-bitmap.c                |   14 +-
 migration/block.c                             |   13 +-
 migration/channel-block.c                     |    1 +
 migration/channel.c                           |   45 +
 migration/dirtyrate.c                         |   10 +-
 migration/migration.c                         |  124 +-
 migration/multifd.c                           |   39 +-
 migration/postcopy-ram.c                      |   16 +-
 migration/ram.c                               |  120 +-
 migration/rdma.c                              |   16 +-
 migration/savevm.c                            |  187 ++-
 migration/threadinfo.c                        |   51 +
 migration/vmstate.c                           |    2 +
 scsi/qemu-pr-helper.c                         |    2 +-
 tests/qtest/migration-test.c                  |    4 +-
 tests/qtest/tpm-emu.c                         |    2 +-
 tests/unit/test-io-channel-socket.c           |    1 +
 util/userfaultfd.c                            |   13 +-
 util/vhost-user-server.c                      |    2 +-
 hw/vfio/trace-events                          |    2 +-
 migration/meson.build                         |    1 +
 migration/multifd.c.orig                      | 1274 +++++++++++++++++
 migration/trace-events                        |    7 +-
 53 files changed, 2134 insertions(+), 233 deletions(-)
 create mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela-devices.mak
 create mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela2-devices.mak
 create mode 100644 migration/threadinfo.h
 create mode 100644 migration/threadinfo.c
 create mode 100644 migration/multifd.c.orig

-- 
2.39.1


