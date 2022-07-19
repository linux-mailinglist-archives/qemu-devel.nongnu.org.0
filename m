Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45A57A4C5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:16:37 +0200 (CEST)
Received: from localhost ([::1]:36218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqpo-00033M-Ts
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcI-0006F5-UF
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcF-0002sf-ID
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658250154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wUbYyHVcTU7PZJo5QcBI3coiS554FFIY1r/NFjy/xWw=;
 b=NXEU/41c0VgEXxCKxdjC5dXauNP/BsOrHV7oGnKWRG6VXhk0GkfLq1uSRpqgMHMhWFqGBh
 AUKOmCezPTctRnCUnnJBH8LdC0L0hK1gdgzXnsYqh1mk7ofQcIhHjTaq/sDdkonP/lVzvW
 kmFu+bfWDWZU4NahltXNTot0jdSQVDU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-G_I3Oni5NqWLZ7SXTpSi4A-1; Tue, 19 Jul 2022 13:02:27 -0400
X-MC-Unique: G_I3Oni5NqWLZ7SXTpSi4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74FF718812C7;
 Tue, 19 Jul 2022 17:02:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B6FD40CF8E5;
 Tue, 19 Jul 2022 17:02:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 00/29] migration queue
Date: Tue, 19 Jul 2022 18:01:52 +0100
Message-Id: <20220719170221.576190-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit da7da9d5e608200ecc0749ff37be246e9cd3314f:

  Merge tag 'pull-request-2022-07-19' of https://gitlab.com/thuth/qemu into staging (2022-07-19 13:05:06 +0100)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220719c

for you to fetch changes up to ec0345c1000b3a57b557da4c2e3f2114dd23903a:

  migration: Avoid false-positive on non-supported scenarios for zero-copy-send (2022-07-19 17:33:22 +0100)

----------------------------------------------------------------
Migration pull 2022-07-19

  Hyman's dirty page rate limit set
  Ilya's fix for zlib vs migration
  Peter's postcopy-preempt
  Cleanup from Dan
  zero-copy tidy ups from Leo
  multifd doc fix from Juan

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Daniel P. Berrangé (1):
      migration: remove unreachable code after reading data

Hyman Huang (8):
      accel/kvm/kvm-all: Refactor per-vcpu dirty ring reaping
      cpus: Introduce cpu_list_generation_id
      migration/dirtyrate: Refactor dirty page rate calculation
      softmmu/dirtylimit: Implement vCPU dirtyrate calculation periodically
      accel/kvm/kvm-all: Introduce kvm_dirty_ring_size function
      softmmu/dirtylimit: Implement virtual CPU throttle
      softmmu/dirtylimit: Implement dirty page rate limit
      tests: Add dirty page rate limit test

Ilya Leoshkevich (1):
      multifd: Copy pages before compressing them with zlib

Juan Quintela (1):
      multifd: Document the locking of MultiFD{Send/Recv}Params

Leonardo Bras (4):
      QIOChannelSocket: Fix zero-copy flush returning code 1 when nothing sent
      Add dirty-sync-missed-zero-copy migration stat
      migration/multifd: Report to user when zerocopy not working
      migration: Avoid false-positive on non-supported scenarios for zero-copy-send

Peter Xu (14):
      migration: Add postcopy-preempt capability
      migration: Postcopy preemption preparation on channel creation
      migration: Postcopy preemption enablement
      migration: Postcopy recover with preempt enabled
      migration: Create the postcopy preempt channel asynchronously
      migration: Add property x-postcopy-preempt-break-huge
      migration: Add helpers to detect TLS capability
      migration: Export tls-[creds|hostname|authz] params to cmdline too
      migration: Enable TLS for preempt channel
      migration: Respect postcopy request order in preemption mode
      tests: Move MigrateCommon upper
      tests: Add postcopy tls migration test
      tests: Add postcopy tls recovery migration test
      tests: Add postcopy preempt tests

 accel/kvm/kvm-all.c             |  46 ++-
 accel/stubs/kvm-stub.c          |   5 +
 cpus-common.c                   |   8 +
 hmp-commands-info.hx            |  13 +
 hmp-commands.hx                 |  32 +++
 include/exec/cpu-common.h       |   1 +
 include/exec/memory.h           |   5 +-
 include/hw/core/cpu.h           |   6 +
 include/monitor/hmp.h           |   3 +
 include/sysemu/dirtylimit.h     |  37 +++
 include/sysemu/dirtyrate.h      |  28 ++
 include/sysemu/kvm.h            |   2 +
 io/channel-socket.c             |   8 +-
 migration/channel.c             |   9 +-
 migration/dirtyrate.c           | 227 +++++++++------
 migration/dirtyrate.h           |   7 +-
 migration/migration.c           | 152 ++++++++--
 migration/migration.h           |  44 ++-
 migration/multifd-zlib.c        |  38 ++-
 migration/multifd.c             |   6 +-
 migration/multifd.h             |  66 +++--
 migration/postcopy-ram.c        | 186 ++++++++++++-
 migration/postcopy-ram.h        |  11 +
 migration/qemu-file.c           |  31 ++-
 migration/qemu-file.h           |   1 +
 migration/ram.c                 | 331 ++++++++++++++++++++--
 migration/ram.h                 |   6 +-
 migration/savevm.c              |  46 ++-
 migration/socket.c              |  22 +-
 migration/socket.h              |   1 +
 migration/tls.c                 |   9 +
 migration/tls.h                 |   4 +
 migration/trace-events          |  15 +-
 monitor/hmp-cmds.c              |   5 +
 qapi/migration.json             |  94 ++++++-
 softmmu/dirtylimit.c            | 601 ++++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build             |   1 +
 softmmu/trace-events            |   7 +
 tests/qtest/migration-helpers.c |  22 ++
 tests/qtest/migration-helpers.h |   2 +
 tests/qtest/migration-test.c    | 539 +++++++++++++++++++++++++++++------
 tests/qtest/qmp-cmd-test.c      |   2 +
 42 files changed, 2394 insertions(+), 285 deletions(-)
 create mode 100644 include/sysemu/dirtylimit.h
 create mode 100644 include/sysemu/dirtyrate.h
 create mode 100644 softmmu/dirtylimit.c


