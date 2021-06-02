Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162FD398AFE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:48:21 +0200 (CEST)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loREK-00031A-3n
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBq-0007w6-Vb
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBk-0006ry-3i
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fCTtJcpo/oazMqztyWZ/VGuLXiJ4Zsyxep5G6lW4vHg=;
 b=fKJ5Ij4/XfeoKFEmakinoBjDu0zmHPqUqFPYeVNRKwjLL4jLd24pWtZENO+SVlTurl8FSq
 ci5/LhP4aLW4ypUDy53fsbSkASMkwlgypwsBzNIDkQ9+nFG1ErYzcp4Nno+U0tmzws1fOA
 rky8NkVKMThs5uODOgd02oDGAVjyfYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-VCXDNsVbMba__eSgZcGR2A-1; Wed, 02 Jun 2021 09:45:35 -0400
X-MC-Unique: VCXDNsVbMba__eSgZcGR2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D883C1882FD7;
 Wed,  2 Jun 2021 13:45:34 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C094B7863C;
 Wed,  2 Jun 2021 13:45:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/20] Block layer patches
Date: Wed,  2 Jun 2021 15:45:09 +0200
Message-Id: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The following changes since commit dd2db39d78431ab5a0b78777afaab3d61e94533e:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-06-01 21:23:26 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to b317006a3f1f04191a7981cef83417cb2477213b:

  docs/secure-coding-practices: Describe how to use 'null-co' block driver (2021-06-02 14:29:14 +0200)

----------------------------------------------------------------
Block layer patches

- NBD server: Fix crashes related to switching between AioContexts
- file-posix: Workaround for discard/write_zeroes on buggy filesystems
- Follow-up fixes for the reopen vs. permission changes
- quorum: Fix error handling for flush
- block-copy: Refactor copy_range handling
- docs: Describe how to use 'null-co' block driver

----------------------------------------------------------------
Lukas Straub (1):
      block/quorum: Provide .bdrv_co_flush instead of .bdrv_co_flush_to_disk

Philippe Mathieu-Daudé (1):
      docs/secure-coding-practices: Describe how to use 'null-co' block driver

Sergio Lopez (2):
      block-backend: add drained_poll
      nbd/server: Use drained block ops to quiesce the server

Thomas Huth (2):
      block/file-posix: Fix problem with fallocate(PUNCH_HOLE) on GPFS
      block/file-posix: Try other fallbacks after invalid FALLOC_FL_ZERO_RANGE

Vladimir Sementsov-Ogievskiy (14):
      qemu-io-cmds: assert that we don't have .perm requested in no-blk case
      block/vvfat: child_vvfat_qcow: add .get_parent_aio_context, fix crash
      block/vvfat: fix vvfat_child_perm crash
      block: consistently use bdrv_is_read_only()
      block: drop BlockDriverState::read_only
      block: drop BlockBackendRootState::read_only
      block: document child argument of bdrv_attach_child_common()
      block-backend: improve blk_root_get_parent_desc()
      block: improve bdrv_child_get_parent_desc()
      block/vvfat: inherit child_vvfat_qcow from child_of_bds
      block: simplify bdrv_child_user_desc()
      block: improve permission conflict error message
      block-copy: fix block_copy_task_entry() progress update
      block-copy: refactor copy_range handling

 docs/devel/secure-coding-practices.rst |  9 ++++
 include/block/block.h                  |  1 +
 include/block/block_int.h              |  2 -
 include/sysemu/block-backend.h         |  4 ++
 block.c                                | 82 ++++++++++++++++++++--------------
 block/block-backend.c                  | 26 +++++------
 block/block-copy.c                     | 80 ++++++++++++++++++++++-----------
 block/commit.c                         |  2 +-
 block/file-posix.c                     | 29 ++++++++----
 block/io.c                             |  4 +-
 block/qapi.c                           |  2 +-
 block/qcow2-snapshot.c                 |  2 +-
 block/qcow2.c                          |  5 +--
 block/quorum.c                         |  2 +-
 block/snapshot.c                       |  2 +-
 block/vhdx-log.c                       |  2 +-
 block/vvfat.c                          | 14 +++---
 blockdev.c                             |  3 +-
 nbd/server.c                           | 82 +++++++++++++++++++++++++---------
 qemu-io-cmds.c                         | 14 +++++-
 tests/unit/test-block-iothread.c       |  6 ---
 tests/qemu-iotests/283.out             |  2 +-
 tests/qemu-iotests/307.out             |  2 +-
 tests/qemu-iotests/tests/qsd-jobs.out  |  2 +-
 24 files changed, 241 insertions(+), 138 deletions(-)


