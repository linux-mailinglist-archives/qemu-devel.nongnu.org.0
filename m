Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF194963A4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:16:32 +0100 (CET)
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAxWZ-00085n-A6
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:16:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMc-0007Fj-EM
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMW-0007i7-0T
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EQwNjGVqKMtfeOKElvVJIswPRgPgpaCXWznhS50SiB4=;
 b=KV8GefKm13HjYe0TD9nTXMI835zk0TiayHts6BDSamuWVFhxHNOnXSeQWM9zlNulAvlgsh
 82np0umb3Pq3eGOm3ePmh3XoQlvZ3ZOxtHgbvmmu3h34FfEoZZd0vw0weq1aLRsNImA4lA
 wydpqC/a7dqvPlQNhHzu5KXiO35444c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-bb09pSIlOxS8aBrd962MQw-1; Fri, 21 Jan 2022 12:06:01 -0500
X-MC-Unique: bb09pSIlOxS8aBrd962MQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D41651091DA4;
 Fri, 21 Jan 2022 17:05:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC76D7E918;
 Fri, 21 Jan 2022 17:05:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 00/33] block layer: split block APIs in global state and I/O
Date: Fri, 21 Jan 2022 12:05:11 -0500
Message-Id: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, block layer APIs like block.h contain a mix of
functions that are either running in the main loop and under the
BQL, or are thread-safe functions and run in iothreads performing I/O.
The functions running under BQL also take care of modifying the
block graph, by using drain and/or aio_context_acquire/release.
This makes it very confusing to understand where each function
runs, and what assumptions it provided with regards to thread
safety.

We call the functions running under BQL "global state (GS) API", and
distinguish them from the thread-safe "I/O API".

The aim of this series is to split the relevant block headers in
global state and I/O sub-headers. The division will be done in
this way:
header.h will be split in header-global-state.h, header-io.h and
header-common.h. The latter will just contain the data structures
needed by header-global-state and header-io, and common helpers
that are neither in GS nor in I/O. header.h will remain for
legacy and to avoid changing all includes in all QEMU c files,
but will only include the two new headers. No function shall be
added in header.c .
Once we split all relevant headers, it will be much easier to see what
uses the AioContext lock and remove it, which is the overall main
goal of this and other series that I posted/will post.

In addition to splitting the relevant headers shown in this series,
it is also very helpful splitting the function pointers in some
block structures, to understand what runs under AioContext lock and
what doesn't. This is what patches 21-27 do.

Each function in the GS API will have an assertion, checking
that it is always running under BQL.
I/O functions are instead thread safe (or so should be), meaning
that they *can* run under BQL, but also in an iothread in another
AioContext. Therefore they do not provide any assertion, and
need to be audited manually to verify the correctness.

Adding assetions has helped finding 2 bugs already, as shown in
my series "Migration: fix missing iothread locking".

Tested this series by running unit tests, qemu-iotests and qtests
(x86_64).
Some functions in the GS API are used everywhere but not
properly tested. Therefore their assertion is never actually run in
the tests, so despite my very careful auditing, it is not impossible
to exclude that some will trigger while actually using QEMU.

Patch 1 introduces qemu_in_main_thread(), the function used in
all assertions. This had to be introduced otherwise all unit tests
would fail, since they run in the main loop but use the code in
stubs/iothread.c
Patches 2-27 (with the exception of patch 9-10, that are an additional
assert) are all structured in the same way: first we split the header
and in the next (or same, if small) patch we add assertions.
Patch 28-31 take care instead of the block layer permission API,
fixing some bugs where they are used in I/O functions.

Next steps once this get reviewed:
1) audit the GS API and replace the AioContext lock with drains,
or remove them when not necessary (requires further discussion).
2) [optional as it should be already the case] audit the I/O API
and check that thread safety is guaranteed

In order to keep this series a little bit smaller, move some
refactoring patches in another series already merged,
"block: minor refactoring in preparation to the block layer API split".

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v6:
* Additional assertions in "block.c: add assertions to static functions"
* bdrv_co_invalidate_cache: create a new GS function bdrv_activate, and move
  all GS logic of bdrv_co_invalidate_cache there, so that the
  coroutine only runs I/O code. Move the resulting 3 patches before
  "block/coroutines: I/O API"
* crypto (patch 30): introduce bdrv_amend_pre_run and bdrv_clean, along with
  job_pre_run and job_clean to be sure of setting the permissions in GS
* remove TODO in blk_{get/set}_perm, and handle the RESIZE permission in patch 6
* in I/O:
    blk_ioctl
    blk_get_attached_dev_id
    blk_enable_write_cache
    blk_set_guest_block_size
    blk_lock_medium
    bdrv_lock_medium
    (*bdrv_lock_medium)
    blk_eject
    bdrv_eject
    (*bdrv_eject)
    bdrv_probe_all
* patch 13 just move an assertion before the variable assignment,
  and not after.
* remove patch 10 (block.c: modify .attach and .detach callbacks of
  child_of_bds), as it is not necessary.

v5:
* In short, apply all Hanna's comments. More in details,
  the following functions in the following headers have been moved:
  block-backend:
    blk_replace_bs (to gs)
    blk_nb_sectors (to io)
    blk_name (to io)
    blk_set_perm (to io)
    blk_get_perm (to io)
    blk_drain (to io)
    blk_abort_aio_request (to io)
    blk_make_empty (to gs)
    blk_invalidate_cache (was in io, but had GS assertion)
    blk_aio_cancel (to gs)
  block:
    bdrv_replace_child_bs (to gs)
    bdrv_get_device_name (to io)
    bdrv_get_device_or_node_name (to io)
    bdrv_drained_end_no_poll (to io)
    bdrv_block_status (was in io, but had GS assertion)
    bdrv_drain (to io)
    bdrv_co_drain (to io)
    bdrv_make_zero (was in GS, but did not have the assertion)
    bdrv_save_vmstate (to io)
    bdrv_load_vmstate (to io)
    bdrv_aio_cancel_async (to io)
  block_int:
    bdrv_get_parent_name (to io)
    bdrv_apply_subtree_drain (to io)
    bdrv_unapply_subtree_drain (to io)
    bdrv_co_copy_range_from (was in io, but had GS assertion)
    bdrv_co_copy_range_to (was in io, but had GS assertion)
    ->bdrv_save_vmstate (to io)
    ->bdrv_load_vmstate (to io)

  coding style (assertion after definitions):
    bdrv_save_vmstate
    bdrv_load_vmstate
    block_job_next
    block_job_get

  new patches:
    block.c: modify .attach and .detach callbacks of child_of_bds
    introduce pre_run as JobDriver callback to handle
      bdrv_co_amend usage of permission function
    leave blk_set/get_perm as a TODO in fuse.c
    make sure bdrv_co_invalidate_cache does not use permissions
      if BQL is not held

  minor changes:
    put back TODO for include block/block.h in block-backend-common.h
    rebase on kwolf/block branch
    modify where are used assert_bdrv_graph_writable, due to rebase

v4:
* Moved the following functions from block-io to
  block-global-state (+ assertion):
  - bdrv_apply_auto_read_only
  - bdrv_can_set_read_only
* Moved the following functions from block-backend-io to
  block-backend-global-state (+ assertion):
  - blk_ioctl
* added patch 4 to distinguish assertions added to static functions
  in block.c
* block/coroutines: it seems that blk_co_do_ioctl and
  blk_do_ioctl are global state too

v3:
* blockdev.h (patch 14): blockdev_mark_auto_del, blockdev_auto_del
  and blk_legacy_dinfo as GS API.
* add copyright header to block.h, block-io.h and block-global-state.h
* rebase on current master (c5b2f55981)

v2:
* rename "graph API" into "global state API"
* change order of patches, block.h comes before block-backend.h
* change GS and I/O comment headers to avoid redundancy, all other
  headers refer to block-global-state.h and block-io.h
* fix typo on GS and I/O headers
* use assert instead of g_assert
* move bdrv_pwrite_sync, bdrv_block_status and bdrv_co_copy_range_{from/to}
  to the I/O API
* change assert_bdrv_graph_writable implementation, since we need
  to introduce additional drains
* remove transactions API split
* add preparation patch for blockdev.h (patch 13)
* backup-top -> copy-on-write
* change I/O comment in job.h into a better meaningful explanation
* fix all warnings given by checkpatch, mostly due to /* */ to be
  split in separate lines
* rebase on current master (c09124dcb8), and split the following new functions:
	blk_replace_bs (I/O)
	bdrv_bsc_is_data (I/O)
	bdrv_bsc_invalidate_range (I/O)
	bdrv_bsc_fill (I/O)
	bdrv_new_open_driver_opts (GS)
	blk_get_max_hw_iov (I/O)
  they are all added in patches 4 and 6.

v1:
* remove the iothread locking bug fix, and send it as separate patch
* rename graph API -> global state API
* better documented patch 1 (qemu_in_main_thread)
* add and split all other block layer headers
* fix warnings given by checkpatch on multiline comments

Emanuele Giuseppe Esposito (33):
  main-loop.h: introduce qemu_in_main_thread()
  include/block/block: split header into I/O and global state API
  assertions for block global state API
  block/export/fuse.c: allow writable exports to take RESIZE permission
  include/sysemu/block-backend: split header into I/O and global state
    (GS) API
  block/block-backend.c: assertions for block-backend
  include/block/block_int: split header into I/O and global state API
  assertions for block_int global state API
  block: introduce assert_bdrv_graph_writable
  include/block/blockjob_int.h: split header into I/O and GS API
  assertions for blockjob_int.h
  block.c: add assertions to static functions
  include/block/blockjob.h: global state API
  assertions for blockjob.h global state API
  include/sysemu/blockdev.h: global state API
  assertions for blockdev.h global state API
  include/block/snapshot: global state API + assertions
  block/copy-before-write.h: global state API + assertions
  block: introduce bdrv_activate
  block: rename bdrv_invalidate_cache_all, blk_invalidate_cache and
    test_sync_op_invalidate_cache
  block: move BQL logic of bdrv_co_invalidate_cache in bdrv_activate
  block/coroutines: I/O API
  block_int-common.h: split function pointers in BlockDriver
  block_int-common.h: assertions in the callers of BlockDriver function
    pointers
  block_int-common.h: split function pointers in BdrvChildClass
  block_int-common.h: assertions in the callers of BdrvChildClass
    function pointers
  block-backend-common.h: split function pointers in BlockDevOps
  job.h: split function pointers in JobDriver
  job.h: assertions in the callers of JobDriver funcion pointers
  include/block/block_int-common.h: introduce bdrv_amend_pre_run and
    bdrv_amend_clean
  include/qemu/job.h: introduce job->pre_run() and use it in amend
  crypto: delegate permission functions to JobDriver .pre_run
  block.c: assertions to the block layer permissions API

 block.c                                     |  278 +++-
 block/amend.c                               |   33 +
 block/backup.c                              |    1 +
 block/block-backend.c                       |  101 +-
 block/commit.c                              |    4 +
 block/copy-before-write.c                   |    2 +
 block/copy-before-write.h                   |    7 +
 block/coroutines.h                          |    6 +
 block/create.c                              |    2 +
 block/crypto.c                              |   73 +-
 block/dirty-bitmap.c                        |    1 +
 block/export/export.c                       |    2 +-
 block/export/fuse.c                         |   25 +-
 block/io.c                                  |   26 +
 block/meson.build                           |    7 +-
 block/mirror.c                              |    4 +
 block/monitor/bitmap-qmp-cmds.c             |    6 +
 block/parallels.c                           |    2 +-
 block/snapshot.c                            |   28 +
 block/stream.c                              |    2 +
 blockdev.c                                  |   29 +
 blockjob.c                                  |   14 +
 hw/block/pflash_cfi01.c                     |    2 +-
 hw/nvram/spapr_nvram.c                      |    2 +-
 include/block/block-common.h                |  381 +++++
 include/block/block-global-state.h          |  269 ++++
 include/block/block-io.h                    |  324 ++++
 include/block/block.h                       |  879 +----------
 include/block/block_int-common.h            | 1215 +++++++++++++++
 include/block/block_int-global-state.h      |  320 ++++
 include/block/block_int-io.h                |  170 +++
 include/block/block_int.h                   | 1475 +------------------
 include/block/blockjob.h                    |    9 +
 include/block/blockjob_int.h                |   28 +
 include/block/snapshot.h                    |   13 +-
 include/qemu/job.h                          |   31 +
 include/qemu/main-loop.h                    |   13 +
 include/sysemu/block-backend-common.h       |  102 ++
 include/sysemu/block-backend-global-state.h |  115 ++
 include/sysemu/block-backend-io.h           |  145 ++
 include/sysemu/block-backend.h              |  269 +---
 include/sysemu/blockdev.h                   |   13 +-
 job.c                                       |   22 +
 migration/block.c                           |    2 +-
 migration/migration.c                       |   10 +-
 migration/savevm.c                          |    6 +-
 monitor/qmp-cmds.c                          |    2 +-
 softmmu/cpus.c                              |    5 +
 softmmu/qdev-monitor.c                      |    2 +
 stubs/iothread-lock.c                       |    5 +
 tests/unit/test-block-iothread.c            |    8 +-
 51 files changed, 3824 insertions(+), 2666 deletions(-)
 create mode 100644 include/block/block-common.h
 create mode 100644 include/block/block-global-state.h
 create mode 100644 include/block/block-io.h
 create mode 100644 include/block/block_int-common.h
 create mode 100644 include/block/block_int-global-state.h
 create mode 100644 include/block/block_int-io.h
 create mode 100644 include/sysemu/block-backend-common.h
 create mode 100644 include/sysemu/block-backend-global-state.h
 create mode 100644 include/sysemu/block-backend-io.h

-- 
2.31.1


