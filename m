Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67730F36F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:51:53 +0100 (CET)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7e6y-00039t-60
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7e4O-00019J-Kt
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7e4M-0001jF-28
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612442949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPPnvZA4XGtJ97KvbYdx6VfnQhpAg5dZIqvT+5j+C/E=;
 b=i8NVDUlBx3t3GiiovdL5IbwhtcF1vgN18Y3/04oAGHeNY0Q2+7og7c7h6wIdADFogtCqRI
 POMr/KADytmxONu1cVG+sWK4+9YNcsWuZ069QHH4Khy7MIXMF1SzGjqQDzWPnha3C2Wh/K
 jZHdjqWmCeQeHxS+Wt/zqBtwYcMc+3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-1H7YeT-MMHOuyFLNQVhLnA-1; Thu, 04 Feb 2021 07:49:06 -0500
X-MC-Unique: 1H7YeT-MMHOuyFLNQVhLnA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36FB107ACE4;
 Thu,  4 Feb 2021 12:49:04 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-169.ams2.redhat.com
 [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0015E5B4AE;
 Thu,  4 Feb 2021 12:49:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 06/12] block: rename and alter bdrv_all_find_snapshot
 semantics
Date: Thu,  4 Feb 2021 12:48:28 +0000
Message-Id: <20210204124834.774401-7-berrange@redhat.com>
In-Reply-To: <20210204124834.774401-1-berrange@redhat.com>
References: <20210204124834.774401-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently bdrv_all_find_snapshot() will return 0 if it finds
a snapshot, -1 if an error occurs, or if it fails to find a
snapshot. New callers to be added want to distinguish between
the error scenario and failing to find a snapshot.

Rename it to bdrv_all_has_snapshot and make it return -1 on
error, 0 if no snapshot is found and 1 if snapshot is found.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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
index 1fc4bffe8b..5cd3408dfe 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2942,10 +2942,15 @@ bool load_snapshot(const char *name, Error **errp)
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


