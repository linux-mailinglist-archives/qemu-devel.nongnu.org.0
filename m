Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CE564B1BD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 10:02:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p512t-0006Jo-8Y; Tue, 13 Dec 2022 03:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512e-0006Cs-JI
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512c-0002u3-Qt
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4sbh3mSniU/z2/dBhOUwGRwulgF6ykFeYseTo/1rMSg=;
 b=N+f4yM5eKzldHH3w/X7XVy3AIa5/gE/8UDwL/OkdXRXefVVUflOFCkTpXNg75+oHn2hjz8
 KPr6Wv13ydXRVO/C1fqBt6EQDPSB23J/JTgdHneXOPxoAtZy9stjQT6xnyJ/OkV+9JMSKK
 w2HbXVhJ0gMf1cCSXTXLa7gDb2Fkb9A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-dbaaTZelOASJ89JB8dTuGw-1; Tue, 13 Dec 2022 03:53:31 -0500
X-MC-Unique: dbaaTZelOASJ89JB8dTuGw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A028855438;
 Tue, 13 Dec 2022 08:53:31 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5EB0492C14;
 Tue, 13 Dec 2022 08:53:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 00/14] block: Move more functions to coroutines
Date: Tue, 13 Dec 2022 09:53:06 +0100
Message-Id: <20221213085320.95673-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

This series converts some IO_CODE() functions to coroutine_fn because
they access the graph and will need to hold the graph lock in the
future. IO_CODE() functions can be called from iothreads, so taking the
graph lock requires the function to run in coroutine context.

Pretty much all of the changes in this series were posted by Emanuele
before as part of "Protect the block layer with a rwlock: part 3". The
major difference is that in the old version, the patches did two things
at once: Converting functions to coroutine_fn, and adding the locking to
them. This series does only the coroutine conversion. The locking part
will be in another series which now comes with TSA annotations and makes
the locking related changes big enough to have separate patches.

Emanuele Giuseppe Esposito (14):
  block-coroutine-wrapper: support void functions
  block: Convert bdrv_io_plug() to co_wrapper
  block: Convert bdrv_io_unplug() to co_wrapper
  block: Rename refresh_total_sectors to bdrv_refresh_total_sectors
  block: Convert bdrv_refresh_total_sectors() to co_wrapper_mixed
  block-backend: use bdrv_getlength instead of blk_getlength
  block: use bdrv_co_refresh_total_sectors when possible
  block: Convert bdrv_get_allocated_file_size() to co_wrapper
  block: Convert bdrv_get_info() to co_wrapper_mixed
  block: Convert bdrv_is_inserted() to co_wrapper
  block: Convert bdrv_eject() to co_wrapper
  block: convert bdrv_lock_medium in co_wrapper
  block: Convert bdrv_debug_event to co_wrapper_mixed
  block: Rename newly converted BlockDriver IO coroutine functions

 include/block/block-io.h           | 36 +++++++++----
 include/block/block_int-common.h   | 26 ++++++----
 include/block/block_int-io.h       |  5 +-
 include/sysemu/block-backend-io.h  | 31 ++++++++---
 block.c                            | 82 ++++++++++++++++++------------
 block/blkdebug.c                   |  4 +-
 block/blkio.c                      |  6 +--
 block/blklogwrites.c               |  2 +-
 block/blkreplay.c                  |  2 +-
 block/blkverify.c                  |  2 +-
 block/block-backend.c              | 36 ++++++-------
 block/commit.c                     |  4 +-
 block/copy-on-read.c               | 12 ++---
 block/crypto.c                     |  6 +--
 block/curl.c                       |  8 +--
 block/file-posix.c                 | 48 ++++++++---------
 block/file-win32.c                 | 12 ++---
 block/filter-compress.c            | 10 ++--
 block/gluster.c                    | 16 +++---
 block/io.c                         | 76 +++++++++++++--------------
 block/iscsi.c                      |  8 +--
 block/mirror.c                     |  6 +--
 block/nbd.c                        |  6 +--
 block/nfs.c                        |  2 +-
 block/null.c                       |  8 +--
 block/nvme.c                       |  6 +--
 block/preallocate.c                |  2 +-
 block/qcow.c                       |  2 +-
 block/qcow2-refcount.c             |  2 +-
 block/qcow2.c                      |  6 +--
 block/qed.c                        |  4 +-
 block/quorum.c                     |  2 +-
 block/raw-format.c                 | 14 ++---
 block/rbd.c                        |  4 +-
 block/replication.c                |  2 +-
 block/ssh.c                        |  2 +-
 block/throttle.c                   |  2 +-
 block/vdi.c                        |  2 +-
 block/vhdx.c                       |  2 +-
 block/vmdk.c                       |  4 +-
 block/vpc.c                        |  2 +-
 blockdev.c                         |  8 ++-
 hw/scsi/scsi-disk.c                |  5 ++
 tests/unit/test-block-iothread.c   |  3 ++
 scripts/block-coroutine-wrapper.py | 20 ++++++--
 block/meson.build                  |  1 +
 46 files changed, 316 insertions(+), 233 deletions(-)

-- 
2.38.1


