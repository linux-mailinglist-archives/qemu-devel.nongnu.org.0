Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318274B2866
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:55:33 +0100 (CET)
Received: from localhost ([::1]:60696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXKe-0006vU-0i
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHJ-0003Sa-71
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHF-0001i1-56
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eq7419DIrZPrxX1V2Vyqt9ap8NgIQgQ8INMrETub/24=;
 b=AoRRiAvyjJPIraq0NsIXdj4sqUDYTWesi5fnHD4OSafoYSgRaqeQ7IZ+HOiHZrKY2OP7eV
 7BMAfrZlUARc4RgmI+uu1nAILQGnUYqCBSSly8fqWO5n9Zt/s3q788z9yKW9GHZwrAXO1b
 qMjnagOFFuv4dp/hHbf6vz89yeOKQHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-kB4x3ZMTNAGs7WH-0qzXvA-1; Fri, 11 Feb 2022 09:51:58 -0500
X-MC-Unique: kB4x3ZMTNAGs7WH-0qzXvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15B44101F7A1;
 Fri, 11 Feb 2022 14:51:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1147C0E8;
 Fri, 11 Feb 2022 14:51:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 00/31] block layer: split block APIs in global state and I/O
Date: Fri, 11 Feb 2022 09:51:22 -0500
Message-Id: <20220211145153.2861415-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
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

This serie depends on my previous serie "block layer: permission API
refactoring in preparation to the API split"

Based-on: <20220209105452.1694545-1-eesposit@redhat.com>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v7:
* crypto permissions and bdrv-activate patches sent in another serie
* (*bdrv_probe) and (*get_name) are I/O
* add missing license header in block-common.h
* in block-common.h:
  bdrv_parse_cache_mode
  bdrv_parse_discard_flags
  bdrv_perm_names
  bdrv_qapi_perm_to_blk_perm
  bdrv_init_with_whitelist
  bdrv_uses_whitelist
  bdrv_is_whitelisted
* in block-io.h:
  bdrv_get_full_backing_filename
  bdrv_make_zero
  bdrv_aio_cancel
* Introduce new "Global OR I/O" category for the functions using
BDRV_POLL_WHILE
  Functions in this category:
    BDRV_POLL_WHILE
    bdrv_drain
    bdrv_co_drain
    bdrv_truncate
    bdrv_check
    bdrv_invalidate_cache
    bdrv_flush
    bdrv_pdiscard
    bdrv_readv_vmstate
    bdrv_writev_vmstate
    bdrv_parent_drained_begin_single
    bdrv_parent_drained_end_single
    bdrv_drain_poll
    bdrv_drained_begin
    bdrv_do_drained_begin_quiesce
    bdrv_subtree_drained_begin
    bdrv_drained_end
    bdrv_drained_end_no_poll
    bdrv_subtree_drained_end
* better comment descriptions of common, GS, I/O and "I/O or GS" categories
* remove job_pre_run, we don't really need it.
* insert assertion GLOBAL_STATE_CODE, IO_CODE and IO_OR_GS_CODE macros
* replace all assert(qemu_in_main_thread()) with GLOBAL_STATE_CODE
* use IO_CODE and IO_OR_GS_CODE assertions, in additional patches

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

Emanuele Giuseppe Esposito (31):
  main-loop.h: introduce qemu_in_main_thread()
  main loop: macros to mark GS and I/O functions
  include/block/block: split header into I/O and global state API
  assertions for block global state API
  IO_CODE and IO_OR_GS_CODE for block I/O API
  block/export/fuse.c: allow writable exports to take RESIZE permission
  include/sysemu/block-backend: split header into I/O and global state
    (GS) API
  block/block-backend.c: assertions for block-backend
  IO_CODE and IO_OR_GS_CODE for block-backend I/O API
  block.c: assertions to the block layer permissions API
  include/block/block_int: split header into I/O and global state API
  assertions for block_int global state API
  IO_CODE and IO_OR_GS_CODE for block_int I/O API
  block: introduce assert_bdrv_graph_writable
  include/block/blockjob_int.h: split header into I/O and GS API
  GS and IO CODE macros for blockjob_int.h
  block.c: add assertions to static functions
  include/block/blockjob.h: global state API
  assertions for blockjob.h global state API
  include/sysemu/blockdev.h: global state API
  assertions for blockdev.h global state API
  include/block/snapshot: global state API + assertions
  block/copy-before-write.h: global state API + assertions
  block/coroutines: I/O and "I/O or GS" API
  block_int-common.h: split function pointers in BlockDriver
  block_int-common.h: assertions in the callers of BlockDriver function
    pointers
  block_int-common.h: split function pointers in BdrvChildClass
  block_int-common.h: assertions in the callers of BdrvChildClass
    function pointers
  block-backend-common.h: split function pointers in BlockDevOps
  job.h: split function pointers in JobDriver
  job.h: assertions in the callers of JobDriver function pointers

 block.c                                     |  283 +++-
 block/backup.c                              |    1 +
 block/block-backend.c                       |  162 +-
 block/commit.c                              |    4 +
 block/copy-before-write.c                   |    2 +
 block/copy-before-write.h                   |    7 +
 block/coroutines.h                          |   81 +-
 block/create.c                              |    2 +
 block/dirty-bitmap.c                        |    5 +
 block/export/fuse.c                         |   25 +-
 block/io.c                                  |   71 +-
 block/meson.build                           |    7 +-
 block/mirror.c                              |    4 +
 block/monitor/bitmap-qmp-cmds.c             |    6 +
 block/nbd.c                                 |    1 +
 block/snapshot.c                            |   28 +
 block/stream.c                              |    2 +
 blockdev.c                                  |   29 +
 blockjob.c                                  |   16 +
 include/block/block-common.h                |  418 ++++++
 include/block/block-global-state.h          |  256 ++++
 include/block/block-io.h                    |  365 +++++
 include/block/block.h                       |  879 +----------
 include/block/block_int-common.h            | 1222 +++++++++++++++
 include/block/block_int-global-state.h      |  329 ++++
 include/block/block_int-io.h                |  185 +++
 include/block/block_int.h                   | 1489 +------------------
 include/block/blockjob.h                    |   29 +-
 include/block/blockjob_int.h                |   28 +
 include/block/snapshot.h                    |   13 +-
 include/qemu/job.h                          |   22 +
 include/qemu/main-loop.h                    |   33 +
 include/sysemu/block-backend-common.h       |  102 ++
 include/sysemu/block-backend-global-state.h |  117 ++
 include/sysemu/block-backend-io.h           |  161 ++
 include/sysemu/block-backend.h              |  269 +---
 include/sysemu/blockdev.h                   |   13 +-
 job.c                                       |   10 +
 migration/savevm.c                          |    2 +
 softmmu/cpus.c                              |    5 +
 softmmu/qdev-monitor.c                      |    2 +
 stubs/iothread-lock.c                       |    5 +
 42 files changed, 4022 insertions(+), 2668 deletions(-)
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


