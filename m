Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399433F5F7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:46:26 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZJR-0003sF-Do
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ6W-0000GJ-JY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:33:04 -0400
Received: from relay.sw.ru ([185.231.240.75]:49224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ6O-0004V9-CN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=FQRVvxxgsnOia6qFWKKf6a3iDt5Gb5zVrTahUdF6KEo=; b=gotrzdGCutFU
 ZHFRpuOx8zsO5AtMMKgKDxIBg4z2U94BUwgfIUO1fCOPYj0m0kyh3QjxFGfMf8iYdB8MNTHjpxS8q
 mu38d+Alo1XCkkVYiNhfqWwr5m8BDvOaq4Kwo71wutmcHUzyrh6aznxJkvS/gTuJYIu7AOc5m5T8d
 7s3oU=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ5f-0034yI-Si; Wed, 17 Mar 2021 19:32:11 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH 0/9] migration/snap-tool: External snapshot utility
Date: Wed, 17 Mar 2021 19:32:13 +0300
Message-Id: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is a kind of PoC for asynchronous snapshot reverting. This is
about external snapshots only and doesn't involve block devices. Thus, it's
mainly intended to be used with the new 'background-snapshot' migration
capability and otherwise standard QEMU migration mechanism.

The major ideas behind this first version were:
  * Make it compatible with 'exec:'-style migration - options can be create
    some separate tool or integrate into qemu-system.
  * Support asynchronous revert stage by using unaltered postcopy logic
    at destination. To do this, we should be capable of saving RAM pages
    so that any particular page can be directly addressed by it's block ID
    and page offset. Possible solutions here seem to be:
      use separate index (and storing it somewhere)
      create sparse file on host FS and address pages with file offset
      use QCOW2 (or other) image container with inherent sparsity support
  * Make snapshot image file dense on the host FS so we don't depend on
    copy/backup tools and how they deal with sparse files. Off course,
    there's some performance cost for this choice.
  * Make the code which is parsing unstructered format of migration stream,
    at least, not very sophisticated. Also, try to have minimum dependencies
    on QEMU migration code, both RAM and device.
  * Try to keep page save latencies small while not degrading migration
    bandwidth too much.

For this first version I decided not to integrate into main QEMU code but
create a separate tool. The main reason is that there's not too much migration
code that is target-specific and can be used in it's unmodified form. Also,
it's still not very clear how to make 'qemu-system' integration in terms of
command-line (or monitor/QMP?) interface extension.

For the storage format, QCOW2 as a container and large (1MB) cluster size seem
to be an optimal choice. Larger cluster is beneficial for performance particularly
in the case when image preallocation is disabled. Such cluster size does not result
in too high internal fragmentation level (~10% of space waste in most cases) yet
allows to reduce significantly the number of expensive cluster allocations.

A bit tricky part is dispatching QEMU migration stream cause it is mostly
unstructered and depends on configuration parameters like 'send-configuration'
and 'send-section-footer'. But, for the case with default values in migration
globals it seems that implemented dispatching code works well and won't have
compatibility issues in a reasonably long time frame.

I decided to keep RAM save path synchronous, anyhow it's better to use writeback
cache mode for the live snapshots cause of it's interleaving page address pattern.
Page coalescing buffer is used to merge contiguous pages to optimize block layer
writes.

Since for snapshot loading opening image file in cached mode would not do any good,
it implies that Linux native AIO and O_DIRECT mode is used in a common scenario.
AIO support in RAM loading path is implemented by using a ring of preallocated
fixed-sized buffers in such a way that there's always a number of outstanding block
requests anytime. It also ensures in-order request completion.

How to use:

**Save:**
* qemu> migrate_set_capability background-snapshot on
* qemu> migrate "exec:<qemu-bin-path>/qemu-snap -s <virtual-size>
           --cache=writeback --aio=threads save <image-file.qcow2>"

**Load:**
* Use 'qemu-system-* -incoming defer'
* qemu> migrate_incoming "exec:<qemu-bin-path>/qemu-snap
          --cache=none --aio=native load <image-file.qcow2>"

**Load with postcopy:**
* Use 'qemu-system-* -incoming defer'
* qemu> migrate_set_capability postcopy-ram on
* qemu> migrate_incoming "exec:<qemu-bin-path>/qemu-snap --postcopy=60
          --cache=none --aio=native load <image-file.qcow2>"

And yes, asynchronous revert works well only with SSD, not with rotational disk..

Some performance stats:
* SATA SSD drive with ~500/450 MB/s sequantial read/write and ~60K IOPS max.
* 220 MB/s average save rate (depends on workload)
* 440 MB/s average load rate in precopy
* 260 MB/s average load rate in postcopy

Andrey Gruzdev (9):
  migration/snap-tool: Introduce qemu-snap tool
  migration/snap-tool: Snapshot image create/open routines for qemu-snap
    tool
  migration/snap-tool: Preparations to run code in main loop context
  migration/snap-tool: Introduce qemu_ftell2() routine to qemu-file.c
  migration/snap-tool: Block layer AIO support and file utility routines
  migration/snap-tool: Move RAM_SAVE_FLAG_xxx defines to migration/ram.h
  migration/snap-tool: Complete implementation of snapshot saving
  migration/snap-tool: Implementation of snapshot loading in precopy
  migration/snap-tool: Implementation of snapshot loading in postcopy

 include/qemu-snap.h   |  163 ++++
 meson.build           |    2 +
 migration/qemu-file.c |    6 +
 migration/qemu-file.h |    1 +
 migration/ram.c       |   16 -
 migration/ram.h       |   16 +
 qemu-snap-handlers.c  | 1801 +++++++++++++++++++++++++++++++++++++++++
 qemu-snap-io.c        |  325 ++++++++
 qemu-snap.c           |  673 +++++++++++++++
 9 files changed, 2987 insertions(+), 16 deletions(-)
 create mode 100644 include/qemu-snap.h
 create mode 100644 qemu-snap-handlers.c
 create mode 100644 qemu-snap-io.c
 create mode 100644 qemu-snap.c

-- 
2.25.1


