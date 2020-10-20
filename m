Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE86282582
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 19:20:00 +0200 (CEST)
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOlCR-0001MG-NF
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 13:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kOl6H-0002bU-0G
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:13:37 -0400
Received: from mail.ispras.ru ([83.149.199.84]:36034)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kOl6F-0008HY-1g
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:13:36 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id E48D94089F1F;
 Sat,  3 Oct 2020 17:13:32 +0000 (UTC)
Subject: [PATCH v7 08/14] replay: implement replay-seek command
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Sat, 03 Oct 2020 20:13:31 +0300
Message-ID: <160174521180.12451.14033112911009278753.stgit@pasha-ThinkPad-X280>
In-Reply-To: <160174516520.12451.10785284392438702137.stgit@pasha-ThinkPad-X280>
References: <160174516520.12451.10785284392438702137.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/03 13:12:47
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

This patch adds hmp/qmp commands replay_seek/replay-seek that proceed
the execution to the specified instruction count.
The command automatically loads nearest snapshot and replays the execution
to find the desired instruction count.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Acked-by: Markus Armbruster <armbru@redhat.com>

--

v4 changes:
 - fixed HMP command description indent
 - removed useless error_free call
---
 hmp-commands.hx           |   18 +++++++++
 include/monitor/hmp.h     |    1 +
 qapi/replay.json          |   20 ++++++++++
 replay/replay-debugging.c |   87 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 7680d0b380..e43ce600b8 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1836,6 +1836,24 @@ SRST
   The command is ignored when there are no replay breakpoints.
 ERST
 
+    {
+        .name       = "replay_seek",
+        .args_type  = "icount:i",
+        .params     = "icount",
+        .help       = "replay execution to the specified instruction count",
+        .cmd        = hmp_replay_seek,
+    },
+
+SRST
+``replay_seek`` *icount*
+  Automatically proceed to the instruction count *icount*, when
+  replaying the execution. The command automatically loads nearest
+  snapshot and replays the execution to find the desired instruction.
+  When there is no preceding snapshot or the execution is not replayed,
+  then the command fails.
+  *icount* for the reference may be observed with ``info replay`` command.
+ERST
+
     {
         .name       = "info",
         .args_type  = "item:s?",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 809ad638bb..ed2913fd18 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -132,5 +132,6 @@ void hmp_info_sev(Monitor *mon, const QDict *qdict);
 void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
+void hmp_replay_seek(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/qapi/replay.json b/qapi/replay.json
index 173ba76107..bfd83d7591 100644
--- a/qapi/replay.json
+++ b/qapi/replay.json
@@ -99,3 +99,23 @@
 #
 ##
 { 'command': 'replay-delete-break' }
+
+##
+# @replay-seek:
+#
+# Automatically proceed to the instruction count @icount, when
+# replaying the execution. The command automatically loads nearest
+# snapshot and replays the execution to find the desired instruction.
+# When there is no preceding snapshot or the execution is not replayed,
+# then the command fails.
+# icount for the reference may be obtained with @query-replay command.
+#
+# @icount: target instruction count
+#
+# Since: 5.2
+#
+# Example:
+#
+# -> { "execute": "replay-seek", "data": { "icount": 220414 } }
+##
+{ 'command': 'replay-seek', 'data': { 'icount': 'int' } }
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 3dc23b84fc..e1fe6b8661 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -19,6 +19,8 @@
 #include "qapi/qapi-commands-replay.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/timer.h"
+#include "block/snapshot.h"
+#include "migration/snapshot.h"
 
 void hmp_info_replay(Monitor *mon, const QDict *qdict)
 {
@@ -125,3 +127,88 @@ void hmp_replay_delete_break(Monitor *mon, const QDict *qdict)
         return;
     }
 }
+
+static char *replay_find_nearest_snapshot(int64_t icount,
+                                          int64_t *snapshot_icount)
+{
+    BlockDriverState *bs;
+    QEMUSnapshotInfo *sn_tab;
+    QEMUSnapshotInfo *nearest = NULL;
+    char *ret = NULL;
+    int nb_sns, i;
+    AioContext *aio_context;
+
+    *snapshot_icount = -1;
+
+    bs = bdrv_all_find_vmstate_bs();
+    if (!bs) {
+        goto fail;
+    }
+    aio_context = bdrv_get_aio_context(bs);
+
+    aio_context_acquire(aio_context);
+    nb_sns = bdrv_snapshot_list(bs, &sn_tab);
+    aio_context_release(aio_context);
+
+    for (i = 0; i < nb_sns; i++) {
+        if (bdrv_all_find_snapshot(sn_tab[i].name, &bs) == 0) {
+            if (sn_tab[i].icount != -1ULL
+                && sn_tab[i].icount <= icount
+                && (!nearest || nearest->icount < sn_tab[i].icount)) {
+                nearest = &sn_tab[i];
+            }
+        }
+    }
+    if (nearest) {
+        ret = g_strdup(nearest->name);
+        *snapshot_icount = nearest->icount;
+    }
+    g_free(sn_tab);
+
+fail:
+    return ret;
+}
+
+static void replay_seek(int64_t icount, QEMUTimerCB callback, Error **errp)
+{
+    char *snapshot = NULL;
+    int64_t snapshot_icount;
+
+    if (replay_mode != REPLAY_MODE_PLAY) {
+        error_setg(errp, "replay must be enabled to seek");
+        return;
+    }
+
+    snapshot = replay_find_nearest_snapshot(icount, &snapshot_icount);
+    if (snapshot) {
+        if (icount < replay_get_current_icount()
+            || replay_get_current_icount() < snapshot_icount) {
+            vm_stop(RUN_STATE_RESTORE_VM);
+            load_snapshot(snapshot, errp);
+        }
+        g_free(snapshot);
+    }
+    if (replay_get_current_icount() <= icount) {
+        replay_break(icount, callback, NULL);
+        vm_start();
+    } else {
+        error_setg(errp, "cannot seek to the specified instruction count");
+    }
+}
+
+void qmp_replay_seek(int64_t icount, Error **errp)
+{
+    replay_seek(icount, replay_stop_vm, errp);
+}
+
+void hmp_replay_seek(Monitor *mon, const QDict *qdict)
+{
+    int64_t icount = qdict_get_try_int(qdict, "icount", -1LL);
+    Error *err = NULL;
+
+    qmp_replay_seek(icount, &err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+}


