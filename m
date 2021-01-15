Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8FF2F7BAF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:06:13 +0100 (CET)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Ons-0003KD-MW
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l0Ol8-00022m-Q7; Fri, 15 Jan 2021 08:03:22 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:44635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l0Ol3-0003wA-Sr; Fri, 15 Jan 2021 08:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=f8QA3U6Gnw8hWYP3Fzo72aiMuFKL6DyIS/zDdgwS/E4=; 
 b=AHPkMLkh5C7zLTGl323vm92LMfDZW+mwkoJyYQfYPk0qbhbs/MvpMjUGN7tKDyhw/0a2oqYmtpX1S8lpo7c8nG06S4TTO0l6ctfViV972TT3ErxsFslQtWggxDwumzDOYHO4QT/9S8JbOx4EHrzRK03jl2HFoSFnELH9VtYl9dNibfZgRBkki1evSdPNn1g9xdlBq/NZ1WAaUFq4V1SC1kESfNTr6rqv3qKaj0Jf4L3KIeMxERJg0zIvh1fTkqFNzZ7s8RVDW8aBX9YxbVMetmP6TisGcfXf57bSn0sJQaLMg28MEm/7e4F51wMJTAbeC+7af0luW2qwTR+WH0Hq3g==;
Received: from [213.94.31.64] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1l0Okg-0007Wc-NT; Fri, 15 Jan 2021 14:02:54 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1l0OkT-0003fm-RU; Fri, 15 Jan 2021 14:02:41 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] block: Allow changing bs->file on reopen
Date: Fri, 15 Jan 2021 14:02:37 +0100
Message-Id: <1a9b457d93c0732e8e4785a0cc4b5f3b935f2cf6.1610715661.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1610715661.git.berto@igalia.com>
References: <cover.1610715661.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the x-blockdev-reopen was added it allowed reconfiguring the
graph by replacing backing files, but changing the 'file' option was
forbidden. Because of this restriction some operations are not
possible, notably inserting and removing block filters.

This patch adds support for replacing the 'file' option. This is
similar to replacing the backing file and the user is likewise
responsible for the correctness of the resulting graph, otherwise this
can lead to data corruption.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 include/block/block.h  |  1 +
 block.c                | 61 ++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/245 |  7 ++---
 3 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 82271d9ccd..6dd687a69e 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -196,6 +196,7 @@ typedef struct BDRVReopenState {
     bool backing_missing;
     bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
     BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
+    BlockDriverState *old_file_bs;    /* keep pointer for permissions update */
     uint64_t perm, shared_perm;
     QDict *options;
     QDict *explicit_options;
diff --git a/block.c b/block.c
index 576b145cbf..114788e58e 100644
--- a/block.c
+++ b/block.c
@@ -3978,6 +3978,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
             refresh_list = bdrv_topological_dfs(refresh_list, found,
                                                 state->old_backing_bs);
         }
+        if (state->old_file_bs) {
+            refresh_list = bdrv_topological_dfs(refresh_list, found,
+                                                state->old_file_bs);
+        }
     }
 
     ret = bdrv_list_refresh_perms(refresh_list, bs_queue, &tran, errp);
@@ -4196,6 +4200,57 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
     return 0;
 }
 
+static int bdrv_reopen_parse_file(BDRVReopenState *reopen_state,
+                                  GSList **tran,
+                                  Error **errp)
+{
+    BlockDriverState *bs = reopen_state->bs;
+    BlockDriverState *new_file_bs;
+    QObject *value;
+    const char *str;
+
+    value = qdict_get(reopen_state->options, "file");
+    if (value == NULL) {
+        return 0;
+    }
+
+    /* The 'file' option only allows strings */
+    assert(qobject_type(value) == QTYPE_QSTRING);
+
+    str = qobject_get_try_str(value);
+    new_file_bs = bdrv_lookup_bs(NULL, str, errp);
+    if (new_file_bs == NULL) {
+        return -EINVAL;
+    } else if (bdrv_recurse_has_child(new_file_bs, bs)) {
+        error_setg(errp, "Making '%s' a file of '%s' "
+                   "would create a cycle", str, bs->node_name);
+        return -EINVAL;
+    }
+
+    assert(bs->file && bs->file->bs);
+
+    /* If 'file' points to the current child then there's nothing to do */
+    if (bs->file->bs == new_file_bs) {
+        return 0;
+    }
+
+    /* Check AioContext compatibility */
+    if (!bdrv_reopen_can_attach(bs, bs->file, new_file_bs, errp)) {
+        return -EINVAL;
+    }
+
+    /* At the moment only backing links are frozen */
+    assert(!bs->file->frozen);
+
+    /* Store the old file bs because we'll need to refresh its permissions */
+    reopen_state->old_file_bs = bs->file->bs;
+
+    /* And finally replace the child */
+    bdrv_replace_child(bs->file, new_file_bs, tran);
+
+    return 0;
+}
+
 /*
  * Prepares a BlockDriverState for reopen. All changes are staged in the
  * 'opaque' field of the BDRVReopenState, which is used and allocated by
@@ -4347,6 +4402,12 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
     }
     qdict_del(reopen_state->options, "backing");
 
+    ret = bdrv_reopen_parse_file(reopen_state, set_backings_tran, errp);
+    if (ret < 0) {
+        goto error;
+    }
+    qdict_del(reopen_state->options, "file");
+
     /* Options that are not handled are only okay if they are unchanged
      * compared to the old state. It is expected that some options are only
      * used for the initial open, but not reopen (e.g. filename) */
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index e60c8326d3..f9d68b3958 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -145,8 +145,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
         self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
         self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
-        self.reopen(opts, {'file': 'not-found'}, "Cannot change the option 'file'")
-        self.reopen(opts, {'file': ''}, "Cannot change the option 'file'")
+        self.reopen(opts, {'file': 'not-found'}, "Cannot find device= nor node_name=not-found")
+        self.reopen(opts, {'file': ''}, "Cannot find device= nor node_name=")
         self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
         self.reopen(opts, {'file.node-name': 'newname'}, "Cannot change the option 'node-name'")
         self.reopen(opts, {'file.driver': 'host_device'}, "Cannot change the option 'driver'")
@@ -454,7 +454,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # More illegal operations
         self.reopen(opts[2], {'backing': 'hd1'},
                     "Making 'hd1' a backing file of 'hd2' would create a cycle")
-        self.reopen(opts[2], {'file': 'hd0-file'}, "Cannot change the option 'file'")
+        self.reopen(opts[2], {'file': 'hd0-file'},
+                    "Conflicts with use by hd2 as 'file', which does not allow 'write, resize' on hd0-file")
 
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd2')
         self.assert_qmp(result, 'error/class', 'GenericError')
-- 
2.20.1


