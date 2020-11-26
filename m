Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3672C5AE9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:45:27 +0100 (CET)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLKg-000338-AT
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:45:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiLBW-0002jj-Qt
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:35:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiLBU-0006Ws-Ed
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606412155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHmzakf0ycU7l99vwt9JfqtOPGcn+lrsf0mFVRj6l6I=;
 b=AGb/6T3SrFtwmnSd3fq0McOo3kuDgexl/SqatX7ZGsE17jAQ5tj9kpD1aGRTTxdf8o3oCL
 sty9Y/eC7s4i20XcVzJ2yoxWL37E+pEj2UCM3LuGTlVa9WZAHS16ECPeUawIXuH0upbdKA
 JwqW/T/F0dkuwfXt4YJvf+jL5wjnrQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-rcidm8bDMUKUk8qh0UbVEQ-1; Thu, 26 Nov 2020 12:35:53 -0500
X-MC-Unique: rcidm8bDMUKUk8qh0UbVEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CA3BC73A2;
 Thu, 26 Nov 2020 17:35:52 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BABF1C956;
 Thu, 26 Nov 2020 17:35:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/11] block: allow specifying name of block device for
 vmstate storage
Date: Thu, 26 Nov 2020 17:35:15 +0000
Message-Id: <20201126173521.137580-6-berrange@redhat.com>
In-Reply-To: <20201126173521.137580-1-berrange@redhat.com>
References: <20201126173521.137580-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
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
index ebb6ae0333..aee243becd 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -901,7 +901,7 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
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
index 0570341a0f..9459faec68 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2758,7 +2758,7 @@ bool save_snapshot(const char *name, Error **errp)
         }
     }
 
-    bs = bdrv_all_find_vmstate_bs(false, NULL, errp);
+    bs = bdrv_all_find_vmstate_bs(NULL, false, NULL, errp);
     if (bs == NULL) {
         return false;
     }
@@ -2948,7 +2948,7 @@ bool load_snapshot(const char *name, Error **errp)
         return false;
     }
 
-    bs_vm_state = bdrv_all_find_vmstate_bs(false, NULL, errp);
+    bs_vm_state = bdrv_all_find_vmstate_bs(NULL, false, NULL, errp);
     if (!bs_vm_state) {
         return false;
     }
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 095e64561e..e95c30703c 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -149,7 +149,7 @@ static char *replay_find_nearest_snapshot(int64_t icount,
 
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
2.28.0


