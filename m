Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360617D2E6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Mar 2020 10:30:42 +0100 (CET)
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAsGf-0003pu-I1
	for lists+qemu-devel@lfdr.de; Sun, 08 Mar 2020 05:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jAsBY-0003fC-GX
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 05:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1jAsBV-0000Ej-8d
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 05:25:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28176
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1jAsBV-0000EX-3L
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 05:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583659520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+yO139i+hn7PfOJhB1m/WxK+oxaY6buL5siIDKC+HE=;
 b=BXuqkajNS1o0dMhuJPSPZ7Tlx6ShEs95Db6ZTkTwO2mp0O6Xkoxk8GPBMR7yk4t3z+7Wzo
 iNM8ry29bx3CjLjnOw0OuhfuQMgUnUBcYMLYJCuqgm0wU5Jg4HKkPykAUia3W8xsP+3RMI
 n4IVNuUqrSkzmJZ2bv0h6+LcdfIj5nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-naY0NY3NNCujlk567qHVRA-1; Sun, 08 Mar 2020 05:25:17 -0400
X-MC-Unique: naY0NY3NNCujlk567qHVRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D086A108443A;
 Sun,  8 Mar 2020 09:25:16 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CD3B10027B8;
 Sun,  8 Mar 2020 09:25:14 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/11] monitor/hmp: move hmp_info_block* to block-hmp-cmds.c
Date: Sun,  8 Mar 2020 11:24:39 +0200
Message-Id: <20200308092440.23564-11-mlevitsk@redhat.com>
In-Reply-To: <20200308092440.23564-1-mlevitsk@redhat.com>
References: <20200308092440.23564-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 block/monitor/block-hmp-cmds.c | 389 +++++++++++++++++++++++++++++++++
 include/block/block-hmp-cmds.h |   4 +
 include/monitor/hmp.h          |   4 -
 monitor/hmp-cmds.c             | 388 --------------------------------
 4 files changed, 393 insertions(+), 392 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.=
c
index 5beb7df2f7..aebf1dce0d 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -46,10 +46,12 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/sockets.h"
+#include "qemu/cutils.h"
 #include "sysemu/sysemu.h"
 #include "monitor/monitor.h"
 #include "monitor/hmp.h"
 #include "block/nbd.h"
+#include "block/qapi.h"
 #include "block/block_int.h"
 #include "block/block-hmp-cmds.h"
 #include "qemu-io.h"
@@ -594,3 +596,390 @@ fail:
     blk_unref(local_blk);
     hmp_handle_error(mon, err);
 }
+
+static void print_block_info(Monitor *mon, BlockInfo *info,
+                             BlockDeviceInfo *inserted, bool verbose)
+{
+    ImageInfo *image_info;
+
+    assert(!info || !info->has_inserted || info->inserted =3D=3D inserted)=
;
+
+    if (info && *info->device) {
+        monitor_printf(mon, "%s", info->device);
+        if (inserted && inserted->has_node_name) {
+            monitor_printf(mon, " (%s)", inserted->node_name);
+        }
+    } else {
+        assert(info || inserted);
+        monitor_printf(mon, "%s",
+                       inserted && inserted->has_node_name ? inserted->nod=
e_name
+                       : info && info->has_qdev ? info->qdev
+                       : "<anonymous>");
+    }
+
+    if (inserted) {
+        monitor_printf(mon, ": %s (%s%s%s)\n",
+                       inserted->file,
+                       inserted->drv,
+                       inserted->ro ? ", read-only" : "",
+                       inserted->encrypted ? ", encrypted" : "");
+    } else {
+        monitor_printf(mon, ": [not inserted]\n");
+    }
+
+    if (info) {
+        if (info->has_qdev) {
+            monitor_printf(mon, "    Attached to:      %s\n", info->qdev);
+        }
+        if (info->has_io_status && info->io_status !=3D BLOCK_DEVICE_IO_ST=
ATUS_OK) {
+            monitor_printf(mon, "    I/O status:       %s\n",
+                           BlockDeviceIoStatus_str(info->io_status));
+        }
+
+        if (info->removable) {
+            monitor_printf(mon, "    Removable device: %slocked, tray %s\n=
",
+                           info->locked ? "" : "not ",
+                           info->tray_open ? "open" : "closed");
+        }
+    }
+
+
+    if (!inserted) {
+        return;
+    }
+
+    monitor_printf(mon, "    Cache mode:       %s%s%s\n",
+                   inserted->cache->writeback ? "writeback" : "writethroug=
h",
+                   inserted->cache->direct ? ", direct" : "",
+                   inserted->cache->no_flush ? ", ignore flushes" : "");
+
+    if (inserted->has_backing_file) {
+        monitor_printf(mon,
+                       "    Backing file:     %s "
+                       "(chain depth: %" PRId64 ")\n",
+                       inserted->backing_file,
+                       inserted->backing_file_depth);
+    }
+
+    if (inserted->detect_zeroes !=3D BLOCKDEV_DETECT_ZEROES_OPTIONS_OFF) {
+        monitor_printf(mon, "    Detect zeroes:    %s\n",
+                BlockdevDetectZeroesOptions_str(inserted->detect_zeroes));
+    }
+
+    if (inserted->bps  || inserted->bps_rd  || inserted->bps_wr  ||
+        inserted->iops || inserted->iops_rd || inserted->iops_wr)
+    {
+        monitor_printf(mon, "    I/O throttling:   bps=3D%" PRId64
+                        " bps_rd=3D%" PRId64  " bps_wr=3D%" PRId64
+                        " bps_max=3D%" PRId64
+                        " bps_rd_max=3D%" PRId64
+                        " bps_wr_max=3D%" PRId64
+                        " iops=3D%" PRId64 " iops_rd=3D%" PRId64
+                        " iops_wr=3D%" PRId64
+                        " iops_max=3D%" PRId64
+                        " iops_rd_max=3D%" PRId64
+                        " iops_wr_max=3D%" PRId64
+                        " iops_size=3D%" PRId64
+                        " group=3D%s\n",
+                        inserted->bps,
+                        inserted->bps_rd,
+                        inserted->bps_wr,
+                        inserted->bps_max,
+                        inserted->bps_rd_max,
+                        inserted->bps_wr_max,
+                        inserted->iops,
+                        inserted->iops_rd,
+                        inserted->iops_wr,
+                        inserted->iops_max,
+                        inserted->iops_rd_max,
+                        inserted->iops_wr_max,
+                        inserted->iops_size,
+                        inserted->group);
+    }
+
+    if (verbose) {
+        monitor_printf(mon, "\nImages:\n");
+        image_info =3D inserted->image;
+        while (1) {
+                bdrv_image_info_dump(image_info);
+            if (image_info->has_backing_image) {
+                image_info =3D image_info->backing_image;
+            } else {
+                break;
+            }
+        }
+    }
+}
+
+void hmp_info_block(Monitor *mon, const QDict *qdict)
+{
+    BlockInfoList *block_list, *info;
+    BlockDeviceInfoList *blockdev_list, *blockdev;
+    const char *device =3D qdict_get_try_str(qdict, "device");
+    bool verbose =3D qdict_get_try_bool(qdict, "verbose", false);
+    bool nodes =3D qdict_get_try_bool(qdict, "nodes", false);
+    bool printed =3D false;
+
+    /* Print BlockBackend information */
+    if (!nodes) {
+        block_list =3D qmp_query_block(NULL);
+    } else {
+        block_list =3D NULL;
+    }
+
+    for (info =3D block_list; info; info =3D info->next) {
+        if (device && strcmp(device, info->value->device)) {
+            continue;
+        }
+
+        if (info !=3D block_list) {
+            monitor_printf(mon, "\n");
+        }
+
+        print_block_info(mon, info->value, info->value->has_inserted
+                                           ? info->value->inserted : NULL,
+                         verbose);
+        printed =3D true;
+    }
+
+    qapi_free_BlockInfoList(block_list);
+
+    if ((!device && !nodes) || printed) {
+        return;
+    }
+
+    /* Print node information */
+    blockdev_list =3D qmp_query_named_block_nodes(false, false, NULL);
+    for (blockdev =3D blockdev_list; blockdev; blockdev =3D blockdev->next=
) {
+        assert(blockdev->value->has_node_name);
+        if (device && strcmp(device, blockdev->value->node_name)) {
+            continue;
+        }
+
+        if (blockdev !=3D blockdev_list) {
+            monitor_printf(mon, "\n");
+        }
+
+        print_block_info(mon, NULL, blockdev->value, verbose);
+    }
+    qapi_free_BlockDeviceInfoList(blockdev_list);
+}
+
+void hmp_info_blockstats(Monitor *mon, const QDict *qdict)
+{
+    BlockStatsList *stats_list, *stats;
+
+    stats_list =3D qmp_query_blockstats(false, false, NULL);
+
+    for (stats =3D stats_list; stats; stats =3D stats->next) {
+        if (!stats->value->has_device) {
+            continue;
+        }
+
+        monitor_printf(mon, "%s:", stats->value->device);
+        monitor_printf(mon, " rd_bytes=3D%" PRId64
+                       " wr_bytes=3D%" PRId64
+                       " rd_operations=3D%" PRId64
+                       " wr_operations=3D%" PRId64
+                       " flush_operations=3D%" PRId64
+                       " wr_total_time_ns=3D%" PRId64
+                       " rd_total_time_ns=3D%" PRId64
+                       " flush_total_time_ns=3D%" PRId64
+                       " rd_merged=3D%" PRId64
+                       " wr_merged=3D%" PRId64
+                       " idle_time_ns=3D%" PRId64
+                       "\n",
+                       stats->value->stats->rd_bytes,
+                       stats->value->stats->wr_bytes,
+                       stats->value->stats->rd_operations,
+                       stats->value->stats->wr_operations,
+                       stats->value->stats->flush_operations,
+                       stats->value->stats->wr_total_time_ns,
+                       stats->value->stats->rd_total_time_ns,
+                       stats->value->stats->flush_total_time_ns,
+                       stats->value->stats->rd_merged,
+                       stats->value->stats->wr_merged,
+                       stats->value->stats->idle_time_ns);
+    }
+
+    qapi_free_BlockStatsList(stats_list);
+}
+
+void hmp_info_block_jobs(Monitor *mon, const QDict *qdict)
+{
+    BlockJobInfoList *list;
+    Error *err =3D NULL;
+
+    list =3D qmp_query_block_jobs(&err);
+    assert(!err);
+
+    if (!list) {
+        monitor_printf(mon, "No active jobs\n");
+        return;
+    }
+
+    while (list) {
+        if (strcmp(list->value->type, "stream") =3D=3D 0) {
+            monitor_printf(mon, "Streaming device %s: Completed %" PRId64
+                           " of %" PRId64 " bytes, speed limit %" PRId64
+                           " bytes/s\n",
+                           list->value->device,
+                           list->value->offset,
+                           list->value->len,
+                           list->value->speed);
+        } else {
+            monitor_printf(mon, "Type %s, device %s: Completed %" PRId64
+                           " of %" PRId64 " bytes, speed limit %" PRId64
+                           " bytes/s\n",
+                           list->value->type,
+                           list->value->device,
+                           list->value->offset,
+                           list->value->len,
+                           list->value->speed);
+        }
+        list =3D list->next;
+    }
+
+    qapi_free_BlockJobInfoList(list);
+}
+
+void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
+{
+    BlockDriverState *bs, *bs1;
+    BdrvNextIterator it1;
+    QEMUSnapshotInfo *sn_tab, *sn;
+    bool no_snapshot =3D true;
+    int nb_sns, i;
+    int total;
+    int *global_snapshots;
+    AioContext *aio_context;
+
+    typedef struct SnapshotEntry {
+        QEMUSnapshotInfo sn;
+        QTAILQ_ENTRY(SnapshotEntry) next;
+    } SnapshotEntry;
+
+    typedef struct ImageEntry {
+        const char *imagename;
+        QTAILQ_ENTRY(ImageEntry) next;
+        QTAILQ_HEAD(, SnapshotEntry) snapshots;
+    } ImageEntry;
+
+    QTAILQ_HEAD(, ImageEntry) image_list =3D
+        QTAILQ_HEAD_INITIALIZER(image_list);
+
+    ImageEntry *image_entry, *next_ie;
+    SnapshotEntry *snapshot_entry;
+
+    bs =3D bdrv_all_find_vmstate_bs();
+    if (!bs) {
+        monitor_printf(mon, "No available block device supports snapshots\=
n");
+        return;
+    }
+    aio_context =3D bdrv_get_aio_context(bs);
+
+    aio_context_acquire(aio_context);
+    nb_sns =3D bdrv_snapshot_list(bs, &sn_tab);
+    aio_context_release(aio_context);
+
+    if (nb_sns < 0) {
+        monitor_printf(mon, "bdrv_snapshot_list: error %d\n", nb_sns);
+        return;
+    }
+
+    for (bs1 =3D bdrv_first(&it1); bs1; bs1 =3D bdrv_next(&it1)) {
+        int bs1_nb_sns =3D 0;
+        ImageEntry *ie;
+        SnapshotEntry *se;
+        AioContext *ctx =3D bdrv_get_aio_context(bs1);
+
+        aio_context_acquire(ctx);
+        if (bdrv_can_snapshot(bs1)) {
+            sn =3D NULL;
+            bs1_nb_sns =3D bdrv_snapshot_list(bs1, &sn);
+            if (bs1_nb_sns > 0) {
+                no_snapshot =3D false;
+                ie =3D g_new0(ImageEntry, 1);
+                ie->imagename =3D bdrv_get_device_name(bs1);
+                QTAILQ_INIT(&ie->snapshots);
+                QTAILQ_INSERT_TAIL(&image_list, ie, next);
+                for (i =3D 0; i < bs1_nb_sns; i++) {
+                    se =3D g_new0(SnapshotEntry, 1);
+                    se->sn =3D sn[i];
+                    QTAILQ_INSERT_TAIL(&ie->snapshots, se, next);
+                }
+            }
+            g_free(sn);
+        }
+        aio_context_release(ctx);
+    }
+
+    if (no_snapshot) {
+        monitor_printf(mon, "There is no snapshot available.\n");
+        return;
+    }
+
+    global_snapshots =3D g_new0(int, nb_sns);
+    total =3D 0;
+    for (i =3D 0; i < nb_sns; i++) {
+        SnapshotEntry *next_sn;
+        if (bdrv_all_find_snapshot(sn_tab[i].name, &bs1) =3D=3D 0) {
+            global_snapshots[total] =3D i;
+            total++;
+            QTAILQ_FOREACH(image_entry, &image_list, next) {
+                QTAILQ_FOREACH_SAFE(snapshot_entry, &image_entry->snapshot=
s,
+                                    next, next_sn) {
+                    if (!strcmp(sn_tab[i].name, snapshot_entry->sn.name)) =
{
+                        QTAILQ_REMOVE(&image_entry->snapshots, snapshot_en=
try,
+                                      next);
+                        g_free(snapshot_entry);
+                    }
+                }
+            }
+        }
+    }
+    monitor_printf(mon, "List of snapshots present on all disks:\n");
+
+    if (total > 0) {
+        bdrv_snapshot_dump(NULL);
+        monitor_printf(mon, "\n");
+        for (i =3D 0; i < total; i++) {
+            sn =3D &sn_tab[global_snapshots[i]];
+            /*
+             * The ID is not guaranteed to be the same on all images, so
+             * overwrite it.
+             */
+            pstrcpy(sn->id_str, sizeof(sn->id_str), "--");
+            bdrv_snapshot_dump(sn);
+            monitor_printf(mon, "\n");
+        }
+    } else {
+        monitor_printf(mon, "None\n");
+    }
+
+    QTAILQ_FOREACH(image_entry, &image_list, next) {
+        if (QTAILQ_EMPTY(&image_entry->snapshots)) {
+            continue;
+        }
+        monitor_printf(mon,
+                       "\nList of partial (non-loadable) snapshots on '%s'=
:\n",
+                       image_entry->imagename);
+        bdrv_snapshot_dump(NULL);
+        monitor_printf(mon, "\n");
+        QTAILQ_FOREACH(snapshot_entry, &image_entry->snapshots, next) {
+            bdrv_snapshot_dump(&snapshot_entry->sn);
+            monitor_printf(mon, "\n");
+        }
+    }
+
+    QTAILQ_FOREACH_SAFE(image_entry, &image_list, next, next_ie) {
+        SnapshotEntry *next_sn;
+        QTAILQ_FOREACH_SAFE(snapshot_entry, &image_entry->snapshots, next,
+                            next_sn) {
+            g_free(snapshot_entry);
+        }
+        g_free(image_entry);
+    }
+    g_free(sn_tab);
+    g_free(global_snapshots);
+}
diff --git a/include/block/block-hmp-cmds.h b/include/block/block-hmp-cmds.=
h
index c2d18fba06..3412e108ca 100644
--- a/include/block/block-hmp-cmds.h
+++ b/include/block/block-hmp-cmds.h
@@ -46,5 +46,9 @@ void hmp_eject(Monitor *mon, const QDict *qdict);
=20
 void hmp_qemu_io(Monitor *mon, const QDict *qdict);
=20
+void hmp_info_block(Monitor *mon, const QDict *qdict);
+void hmp_info_blockstats(Monitor *mon, const QDict *qdict);
+void hmp_info_block_jobs(Monitor *mon, const QDict *qdict);
+void hmp_info_snapshots(Monitor *mon, const QDict *qdict);
=20
 #endif
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 47a7cad734..e33ca5a911 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -30,8 +30,6 @@ void hmp_info_migrate_capabilities(Monitor *mon, const QD=
ict *qdict);
 void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict);
 void hmp_info_migrate_cache_size(Monitor *mon, const QDict *qdict);
 void hmp_info_cpus(Monitor *mon, const QDict *qdict);
-void hmp_info_block(Monitor *mon, const QDict *qdict);
-void hmp_info_blockstats(Monitor *mon, const QDict *qdict);
 void hmp_info_vnc(Monitor *mon, const QDict *qdict);
 void hmp_info_spice(Monitor *mon, const QDict *qdict);
 void hmp_info_balloon(Monitor *mon, const QDict *qdict);
@@ -39,7 +37,6 @@ void hmp_info_irq(Monitor *mon, const QDict *qdict);
 void hmp_info_pic(Monitor *mon, const QDict *qdict);
 void hmp_info_rdma(Monitor *mon, const QDict *qdict);
 void hmp_info_pci(Monitor *mon, const QDict *qdict);
-void hmp_info_block_jobs(Monitor *mon, const QDict *qdict);
 void hmp_info_tpm(Monitor *mon, const QDict *qdict);
 void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
 void hmp_quit(Monitor *mon, const QDict *qdict);
@@ -62,7 +59,6 @@ void hmp_balloon(Monitor *mon, const QDict *qdict);
 void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
-void hmp_info_snapshots(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
 void hmp_migrate_incoming(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 99aa31aefa..dc790f1801 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -47,7 +47,6 @@
 #include "qapi/string-output-visitor.h"
 #include "qom/object_interfaces.h"
 #include "ui/console.h"
-#include "block/qapi.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "exec/ramlist.h"
@@ -470,213 +469,6 @@ void hmp_info_migrate_cache_size(Monitor *mon, const =
QDict *qdict)
                    qmp_query_migrate_cache_size(NULL) >> 10);
 }
=20
-static void print_block_info(Monitor *mon, BlockInfo *info,
-                             BlockDeviceInfo *inserted, bool verbose)
-{
-    ImageInfo *image_info;
-
-    assert(!info || !info->has_inserted || info->inserted =3D=3D inserted)=
;
-
-    if (info && *info->device) {
-        monitor_printf(mon, "%s", info->device);
-        if (inserted && inserted->has_node_name) {
-            monitor_printf(mon, " (%s)", inserted->node_name);
-        }
-    } else {
-        assert(info || inserted);
-        monitor_printf(mon, "%s",
-                       inserted && inserted->has_node_name ? inserted->nod=
e_name
-                       : info && info->has_qdev ? info->qdev
-                       : "<anonymous>");
-    }
-
-    if (inserted) {
-        monitor_printf(mon, ": %s (%s%s%s)\n",
-                       inserted->file,
-                       inserted->drv,
-                       inserted->ro ? ", read-only" : "",
-                       inserted->encrypted ? ", encrypted" : "");
-    } else {
-        monitor_printf(mon, ": [not inserted]\n");
-    }
-
-    if (info) {
-        if (info->has_qdev) {
-            monitor_printf(mon, "    Attached to:      %s\n", info->qdev);
-        }
-        if (info->has_io_status && info->io_status !=3D BLOCK_DEVICE_IO_ST=
ATUS_OK) {
-            monitor_printf(mon, "    I/O status:       %s\n",
-                           BlockDeviceIoStatus_str(info->io_status));
-        }
-
-        if (info->removable) {
-            monitor_printf(mon, "    Removable device: %slocked, tray %s\n=
",
-                           info->locked ? "" : "not ",
-                           info->tray_open ? "open" : "closed");
-        }
-    }
-
-
-    if (!inserted) {
-        return;
-    }
-
-    monitor_printf(mon, "    Cache mode:       %s%s%s\n",
-                   inserted->cache->writeback ? "writeback" : "writethroug=
h",
-                   inserted->cache->direct ? ", direct" : "",
-                   inserted->cache->no_flush ? ", ignore flushes" : "");
-
-    if (inserted->has_backing_file) {
-        monitor_printf(mon,
-                       "    Backing file:     %s "
-                       "(chain depth: %" PRId64 ")\n",
-                       inserted->backing_file,
-                       inserted->backing_file_depth);
-    }
-
-    if (inserted->detect_zeroes !=3D BLOCKDEV_DETECT_ZEROES_OPTIONS_OFF) {
-        monitor_printf(mon, "    Detect zeroes:    %s\n",
-                BlockdevDetectZeroesOptions_str(inserted->detect_zeroes));
-    }
-
-    if (inserted->bps  || inserted->bps_rd  || inserted->bps_wr  ||
-        inserted->iops || inserted->iops_rd || inserted->iops_wr)
-    {
-        monitor_printf(mon, "    I/O throttling:   bps=3D%" PRId64
-                        " bps_rd=3D%" PRId64  " bps_wr=3D%" PRId64
-                        " bps_max=3D%" PRId64
-                        " bps_rd_max=3D%" PRId64
-                        " bps_wr_max=3D%" PRId64
-                        " iops=3D%" PRId64 " iops_rd=3D%" PRId64
-                        " iops_wr=3D%" PRId64
-                        " iops_max=3D%" PRId64
-                        " iops_rd_max=3D%" PRId64
-                        " iops_wr_max=3D%" PRId64
-                        " iops_size=3D%" PRId64
-                        " group=3D%s\n",
-                        inserted->bps,
-                        inserted->bps_rd,
-                        inserted->bps_wr,
-                        inserted->bps_max,
-                        inserted->bps_rd_max,
-                        inserted->bps_wr_max,
-                        inserted->iops,
-                        inserted->iops_rd,
-                        inserted->iops_wr,
-                        inserted->iops_max,
-                        inserted->iops_rd_max,
-                        inserted->iops_wr_max,
-                        inserted->iops_size,
-                        inserted->group);
-    }
-
-    if (verbose) {
-        monitor_printf(mon, "\nImages:\n");
-        image_info =3D inserted->image;
-        while (1) {
-                bdrv_image_info_dump(image_info);
-            if (image_info->has_backing_image) {
-                image_info =3D image_info->backing_image;
-            } else {
-                break;
-            }
-        }
-    }
-}
-
-void hmp_info_block(Monitor *mon, const QDict *qdict)
-{
-    BlockInfoList *block_list, *info;
-    BlockDeviceInfoList *blockdev_list, *blockdev;
-    const char *device =3D qdict_get_try_str(qdict, "device");
-    bool verbose =3D qdict_get_try_bool(qdict, "verbose", false);
-    bool nodes =3D qdict_get_try_bool(qdict, "nodes", false);
-    bool printed =3D false;
-
-    /* Print BlockBackend information */
-    if (!nodes) {
-        block_list =3D qmp_query_block(NULL);
-    } else {
-        block_list =3D NULL;
-    }
-
-    for (info =3D block_list; info; info =3D info->next) {
-        if (device && strcmp(device, info->value->device)) {
-            continue;
-        }
-
-        if (info !=3D block_list) {
-            monitor_printf(mon, "\n");
-        }
-
-        print_block_info(mon, info->value, info->value->has_inserted
-                                           ? info->value->inserted : NULL,
-                         verbose);
-        printed =3D true;
-    }
-
-    qapi_free_BlockInfoList(block_list);
-
-    if ((!device && !nodes) || printed) {
-        return;
-    }
-
-    /* Print node information */
-    blockdev_list =3D qmp_query_named_block_nodes(false, false, NULL);
-    for (blockdev =3D blockdev_list; blockdev; blockdev =3D blockdev->next=
) {
-        assert(blockdev->value->has_node_name);
-        if (device && strcmp(device, blockdev->value->node_name)) {
-            continue;
-        }
-
-        if (blockdev !=3D blockdev_list) {
-            monitor_printf(mon, "\n");
-        }
-
-        print_block_info(mon, NULL, blockdev->value, verbose);
-    }
-    qapi_free_BlockDeviceInfoList(blockdev_list);
-}
-
-void hmp_info_blockstats(Monitor *mon, const QDict *qdict)
-{
-    BlockStatsList *stats_list, *stats;
-
-    stats_list =3D qmp_query_blockstats(false, false, NULL);
-
-    for (stats =3D stats_list; stats; stats =3D stats->next) {
-        if (!stats->value->has_device) {
-            continue;
-        }
-
-        monitor_printf(mon, "%s:", stats->value->device);
-        monitor_printf(mon, " rd_bytes=3D%" PRId64
-                       " wr_bytes=3D%" PRId64
-                       " rd_operations=3D%" PRId64
-                       " wr_operations=3D%" PRId64
-                       " flush_operations=3D%" PRId64
-                       " wr_total_time_ns=3D%" PRId64
-                       " rd_total_time_ns=3D%" PRId64
-                       " flush_total_time_ns=3D%" PRId64
-                       " rd_merged=3D%" PRId64
-                       " wr_merged=3D%" PRId64
-                       " idle_time_ns=3D%" PRId64
-                       "\n",
-                       stats->value->stats->rd_bytes,
-                       stats->value->stats->wr_bytes,
-                       stats->value->stats->rd_operations,
-                       stats->value->stats->wr_operations,
-                       stats->value->stats->flush_operations,
-                       stats->value->stats->wr_total_time_ns,
-                       stats->value->stats->rd_total_time_ns,
-                       stats->value->stats->flush_total_time_ns,
-                       stats->value->stats->rd_merged,
-                       stats->value->stats->wr_merged,
-                       stats->value->stats->idle_time_ns);
-    }
-
-    qapi_free_BlockStatsList(stats_list);
-}
=20
 #ifdef CONFIG_VNC
 /* Helper for hmp_info_vnc_clients, _servers */
@@ -1056,44 +848,6 @@ void hmp_info_pci(Monitor *mon, const QDict *qdict)
     qapi_free_PciInfoList(info_list);
 }
=20
-void hmp_info_block_jobs(Monitor *mon, const QDict *qdict)
-{
-    BlockJobInfoList *list;
-    Error *err =3D NULL;
-
-    list =3D qmp_query_block_jobs(&err);
-    assert(!err);
-
-    if (!list) {
-        monitor_printf(mon, "No active jobs\n");
-        return;
-    }
-
-    while (list) {
-        if (strcmp(list->value->type, "stream") =3D=3D 0) {
-            monitor_printf(mon, "Streaming device %s: Completed %" PRId64
-                           " of %" PRId64 " bytes, speed limit %" PRId64
-                           " bytes/s\n",
-                           list->value->device,
-                           list->value->offset,
-                           list->value->len,
-                           list->value->speed);
-        } else {
-            monitor_printf(mon, "Type %s, device %s: Completed %" PRId64
-                           " of %" PRId64 " bytes, speed limit %" PRId64
-                           " bytes/s\n",
-                           list->value->type,
-                           list->value->device,
-                           list->value->offset,
-                           list->value->len,
-                           list->value->speed);
-        }
-        list =3D list->next;
-    }
-
-    qapi_free_BlockJobInfoList(list);
-}
-
 void hmp_info_tpm(Monitor *mon, const QDict *qdict)
 {
     TPMInfoList *info_list, *info;
@@ -1356,148 +1110,6 @@ void hmp_delvm(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
=20
-void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
-{
-    BlockDriverState *bs, *bs1;
-    BdrvNextIterator it1;
-    QEMUSnapshotInfo *sn_tab, *sn;
-    bool no_snapshot =3D true;
-    int nb_sns, i;
-    int total;
-    int *global_snapshots;
-    AioContext *aio_context;
-
-    typedef struct SnapshotEntry {
-        QEMUSnapshotInfo sn;
-        QTAILQ_ENTRY(SnapshotEntry) next;
-    } SnapshotEntry;
-
-    typedef struct ImageEntry {
-        const char *imagename;
-        QTAILQ_ENTRY(ImageEntry) next;
-        QTAILQ_HEAD(, SnapshotEntry) snapshots;
-    } ImageEntry;
-
-    QTAILQ_HEAD(, ImageEntry) image_list =3D
-        QTAILQ_HEAD_INITIALIZER(image_list);
-
-    ImageEntry *image_entry, *next_ie;
-    SnapshotEntry *snapshot_entry;
-
-    bs =3D bdrv_all_find_vmstate_bs();
-    if (!bs) {
-        monitor_printf(mon, "No available block device supports snapshots\=
n");
-        return;
-    }
-    aio_context =3D bdrv_get_aio_context(bs);
-
-    aio_context_acquire(aio_context);
-    nb_sns =3D bdrv_snapshot_list(bs, &sn_tab);
-    aio_context_release(aio_context);
-
-    if (nb_sns < 0) {
-        monitor_printf(mon, "bdrv_snapshot_list: error %d\n", nb_sns);
-        return;
-    }
-
-    for (bs1 =3D bdrv_first(&it1); bs1; bs1 =3D bdrv_next(&it1)) {
-        int bs1_nb_sns =3D 0;
-        ImageEntry *ie;
-        SnapshotEntry *se;
-        AioContext *ctx =3D bdrv_get_aio_context(bs1);
-
-        aio_context_acquire(ctx);
-        if (bdrv_can_snapshot(bs1)) {
-            sn =3D NULL;
-            bs1_nb_sns =3D bdrv_snapshot_list(bs1, &sn);
-            if (bs1_nb_sns > 0) {
-                no_snapshot =3D false;
-                ie =3D g_new0(ImageEntry, 1);
-                ie->imagename =3D bdrv_get_device_name(bs1);
-                QTAILQ_INIT(&ie->snapshots);
-                QTAILQ_INSERT_TAIL(&image_list, ie, next);
-                for (i =3D 0; i < bs1_nb_sns; i++) {
-                    se =3D g_new0(SnapshotEntry, 1);
-                    se->sn =3D sn[i];
-                    QTAILQ_INSERT_TAIL(&ie->snapshots, se, next);
-                }
-            }
-            g_free(sn);
-        }
-        aio_context_release(ctx);
-    }
-
-    if (no_snapshot) {
-        monitor_printf(mon, "There is no snapshot available.\n");
-        return;
-    }
-
-    global_snapshots =3D g_new0(int, nb_sns);
-    total =3D 0;
-    for (i =3D 0; i < nb_sns; i++) {
-        SnapshotEntry *next_sn;
-        if (bdrv_all_find_snapshot(sn_tab[i].name, &bs1) =3D=3D 0) {
-            global_snapshots[total] =3D i;
-            total++;
-            QTAILQ_FOREACH(image_entry, &image_list, next) {
-                QTAILQ_FOREACH_SAFE(snapshot_entry, &image_entry->snapshot=
s,
-                                    next, next_sn) {
-                    if (!strcmp(sn_tab[i].name, snapshot_entry->sn.name)) =
{
-                        QTAILQ_REMOVE(&image_entry->snapshots, snapshot_en=
try,
-                                      next);
-                        g_free(snapshot_entry);
-                    }
-                }
-            }
-        }
-    }
-
-    monitor_printf(mon, "List of snapshots present on all disks:\n");
-
-    if (total > 0) {
-        bdrv_snapshot_dump(NULL);
-        monitor_printf(mon, "\n");
-        for (i =3D 0; i < total; i++) {
-            sn =3D &sn_tab[global_snapshots[i]];
-            /* The ID is not guaranteed to be the same on all images, so
-             * overwrite it.
-             */
-            pstrcpy(sn->id_str, sizeof(sn->id_str), "--");
-            bdrv_snapshot_dump(sn);
-            monitor_printf(mon, "\n");
-        }
-    } else {
-        monitor_printf(mon, "None\n");
-    }
-
-    QTAILQ_FOREACH(image_entry, &image_list, next) {
-        if (QTAILQ_EMPTY(&image_entry->snapshots)) {
-            continue;
-        }
-        monitor_printf(mon,
-                       "\nList of partial (non-loadable) snapshots on '%s'=
:\n",
-                       image_entry->imagename);
-        bdrv_snapshot_dump(NULL);
-        monitor_printf(mon, "\n");
-        QTAILQ_FOREACH(snapshot_entry, &image_entry->snapshots, next) {
-            bdrv_snapshot_dump(&snapshot_entry->sn);
-            monitor_printf(mon, "\n");
-        }
-    }
-
-    QTAILQ_FOREACH_SAFE(image_entry, &image_list, next, next_ie) {
-        SnapshotEntry *next_sn;
-        QTAILQ_FOREACH_SAFE(snapshot_entry, &image_entry->snapshots, next,
-                            next_sn) {
-            g_free(snapshot_entry);
-        }
-        g_free(image_entry);
-    }
-    g_free(sn_tab);
-    g_free(global_snapshots);
-
-}
-
 void hmp_announce_self(Monitor *mon, const QDict *qdict)
 {
     const char *interfaces_str =3D qdict_get_try_str(qdict, "interfaces");
--=20
2.17.2


