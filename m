Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63C1D2595
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 05:52:40 +0200 (CEST)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ4vH-00042S-8T
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 23:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ4sY-0000Hy-LW
 for qemu-devel@nongnu.org; Wed, 13 May 2020 23:49:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53395
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ4sX-0008Pd-O1
 for qemu-devel@nongnu.org; Wed, 13 May 2020 23:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589428189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YwgeYTj6shlJEcWAb0bpxoHNzTl6kakit/yby4UtizQ=;
 b=DGh1p2DtrLcL5DPM3MVetlQumNerPMPCwkECMm8F3uOXAC2QPx2MMCiR1sefba/Uf+wXgw
 90ufh317LGqldWvYK4/Kh2FZ0QpM5dDQ5aurgRE8wrM20oWzKn4lI5ilEnICFYYmbc8GTH
 38K1drdnQRlWio/DAyI7mkKwKo1ynXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-Ep07ldf1MiaYAdLvaDypSw-1; Wed, 13 May 2020 23:49:45 -0400
X-MC-Unique: Ep07ldf1MiaYAdLvaDypSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76844107ACF6;
 Thu, 14 May 2020 03:49:44 +0000 (UTC)
Received: from probe.redhat.com (ovpn-113-9.rdu2.redhat.com [10.10.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC9E47529E;
 Thu, 14 May 2020 03:49:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 3/5] qmp: expose block-dirty-bitmap-populate
Date: Wed, 13 May 2020 23:49:20 -0400
Message-Id: <20200514034922.24834-4-jsnow@redhat.com>
In-Reply-To: <20200514034922.24834-1-jsnow@redhat.com>
References: <20200514034922.24834-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, vsementsov@virtuozzo.com,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a new job-creating command.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/block-core.json  | 18 +++++++++++
 qapi/transaction.json |  2 ++
 blockdev.c            | 74 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0fb527a9a1..f7cae77fc9 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2250,6 +2250,24 @@
             '*auto-finalize': 'bool',
             '*auto-dismiss': 'bool' } }
 
+##
+# @block-dirty-bitmap-populate:
+#
+# Creates a new job that writes a pattern into a dirty bitmap.
+#
+# Since: 5.0
+#
+# Example:
+#
+# -> { "execute": "block-dirty-bitmap-populate",
+#      "arguments": { "node": "drive0", "target": "bitmap0",
+#                     "job-id": "job0", "pattern": "allocate-top" } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'block-dirty-bitmap-populate', 'boxed': true,
+  'data': 'BlockDirtyBitmapPopulate' }
+
 ##
 # @BlockDirtyBitmapSha256:
 #
diff --git a/qapi/transaction.json b/qapi/transaction.json
index b6c11158f0..44be517de5 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -50,6 +50,7 @@
 # - @block-dirty-bitmap-enable: since 4.0
 # - @block-dirty-bitmap-disable: since 4.0
 # - @block-dirty-bitmap-merge: since 4.0
+# - @block-dirty-bitmap-populate: since 5.0
 # - @blockdev-backup: since 2.3
 # - @blockdev-snapshot: since 2.5
 # - @blockdev-snapshot-internal-sync: since 1.7
@@ -67,6 +68,7 @@
        'block-dirty-bitmap-enable': 'BlockDirtyBitmap',
        'block-dirty-bitmap-disable': 'BlockDirtyBitmap',
        'block-dirty-bitmap-merge': 'BlockDirtyBitmapMerge',
+       'block-dirty-bitmap-populate': 'BlockDirtyBitmapPopulate',
        'blockdev-backup': 'BlockdevBackup',
        'blockdev-snapshot': 'BlockdevSnapshot',
        'blockdev-snapshot-internal-sync': 'BlockdevSnapshotInternal',
diff --git a/blockdev.c b/blockdev.c
index d3e8a6ca22..08844e9e33 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2233,6 +2233,63 @@ static void block_dirty_bitmap_remove_commit(BlkActionState *common)
     bdrv_release_dirty_bitmap(state->bitmap);
 }
 
+static void block_dirty_bitmap_populate_prepare(BlkActionState *common,
+                                                Error **errp)
+{
+    BlockJobActionState *state = DO_UPCAST(BlockJobActionState, common, common);
+    BlockDirtyBitmapPopulate *bitpop;
+    BlockDriverState *bs;
+    AioContext *aio_context;
+    BdrvDirtyBitmap *bmap = NULL;
+    int job_flags = JOB_DEFAULT;
+
+    assert(common->action->type == \
+           TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_POPULATE);
+    bitpop = common->action->u.block_dirty_bitmap_populate.data;
+
+    bmap = block_dirty_bitmap_lookup(bitpop->node, bitpop->name, &bs, errp);
+    if (!bmap) {
+        return;
+    }
+
+    aio_context = bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
+    state->bs = bs;
+
+    /* Paired with .clean() */
+    bdrv_drained_begin(state->bs);
+
+    if (!bitpop->has_on_error) {
+        bitpop->on_error = BLOCKDEV_ON_ERROR_REPORT;
+    }
+    if (!bitpop->has_auto_finalize) {
+        bitpop->auto_finalize = true;
+    }
+    if (!bitpop->has_auto_dismiss) {
+        bitpop->auto_dismiss = true;
+    }
+
+    if (!bitpop->auto_finalize) {
+        job_flags |= JOB_MANUAL_FINALIZE;
+    }
+    if (!bitpop->auto_dismiss) {
+        job_flags |= JOB_MANUAL_DISMISS;
+    }
+
+    state->job = bitpop_job_create(
+        bitpop->job_id,
+        bs,
+        bmap,
+        bitpop->pattern,
+        bitpop->on_error,
+        job_flags,
+        NULL, NULL,
+        common->block_job_txn,
+        errp);
+
+    aio_context_release(aio_context);
+}
+
 static void abort_prepare(BlkActionState *common, Error **errp)
 {
     error_setg(errp, "Transaction aborted using Abort action");
@@ -2316,6 +2373,13 @@ static const BlkActionOps actions[] = {
         .commit = block_dirty_bitmap_remove_commit,
         .abort = block_dirty_bitmap_remove_abort,
     },
+    [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_POPULATE] = {
+        .instance_size = sizeof(BlockJobActionState),
+        .prepare = block_dirty_bitmap_populate_prepare,
+        .commit = blockdev_backup_commit,
+        .abort = blockdev_backup_abort,
+        .clean = blockdev_backup_clean,
+    },
     /* Where are transactions for MIRROR, COMMIT and STREAM?
      * Although these blockjobs use transaction callbacks like the backup job,
      * these jobs do not necessarily adhere to transaction semantics.
@@ -2672,6 +2736,16 @@ void qmp_block_dirty_bitmap_merge(const char *node, const char *target,
     do_block_dirty_bitmap_merge(node, target, bitmaps, NULL, errp);
 }
 
+void qmp_block_dirty_bitmap_populate(BlockDirtyBitmapPopulate *bitpop,
+                                     Error **errp)
+{
+    TransactionAction action = {
+        .type = TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_POPULATE,
+        .u.block_dirty_bitmap_populate.data = bitpop,
+    };
+    blockdev_do_action(&action, errp);
+}
+
 BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
                                                               const char *name,
                                                               Error **errp)
-- 
2.21.1


