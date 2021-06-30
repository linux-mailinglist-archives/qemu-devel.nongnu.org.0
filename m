Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39F3B86F6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:19:59 +0200 (CEST)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycwQ-0007Of-VB
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfs-0002yn-6O
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfa-00075T-5U
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wyMTrpENnrhLwjLQlRcHMny1rIjUqH3gRWS7kOwrfjg=;
 b=NApg4JF31KRD5bXGvS+EsM/IJ2GAYavLpF2HKiEgdWSKteXULZ/vdFNxlnVrokCPKTHbUv
 K28iqSSlcbhMLENXHHMC4tGf119RDNlFwDed/mjGg6B5VGOL7cnRwSvAdp66/10CSxcxQn
 TYnHRUHbjVaU/EDgvyCM1oscqcD4wy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-zaJswWdtPQ67Z7yyWDvLAA-1; Wed, 30 Jun 2021 12:02:28 -0400
X-MC-Unique: zaJswWdtPQ67Z7yyWDvLAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99A5D1835AC4;
 Wed, 30 Jun 2021 16:02:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6C726E0B9;
 Wed, 30 Jun 2021 16:02:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/24] block: Allow changing bs->file on reopen
Date: Wed, 30 Jun 2021 18:01:55 +0200
Message-Id: <20210630160206.276439-14-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

When the x-blockdev-reopen was added it allowed reconfiguring the
graph by replacing backing files, but changing the 'file' option was
forbidden. Because of this restriction some operations are not
possible, notably inserting and removing block filters.

This patch adds support for replacing the 'file' option. This is
similar to replacing the backing file and the user is likewise
responsible for the correctness of the resulting graph, otherwise this
can lead to data corruption.

Signed-off-by: Alberto Garcia <berto@igalia.com>
 [vsementsov: bdrv_reopen_parse_file_or_backing() is modified a lot]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610120537.196183-9-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h  |  1 +
 block.c                | 78 +++++++++++++++++++++++++++++-------------
 tests/qemu-iotests/245 | 23 +++++++------
 3 files changed, 67 insertions(+), 35 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index d28022e761..7ec77ecb1a 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -209,6 +209,7 @@ typedef struct BDRVReopenState {
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
     BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
+    BlockDriverState *old_file_bs; /* keep pointer for permissions update */
     QDict *options;
     QDict *explicit_options;
     void *opaque;
diff --git a/block.c b/block.c
index ca11078cd2..acd35cb0cb 100644
--- a/block.c
+++ b/block.c
@@ -92,7 +92,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
-                               Transaction *set_backings_tran, Error **errp);
+                               Transaction *change_child_tran, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
@@ -4148,6 +4148,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
             refresh_list = bdrv_topological_dfs(refresh_list, found,
                                                 state->old_backing_bs);
         }
+        if (state->old_file_bs) {
+            refresh_list = bdrv_topological_dfs(refresh_list, found,
+                                                state->old_file_bs);
+        }
     }
 
     /*
@@ -4240,64 +4244,81 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
  *
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
-static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
-                                     Transaction *set_backings_tran,
-                                     Error **errp)
+static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
+                                             bool is_backing, Transaction *tran,
+                                             Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
-    BlockDriverState *new_backing_bs;
+    BlockDriverState *new_child_bs;
+    BlockDriverState *old_child_bs = is_backing ? child_bs(bs->backing) :
+                                                  child_bs(bs->file);
+    const char *child_name = is_backing ? "backing" : "file";
     QObject *value;
     const char *str;
 
-    value = qdict_get(reopen_state->options, "backing");
+    value = qdict_get(reopen_state->options, child_name);
     if (value == NULL) {
         return 0;
     }
 
     switch (qobject_type(value)) {
     case QTYPE_QNULL:
-        new_backing_bs = NULL;
+        assert(is_backing); /* The 'file' option does not allow a null value */
+        new_child_bs = NULL;
         break;
     case QTYPE_QSTRING:
         str = qstring_get_str(qobject_to(QString, value));
-        new_backing_bs = bdrv_lookup_bs(NULL, str, errp);
-        if (new_backing_bs == NULL) {
+        new_child_bs = bdrv_lookup_bs(NULL, str, errp);
+        if (new_child_bs == NULL) {
             return -EINVAL;
-        } else if (bdrv_recurse_has_child(new_backing_bs, bs)) {
-            error_setg(errp, "Making '%s' a backing file of '%s' "
-                       "would create a cycle", str, bs->node_name);
+        } else if (bdrv_recurse_has_child(new_child_bs, bs)) {
+            error_setg(errp, "Making '%s' a %s child of '%s' would create a "
+                       "cycle", str, child_name, bs->node_name);
             return -EINVAL;
         }
         break;
     default:
-        /* 'backing' does not allow any other data type */
+        /*
+         * The options QDict has been flattened, so 'backing' and 'file'
+         * do not allow any other data type here.
+         */
         g_assert_not_reached();
     }
 
-    if (bs->backing) {
-        if (bdrv_skip_implicit_filters(bs->backing->bs) == new_backing_bs) {
+    if (old_child_bs == new_child_bs) {
+        return 0;
+    }
+
+    if (old_child_bs) {
+        if (bdrv_skip_implicit_filters(old_child_bs) == new_child_bs) {
             return 0;
         }
 
-        if (bs->backing->bs->implicit) {
-            error_setg(errp, "Cannot change backing link if '%s' has "
-                       "an implicit backing file", bs->node_name);
+        if (old_child_bs->implicit) {
+            error_setg(errp, "Cannot replace implicit %s child of %s",
+                       child_name, bs->node_name);
             return -EPERM;
         }
     }
 
-    if (bs->drv->is_filter && !bs->backing) {
+    if (bs->drv->is_filter && !old_child_bs) {
         /*
          * Filters always have a file or a backing child, so we are trying to
          * change wrong child
          */
         error_setg(errp, "'%s' is a %s filter node that does not support a "
-                   "backing child", bs->node_name, bs->drv->format_name);
+                   "%s child", bs->node_name, bs->drv->format_name, child_name);
         return -EINVAL;
     }
 
-    reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
-    return bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran, errp);
+    if (is_backing) {
+        reopen_state->old_backing_bs = old_child_bs;
+    } else {
+        reopen_state->old_file_bs = old_child_bs;
+    }
+
+    return bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
+                                           tran, errp);
 }
 
 /*
@@ -4319,7 +4340,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
-                               Transaction *set_backings_tran, Error **errp)
+                               Transaction *change_child_tran, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4439,12 +4460,21 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_backing(reopen_state, set_backings_tran, errp);
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, true,
+                                            change_child_tran, errp);
     if (ret < 0) {
         goto error;
     }
     qdict_del(reopen_state->options, "backing");
 
+    /* Allow changing the 'file' option. In this case NULL is not allowed */
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, false,
+                                            change_child_tran, errp);
+    if (ret < 0) {
+        goto error;
+    }
+    qdict_del(reopen_state->options, "file");
+
     /* Options that are not handled are only okay if they are unchanged
      * compared to the old state. It is expected that some options are only
      * used for the initial open, but not reopen (e.g. filename) */
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index c7d671366a..d955e0dfd3 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -146,8 +146,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
         self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
         self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
-        self.reopen(opts, {'file': 'not-found'}, "Cannot change the option 'file'")
-        self.reopen(opts, {'file': ''}, "Cannot change the option 'file'")
+        self.reopen(opts, {'file': 'not-found'}, "Cannot find device='' nor node-name='not-found'")
+        self.reopen(opts, {'file': ''}, "Cannot find device='' nor node-name=''")
         self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
         self.reopen(opts, {'file.node-name': 'newname'}, "Cannot change the option 'node-name'")
         self.reopen(opts, {'file.driver': 'host_device'}, "Cannot change the option 'driver'")
@@ -443,7 +443,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # Illegal operation: hd2 is a child of hd1
         self.reopen(opts[2], {'backing': 'hd1'},
-                    "Making 'hd1' a backing file of 'hd2' would create a cycle")
+                    "Making 'hd1' a backing child of 'hd2' would create a cycle")
 
         # hd2 <- hd0, hd2 <- hd1
         self.reopen(opts[0], {'backing': 'hd2'})
@@ -454,8 +454,9 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # More illegal operations
         self.reopen(opts[2], {'backing': 'hd1'},
-                    "Making 'hd1' a backing file of 'hd2' would create a cycle")
-        self.reopen(opts[2], {'file': 'hd0-file'}, "Cannot change the option 'file'")
+                    "Making 'hd1' a backing child of 'hd2' would create a cycle")
+        self.reopen(opts[2], {'file': 'hd0-file'},
+                    "Permission conflict on node 'hd0-file': permissions 'write, resize' are both required by node 'hd0' (uses node 'hd0-file' as 'file' child) and unshared by node 'hd2' (uses node 'hd0-file' as 'file' child).")
 
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd2')
         self.assert_qmp(result, 'error/class', 'GenericError')
@@ -497,18 +498,18 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # Illegal: hd2 is backed by hd1
         self.reopen(opts[1], {'backing': 'hd2'},
-                    "Making 'hd2' a backing file of 'hd1' would create a cycle")
+                    "Making 'hd2' a backing child of 'hd1' would create a cycle")
 
         # hd1 <- hd0 <- hd2
         self.reopen(opts[2], {'backing': 'hd0'})
 
         # Illegal: hd2 is backed by hd0, which is backed by hd1
         self.reopen(opts[1], {'backing': 'hd2'},
-                    "Making 'hd2' a backing file of 'hd1' would create a cycle")
+                    "Making 'hd2' a backing child of 'hd1' would create a cycle")
 
         # Illegal: hd1 cannot point to itself
         self.reopen(opts[1], {'backing': 'hd1'},
-                    "Making 'hd1' a backing file of 'hd1' would create a cycle")
+                    "Making 'hd1' a backing child of 'hd1' would create a cycle")
 
         # Remove all backing files
         self.reopen(opts[0])
@@ -530,7 +531,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # Illegal: hd0 is a child of the blkverify node
         self.reopen(opts[0], {'backing': 'bv'},
-                    "Making 'bv' a backing file of 'hd0' would create a cycle")
+                    "Making 'bv' a backing child of 'hd0' would create a cycle")
 
         # Delete the blkverify node
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'bv')
@@ -563,7 +564,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # You can't make quorum0 a backing file of hd0:
         # hd0 is already a child of quorum0.
         self.reopen(hd_opts(0), {'backing': 'quorum0'},
-                    "Making 'quorum0' a backing file of 'hd0' would create a cycle")
+                    "Making 'quorum0' a backing child of 'hd0' would create a cycle")
 
         # Delete quorum0
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'quorum0')
@@ -969,7 +970,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd1 while the commit job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change backing link if 'hd0' has an implicit backing file")
+        self.reopen(opts, {}, "Cannot replace implicit backing child of hd0")
 
         # hd2 <- hd0
         self.vm.run_job('commit0', auto_finalize = False, auto_dismiss = True)
-- 
2.31.1


