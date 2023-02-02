Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF26883AE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:07:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNc7X-00072y-IH; Thu, 02 Feb 2023 11:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc77-0006zg-Dm
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc74-0004yt-37
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675354020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fssLqWKbfUr/0NTiRsU4QHzh41eeYYWFL5VJNteRAjk=;
 b=faTp/cMOFBfePVEwu1r48RaG2uSoS4ZxTKUxMlbTJIIg4bmV+na24CeszACqJUYYIOae75
 OGi+JoJTiWNRZocHRrB6TdUNr/jgtCiB/M9O5b0rNDkjkhvwa6rBykkTqgpHOD9YsutB5P
 gPOVuAyNfvYSHVl4qFnm7UEcdLMVQdM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-lusupcgsOVaGMaeiuYveOg-1; Thu, 02 Feb 2023 11:06:57 -0500
X-MC-Unique: lusupcgsOVaGMaeiuYveOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EB3787B2A6;
 Thu,  2 Feb 2023 16:06:46 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7DC51FF;
 Thu,  2 Feb 2023 16:06:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org
Subject: [PULL 00/26] Next patches
Date: Thu,  2 Feb 2023 17:06:14 +0100
Message-Id: <20230202160640.2300-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit deabea6e88f7c4c3c12a36ee30051c6209561165:

  Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2023-02-02 10:10:07 +0000)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/next-pull-request

for you to fetch changes up to 5ee6d3d1eeccd85aa2a835e82b8d9e1b4f7441e1:

  migration: check magic value for deciding the mapping of channels (2023-02-02 17:04:16 +0100)

----------------------------------------------------------------
Migration PULL request, new try

Hi

It includes:
- David Hildenbrand fixes for virtio-men
- David Gilbert canary to detect problems
- Fix for rdma return values (Fiona)
- Peter Xu uffd_open fixes
- Peter Xu show right downtime for postcopy
- manish.mishra msg fix fixes
- my vfio changes.

Please apply.

Please, apply.

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

Juan Quintela (4):
  migration: No save_live_pending() method uses the QEMUFile parameter
  migration: Split save_live_pending() into state_pending_*
  migration: Remove unused threshold_size parameter
  migration: simplify migration_iteration_run()

Peter Xu (3):
  migration: Fix migration crash when target psize larger than host
  util/userfaultfd: Add uffd_open()
  migration: Show downtime during postcopy phase

Zhenzhong Duan (1):
  migration/dirtyrate: Show sample pages only in page-sampling mode

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 docs/devel/migration.rst            |  18 +--
 docs/devel/vfio-migration.rst       |   4 +-
 include/hw/virtio/virtio-mem.h      |   8 ++
 include/io/channel.h                |   6 +
 include/migration/misc.h            |   4 +-
 include/migration/register.h        |  17 +--
 include/migration/vmstate.h         |  35 +++++-
 include/qemu/userfaultfd.h          |   8 ++
 migration/channel.h                 |   5 +
 migration/migration.h               |   4 +
 migration/multifd.h                 |   2 +-
 migration/postcopy-ram.h            |   2 +-
 migration/savevm.h                  |  10 +-
 chardev/char-socket.c               |   4 +-
 hw/core/machine.c                   |   4 +-
 hw/s390x/s390-stattrib.c            |  11 +-
 hw/vfio/migration.c                 |  20 +--
 hw/virtio/virtio-mem.c              | 144 ++++++++++++++++++++-
 io/channel-buffer.c                 |   1 +
 io/channel-command.c                |   1 +
 io/channel-file.c                   |   1 +
 io/channel-null.c                   |   1 +
 io/channel-socket.c                 |  19 ++-
 io/channel-tls.c                    |   1 +
 io/channel-websock.c                |   1 +
 io/channel.c                        |  16 ++-
 migration/block-dirty-bitmap.c      |  14 +--
 migration/block.c                   |  13 +-
 migration/channel-block.c           |   1 +
 migration/channel.c                 |  45 +++++++
 migration/dirtyrate.c               |  10 +-
 migration/migration.c               | 119 ++++++++++++------
 migration/multifd.c                 |  19 +--
 migration/postcopy-ram.c            |  16 +--
 migration/ram.c                     | 120 +++++++++++++-----
 migration/rdma.c                    |  16 ++-
 migration/savevm.c                  | 187 ++++++++++++++++++++--------
 migration/vmstate.c                 |   2 +
 scsi/qemu-pr-helper.c               |   2 +-
 tests/qtest/migration-test.c        |   3 +-
 tests/qtest/tpm-emu.c               |   2 +-
 tests/unit/test-io-channel-socket.c |   1 +
 util/userfaultfd.c                  |  13 +-
 util/vhost-user-server.c            |   2 +-
 hw/vfio/trace-events                |   2 +-
 migration/trace-events              |   7 +-
 46 files changed, 715 insertions(+), 226 deletions(-)

-- 
2.39.1


