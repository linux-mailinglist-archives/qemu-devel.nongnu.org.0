Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6D162C0A5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:14:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ54-0001C6-Sp; Wed, 16 Nov 2022 09:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4t-0000lB-Ch
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4q-00068E-1i
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3nn12dYvnBBU1wbiddzqJM3Jff1Cp69IQIljbBzGRKI=;
 b=Y6RmF6qeJ6ApMIaEBeMAT181SBkvwW+3jf3mxNEJ/f8JfC3Crt433GXGT8aAir5dp9Yb2B
 yCg9ZtsfkxL11vHh5FWp6jTGMMp/IkYbJADdWx2IZ7TzIMBUSvSVNiGfkjzwBQ3sWtFQNx
 60WVkCYcbR6xkzTLohfoe19Ydm5HBl8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-l4EDTprMPRGwvYXx0Uulew-1; Wed, 16 Nov 2022 09:07:35 -0500
X-MC-Unique: l4EDTprMPRGwvYXx0Uulew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 333743C10147;
 Wed, 16 Nov 2022 14:07:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11AF1C158CF;
 Wed, 16 Nov 2022 14:07:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 00/15] Protect the block layer with a rwlock: part 3
Date: Wed, 16 Nov 2022 09:07:15 -0500
Message-Id: <20221116140730.3056048-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

Please read "Protect the block layer with a rwlock: part 1" and
"Protect the block layer with a rwlock: part 2" for an
additional introduction and aim of this series.

In this serie, we cover the remaining BlockDriver IO callbacks that were not
running in coroutine, therefore not using the graph rdlock.
Therefore convert them to coroutines, using either g_c_w or a new
variant introduced in this serie (see below).

We need to convert these callbacks into coroutine because non-coroutine code
is tied to the main thread, even though it will still delegate I/O accesses to
the iothread (via the bdrv_coroutine_enter call in generated_co_wrappers).
Making callbacks run in coroutines provides more flexibility, because they run
entirely in iothreads and can use CoMutexes for mutual exclusion.

Here we introduce generated_co_wrapper_simple, a simplification of g_c_w that
only considers the case where the caller is not in a coroutine.
This simplifies and clarifies a lot when the caller is a coroutine or not, and
in the future will hopefully replace g_c_w.

While we are at it, try to directly call the _co_ counterpart of a g_c_w when
we know already that the function always run in a coroutine.

Based-on: <20221116135331.3052923-1-eesposit@redhat.com>

Thank you,
Emanuele

Emanuele Giuseppe Esposito (15):
  block/qed: add missing graph rdlock in qed_need_check_timer_entry
  block: rename refresh_total_sectors in bdrv_refresh_total_sectors
  block-backend: use bdrv_getlength instead of blk_getlength
  block: convert bdrv_refresh_total_sectors in generated_co_wrapper
  block: use bdrv_co_refresh_total_sectors when possible
  block: convert bdrv_get_allocated_file_size in
    generated_co_wrapper_simple
  block: convert bdrv_get_info in generated_co_wrapper
  block: convert bdrv_is_inserted in generated_co_wrapper_simple
  block-coroutine-wrapper: support void functions
  block: convert bdrv_eject in generated_co_wrapper_simple
  block: convert bdrv_lock_medium in generated_co_wrapper_simple
  block: convert bdrv_debug_event in generated_co_wrapper
  block: convert bdrv_io_plug in generated_co_wrapper_simple
  block: convert bdrv_io_unplug in generated_co_wrapper_simple
  block: rename newly converted BlockDriver IO coroutine functions

 block.c                            | 93 +++++++++++++++++++-----------
 block/blkdebug.c                   |  4 +-
 block/blkio.c                      |  6 +-
 block/blklogwrites.c               |  2 +-
 block/blkreplay.c                  |  2 +-
 block/blkverify.c                  |  2 +-
 block/block-backend.c              | 43 ++++++++------
 block/commit.c                     |  4 +-
 block/copy-on-read.c               | 12 ++--
 block/crypto.c                     |  6 +-
 block/curl.c                       |  8 +--
 block/file-posix.c                 | 48 +++++++--------
 block/file-win32.c                 |  8 +--
 block/filter-compress.c            | 10 ++--
 block/gluster.c                    | 16 ++---
 block/io.c                         | 78 +++++++++++++------------
 block/iscsi.c                      |  8 +--
 block/meson.build                  |  1 +
 block/mirror.c                     | 17 ++++--
 block/nbd.c                        |  6 +-
 block/nfs.c                        |  2 +-
 block/null.c                       |  8 +--
 block/nvme.c                       |  6 +-
 block/preallocate.c                |  2 +-
 block/qcow.c                       |  2 +-
 block/qcow2-refcount.c             |  2 +-
 block/qcow2.c                      |  6 +-
 block/qed.c                        |  7 ++-
 block/quorum.c                     |  2 +-
 block/raw-format.c                 | 14 ++---
 block/rbd.c                        |  4 +-
 block/replication.c                |  2 +-
 block/ssh.c                        |  2 +-
 block/stream.c                     |  4 +-
 block/throttle.c                   |  2 +-
 block/vdi.c                        |  2 +-
 block/vhdx.c                       |  2 +-
 block/vmdk.c                       |  4 +-
 block/vpc.c                        |  2 +-
 blockdev.c                         |  8 ++-
 hw/scsi/scsi-disk.c                |  5 ++
 include/block/block-io.h           | 40 +++++++++----
 include/block/block_int-common.h   | 37 +++++++-----
 include/block/block_int-io.h       |  5 +-
 include/sysemu/block-backend-io.h  | 32 +++++++---
 scripts/block-coroutine-wrapper.py | 19 ++++--
 tests/unit/test-block-iothread.c   |  7 +++
 47 files changed, 364 insertions(+), 238 deletions(-)

-- 
2.31.1


