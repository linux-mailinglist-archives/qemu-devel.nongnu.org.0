Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A082610FF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 13:54:29 +0200 (CEST)
Received: from localhost ([::1]:52590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFcCi-0007S2-DF
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 07:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFcBs-0006r2-VX
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 07:53:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36041
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFcBq-00031h-5d
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 07:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599566012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=50bLK80+kvmvCy6+HKqwDv+hhqF+n4H7IyR748V7KdA=;
 b=eXbnFf0Yg+IIoc0hOrEa9dpK9xXpuZSgiUlGKexdKq5esgJGm2jKla8cdMbC/Gz1tKV5mT
 aN3fK77Y1aHkJBZ6Q2jk/yZ8N04GT0WUPw0NuGupNzkoRApc1opJZ9HKvOdH52KZHDB5Io
 azQzh/eZW/Z/4yVxJgqaMDAcTG43z9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-yoqpxz8GMKuAjgBBmTfbkg-1; Tue, 08 Sep 2020 07:53:31 -0400
X-MC-Unique: yoqpxz8GMKuAjgBBmTfbkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE64A1DDEF;
 Tue,  8 Sep 2020 11:53:29 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-55.ams2.redhat.com [10.36.113.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01A9B60DA0;
 Tue,  8 Sep 2020 11:53:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2] Block layer patches
Date: Tue,  8 Sep 2020 13:53:22 +0200
Message-Id: <20200908115322.325832-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7c37270b3fbe3d034ba80e488761461676e21eb4:

  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20200904-pull-request' into staging (2020-09-06 16:23:55 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to c984095a47c30e0952d34e77decf9f4c0f8d5a19:

  block/nvme: Pair doorbell registers (2020-09-08 13:40:53 +0200)

----------------------------------------------------------------
Block layer patches:

- qemu-img create: Fail gracefully when backing file is an empty string
- Fixes related to filter block nodes ("Deal with filters" series)
- block/nvme: Various cleanups required to use multiple queues
- block/nvme: Use NvmeBar structure from "block/nvme.h"
- file-win32: Fix "locking" option
- iotests: Allow running from different directory

----------------------------------------------------------------
Connor Kuehl (1):
      block: Raise an error when backing file parameter is an empty string

Kevin Wolf (2):
      iotests: Allow running from different directory
      file-win32: Fix "locking" option

Max Reitz (43):
      block: Add child access functions
      block: Add chain helper functions
      block: bdrv_cow_child() for bdrv_has_zero_init()
      block: bdrv_set_backing_hd() is about bs->backing
      block: Include filters when freezing backing chain
      block: Drop bdrv_is_encrypted()
      block: Add bdrv_supports_compressed_writes()
      throttle: Support compressed writes
      copy-on-read: Support compressed writes
      block: Use bdrv_filter_(bs|child) where obvious
      block: Use CAFs in block status functions
      stream: Deal with filters
      block: Use CAFs when working with backing chains
      block: Use bdrv_cow_child() in bdrv_co_truncate()
      block: Re-evaluate backing file handling in reopen
      block: Flush all children in generic code
      vmdk: Drop vmdk_co_flush()
      block: Iterate over children in refresh_limits
      block: Use CAFs in bdrv_refresh_filename()
      block: Use CAF in bdrv_co_rw_vmstate()
      block/snapshot: Fix fallback
      block: Use CAFs for debug breakpoints
      block: Improve get_allocated_file_size's default
      block/null: Implement bdrv_get_allocated_file_size
      blockdev: Use CAF in external_snapshot_prepare()
      block: Report data child for query-blockstats
      block: Use child access functions for QAPI queries
      block-copy: Use CAF to find sync=top base
      mirror: Deal with filters
      backup: Deal with filters
      commit: Deal with filters
      nbd: Use CAF when looking for dirty bitmap
      qemu-img: Use child access functions
      block: Drop backing_bs()
      blockdev: Fix active commit choice
      block: Inline bdrv_co_block_status_from_*()
      block: Leave BDS.backing_{file,format} constant
      iotests: Test that qcow2's data-file is flushed
      iotests: Let complete_and_wait() work with commit
      iotests: Add filter commit test cases
      iotests: Add filter mirror test cases
      iotests: Add test for commit in sub directory
      iotests: Test committing to overridden backing

Philippe Mathieu-Daudé (18):
      block/nvme: Replace magic value by SCALE_MS definition
      block/nvme: Avoid further processing if trace event not enabled
      block/nvme: Let nvme_create_queue_pair() fail gracefully
      block/nvme: Define INDEX macros to ease code review
      block/nvme: Improve error message when IO queue creation failed
      block/nvme: Use common error path in nvme_add_io_queue()
      block/nvme: Rename local variable
      block/nvme: Use union of NvmeIdCtrl / NvmeIdNs structures
      block/nvme: Replace qemu_try_blockalign0 by qemu_try_blockalign/memset
      block/nvme: Replace qemu_try_blockalign(bs) by qemu_try_memalign(pg_sz)
      block/nvme: Simplify nvme_init_queue() arguments
      block/nvme: Replace BDRV_POLL_WHILE by AIO_WAIT_WHILE
      block/nvme: Simplify nvme_create_queue_pair() arguments
      block/nvme: Extract nvme_poll_queue()
      block/nvme: Use an array of EventNotifier
      block/nvme: Group controller registers in NVMeRegs structure
      block/nvme: Use generic NvmeBar structure
      block/nvme: Pair doorbell registers

 qapi/block-core.json           |  58 +++--
 include/block/block.h          |   2 +-
 include/block/block_int.h      |  95 +++++---
 block.c                        | 492 +++++++++++++++++++++++++++++++++--------
 block/backup-top.c             |   4 +-
 block/backup.c                 |   9 +-
 block/blkdebug.c               |   7 +-
 block/blklogwrites.c           |   1 -
 block/block-backend.c          |   7 +-
 block/block-copy.c             |   4 +-
 block/commit.c                 |  95 +++++---
 block/copy-on-read.c           |  13 +-
 block/file-win32.c             |  22 +-
 block/filter-compress.c        |   2 -
 block/io.c                     | 142 ++++++------
 block/mirror.c                 | 119 +++++++---
 block/monitor/block-hmp-cmds.c |   2 +-
 block/null.c                   |   7 +
 block/nvme.c                   | 248 +++++++++++----------
 block/qapi.c                   |  74 +++++--
 block/snapshot.c               | 104 +++++++--
 block/stream.c                 |  63 ++++--
 block/throttle.c               |  11 +-
 block/vmdk.c                   |  16 --
 blockdev.c                     | 101 +++++++--
 migration/block-dirty-bitmap.c |   8 +-
 nbd/server.c                   |   6 +-
 qemu-img.c                     |  43 ++--
 tests/qemu-iotests/iotests.py  |  10 +-
 tests/qemu-iotests/020         |  44 ++++
 tests/qemu-iotests/020.out     |  10 +
 tests/qemu-iotests/040         | 238 ++++++++++++++++++++
 tests/qemu-iotests/040.out     |   4 +-
 tests/qemu-iotests/041         | 146 +++++++++++-
 tests/qemu-iotests/041.out     |   4 +-
 tests/qemu-iotests/049         |   4 +
 tests/qemu-iotests/049.out     |   5 +
 tests/qemu-iotests/153.out     |   2 +-
 tests/qemu-iotests/184         |   3 +-
 tests/qemu-iotests/184.out     |  14 +-
 tests/qemu-iotests/204.out     |   1 +
 tests/qemu-iotests/228         |   6 +-
 tests/qemu-iotests/228.out     |   6 +-
 tests/qemu-iotests/244         |  49 ++++
 tests/qemu-iotests/244.out     |   7 +
 tests/qemu-iotests/245         |   4 +-
 tests/qemu-iotests/273.out     |   4 +-
 tests/qemu-iotests/check       |   2 +-
 48 files changed, 1763 insertions(+), 555 deletions(-)


