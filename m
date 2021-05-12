Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A1E37EC93
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 00:33:20 +0200 (CEST)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgxPr-0007Uz-Aw
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 18:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxOB-0004v9-IO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 18:31:35 -0400
Received: from relay.sw.ru ([185.231.240.75]:55482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxO8-0003sS-5h
 for qemu-devel@nongnu.org; Wed, 12 May 2021 18:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=60+CmoPg6EA7IpgxHDQ8b/YDvSU6wphBuUWuCGGJVN4=; b=CfcJks/I6teh
 brH2SktrYDST73gLat5UF8NNfVBqxyiNNOIEnCIJGTZImCLEQBB9lxary32lyBplDpt2cVLszNt6h
 w8ZoKcJijkg4Co3TKdak5DFHFzwklkdam/YRxJBk6XZtgwyvnEkGdf8nkGSeoKGj9/Dqt33gjIT/s
 37z5o=;
Received: from [192.168.15.22] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxO4-002Bd3-0q; Thu, 13 May 2021 01:31:28 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH v2 0/7] migration/snapshot: External snapshot utility
Date: Thu, 13 May 2021 01:31:20 +0300
Message-Id: <20210512223127.586885-1-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
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

Changes v1 -> v2:
 * Fixed CI checks

Changes v0 -> v1:
 * Changed command-line format, now use blockdev specification to
   define vmstate image.
 * Don't deal with image creation in the tool, create externally.
 * Better block layer AIO handling in the load path.
 * Reduced fragmentation of the image backing file by using 'writtent-slice'
   bitmaps in RAM blocks. Zero block write is issued to a never written slice
   before the actual memory page write takes place.
 * Improved load performance in postcopy by using 'loaded-slice' bitmaps
   in RAM blocks.
 * Refactored error handling/messages.
 * Refactored namings.

This series is a kind of PoC for asynchronous snapshot reverting. It is
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
  * Make image file dense on the host FS so we don't depend on
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
* > qemu-img create -f qcow2 -o size=<2_x_ram_size>,cluster_size=1M,
           preallocation=off,refcount_bits=8 <image-filename>
* qemu> migrate_set_capability background-snapshot on
* qemu> migrate "exec:qemu-snapshot
           <image-filename>,cache.direct=off,file.aio=threads"

**Load:**
* Use 'qemu-system-* -incoming defer'
* qemu> migrate_incoming "exec:qemu-snapshot --revert
           <image-filename>,cache.direct=on,file.aio=native"

**Load with postcopy:**
* Use 'qemu-system-* -incoming defer'
* qemu> migrate_set_capability postcopy-ram on
* qemu> migrate_incoming "exec:qemu-snapshot --revert --postcopy=60
           <image-filename>,cache.direct=on,file.aio=native"

And yes, asynchronous revert works well only with SSD, not with rotational disk..

Some performance stats:
* SATA SSD drive with ~500/450 MB/s sequantial read/write and ~60K IOPS max.
* 220 MB/s average save rate (depends on workload).
* 440 MB/s average load rate in precopy.
* 260 MB/s average load rate in postcopy.

Andrey Gruzdev (7):
  migration/snapshot: Introduce qemu-snapshot tool
  migration/snapshot: Introduce qemu_ftell2() routine
  migration/snapshot: Move RAM_SAVE_FLAG_xxx defines to migration/ram.h
  migration/snapshot: Block layer AIO support in qemu-snapshot
  migration/snapshot: Implementation of qemu-snapshot save path
  migration/snapshot: Implementation of qemu-snapshot load path
  migration/snapshot: Implementation of qemu-snapshot load path in
    postcopy mode

 include/qemu-snapshot.h |  155 ++++
 meson.build             |    2 +
 migration/qemu-file.c   |    6 +
 migration/qemu-file.h   |    1 +
 migration/ram.c         |   16 -
 migration/ram.h         |   16 +
 qemu-snapshot-io.c      |  266 ++++++
 qemu-snapshot-vm.c      | 1881 +++++++++++++++++++++++++++++++++++++++
 qemu-snapshot.c         |  554 ++++++++++++
 9 files changed, 2881 insertions(+), 16 deletions(-)
 create mode 100644 include/qemu-snapshot.h
 create mode 100644 qemu-snapshot-io.c
 create mode 100644 qemu-snapshot-vm.c
 create mode 100644 qemu-snapshot.c

-- 
2.27.0


