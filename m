Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF6F30F9FC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:43:44 +0100 (CET)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ifP-00066Y-GU
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hiT-00049k-RP
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:42:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hiN-0005z0-3A
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OME4PFsZTHyoOjhxy8orEH4uwZGuPN3Q5Bt20Fh1TFE=;
 b=EVM8SBk+hsUmxbKw93q7BoypwMmU8g7n5fsTl+tEpFAI6ScdAP9k7xx8BCvJOtDs5jqULG
 xBAOhplzRrmOMh2Af20DOI2RiYmYPDzCXQW3BGNtNs48mVCo7LCXskkaM7YQdDWX0+Fvo6
 3hn4Ut2ceXNXdZqtnmg28cJm1wh9yrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-7u3ObWRWPZWnzsAz1JGwNg-1; Thu, 04 Feb 2021 11:42:33 -0500
X-MC-Unique: 7u3ObWRWPZWnzsAz1JGwNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8578D801963;
 Thu,  4 Feb 2021 16:42:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0F331A26A;
 Thu,  4 Feb 2021 16:42:27 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 21/27] block: rename and alter bdrv_all_find_snapshot semantics
Date: Thu,  4 Feb 2021 16:39:53 +0000
Message-Id: <20210204163959.377618-22-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
References: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

Currently bdrv_all_find_snapshot() will return 0 if it finds
a snapshot, -1 if an error occurs, or if it fails to find a
snapshot. New callers to be added want to distinguish between
the error scenario and failing to find a snapshot.

Rename it to bdrv_all_has_snapshot and make it return -1 on
error, 0 if no snapshot is found and 1 if snapshot is found.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210204124834.774401-7-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 block/monitor/block-hmp-cmds.c |  2 +-
 block/snapshot.c               | 19 ++++++++++++-------
 include/block/snapshot.h       |  6 +++---
 migration/savevm.c             |  7 ++++++-
 replay/replay-debugging.c      |  6 +++++-
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 9cc5d4b51e..75d7fa9510 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -954,7 +954,7 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
     total = 0;
     for (i = 0; i < nb_sns; i++) {
         SnapshotEntry *next_sn;
-        if (bdrv_all_find_snapshot(sn_tab[i].name, false, NULL, NULL) == 0) {
+        if (bdrv_all_has_snapshot(sn_tab[i].name, false, NULL, NULL) == 1) {
             global_snapshots[total] = i;
             total++;
             QTAILQ_FOREACH(image_entry, &image_list, next) {
diff --git a/block/snapshot.c b/block/snapshot.c
index 0b129bee8f..e8ae9a28c1 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -603,9 +603,9 @@ int bdrv_all_goto_snapshot(const char *name,
     return 0;
 }
 
-int bdrv_all_find_snapshot(const char *name,
-                           bool has_devices, strList *devices,
-                           Error **errp)
+int bdrv_all_has_snapshot(const char *name,
+                          bool has_devices, strList *devices,
+                          Error **errp)
 {
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
@@ -627,15 +627,20 @@ int bdrv_all_find_snapshot(const char *name,
         }
         aio_context_release(ctx);
         if (ret < 0) {
-            error_setg(errp, "Could not find snapshot '%s' on '%s'",
-                       name, bdrv_get_device_or_node_name(bs));
-            return -1;
+            if (ret == -ENOENT) {
+                return 0;
+            } else {
+                error_setg_errno(errp, errno,
+                                 "Could not check snapshot '%s' on '%s'",
+                                 name, bdrv_get_device_or_node_name(bs));
+                return -1;
+            }
         }
 
         iterbdrvs = iterbdrvs->next;
     }
 
-    return 0;
+    return 1;
 }
 
 int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
diff --git a/include/block/snapshot.h b/include/block/snapshot.h
index 8a6a37240d..940345692f 100644
--- a/include/block/snapshot.h
+++ b/include/block/snapshot.h
@@ -85,9 +85,9 @@ int bdrv_all_delete_snapshot(const char *name,
 int bdrv_all_goto_snapshot(const char *name,
                            bool has_devices, strList *devices,
                            Error **errp);
-int bdrv_all_find_snapshot(const char *name,
-                           bool has_devices, strList *devices,
-                           Error **errp);
+int bdrv_all_has_snapshot(const char *name,
+                          bool has_devices, strList *devices,
+                          Error **errp);
 int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
                              BlockDriverState *vm_state_bs,
                              uint64_t vm_state_size,
diff --git a/migration/savevm.c b/migration/savevm.c
index cdd201e7f8..a2a842d067 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2977,10 +2977,15 @@ bool load_snapshot(const char *name, Error **errp)
     if (!bdrv_all_can_snapshot(false, NULL, errp)) {
         return false;
     }
-    ret = bdrv_all_find_snapshot(name, false, NULL, errp);
+    ret = bdrv_all_has_snapshot(name, false, NULL, errp);
     if (ret < 0) {
         return false;
     }
+    if (ret == 0) {
+        error_setg(errp, "Snapshot '%s' does not exist in one or more devices",
+                   name);
+        return false;
+    }
 
     bs_vm_state = bdrv_all_find_vmstate_bs(NULL, false, NULL, errp);
     if (!bs_vm_state) {
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index ca37cf4025..098ef8e0f5 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -143,6 +143,7 @@ static char *replay_find_nearest_snapshot(int64_t icount,
     QEMUSnapshotInfo *sn_tab;
     QEMUSnapshotInfo *nearest = NULL;
     char *ret = NULL;
+    int rv;
     int nb_sns, i;
     AioContext *aio_context;
 
@@ -159,7 +160,10 @@ static char *replay_find_nearest_snapshot(int64_t icount,
     aio_context_release(aio_context);
 
     for (i = 0; i < nb_sns; i++) {
-        if (bdrv_all_find_snapshot(sn_tab[i].name, false, NULL, NULL) == 0) {
+        rv = bdrv_all_has_snapshot(sn_tab[i].name, false, NULL, NULL);
+        if (rv < 0)
+            goto fail;
+        if (rv == 1) {
             if (sn_tab[i].icount != -1ULL
                 && sn_tab[i].icount <= icount
                 && (!nearest || nearest->icount < sn_tab[i].icount)) {
-- 
2.29.2


