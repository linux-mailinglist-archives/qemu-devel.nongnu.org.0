Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7B6531E5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:41:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zGd-0000QM-29; Wed, 21 Dec 2022 08:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7zGL-0000I0-Nl
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7zGF-0001Jc-I7
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671629754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fXW/UrlnF5OD3F3wDjRG5zYWVKlmzbNLq1H3rh3wmIQ=;
 b=BliP1n4m4rOejGtXDyFbaDlTgNTq7n1l1FJ2ZsDK4fL44SXtpj5wQ6wTpfRqpbaVI1XmBW
 pmEsItwq7AcR4APks4g36CpZEtmMUfHQJiGO81CMxXqtaPfYRP7/kFBdK+XGuhTuOyxemu
 FsgSfPH6sHf0VvUR/8Z8wqRm0kpklJI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-c7FC5NTmPf-vFDeVHfzJ0A-1; Wed, 21 Dec 2022 08:35:53 -0500
X-MC-Unique: c7FC5NTmPf-vFDeVHfzJ0A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCAD0101B429;
 Wed, 21 Dec 2022 13:35:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A91C1492B00;
 Wed, 21 Dec 2022 13:35:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 98B3D21E691D; Wed, 21 Dec 2022 14:35:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH v2 0/3] block: Clean up includes
Date: Wed, 21 Dec 2022 14:35:48 +0100
Message-Id: <20221221133551.3967339-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Based-on: <20221221131435.3851212-1-armbru@redhat.com>

v2:
* Rebased
* PATCH 1: Comment typo fixed [Paolo]

Markus Armbruster (3):
  include/block: Untangle inclusion loops
  hw/sparc64/niagara: Use blk_name() instead of open-coding it
  include/hw/block: Include hw/block/block.h where needed

 include/block/block-common.h           |  9 ++-------
 include/block/block-copy.h             |  4 ++--
 include/block/block-global-state.h     |  4 +++-
 include/block/block-hmp-cmds.h         |  2 ++
 include/block/block-io.h               |  5 ++++-
 include/block/block.h                  |  4 ++--
 include/block/block_backup.h           |  2 +-
 include/block/block_int-common.h       | 14 +++++---------
 include/block/block_int-global-state.h |  5 ++++-
 include/block/block_int-io.h           |  4 +++-
 include/block/block_int.h              |  4 ++--
 include/block/blockjob.h               |  2 +-
 include/block/blockjob_int.h           |  1 -
 include/block/dirty-bitmap.h           |  1 +
 include/block/qapi.h                   |  2 +-
 include/block/thread-pool.h            |  2 +-
 include/block/throttle-groups.h        |  2 +-
 include/hw/block/swim.h                |  1 +
 include/sysemu/block-backend-io.h      |  1 +
 block.c                                |  1 +
 block/amend.c                          |  1 +
 block/backup.c                         |  1 +
 block/blkdebug.c                       |  1 +
 block/blklogwrites.c                   |  1 +
 block/blkreplay.c                      |  1 +
 block/blkverify.c                      |  1 +
 block/block-copy.c                     |  4 ++++
 block/bochs.c                          |  1 +
 block/cloop.c                          |  1 +
 block/copy-before-write.c              |  1 +
 block/copy-on-read.c                   |  1 +
 block/curl.c                           |  1 +
 block/dirty-bitmap.c                   |  2 ++
 block/dmg.c                            |  1 +
 block/export/fuse.c                    |  3 ++-
 block/file-posix.c                     |  1 +
 block/file-win32.c                     |  1 +
 block/filter-compress.c                |  1 +
 block/gluster.c                        |  1 +
 block/io.c                             |  1 +
 block/iscsi.c                          |  1 +
 block/mirror.c                         |  1 +
 block/monitor/bitmap-qmp-cmds.c        |  2 ++
 block/nfs.c                            |  1 +
 block/null.c                           |  1 +
 block/nvme.c                           |  1 +
 block/parallels-ext.c                  |  2 ++
 block/preallocate.c                    |  1 +
 block/qapi-sysemu.c                    |  1 +
 block/qapi.c                           |  1 +
 block/qcow2-bitmap.c                   |  2 ++
 block/qcow2-cache.c                    |  1 +
 block/qcow2-cluster.c                  |  1 +
 block/qcow2-refcount.c                 |  1 +
 block/qcow2-threads.c                  |  1 +
 block/qcow2.c                          |  1 +
 block/qed-check.c                      |  1 +
 block/qed-table.c                      |  1 +
 block/raw-format.c                     |  1 +
 block/rbd.c                            |  1 +
 block/ssh.c                            |  1 +
 block/throttle.c                       |  2 ++
 block/vhdx-log.c                       |  1 +
 block/vvfat.c                          |  1 +
 block/win32-aio.c                      |  1 +
 block/write-threshold.c                |  1 +
 blockdev.c                             |  1 +
 blockjob.c                             |  1 +
 hw/block/block.c                       |  1 +
 hw/sparc64/niagara.c                   |  5 ++---
 hw/virtio/virtio-pmem.c                |  1 +
 migration/block-dirty-bitmap.c         |  1 +
 migration/block.c                      |  1 +
 migration/savevm.c                     |  1 +
 monitor/qmp-cmds.c                     |  1 +
 nbd/server.c                           |  2 ++
 qemu-img.c                             |  1 +
 softmmu/cpus.c                         |  1 +
 softmmu/physmem.c                      |  1 +
 storage-daemon/qemu-storage-daemon.c   |  1 +
 target/i386/kvm/kvm.c                  |  1 +
 tests/unit/test-bdrv-drain.c           |  2 +-
 tests/unit/test-block-iothread.c       |  1 +
 scripts/block-coroutine-wrapper.py     |  3 ++-
 84 files changed, 114 insertions(+), 38 deletions(-)

-- 
2.38.1


