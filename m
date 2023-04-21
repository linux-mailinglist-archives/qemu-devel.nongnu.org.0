Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48776EA97A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:42:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppp95-0006vs-1c; Fri, 21 Apr 2023 07:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppp8w-0006no-3M; Fri, 21 Apr 2023 07:41:34 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppp8s-0001H0-P8; Fri, 21 Apr 2023 07:41:33 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 9CEE360025;
 Fri, 21 Apr 2023 14:41:20 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 3fdrVT1OnCg0-qR1uosON; Fri, 21 Apr 2023 14:41:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682077279; bh=mv0a/KtDpEVCcW103rC/FA47XqWalxiRzqFUPptmZLI=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=DzBUsnJemrK7xCEh3EeUxWD05n4Hxfs7g+vo9TtpTAUu/eMUXcitBB51dCerMoaQ5
 wUHU6rKvtTnAXM4PDYEhSNFfjFWyjGhviN+UXeOJ8Ztw0DYx51vlUtYRY7H+mIe2Ta
 4oTUxBRxS7hED7FJNo6Ecl2fofwm0wyh3gTh26Is=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 alexander.ivanov@virtuozzo.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v7 4/7] qapi: add x-blockdev-replace command
Date: Fri, 21 Apr 2023 14:40:59 +0300
Message-Id: <20230421114102.884457-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421114102.884457-1-vsementsov@yandex-team.ru>
References: <20230421114102.884457-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a command that can replace bs in following BdrvChild structures:

 - qdev blk root child
 - block-export blk root child
 - any child of BlockDriverState selected by child-name

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 blockdev.c             | 56 ++++++++++++++++++++++++++++++++++++++
 qapi/block-core.json   | 62 ++++++++++++++++++++++++++++++++++++++++++
 stubs/blk-by-qdev-id.c |  9 ++++++
 stubs/meson.build      |  1 +
 4 files changed, 128 insertions(+)
 create mode 100644 stubs/blk-by-qdev-id.c

diff --git a/blockdev.c b/blockdev.c
index 461657edda..75d6283ef3 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2193,6 +2193,62 @@ static void abort_commit(BlkActionState *common)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
+void qmp_x_blockdev_replace(BlockdevReplace *repl, Error **errp)
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
+            return;
+        }
+
+        child = bdrv_find_child(parent_bs, repl->u.driver.child);
+        if (!child) {
+            error_setg(errp, "Block driver node '%s' doesn't have child "
+                       "named '%s'", repl->u.driver.node_name,
+                       repl->u.driver.child);
+            return;
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
+            return;
+        }
+
+        child = blk_root(blk);
+        if (!child) {
+            error_setg(errp, "%s '%s' is empty, nothing to replace",
+                       is_qdev ? "Device" : "Export", id);
+            return;
+        }
+    }
+
+    assert(child);
+    assert(child->bs);
+
+    new_child_bs = bdrv_find_node(repl->new_child);
+    if (!new_child_bs) {
+        error_setg(errp, "Node '%s' not found", repl->new_child);
+        return;
+    }
+
+    bdrv_replace_child_bs(child, new_child_bs, errp);
+}
+
 static const BlkActionOps actions[] = {
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
         .instance_size = sizeof(ExternalSnapshotState),
diff --git a/qapi/block-core.json b/qapi/block-core.json
index c05ad0c07e..c03ec01b53 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5858,3 +5858,65 @@
 ##
 { 'struct': 'DummyBlockCoreForceArrays',
   'data': { 'unused-block-graph-info': ['BlockGraphInfo'] } }
+
+##
+# @BlockParentType:
+#
+# Since 8.1
+##
+{ 'enum': 'BlockParentType',
+  'data': ['qdev', 'driver', 'export'] }
+
+##
+# @BdrvChildRefQdev:
+#
+# Since 8.1
+##
+{ 'struct': 'BdrvChildRefQdev',
+  'data': { 'qdev-id': 'str' } }
+
+##
+# @BdrvChildRefExport:
+#
+# Since 8.1
+##
+{ 'struct': 'BdrvChildRefExport',
+  'data': { 'export-id': 'str' } }
+
+##
+# @BdrvChildRefDriver:
+#
+# Since 8.1
+##
+{ 'struct': 'BdrvChildRefDriver',
+  'data': { 'node-name': 'str', 'child': 'str' } }
+
+##
+# @BlockdevReplace:
+#
+# Since 8.1
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
+# Since 8.1
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
index b2b5956d97..026866aea7 100644
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
2.34.1


