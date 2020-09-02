Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AD325A7A4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 10:18:54 +0200 (CEST)
Received: from localhost ([::1]:48246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDNyn-0005s2-Iz
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 04:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kDNwF-0001U2-E6
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:16:15 -0400
Received: from mail.ispras.ru ([83.149.199.84]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kDNwC-00030a-SL
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:16:15 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id ABB0C40A2055;
 Wed,  2 Sep 2020 08:16:10 +0000 (UTC)
Subject: [PATCH v3 04/15] migration: introduce icount field for snapshots
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Wed, 02 Sep 2020 11:16:10 +0300
Message-ID: <159903457037.28509.3086288532165346082.stgit@pasha-ThinkPad-X280>
In-Reply-To: <159903454714.28509.7439453309116734374.stgit@pasha-ThinkPad-X280>
References: <159903454714.28509.7439453309116734374.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 04:15:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, pavel.dovgalyuk@ispras.ru,
 ehabkost@redhat.com, alex.bennee@linaro.org, mtosatti@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

Saving icount as a parameters of the snapshot allows navigation between
them in the execution replay scenario.
This information can be used for finding a specific snapshot for proceeding
the recorded execution to the specific moment of the time.
E.g., 'reverse step' action (introduced in one of the following patches)
needs to load the nearest snapshot which is prior to the current moment
of time.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Acked-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qapi.c             |   18 ++++++++++++++----
 block/qcow2-snapshot.c   |    2 ++
 blockdev.c               |   10 ++++++++++
 include/block/snapshot.h |    1 +
 migration/savevm.c       |    5 +++++
 qapi/block-core.json     |   10 ++++++++--
 stubs/replay.c           |    5 +++++
 7 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index afd9f3b4a7..3c73db54c4 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -226,6 +226,8 @@ int bdrv_query_snapshot_info_list(BlockDriverState *bs,
         info->date_nsec     = sn_tab[i].date_nsec;
         info->vm_clock_sec  = sn_tab[i].vm_clock_nsec / 1000000000;
         info->vm_clock_nsec = sn_tab[i].vm_clock_nsec % 1000000000;
+        info->icount        = sn_tab[i].icount;
+        info->has_icount    = sn_tab[i].icount != -1ULL;
 
         info_list = g_new0(SnapshotInfoList, 1);
         info_list->value = info;
@@ -658,14 +660,15 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
 void bdrv_snapshot_dump(QEMUSnapshotInfo *sn)
 {
     char date_buf[128], clock_buf[128];
+    char icount_buf[128] = {0};
     struct tm tm;
     time_t ti;
     int64_t secs;
     char *sizing = NULL;
 
     if (!sn) {
-        qemu_printf("%-10s%-20s%11s%20s%15s",
-                    "ID", "TAG", "VM SIZE", "DATE", "VM CLOCK");
+        qemu_printf("%-10s%-18s%7s%20s%13s%11s",
+                    "ID", "TAG", "VM SIZE", "DATE", "VM CLOCK", "ICOUNT");
     } else {
         ti = sn->date_sec;
         localtime_r(&ti, &tm);
@@ -679,11 +682,16 @@ void bdrv_snapshot_dump(QEMUSnapshotInfo *sn)
                  (int)(secs % 60),
                  (int)((sn->vm_clock_nsec / 1000000) % 1000));
         sizing = size_to_str(sn->vm_state_size);
-        qemu_printf("%-10s%-20s%11s%20s%15s",
+        if (sn->icount != -1ULL) {
+            snprintf(icount_buf, sizeof(icount_buf),
+                "%"PRId64, sn->icount);
+        }
+        qemu_printf("%-10s%-18s%7s%20s%13s%11s",
                     sn->id_str, sn->name,
                     sizing,
                     date_buf,
-                    clock_buf);
+                    clock_buf,
+                    icount_buf);
     }
     g_free(sizing);
 }
@@ -845,6 +853,8 @@ void bdrv_image_info_dump(ImageInfo *info)
                 .date_nsec = elem->value->date_nsec,
                 .vm_clock_nsec = elem->value->vm_clock_sec * 1000000000ULL +
                                  elem->value->vm_clock_nsec,
+                .icount = elem->value->has_icount ?
+                          elem->value->icount : -1ULL,
             };
 
             pstrcpy(sn.id_str, sizeof(sn.id_str), elem->value->id);
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index d14e7be1aa..4b127ea6af 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -663,6 +663,7 @@ int qcow2_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
     sn->date_sec = sn_info->date_sec;
     sn->date_nsec = sn_info->date_nsec;
     sn->vm_clock_nsec = sn_info->vm_clock_nsec;
+    sn->icount = sn_info->icount;
     sn->extra_data_size = sizeof(QCowSnapshotExtraData);
 
     /* Allocate the L1 table of the snapshot and copy the current one there. */
@@ -1007,6 +1008,7 @@ int qcow2_snapshot_list(BlockDriverState *bs, QEMUSnapshotInfo **psn_tab)
         sn_info->date_sec = sn->date_sec;
         sn_info->date_nsec = sn->date_nsec;
         sn_info->vm_clock_nsec = sn->vm_clock_nsec;
+        sn_info->icount = sn->icount;
     }
     *psn_tab = sn_tab;
     return s->nb_snapshots;
diff --git a/blockdev.c b/blockdev.c
index 3848a9c8ab..622a436c94 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -59,6 +59,7 @@
 #include "sysemu/arch_init.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
+#include "sysemu/replay.h"
 #include "qemu/cutils.h"
 #include "qemu/help_option.h"
 #include "qemu/main-loop.h"
@@ -1190,6 +1191,10 @@ SnapshotInfo *qmp_blockdev_snapshot_delete_internal_sync(const char *device,
     info->vm_state_size = sn.vm_state_size;
     info->vm_clock_nsec = sn.vm_clock_nsec % 1000000000;
     info->vm_clock_sec = sn.vm_clock_nsec / 1000000000;
+    if (sn.icount != -1ULL) {
+        info->icount = sn.icount;
+        info->has_icount = true;
+    }
 
     return info;
 
@@ -1350,6 +1355,11 @@ static void internal_snapshot_prepare(BlkActionState *common,
     sn->date_sec = tv.tv_sec;
     sn->date_nsec = tv.tv_usec * 1000;
     sn->vm_clock_nsec = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    if (replay_mode != REPLAY_MODE_NONE) {
+        sn->icount = replay_get_current_icount();
+    } else {
+        sn->icount = -1ULL;
+    }
 
     ret1 = bdrv_snapshot_create(bs, sn);
     if (ret1 < 0) {
diff --git a/include/block/snapshot.h b/include/block/snapshot.h
index 2bfcd57578..b0fe42993d 100644
--- a/include/block/snapshot.h
+++ b/include/block/snapshot.h
@@ -42,6 +42,7 @@ typedef struct QEMUSnapshotInfo {
     uint32_t date_sec; /* UTC date of the snapshot */
     uint32_t date_nsec;
     uint64_t vm_clock_nsec; /* VM clock relative to boot */
+    uint64_t icount; /* record/replay step */
 } QEMUSnapshotInfo;
 
 int bdrv_snapshot_find(BlockDriverState *bs, QEMUSnapshotInfo *sn_info,
diff --git a/migration/savevm.c b/migration/savevm.c
index 304d98ff78..74378f8ebd 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2723,6 +2723,11 @@ int save_snapshot(const char *name, Error **errp)
     sn->date_sec = tv.tv_sec;
     sn->date_nsec = tv.tv_usec * 1000;
     sn->vm_clock_nsec = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    if (replay_mode != REPLAY_MODE_NONE) {
+        sn->icount = replay_get_current_icount();
+    } else {
+        sn->icount = -1ULL;
+    }
 
     if (name) {
         ret = bdrv_snapshot_find(bs, old_sn, name);
diff --git a/qapi/block-core.json b/qapi/block-core.json
index db08c58d78..0d8265a78e 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -27,13 +27,18 @@
 #
 # @vm-clock-nsec: fractional part in nano seconds to be used with vm-clock-sec
 #
+# @icount: Current instruction count. Appears when execution record/replay
+#          is enabled. Used for "time-traveling" to match the moment
+#          in the recorded execution with the snapshots. (since 5.2)
+#
 # Since: 1.3
 #
 ##
 { 'struct': 'SnapshotInfo',
   'data': { 'id': 'str', 'name': 'str', 'vm-state-size': 'int',
             'date-sec': 'int', 'date-nsec': 'int',
-            'vm-clock-sec': 'int', 'vm-clock-nsec': 'int' } }
+            'vm-clock-sec': 'int', 'vm-clock-nsec': 'int',
+            '*icount': 'int' } }
 
 ##
 # @ImageInfoSpecificQCow2EncryptionBase:
@@ -5519,7 +5524,8 @@
 #                    "date-sec": 1000012,
 #                    "date-nsec": 10,
 #                    "vm-clock-sec": 100,
-#                    "vm-clock-nsec": 20
+#                    "vm-clock-nsec": 20,
+#                    "icount": 220414
 #      }
 #    }
 #
diff --git a/stubs/replay.c b/stubs/replay.c
index 5974ec1f50..eacb366aa8 100644
--- a/stubs/replay.c
+++ b/stubs/replay.c
@@ -88,3 +88,8 @@ int replay_read_random(void *buf, size_t len)
 {
     return 0;
 }
+
+uint64_t replay_get_current_icount(void)
+{
+    return 0;
+}


