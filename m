Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7EE555379
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 20:47:30 +0200 (CEST)
Received: from localhost ([::1]:35350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o45Nx-00071P-4j
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 14:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45GG-0007WO-Bk
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45GC-0002Bw-Kh
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655923167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Cv4hdv3tpv0z819Dv4ZFOk9iSkg4m1hfwQ8//WKL0Gc=;
 b=V+T4dj8Kl5XRMlSz07WYSIfQsN5OQfV74v2kouDGYDj0VsJOnc7A0Pv3Vwdn+edpJ1Sa22
 PUnm3rf/4mLeQIY5KW7OZCJ5ipcecw1j8lhNim2a4ZC248nz6hcTUrBhRvYUA2s494S5lc
 X0qrQyXdLHpnu2ohVZPYIbTcuk1joZI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-ei0VauaMM124BdGt7_M0CA-1; Wed, 22 Jun 2022 14:39:24 -0400
X-MC-Unique: ei0VauaMM124BdGt7_M0CA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E6E13831C5A;
 Wed, 22 Jun 2022 18:39:24 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A17A1678F;
 Wed, 22 Jun 2022 18:39:23 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 00/33] migration queue
Date: Wed, 22 Jun 2022 19:38:44 +0100
Message-Id: <20220622183917.155308-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 2b049d2c8dc01de750410f8f1a4eac498c04c723:

  Merge tag 'pull-aspeed-20220622' of https://github.com/legoater/qemu into staging (2022-06-22 07:27:06 -0700)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220622b

for you to fetch changes up to 9c6eb6dc3785a280b504195d308da082641af2a7:

  tests: Add dirty page rate limit test (2022-06-22 19:33:43 +0100)

----------------------------------------------------------------
Migration pull 2022-06-22

Compared to Juan's pull:
  a) Hopefully fixed non-Linux builds
    (Local build test on mingw64 works
    Note: the zero-copy capability is now
    defined on non-Linux systems)
  b) Added Hyman's series - it had been
    on queue for a while (sorry for the delay)
  c) Fixed up a whole bunch of check-patch failures
    - please use it!

In this today migration PULL request:
- Dainiel Berrangé - qemufileops cleanup
- Leonardo Bras  - cleanups for zero copy
- Juan Quintela  - RDMA cleanups
- Hyman Huang - per-vcpu dirty ring work

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Daniel P. Berrangé (21):
      io: add a QIOChannelNull equivalent to /dev/null
      migration: switch to use QIOChannelNull for dummy channel
      migration: remove unreachble RDMA code in save_hook impl
      migration: rename rate limiting fields in QEMUFile
      migration: rename 'pos' field in QEMUFile to 'bytes_processed'
      migration: rename qemu_ftell to qemu_file_total_transferred
      migration: rename qemu_update_position to qemu_file_credit_transfer
      migration: rename qemu_file_update_transfer to qemu_file_acct_rate_limit
      migration: introduce a QIOChannel impl for BlockDriverState VMState
      migration: convert savevm to use QIOChannelBlock for VMState
      migration: stop passing 'opaque' parameter to QEMUFile hooks
      migration: hardcode assumption that QEMUFile is backed with QIOChannel
      migration: introduce new constructors for QEMUFile
      migration: remove unused QEMUFileGetFD typedef / qemu_get_fd method
      migration: remove the QEMUFileOps 'shut_down' callback
      migration: remove the QEMUFileOps 'set_blocking' callback
      migration: remove the QEMUFileOps 'close' callback
      migration: remove the QEMUFileOps 'get_buffer' callback
      migration: remove the QEMUFileOps 'writev_buffer' callback
      migration: remove the QEMUFileOps 'get_return_path' callback
      migration: remove the QEMUFileOps abstraction

Hyman Huang (8):
      accel/kvm/kvm-all: Refactor per-vcpu dirty ring reaping
      cpus: Introduce cpu_list_generation_id
      migration/dirtyrate: Refactor dirty page rate calculation
      softmmu/dirtylimit: Implement vCPU dirtyrate calculation periodically
      accel/kvm/kvm-all: Introduce kvm_dirty_ring_size function
      softmmu/dirtylimit: Implement virtual CPU throttle
      softmmu/dirtylimit: Implement dirty page rate limit
      tests: Add dirty page rate limit test

Juan Quintela (1):
      migration: Remove RDMA_UNREGISTRATION_EXAMPLE

Leonardo Bras (3):
      QIOChannelSocket: Introduce assert and reduce ifdefs to improve readability
      QIOChannelSocket: Fix zero-copy send so socket flush works
      migration: Change zero_copy_send from migration parameter to migration capability

 accel/kvm/kvm-all.c               |  46 ++-
 accel/stubs/kvm-stub.c            |   5 +
 cpus-common.c                     |   8 +
 hmp-commands-info.hx              |  13 +
 hmp-commands.hx                   |  32 ++
 include/exec/cpu-common.h         |   1 +
 include/exec/memory.h             |   5 +-
 include/hw/core/cpu.h             |   6 +
 include/io/channel-null.h         |  55 ++++
 include/monitor/hmp.h             |   3 +
 include/sysemu/dirtylimit.h       |  37 +++
 include/sysemu/dirtyrate.h        |  28 ++
 include/sysemu/kvm.h              |   2 +
 io/channel-null.c                 | 237 +++++++++++++++
 io/channel-socket.c               |  19 +-
 io/meson.build                    |   1 +
 io/trace-events                   |   3 +
 migration/block.c                 |  10 +-
 migration/channel-block.c         | 195 +++++++++++++
 migration/channel-block.h         |  59 ++++
 migration/channel.c               |   4 +-
 migration/colo.c                  |   5 +-
 migration/dirtyrate.c             | 227 ++++++++------
 migration/dirtyrate.h             |   7 +-
 migration/meson.build             |   2 +-
 migration/migration.c             |  68 ++---
 migration/multifd.c               |   4 +-
 migration/qemu-file-channel.c     | 194 ------------
 migration/qemu-file-channel.h     |  32 --
 migration/qemu-file.c             | 193 ++++++------
 migration/qemu-file.h             | 125 ++++----
 migration/ram.c                   |   8 +-
 migration/rdma.c                  | 185 +++---------
 migration/savevm.c                |  55 +---
 migration/vmstate.c               |   5 +-
 monitor/hmp-cmds.c                |   6 -
 qapi/migration.json               | 113 +++++--
 softmmu/dirtylimit.c              | 601 ++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build               |   1 +
 softmmu/trace-events              |   7 +
 tests/qtest/migration-helpers.c   |  22 ++
 tests/qtest/migration-helpers.h   |   2 +
 tests/qtest/migration-test.c      | 255 ++++++++++++++++
 tests/qtest/qmp-cmd-test.c        |   2 +
 tests/unit/meson.build            |   1 +
 tests/unit/test-io-channel-null.c |  95 ++++++
 tests/unit/test-vmstate.c         |   5 +-
 47 files changed, 2219 insertions(+), 770 deletions(-)
 create mode 100644 include/io/channel-null.h
 create mode 100644 include/sysemu/dirtylimit.h
 create mode 100644 include/sysemu/dirtyrate.h
 create mode 100644 io/channel-null.c
 create mode 100644 migration/channel-block.c
 create mode 100644 migration/channel-block.h
 delete mode 100644 migration/qemu-file-channel.c
 delete mode 100644 migration/qemu-file-channel.h
 create mode 100644 softmmu/dirtylimit.c
 create mode 100644 tests/unit/test-io-channel-null.c


