Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681194ED068
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:49:53 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi4W-0002kx-Cq
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:49:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftA-0008IN-6E
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:00 -0400
Received: from [2a00:1450:4864:20::22d] (port=36668
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft6-0003Pk-Ov
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:59 -0400
Received: by mail-lj1-x22d.google.com with SMTP id v12so16756536ljd.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KurEVHXow2yH4y+d6s9f9y3Oj56lCs+gGDawVxW2VD0=;
 b=ObC+z1ROHIjBpEcEnh4MUjFxjR9BhJSF/YZTTE8d5P/aLuOhk9xb6BwZeyYf5jhTka
 ebJY+M1AjGfLUBnTBHBsR8t4cN5Ap20DIQue+sVxX0eDIOi5aOZ/yLpuaKCdFwQn5gJ1
 1H+X2MSfDmKS1Zwsx3gbXw/cKFoRA0iJAoeyPMp0/tscLYEbxiw0mWIjymbcrznMFwXe
 JKZI5Cv+wl1HFypcgqrbGvd1+v5CQSb8gYeJoSSlGNZeWFl+KDJ5NSu9CJKtDo/KqxTU
 Xfj+30dKqRnkiRluK0G4V6Xa7AI2CHxUZzrZmCF/8fSSrgnJUHVX2Htv1fxfoc5X8VHn
 9kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KurEVHXow2yH4y+d6s9f9y3Oj56lCs+gGDawVxW2VD0=;
 b=i7Z3gwPERXQJ/eiJBN+TYK8Ydz9yieWmgCinEnex9EHCjHt3D80ZQoYExUO86b8X0Z
 JoJPWbTTmZ4QUe8D3xo6MVONalwyVPJW9fowERMQX5XtlcEl/AIejEdiSAw7nCzb/uNY
 DWa8RRSLnbX0DLURv/29DY48ynEX6BLSdm0GxoW8ysz35MgU032sxp/Uh6gRW+72AASI
 bOua6jpKYrDzaK/quzBR9emBTU110tWMIH56UIQgE2d9Yj8IsEHyrbATu467v/zh1ZKw
 v/Z6B81JRsVNeszo6ozXsTsQ/hoVq80ve+0zvU7kpdgHw9gK5u/DqNEyzPlrhBiaBCUI
 XAOQ==
X-Gm-Message-State: AOAM5332dNbghsQOc5aqN2Pl/l/7QSzxoZP8wos2eBiKQsKe9fFYOBT0
 PHRCxqagj0A3MHrVbTu6K2qbRQ==
X-Google-Smtp-Source: ABdhPJxq3SKodzL5vJ7qs1oYAlrm/U9z2KMOHdv3ca5K1CpKlg/r38paNAVTH/erkno2szCFdXrrPA==
X-Received: by 2002:a05:651c:17a3:b0:245:f39e:f2d2 with SMTP id
 bn35-20020a05651c17a300b00245f39ef2d2mr8572189ljb.490.1648675794557; 
 Wed, 30 Mar 2022 14:29:54 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:54 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 37/45] qapi: add x-blockdev-replace command
Date: Thu, 31 Mar 2022 00:28:54 +0300
Message-Id: <20220330212902.590099-38-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, hreitz@redhat.com,
 vsementsov@openvz.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a command that can replace bs in following BdrvChild structures:

 - qdev blk root child
 - block-export blk root child
 - any child BlockDriverState selected by child-name

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 blockdev.c             | 65 ++++++++++++++++++++++++++++++++++++++++++
 qapi/block-core.json   | 62 ++++++++++++++++++++++++++++++++++++++++
 stubs/blk-by-qdev-id.c |  9 ++++++
 stubs/meson.build      |  1 +
 4 files changed, 137 insertions(+)
 create mode 100644 stubs/blk-by-qdev-id.c

diff --git a/blockdev.c b/blockdev.c
index abd0600d15..3d84cb6f92 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2166,6 +2166,71 @@ static void abort_commit(void *opaque)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
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
index d915cddde9..6e944e4f52 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5592,3 +5592,65 @@
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
index 6f80fec761..9924810a23 100644
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


