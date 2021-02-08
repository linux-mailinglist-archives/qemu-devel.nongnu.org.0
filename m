Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6501314355
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:57:09 +0100 (CET)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FSu-00083L-QV
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXW-0008HB-LZ; Mon, 08 Feb 2021 13:45:38 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXN-0006o3-AN; Mon, 08 Feb 2021 13:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=p5B7Hkc3AVjgiYD1v6iU+Yfxd/Ff2ptADNYOAKMq9Sg=; 
 b=LN5BD2/hl/Q9wmHRm887lqbaBbPZrQBP9Xw2b6XC7byEqUpG62wOxjVL8xg4Tz/vJXJMGbD8WYUaJ0DQ2MefZ/GubIS6IAT2fgVyAogDZbQ/z3243KJ4o9izYW0FNPtfW/WqO3pQQ0KWZGLsVQva2bPs7Ir5ufHpaLcQvlBhK/SQN8ubTDPZWls8z8cuf6R36Ag6AzReZ313NhwASGHddxT0YPXX512FyXO7gp6tx89NTgdd/G7eHXpq0V3BwYQdy14hPSllqMVbkdnEgz4whtMZTuIFYpkxtoskXsVo5Hxkra0KnO7zMmFKSDPRrp0Dvz2rfkxEd44T8ywUyHWDfw==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1l9BWw-000566-H5; Mon, 08 Feb 2021 19:45:02 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1l9BWj-000081-KQ; Mon, 08 Feb 2021 19:44:49 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/4] block: Allow changing bs->file on reopen
Date: Mon,  8 Feb 2021 19:44:41 +0100
Message-Id: <670613fb7829ae2bf1329fca2e13bd51bd357024.1612809837.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1612809837.git.berto@igalia.com>
References: <cover.1612809837.git.berto@igalia.com>
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
 Max Reitz <mreitz@redhat.com>
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
 block.c                | 65 ++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/245 |  7 +++--
 3 files changed, 70 insertions(+), 3 deletions(-)

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
index 576b145cbf..19b62da4af 100644
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
@@ -4196,6 +4200,61 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
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
+    if (bs->file->frozen) {
+        error_setg(errp, "Cannot change the 'file' link of '%s' "
+                   "from '%s' to '%s'", bs->node_name,
+                   bs->file->bs->node_name, new_file_bs->node_name);
+        return -EPERM;
+    }
+
+    /* Check AioContext compatibility */
+    if (!bdrv_reopen_can_attach(bs, bs->file, new_file_bs, errp)) {
+        return -EINVAL;
+    }
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
@@ -4347,6 +4406,12 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
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


