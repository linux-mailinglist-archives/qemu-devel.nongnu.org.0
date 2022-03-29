Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA9C4EB523
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:21:33 +0200 (CEST)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJHQ-0000Ng-5u
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:21:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIhH-0006oE-R0; Tue, 29 Mar 2022 16:44:11 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:43100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIhG-0006zj-0V; Tue, 29 Mar 2022 16:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=zCgRzPSfX8ao4DY2m3S6kXo8B4jrWupjk8jkttY2I6s=; 
 t=1648586650;x=1649192050; 
 b=lWWKpXORJ7tsimGrbAmhHl/5+oWWoz6q1Sn+ie+R0w5bc3cdoiYtb+PtXEQby7fxIHRpii154/AmRvg0Zl2cXxLgJpMfOPb6Atbmhrjy23D6c5AbS1oUcWZMAKqcWlxZR3BR39lKoRbQTslg/UwRlepytGjIXfjpYrzEyr4bonk47V78QcevwBp81v5yO5CJ5CftznB1QehffHUjJrrImpzK0ILpyYhxE0Pgmmqd0koWSQJ2zBJvpk2tqBeSQ+gGWc3IGPgCSEMMSVQ43PrrjbFBoJYPVShR8Me2NXqQ+YEvhLAz3zoHOAmSJq0VDlYGg2Zi82Dtr5DF+yoPnpUqiA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIhD-000374-6l; Tue, 29 Mar 2022 23:44:07 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 37/45] qapi: add x-blockdev-replace command
Date: Tue, 29 Mar 2022 23:40:59 +0300
Message-Id: <20220329204107.411011-38-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9B83DD81DD066BE64A182F30D711DF321C3181FFB50202F95182A05F5380850404C228DA9ACA6FE27A55622F7EFB1A756CFAA9132C0082CC00C517AD1ECFAF7EE28140BE3812E77C3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77BF46084C0059042EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D3219148F76DED538638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84C7A12223318C024C527AE7098E0E6CF6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7820CF4CC0E318EFB9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC74F4549EE67997D43AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637A9B5CFA561830F3FD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F72BE6798D6036352262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-B7AD71C0: 1B70FBA5C9BEEE72C9761FC34675ADEB871C96603B655635EE9D5CB6078CC77C7852FCA171EEEFD071B50B874F048A7C
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF066AC94AFA8988247170D3C8C407BB724B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349EC559D073CA5B688C6B727B7C81CF73979BFAC02D2C4283EF6C1AA8D7AC9287F78AF1DB25EDCF441D7E09C32AA3244CE760A8CA17ED6E10E599ABA2D442A74F250262A5EE9971B0AD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGZt0G16Tvvnsg==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE65960E19525D0BDF15AF310B5C2AA281BCBED4EBA2EB499AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add a command that can replace bs in following BdrvChild structures:

 - qdev blk root child
 - block-export blk root child
 - any child BlockDriverState selected by child-name

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 blockdev.c             | 65 ++++++++++++++++++++++++++++++++++++++++++
 qapi/block-core.json   | 62 ++++++++++++++++++++++++++++++++++++++++
 stubs/blk-by-qdev-id.c |  9 ++++++
 stubs/meson.build      |  1 +
 4 files changed, 137 insertions(+)
 create mode 100644 stubs/blk-by-qdev-id.c

diff --git a/blockdev.c b/blockdev.c
index b10e867676..c1ffdbcfa4 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2147,6 +2147,71 @@ static void abort_commit(void *opaque)
 static int blockdev_del(const char *node_name, GSList **detached,
                         Transaction *tran, Error **errp);
 
+static int blockdev_replace(BlockdevReplace *repl, Transaction *tran,
+                            Error **errp)
+{
+    BdrvChild *child = NULL;
+    BlockDriverState *new_child_bs;
+
+    if (repl->parent_type == BLOCK_PARENT_TYPE_DRIVER) {
+        BlockDriverState *parent_bs;
+
+        parent_bs = bdrv_find_node(repl->u.driver.node_name);
+        if (!parent_bs) {
+            error_setg(errp, "Block driver node with node-name '%s' not "
+                       "found", repl->u.driver.node_name);
+            return -EINVAL;
+        }
+
+        child = bdrv_find_child(parent_bs, repl->u.driver.child);
+        if (!child) {
+            error_setg(errp, "Block driver node '%s' doesn't have child "
+                       "named '%s'", repl->u.driver.node_name,
+                       repl->u.driver.child);
+            return -EINVAL;
+        }
+    } else {
+        /* Other types are similar, they work through blk */
+        BlockBackend *blk;
+        bool is_qdev = repl->parent_type == BLOCK_PARENT_TYPE_QDEV;
+        const char *id =
+            is_qdev ? repl->u.qdev.qdev_id : repl->u.export.export_id;
+
+        assert(is_qdev || repl->parent_type == BLOCK_PARENT_TYPE_EXPORT);
+
+        blk = is_qdev ? blk_by_qdev_id(id, errp) : blk_by_export_id(id, errp);
+        if (!blk) {
+            return -EINVAL;
+        }
+
+        child = blk_root(blk);
+        if (!child) {
+            error_setg(errp, "%s '%s' is empty, nothing to replace",
+                       is_qdev ? "Device" : "Export", id);
+            return -EINVAL;
+        }
+    }
+
+    assert(child);
+    assert(child->bs);
+
+    new_child_bs = bdrv_find_node(repl->new_child);
+    if (!new_child_bs) {
+        error_setg(errp, "Node '%s' not found", repl->new_child);
+        return -EINVAL;
+    }
+
+    return bdrv_replace_child_bs(child, new_child_bs, tran, errp);
+}
+
+void qmp_x_blockdev_replace(BlockdevReplace *repl, Error **errp)
+{
+    Transaction *tran = tran_new();
+    int ret = blockdev_replace(repl, tran, errp);
+
+    tran_finalize(tran, ret);
+}
+
 static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
                                GSList **refresh_list,
                                Transaction *tran, Error **errp)
diff --git a/qapi/block-core.json b/qapi/block-core.json
index c0d56b7128..05865dd54b 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5579,3 +5579,65 @@
 { 'command': 'blockdev-snapshot-delete-internal-sync',
   'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
   'returns': 'SnapshotInfo' }
+
+##
+# @BlockParentType:
+#
+# Since 7.0
+##
+{ 'enum': 'BlockParentType',
+  'data': ['qdev', 'driver', 'export'] }
+
+##
+# @BdrvChildRefQdev:
+#
+# Since 7.0
+##
+{ 'struct': 'BdrvChildRefQdev',
+  'data': { 'qdev-id': 'str' } }
+
+##
+# @BdrvChildRefExport:
+#
+# Since 7.0
+##
+{ 'struct': 'BdrvChildRefExport',
+  'data': { 'export-id': 'str' } }
+
+##
+# @BdrvChildRefDriver:
+#
+# Since 7.0
+##
+{ 'struct': 'BdrvChildRefDriver',
+  'data': { 'node-name': 'str', 'child': 'str' } }
+
+##
+# @BlockdevReplace:
+#
+# Since 7.0
+##
+{ 'union': 'BlockdevReplace',
+  'base': {
+      'parent-type': 'BlockParentType',
+      'new-child': 'str'
+  },
+  'discriminator': 'parent-type',
+  'data': {
+      'qdev': 'BdrvChildRefQdev',
+      'export': 'BdrvChildRefExport',
+      'driver': 'BdrvChildRefDriver'
+  } }
+
+##
+# @x-blockdev-replace:
+#
+# Replace a block-node associated with device (selected by
+# @qdev-id) or with block-export (selected by @export-id) or
+# any child of block-node (selected by @node-name and @child)
+# with @new-child block-node.
+#
+# Since 7.0
+##
+{ 'command': 'x-blockdev-replace', 'boxed': true,
+  'data': 'BlockdevReplace' }
diff --git a/stubs/blk-by-qdev-id.c b/stubs/blk-by-qdev-id.c
new file mode 100644
index 0000000000..0e751ce4f7
--- /dev/null
+++ b/stubs/blk-by-qdev-id.c
@@ -0,0 +1,9 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "sysemu/block-backend.h"
+
+BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
+{
+    error_setg(errp, "blk '%s' not found", id);
+    return NULL;
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index d359cbe1ad..90358823fc 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -1,6 +1,7 @@
 stub_ss.add(files('bdrv-next-monitor-owned.c'))
 stub_ss.add(files('blk-commit-all.c'))
 stub_ss.add(files('blk-exp-close-all.c'))
+stub_ss.add(files('blk-by-qdev-id.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
-- 
2.35.1


