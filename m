Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9502320A224
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:38:19 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joTxC-0001yj-IC
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTid-00068u-TV
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:23:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58467
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTib-00019U-DC
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593098592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvmiJZRro3+Y6TfnnqmHWQAENhuKSBh+pkc6ZF5JGsE=;
 b=SRCRXf1GgBfA7Su4Ep9LeGtWL1yO9fXmkRJdukdFI8xWdWiRqmEs9xALVATlBt4DLSi9Vj
 TpG3LnlT1+eq17QW1kpTCkOT1UWvqdt1MeNPd+lZWFVMnc0y/rnnEXh08PmTE/CZB4PYfw
 tZ6MXYPpv2WM3YxBBbv3GzW20JvX+Ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-m2TR2a4oM8uqGthmbGkhMg-1; Thu, 25 Jun 2020 11:23:10 -0400
X-MC-Unique: m2TR2a4oM8uqGthmbGkhMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6D471009613;
 Thu, 25 Jun 2020 15:23:09 +0000 (UTC)
Received: from localhost (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BDA77FEA0;
 Thu, 25 Jun 2020 15:23:09 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 23/47] block/snapshot: Fix fallback
Date: Thu, 25 Jun 2020 17:21:51 +0200
Message-Id: <20200625152215.941773-24-mreitz@redhat.com>
In-Reply-To: <20200625152215.941773-1-mreitz@redhat.com>
References: <20200625152215.941773-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the top node's driver does not provide snapshot functionality and we
want to fall back to a node down the chain, we need to snapshot all
non-COW children.  For simplicity's sake, just do not fall back if there
is more than one such child.  Furthermore, we really only can fall back
to bs->file and bs->backing, because bdrv_snapshot_goto() has to modify
the child link (notably, set it to NULL).

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/snapshot.c | 104 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 83 insertions(+), 21 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index bd9fb01817..a2bf3a54eb 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -147,6 +147,56 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
     return ret;
 }
 
+/**
+ * Return a pointer to the child BDS pointer to which we can fall
+ * back if the given BDS does not support snapshots.
+ * Return NULL if there is no BDS to (safely) fall back to.
+ *
+ * We need to return an indirect pointer because bdrv_snapshot_goto()
+ * has to modify the BdrvChild pointer.
+ */
+static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
+{
+    BdrvChild **fallback;
+    BdrvChild *child;
+
+    /*
+     * The only BdrvChild pointers that are safe to modify (and which
+     * we can thus return a reference to) are bs->file and
+     * bs->backing.
+     */
+    fallback = &bs->file;
+    if (!*fallback && bs->drv && bs->drv->is_filter) {
+        fallback = &bs->backing;
+    }
+
+    if (!*fallback) {
+        return NULL;
+    }
+
+    /*
+     * Check that there are no other children that would need to be
+     * snapshotted.  If there are, it is not safe to fall back to
+     * *fallback.
+     */
+    QLIST_FOREACH(child, &bs->children, next) {
+        if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
+                           BDRV_CHILD_FILTERED) &&
+            child != *fallback)
+        {
+            return NULL;
+        }
+    }
+
+    return fallback;
+}
+
+static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *bs)
+{
+    BdrvChild **child_ptr = bdrv_snapshot_fallback_ptr(bs);
+    return child_ptr ? (*child_ptr)->bs : NULL;
+}
+
 int bdrv_can_snapshot(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
@@ -155,8 +205,9 @@ int bdrv_can_snapshot(BlockDriverState *bs)
     }
 
     if (!drv->bdrv_snapshot_create) {
-        if (bs->file != NULL) {
-            return bdrv_can_snapshot(bs->file->bs);
+        BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
+        if (fallback_bs) {
+            return bdrv_can_snapshot(fallback_bs);
         }
         return 0;
     }
@@ -168,14 +219,15 @@ int bdrv_snapshot_create(BlockDriverState *bs,
                          QEMUSnapshotInfo *sn_info)
 {
     BlockDriver *drv = bs->drv;
+    BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
     if (!drv) {
         return -ENOMEDIUM;
     }
     if (drv->bdrv_snapshot_create) {
         return drv->bdrv_snapshot_create(bs, sn_info);
     }
-    if (bs->file) {
-        return bdrv_snapshot_create(bs->file->bs, sn_info);
+    if (fallback_bs) {
+        return bdrv_snapshot_create(fallback_bs, sn_info);
     }
     return -ENOTSUP;
 }
@@ -185,6 +237,7 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
                        Error **errp)
 {
     BlockDriver *drv = bs->drv;
+    BdrvChild **fallback_ptr;
     int ret, open_ret;
 
     if (!drv) {
@@ -205,39 +258,46 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         return ret;
     }
 
-    if (bs->file) {
-        BlockDriverState *file;
-        QDict *options = qdict_clone_shallow(bs->options);
+    fallback_ptr = bdrv_snapshot_fallback_ptr(bs);
+    if (fallback_ptr) {
+        QDict *options;
         QDict *file_options;
         Error *local_err = NULL;
+        BlockDriverState *fallback_bs = (*fallback_ptr)->bs;
+        char *subqdict_prefix = g_strdup_printf("%s.", (*fallback_ptr)->name);
+
+        options = qdict_clone_shallow(bs->options);
 
-        file = bs->file->bs;
         /* Prevent it from getting deleted when detached from bs */
-        bdrv_ref(file);
+        bdrv_ref(fallback_bs);
 
-        qdict_extract_subqdict(options, &file_options, "file.");
+        qdict_extract_subqdict(options, &file_options, subqdict_prefix);
         qobject_unref(file_options);
-        qdict_put_str(options, "file", bdrv_get_node_name(file));
+        g_free(subqdict_prefix);
+
+        qdict_put_str(options, (*fallback_ptr)->name,
+                      bdrv_get_node_name(fallback_bs));
 
         if (drv->bdrv_close) {
             drv->bdrv_close(bs);
         }
-        bdrv_unref_child(bs, bs->file);
-        bs->file = NULL;
 
-        ret = bdrv_snapshot_goto(file, snapshot_id, errp);
+        bdrv_unref_child(bs, *fallback_ptr);
+        *fallback_ptr = NULL;
+
+        ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
         qobject_unref(options);
         if (open_ret < 0) {
-            bdrv_unref(file);
+            bdrv_unref(fallback_bs);
             bs->drv = NULL;
             /* A bdrv_snapshot_goto() error takes precedence */
             error_propagate(errp, local_err);
             return ret < 0 ? ret : open_ret;
         }
 
-        assert(bs->file->bs == file);
-        bdrv_unref(file);
+        assert(fallback_bs == (*fallback_ptr)->bs);
+        bdrv_unref(fallback_bs);
         return ret;
     }
 
@@ -273,6 +333,7 @@ int bdrv_snapshot_delete(BlockDriverState *bs,
                          Error **errp)
 {
     BlockDriver *drv = bs->drv;
+    BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
     int ret;
 
     if (!drv) {
@@ -289,8 +350,8 @@ int bdrv_snapshot_delete(BlockDriverState *bs,
 
     if (drv->bdrv_snapshot_delete) {
         ret = drv->bdrv_snapshot_delete(bs, snapshot_id, name, errp);
-    } else if (bs->file) {
-        ret = bdrv_snapshot_delete(bs->file->bs, snapshot_id, name, errp);
+    } else if (fallback_bs) {
+        ret = bdrv_snapshot_delete(fallback_bs, snapshot_id, name, errp);
     } else {
         error_setg(errp, "Block format '%s' used by device '%s' "
                    "does not support internal snapshot deletion",
@@ -306,14 +367,15 @@ int bdrv_snapshot_list(BlockDriverState *bs,
                        QEMUSnapshotInfo **psn_info)
 {
     BlockDriver *drv = bs->drv;
+    BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
     if (!drv) {
         return -ENOMEDIUM;
     }
     if (drv->bdrv_snapshot_list) {
         return drv->bdrv_snapshot_list(bs, psn_info);
     }
-    if (bs->file) {
-        return bdrv_snapshot_list(bs->file->bs, psn_info);
+    if (fallback_bs) {
+        return bdrv_snapshot_list(fallback_bs, psn_info);
     }
     return -ENOTSUP;
 }
-- 
2.26.2


