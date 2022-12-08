Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF6E6471F8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:40:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3I44-0001sy-LE; Thu, 08 Dec 2022 09:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3I40-0001qh-UF
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:39:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3I3v-0000Gm-1h
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670510386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlnMpfhJn+vobpxyrF2A+cqhZK0iOjy+nZQklfSmcbI=;
 b=PXr62ph7YUiM6QiPLA4bJIvgzI1QSCXKBwQfAMsXxmN96Q5YIDJ0hCCRjyg/5WrcYK4lWN
 UgIP6mrLCQ00hiNeAnnA1TGdKQWtlPlMOkoBnM56VyP+DtoqjKwVcWEw887pDFnvi7D5AG
 1WRX/8KnD72XAuXmvRmNQN55eUW4DT0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-Jt4ssHhaNSK63jRt6-i0lw-1; Thu, 08 Dec 2022 09:39:43 -0500
X-MC-Unique: Jt4ssHhaNSK63jRt6-i0lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAF4A2A5955A;
 Thu,  8 Dec 2022 14:39:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B5CDC15BA5;
 Thu,  8 Dec 2022 14:39:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 58B3521E6936; Thu,  8 Dec 2022 15:39:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH 1/3] include/block: Untangle inclusion loops
Date: Thu,  8 Dec 2022 15:39:37 +0100
Message-Id: <20221208143939.2775453-2-armbru@redhat.com>
In-Reply-To: <20221208143939.2775453-1-armbru@redhat.com>
References: <20221208143939.2775453-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

We have two inclusion loops:

       block/block.h
    -> block/block-global-state.h
    -> block/block-common.h
    -> block/blockjob.h
    -> block/block.h

       block/block.h
    -> block/block-io.h
    -> block/block-common.h
    -> block/blockjob.h
    -> block/block.h

I believe these go back to Emanuele's reorganization of the block API,
merged a few months ago in commit d7e2fe4aac8.

Fortunately, breaking them is merely a matter of deleting unnecessary
includes from headers, and adding them back in places where they are
now missing.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/block/block-common.h           | 10 ++--------
 include/block/block-copy.h             |  4 ++--
 include/block/block-global-state.h     |  4 +++-
 include/block/block-hmp-cmds.h         |  2 ++
 include/block/block-io.h               |  5 ++++-
 include/block/block.h                  |  4 ++--
 include/block/block_backup.h           |  2 +-
 include/block/block_int-common.h       | 14 +++++---------
 include/block/block_int-global-state.h |  7 +++++--
 include/block/block_int-io.h           |  4 +++-
 include/block/block_int.h              |  4 ++--
 include/block/blockjob.h               |  2 +-
 include/block/blockjob_int.h           |  1 -
 include/block/qapi.h                   |  2 +-
 include/block/thread-pool.h            |  2 +-
 include/block/throttle-groups.h        |  2 +-
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
 hw/sparc64/niagara.c                   |  1 +
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
 81 files changed, 110 insertions(+), 36 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 0f6b8422bd..8ef6bc21df 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -24,14 +24,8 @@
 #ifndef BLOCK_COMMON_H
 #define BLOCK_COMMON_H
 
-#include "block/aio.h"
-#include "block/aio-wait.h"
-#include "qemu/iov.h"
-#include "block/accounting.h"
-#include "block/dirty-bitmap.h"
-#include "block/blockjob.h"
-#include "qemu/hbitmap.h"
-#include "qemu/transactions.h"
+#include "qapi/qapi-types-block-core.h"
+#include "qemu/queue.h"
 
 /*
  * generated_co_wrapper
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index ba0b425d78..53d7fc801d 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -15,8 +15,8 @@
 #ifndef BLOCK_COPY_H
 #define BLOCK_COPY_H
 
-#include "block/block.h"
-#include "qemu/co-shared-resource.h"
+#include "block/block-common.h"
+#include "qemu/progress_meter.h"
 
 /* All APIs are thread-safe */
 
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index c7bd4a2088..6005dc6bde 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -24,7 +24,9 @@
 #ifndef BLOCK_GLOBAL_STATE_H
 #define BLOCK_GLOBAL_STATE_H
 
-#include "block-common.h"
+#include "block/block-common.h"
+#include "qemu/coroutine.h"
+#include "qemu/transactions.h"
 
 /*
  * Global state (GS) API. These functions run under the BQL.
diff --git a/include/block/block-hmp-cmds.h b/include/block/block-hmp-cmds.h
index ba0593c440..71113cd7ef 100644
--- a/include/block/block-hmp-cmds.h
+++ b/include/block/block-hmp-cmds.h
@@ -15,6 +15,8 @@
 #ifndef BLOCK_BLOCK_HMP_CMDS_H
 #define BLOCK_BLOCK_HMP_CMDS_H
 
+#include "qemu/coroutine.h"
+
 void hmp_drive_add(Monitor *mon, const QDict *qdict);
 
 void hmp_commit(Monitor *mon, const QDict *qdict);
diff --git a/include/block/block-io.h b/include/block/block-io.h
index b099d7db45..81febfa17b 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -24,7 +24,10 @@
 #ifndef BLOCK_IO_H
 #define BLOCK_IO_H
 
-#include "block-common.h"
+#include "block/aio-wait.h"
+#include "block/block-common.h"
+#include "qemu/coroutine.h"
+#include "qemu/iov.h"
 
 /*
  * I/O API functions. These functions are thread-safe, and therefore
diff --git a/include/block/block.h b/include/block/block.h
index 1e6b8fef1e..e2c647de27 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -24,8 +24,8 @@
 #ifndef BLOCK_H
 #define BLOCK_H
 
-#include "block-global-state.h"
-#include "block-io.h"
+#include "block/block-global-state.h"
+#include "block/block-io.h"
 
 /* DO NOT ADD ANYTHING IN HERE. USE ONE OF THE HEADERS INCLUDED ABOVE */
 
diff --git a/include/block/block_backup.h b/include/block/block_backup.h
index 157596c296..4d4d5ba153 100644
--- a/include/block/block_backup.h
+++ b/include/block/block_backup.h
@@ -18,7 +18,7 @@
 #ifndef BLOCK_BACKUP_H
 #define BLOCK_BACKUP_H
 
-#include "block/block_int.h"
+#include "block/blockjob.h"
 
 void backup_do_checkpoint(BlockJob *job, Error **errp);
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 31ae91e56e..c5d9ced0ca 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -24,17 +24,13 @@
 #ifndef BLOCK_INT_COMMON_H
 #define BLOCK_INT_COMMON_H
 
-#include "block/accounting.h"
-#include "block/block.h"
-#include "block/aio-wait.h"
-#include "qemu/queue.h"
-#include "qemu/coroutine.h"
-#include "qemu/stats64.h"
-#include "qemu/timer.h"
-#include "qemu/hbitmap.h"
+#include "block/aio.h"
+#include "block/block-common.h"
+#include "block/block-global-state.h"
 #include "block/snapshot.h"
-#include "qemu/throttle.h"
+#include "qemu/iov.h"
 #include "qemu/rcu.h"
+#include "qemu/stats64.h"
 
 #define BLOCK_FLAG_LAZY_REFCOUNTS   8
 
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index b49f4eb35b..8c2543cdf5 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -25,13 +25,16 @@
 #ifndef BLOCK_INT_GLOBAL_STATE_H
 #define BLOCK_INT_GLOBAL_STATE_H
 
-#include "block_int-common.h"
+#include "block/blockjob.h"
+#include "block/block_int-common.h"
+#include "qemu/hbitmap.h"
+#include "qemu/main-loop.h"
 
 /*
  * Global state (GS) API. These functions run under the BQL.
  *
  * See include/block/block-global-state.h for more information about
- * the GS API.
+ * the GS API.b
  */
 
 /**
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 4b0b3e17ef..ef962d2a5c 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -24,7 +24,9 @@
 #ifndef BLOCK_INT_IO_H
 #define BLOCK_INT_IO_H
 
-#include "block_int-common.h"
+#include "block/block_int-common.h"
+#include "qemu/hbitmap.h"
+#include "qemu/main-loop.h"
 
 /*
  * I/O API functions. These functions are thread-safe.
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 7d50b6bbd1..5f5f618a91 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -24,8 +24,8 @@
 #ifndef BLOCK_INT_H
 #define BLOCK_INT_H
 
-#include "block_int-global-state.h"
-#include "block_int-io.h"
+#include "block/block_int-global-state.h"
+#include "block/block_int-io.h"
 
 /* DO NOT ADD ANYTHING IN HERE. USE ONE OF THE HEADERS INCLUDED ABOVE */
 
diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 03032b2eca..058b0c824c 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -26,8 +26,8 @@
 #ifndef BLOCKJOB_H
 #define BLOCKJOB_H
 
+#include "qapi/qapi-types-block-core.h"
 #include "qemu/job.h"
-#include "block/block.h"
 #include "qemu/ratelimit.h"
 
 #define BLOCK_JOB_SLICE_TIME 100000000ULL /* ns */
diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index 6bd9ae2b20..f008446285 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -27,7 +27,6 @@
 #define BLOCKJOB_INT_H
 
 #include "block/blockjob.h"
-#include "block/block.h"
 
 /**
  * BlockJobDriver:
diff --git a/include/block/qapi.h b/include/block/qapi.h
index 22c7807c89..865fb974d4 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -25,8 +25,8 @@
 #ifndef BLOCK_QAPI_H
 #define BLOCK_QAPI_H
 
-#include "block/block.h"
 #include "block/snapshot.h"
+#include "qapi/qapi-types-block-core.h"
 
 BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
                                         BlockDriverState *bs,
diff --git a/include/block/thread-pool.h b/include/block/thread-pool.h
index 2020bcc92d..95ff2b0bdb 100644
--- a/include/block/thread-pool.h
+++ b/include/block/thread-pool.h
@@ -18,7 +18,7 @@
 #ifndef QEMU_THREAD_POOL_H
 #define QEMU_THREAD_POOL_H
 
-#include "block/block.h"
+#include "block/aio.h"
 
 #define THREAD_POOL_MAX_THREADS_DEFAULT         64
 
diff --git a/include/block/throttle-groups.h b/include/block/throttle-groups.h
index 9541b32432..ff282fc0f8 100644
--- a/include/block/throttle-groups.h
+++ b/include/block/throttle-groups.h
@@ -25,8 +25,8 @@
 #ifndef THROTTLE_GROUPS_H
 #define THROTTLE_GROUPS_H
 
+#include "qemu/coroutine.h"
 #include "qemu/throttle.h"
-#include "block/block_int.h"
 #include "qom/object.h"
 
 /* The ThrottleGroupMember structure indicates membership in a ThrottleGroup
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 50f5aa2e07..a878ac4cc0 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -14,6 +14,7 @@
 #define BLOCK_BACKEND_IO_H
 
 #include "block-backend-common.h"
+#include "block/accounting.h"
 
 /*
  * I/O API functions. These functions are thread-safe.
diff --git a/block.c b/block.c
index a18f052374..65619d2c79 100644
--- a/block.c
+++ b/block.c
@@ -27,6 +27,7 @@
 #include "block/trace.h"
 #include "block/block_int.h"
 #include "block/blockjob.h"
+#include "block/dirty-bitmap.h"
 #include "block/fuse.h"
 #include "block/nbd.h"
 #include "block/qdict.h"
diff --git a/block/amend.c b/block/amend.c
index f696a006e3..bc4bb7b416 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qemu/job.h"
 #include "qemu/main-loop.h"
diff --git a/block/backup.c b/block/backup.c
index 6a9ad97a53..824d39acaa 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -20,6 +20,7 @@
 #include "block/blockjob_int.h"
 #include "block/block_backup.h"
 #include "block/block-copy.h"
+#include "block/dirty-bitmap.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/cutils.h"
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 4265ca125e..e874af628d 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/config-file.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "qemu/module.h"
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index cef9efe55d..a5bf767184 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/sockets.h" /* for EINPROGRESS on Windows */
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 76a0b8d12a..e3b6a3efb2 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/module.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "sysemu/replay.h"
 #include "qapi/error.h"
diff --git a/block/blkverify.c b/block/blkverify.c
index c60a2dc624..0e78bc9dd6 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/sockets.h" /* for EINPROGRESS on Windows */
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
diff --git a/block/block-copy.c b/block/block-copy.c
index bb947afdda..cf0de60cce 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -17,10 +17,14 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "block/block-copy.h"
+#include "block/block_int-io.h"
+#include "block/dirty-bitmap.h"
 #include "block/reqlist.h"
 #include "sysemu/block-backend.h"
 #include "qemu/units.h"
+#include "qemu/co-shared-resource.h"
 #include "qemu/coroutine.h"
+#include "qemu/ratelimit.h"
 #include "block/aio_task.h"
 #include "qemu/error-report.h"
 #include "qemu/memalign.h"
diff --git a/block/bochs.c b/block/bochs.c
index e30e3908d9..46e7958316 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -24,6 +24,7 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qemu/bswap.h"
diff --git a/block/cloop.c b/block/cloop.c
index 3ff975a94d..1e5a52d6b2 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qemu/bswap.h"
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4abaa7339e..c1c903f251 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -32,6 +32,7 @@
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "block/block-copy.h"
+#include "block/dirty-bitmap.h"
 
 #include "block/copy-before-write.h"
 #include "block/reqlist.h"
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 815ac1d835..13ed4150a6 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
diff --git a/block/curl.c b/block/curl.c
index cba4c4cac7..bf45fa3244 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -27,6 +27,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index bf3dc0512a..6672ae5c84 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -24,8 +24,10 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "trace.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/blockjob.h"
+#include "block/dirty-bitmap.h"
 #include "qemu/main-loop.h"
 
 struct BdrvDirtyBitmap {
diff --git a/block/dmg.c b/block/dmg.c
index 675e840ca5..e10b9a2ba5 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -23,6 +23,7 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qemu/bswap.h"
 #include "qemu/error-report.h"
diff --git a/block/export/fuse.c b/block/export/fuse.c
index 1b26ddfcf3..e5fc4af165 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -21,12 +21,13 @@
 #include "qemu/osdep.h"
 #include "qemu/memalign.h"
 #include "block/aio.h"
-#include "block/block.h"
+#include "block/block_int-common.h"
 #include "block/export.h"
 #include "block/fuse.h"
 #include "block/qapi.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block.h"
+#include "qemu/main-loop.h"
 #include "sysemu/block-backend.h"
 
 #include <fuse.h>
diff --git a/block/file-posix.c b/block/file-posix.c
index b9647c5ffc..865f042cba 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
diff --git a/block/file-win32.c b/block/file-win32.c
index ec9d64d0e4..12be9c3d0f 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 305716c86c..0ff8d28661 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -22,6 +22,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
diff --git a/block/gluster.c b/block/gluster.c
index 7c90f7ba4b..d94a58ce80 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include <glusterfs/api/glfs.h>
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "qapi/error.h"
diff --git a/block/io.c b/block/io.c
index b9424024f9..28904fe6d6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -30,6 +30,7 @@
 #include "block/blockjob_int.h"
 #include "block/block_int.h"
 #include "block/coroutines.h"
+#include "block/dirty-bitmap.h"
 #include "block/write-threshold.h"
 #include "qemu/cutils.h"
 #include "qemu/memalign.h"
diff --git a/block/iscsi.c b/block/iscsi.c
index a316d46d96..c16c592042 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -33,6 +33,7 @@
 #include "qemu/error-report.h"
 #include "qemu/bitops.h"
 #include "qemu/bitmap.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "scsi/constants.h"
diff --git a/block/mirror.c b/block/mirror.c
index 251adc5ae0..634815d78d 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -18,6 +18,7 @@
 #include "trace.h"
 #include "block/blockjob_int.h"
 #include "block/block_int.h"
+#include "block/dirty-bitmap.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 282363606f..55f778f5af 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -32,7 +32,9 @@
 
 #include "qemu/osdep.h"
 
+#include "block/block-io.h"
 #include "block/block_int.h"
+#include "block/dirty-bitmap.h"
 #include "qapi/qapi-commands-block.h"
 #include "qapi/error.h"
 
diff --git a/block/nfs.c b/block/nfs.c
index ece22353ac..5e288dfc83 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -30,6 +30,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "trace.h"
diff --git a/block/null.c b/block/null.c
index 75f7d0db40..306e605fa1 100644
--- a/block/null.c
+++ b/block/null.c
@@ -16,6 +16,7 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "sysemu/replay.h"
 
diff --git a/block/nvme.c b/block/nvme.c
index 656624c585..1f1367640a 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -23,6 +23,7 @@
 #include "qemu/option.h"
 #include "qemu/memalign.h"
 #include "qemu/vfio-helpers.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "sysemu/replay.h"
 #include "trace.h"
diff --git a/block/parallels-ext.c b/block/parallels-ext.c
index c9dbbf5089..8a109f005a 100644
--- a/block/parallels-ext.c
+++ b/block/parallels-ext.c
@@ -25,7 +25,9 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
+#include "block/dirty-bitmap.h"
 #include "parallels.h"
 #include "crypto/hash.h"
 #include "qemu/uuid.h"
diff --git a/block/preallocate.c b/block/preallocate.c
index d50ee7f49b..a51fc08515 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -30,6 +30,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 
 
diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
index 680c7ee342..76c459932c 100644
--- a/block/qapi-sysemu.c
+++ b/block/qapi-sysemu.c
@@ -32,6 +32,7 @@
 
 #include "qemu/osdep.h"
 
+#include "block/block_int.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qmp/qdict.h"
diff --git a/block/qapi.c b/block/qapi.c
index cf557e3aea..499fc1c362 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -26,6 +26,7 @@
 #include "qemu/cutils.h"
 #include "block/qapi.h"
 #include "block/block_int.h"
+#include "block/dirty-bitmap.h"
 #include "block/throttle-groups.h"
 #include "block/write-threshold.h"
 #include "qapi/error.h"
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index bcad567c0c..385260a1b5 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -26,6 +26,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
+#include "block/dirty-bitmap.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 
diff --git a/block/qcow2-cache.c b/block/qcow2-cache.c
index 54b2d5f4de..01c67bdddc 100644
--- a/block/qcow2-cache.c
+++ b/block/qcow2-cache.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
 #include "qemu/memalign.h"
 #include "qcow2.h"
 #include "trace.h"
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 40ed847f97..870be106b6 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include <zlib.h>
 
+#include "block/block-io.h"
 #include "qapi/error.h"
 #include "qcow2.h"
 #include "qemu/bswap.h"
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 81264740f0..5ffbefee2e 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
 #include "qapi/error.h"
 #include "qcow2.h"
 #include "qemu/range.h"
diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 1914baf456..953bbe6df8 100644
--- a/block/qcow2-threads.c
+++ b/block/qcow2-threads.c
@@ -34,6 +34,7 @@
 #endif
 
 #include "qcow2.h"
+#include "block/block-io.h"
 #include "block/thread-pool.h"
 #include "crypto.h"
 
diff --git a/block/qcow2.c b/block/qcow2.c
index 4d6666d3ff..3d9e0e2394 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -43,6 +43,7 @@
 #include "qapi/qapi-visit-block-core.h"
 #include "crypto.h"
 #include "block/aio_task.h"
+#include "block/dirty-bitmap.h"
 
 /*
   Differences with QCOW:
diff --git a/block/qed-check.c b/block/qed-check.c
index 418033ee24..a6612be00f 100644
--- a/block/qed-check.c
+++ b/block/qed-check.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
 #include "qed.h"
 
 typedef struct {
diff --git a/block/qed-table.c b/block/qed-table.c
index aa203f2627..e41c87a157 100644
--- a/block/qed-table.c
+++ b/block/qed-table.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
 #include "trace.h"
 #include "qemu/sockets.h" /* for EINPROGRESS on Windows */
 #include "qed.h"
diff --git a/block/raw-format.c b/block/raw-format.c
index a68014ef0b..254d660a76 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -27,6 +27,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
diff --git a/block/rbd.c b/block/rbd.c
index f826410f40..c787f0f1d4 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -18,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "crypto/secret.h"
diff --git a/block/ssh.c b/block/ssh.c
index 04726d4ecb..d82455d8ca 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -27,6 +27,7 @@
 #include <libssh/libssh.h>
 #include <libssh/sftp.h>
 
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "qapi/error.h"
diff --git a/block/throttle.c b/block/throttle.c
index 131eba3ab4..52298e10bb 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -18,6 +18,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
+#include "block/block_int.h"
 #include "block/throttle-groups.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 572582b87b..c48cf65d62 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "qemu/error-report.h"
 #include "qemu/bswap.h"
diff --git a/block/vvfat.c b/block/vvfat.c
index 723c91216e..d7d775bd2c 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -27,6 +27,7 @@
 #include <dirent.h>
 #include <glib/gstdio.h>
 #include "qapi/error.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "qemu/module.h"
diff --git a/block/win32-aio.c b/block/win32-aio.c
index aadc7b1bc3..ee87d6048f 100644
--- a/block/win32-aio.c
+++ b/block/win32-aio.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/aio.h"
 #include "block/raw-aio.h"
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 35cafbc22d..76d8885677 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block-io.h"
 #include "block/block_int.h"
 #include "block/write-threshold.h"
 #include "qapi/error.h"
diff --git a/blockdev.c b/blockdev.c
index 3f1dec6242..fa55131ff3 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -35,6 +35,7 @@
 #include "sysemu/blockdev.h"
 #include "hw/block/block.h"
 #include "block/blockjob.h"
+#include "block/dirty-bitmap.h"
 #include "block/qdict.h"
 #include "block/throttle-groups.h"
 #include "monitor/monitor.h"
diff --git a/blockjob.c b/blockjob.c
index c3d3e14a92..0f6607938a 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/aio-wait.h"
 #include "block/block.h"
 #include "block/blockjob_int.h"
 #include "block/block_int.h"
diff --git a/hw/block/block.c b/hw/block/block.c
index f9c4fe6767..ddcef71f80 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block_int-common.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/block-backend.h"
 #include "hw/block/block.h"
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index ccad2c43a3..ab3c4ec346 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/block_int-common.h"
 #include "qemu/units.h"
 #include "cpu.h"
 #include "hw/boards.h"
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index a1abfe0e1b..dff402f08f 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/iov.h"
 #include "qemu/main-loop.h"
 #include "hw/virtio/virtio-pmem.h"
 #include "hw/qdev-properties.h"
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9aba7d9c22..3fc7f0a40c 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -61,6 +61,7 @@
 #include "qemu/osdep.h"
 #include "block/block.h"
 #include "block/block_int.h"
+#include "block/dirty-bitmap.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/runstate.h"
 #include "qemu/main-loop.h"
diff --git a/migration/block.c b/migration/block.c
index 4347da1526..5da15a62de 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -20,6 +20,7 @@
 #include "qemu/cutils.h"
 #include "qemu/queue.h"
 #include "block.h"
+#include "block/dirty-bitmap.h"
 #include "migration/misc.h"
 #include "migration.h"
 #include "migration/register.h"
diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..a783789430 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -52,6 +52,7 @@
 #include "exec/target_page.h"
 #include "trace.h"
 #include "qemu/iov.h"
+#include "qemu/job.h"
 #include "qemu/main-loop.h"
 #include "block/snapshot.h"
 #include "qemu/cutils.h"
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 81c8fdadf8..5a440fa372 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -14,6 +14,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/blockjob.h"
 #include "qemu/cutils.h"
 #include "qemu/option.h"
 #include "monitor/monitor.h"
diff --git a/nbd/server.c b/nbd/server.c
index ada16089f3..aa1b3eb9f8 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -19,7 +19,9 @@
 
 #include "qemu/osdep.h"
 
+#include "block/block_int.h"
 #include "block/export.h"
+#include "block/dirty-bitmap.h"
 #include "qapi/error.h"
 #include "qemu/queue.h"
 #include "trace.h"
diff --git a/qemu-img.c b/qemu-img.c
index a9b3a8103c..32415ff23e 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -48,6 +48,7 @@
 #include "sysemu/block-backend.h"
 #include "block/block_int.h"
 #include "block/blockjob.h"
+#include "block/dirty-bitmap.h"
 #include "block/qapi.h"
 #include "crypto/init.h"
 #include "trace/control.h"
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 5a584a8d57..9cbc8172b5 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -34,6 +34,7 @@
 #include "sysemu/hw_accel.h"
 #include "exec/cpu-common.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "qemu/plugin.h"
 #include "sysemu/cpus.h"
 #include "qemu/guest-random.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 1b606a3002..5145a36cfb 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -23,6 +23,7 @@
 
 #include "qemu/cutils.h"
 #include "qemu/cacheflush.h"
+#include "qemu/hbitmap.h"
 #include "qemu/madvise.h"
 
 #ifdef CONFIG_TCG
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 7718f6dcda..da19498c66 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -48,6 +48,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/help_option.h"
+#include "qemu/job.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a213209379..5c5e478495 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -37,6 +37,7 @@
 #include "exec/gdbstub.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
+#include "qemu/ratelimit.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/memalign.h"
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 09dc4a4891..dab1df167f 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "block/block.h"
+#include "block/block_int.h"
 #include "block/blockjob_int.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 8ca5adec5e..ff5147f619 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "block/block.h"
+#include "block/block_int-global-state.h"
 #include "block/blockjob_int.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
-- 
2.37.3


