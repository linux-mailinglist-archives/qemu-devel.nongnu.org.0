Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E430C462
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:51:11 +0100 (CET)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xxO-0007FM-LO
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6xoo-0008RO-BU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:42:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6xoe-0003cE-Nt
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612280526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzJLip4fGTJV5cY2jxM+cQP5ilah1BQ1dPdKnz/iNzE=;
 b=D+9IMMIkTZ5/a8xoi/O48l1WceISldeoZfv493uiwbPa3LSpYxQcK4nw5Z6aCBE29mfeO1
 rZJ9Kuv3GKeSMRT8py5qHnuDzdrsZck6kQHjwG90JDscsZ4h8hQGVyiOxgDj84NDL+lYvf
 pkiP10yn9dJRNuTRdvWRyGm+hT75t6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-XiL41oSBMna9YuJdKHZ36g-1; Tue, 02 Feb 2021 10:42:03 -0500
X-MC-Unique: XiL41oSBMna9YuJdKHZ36g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B86C81621;
 Tue,  2 Feb 2021 15:42:02 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-202.ams2.redhat.com
 [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CFB62BFC7;
 Tue,  2 Feb 2021 15:41:59 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 05/12] block: allow specifying name of block device for
 vmstate storage
Date: Tue,  2 Feb 2021 15:41:31 +0000
Message-Id: <20210202154138.246464-6-berrange@redhat.com>
In-Reply-To: <20210202154138.246464-1-berrange@redhat.com>
References: <20210202154138.246464-1-berrange@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the vmstate will be stored in the first block device that
supports snapshots. Historically this would have usually been the
root device, but with UEFI it might be the variable store. There
needs to be a way to override the choice of block device to store
the state in.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/monitor/block-hmp-cmds.c |  2 +-
 block/snapshot.c               | 26 +++++++++++++++++++++++---
 include/block/snapshot.h       |  3 ++-
 migration/savevm.c             |  4 ++--
 replay/replay-debugging.c      |  2 +-
 tests/qemu-iotests/267.out     | 12 ++++++------
 6 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index e15121be1f..9cc5d4b51e 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -902,7 +902,7 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
     SnapshotEntry *snapshot_entry;
     Error *err = NULL;
 
-    bs = bdrv_all_find_vmstate_bs(false, NULL, &err);
+    bs = bdrv_all_find_vmstate_bs(NULL, false, NULL, &err);
     if (!bs) {
         error_report_err(err);
         return;
diff --git a/block/snapshot.c b/block/snapshot.c
index 220173deae..0b129bee8f 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -678,7 +678,9 @@ int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
     return 0;
 }
 
-BlockDriverState *bdrv_all_find_vmstate_bs(bool has_devices, strList *devices,
+
+BlockDriverState *bdrv_all_find_vmstate_bs(const char *vmstate_bs,
+                                           bool has_devices, strList *devices,
                                            Error **errp)
 {
     g_autoptr(GList) bdrvs = NULL;
@@ -699,13 +701,31 @@ BlockDriverState *bdrv_all_find_vmstate_bs(bool has_devices, strList *devices,
             bdrv_can_snapshot(bs);
         aio_context_release(ctx);
 
-        if (found) {
+        if (vmstate_bs) {
+            if (g_str_equal(vmstate_bs,
+                            bdrv_get_node_name(bs))) {
+                if (found) {
+                    return bs;
+                } else {
+                    error_setg(errp,
+                               "vmstate block device '%s' does not support snapshots",
+                               vmstate_bs);
+                    return NULL;
+                }
+            }
+        } else if (found) {
             return bs;
         }
 
         iterbdrvs = iterbdrvs->next;
     }
 
-    error_setg(errp, "No block device supports snapshots");
+    if (vmstate_bs) {
+        error_setg(errp,
+                   "vmstate block device '%s' does not exist", vmstate_bs);
+    } else {
+        error_setg(errp,
+                   "no block device can store vmstate for snapshot");
+    }
     return NULL;
 }
diff --git a/include/block/snapshot.h b/include/block/snapshot.h
index 2569a903f2..8a6a37240d 100644
--- a/include/block/snapshot.h
+++ b/include/block/snapshot.h
@@ -95,7 +95,8 @@ int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
                              strList *devices,
                              Error **errp);
 
-BlockDriverState *bdrv_all_find_vmstate_bs(bool has_devices, strList *devices,
+BlockDriverState *bdrv_all_find_vmstate_bs(const char *vmstate_bs,
+                                           bool has_devices, strList *devices,
                                            Error **errp);
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index 90dded91f4..1fc4bffe8b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2762,7 +2762,7 @@ bool save_snapshot(const char *name, Error **errp)
         }
     }
 
-    bs = bdrv_all_find_vmstate_bs(false, NULL, errp);
+    bs = bdrv_all_find_vmstate_bs(NULL, false, NULL, errp);
     if (bs == NULL) {
         return false;
     }
@@ -2947,7 +2947,7 @@ bool load_snapshot(const char *name, Error **errp)
         return false;
     }
 
-    bs_vm_state = bdrv_all_find_vmstate_bs(false, NULL, errp);
+    bs_vm_state = bdrv_all_find_vmstate_bs(NULL, false, NULL, errp);
     if (!bs_vm_state) {
         return false;
     }
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 67d8237077..ca37cf4025 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -148,7 +148,7 @@ static char *replay_find_nearest_snapshot(int64_t icount,
 
     *snapshot_icount = -1;
 
-    bs = bdrv_all_find_vmstate_bs(false, NULL, NULL);
+    bs = bdrv_all_find_vmstate_bs(NULL, false, NULL, NULL);
     if (!bs) {
         goto fail;
     }
diff --git a/tests/qemu-iotests/267.out b/tests/qemu-iotests/267.out
index 6149029b25..7176e376e1 100644
--- a/tests/qemu-iotests/267.out
+++ b/tests/qemu-iotests/267.out
@@ -6,11 +6,11 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 Testing:
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
-Error: No block device supports snapshots
+Error: no block device can store vmstate for snapshot
 (qemu) info snapshots
-No block device supports snapshots
+no block device can store vmstate for snapshot
 (qemu) loadvm snap0
-Error: No block device supports snapshots
+Error: no block device can store vmstate for snapshot
 (qemu) quit
 
 
@@ -22,7 +22,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 Error: Device 'none0' is writable but does not support snapshots
 (qemu) info snapshots
-No block device supports snapshots
+no block device can store vmstate for snapshot
 (qemu) loadvm snap0
 Error: Device 'none0' is writable but does not support snapshots
 (qemu) quit
@@ -58,7 +58,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 Error: Device 'virtio0' is writable but does not support snapshots
 (qemu) info snapshots
-No block device supports snapshots
+no block device can store vmstate for snapshot
 (qemu) loadvm snap0
 Error: Device 'virtio0' is writable but does not support snapshots
 (qemu) quit
@@ -83,7 +83,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 Error: Device 'file' is writable but does not support snapshots
 (qemu) info snapshots
-No block device supports snapshots
+no block device can store vmstate for snapshot
 (qemu) loadvm snap0
 Error: Device 'file' is writable but does not support snapshots
 (qemu) quit
-- 
2.29.2


