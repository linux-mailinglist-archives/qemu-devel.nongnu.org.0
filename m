Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63C26EDBCC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:43:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCNr-0003sF-Dg; Tue, 25 Apr 2023 02:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNn-0003mf-I2
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNj-0004LR-9v
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jA1uuzuaT8CNxMlYFtyJDTbctEafmdIKRlIT9CC8Q8E=;
 b=SdIDmagEYKOVXXPrNX9Ok3pGyBhrXP318yoxe9N8VFbNijaU2zUAGEvBRJcRwRBE8xW7BG
 IotpvVnOqyJPNjIcVir7LIn+Ez0ESuRUwJwEo5EazBsa8cHHKUAiMgvPEkKJrUer7LYLEL
 ffMsdF/iK6Xr+gacCQ88TxC/InCY1zQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-Qt9yQHwsNB6othXKloIMRw-1; Tue, 25 Apr 2023 02:42:27 -0400
X-MC-Unique: Qt9yQHwsNB6othXKloIMRw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A448858F0E;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A89A492C18;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C7E8F21F9816; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org, marcandre.lureau@gmail.com,
 david@redhat.com
Subject: [PATCH v2 07/16] qapi: Tidy up examples
Date: Tue, 25 Apr 2023 08:42:14 +0200
Message-Id: <20230425064223.820979-8-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

A few examples neglect to prefix QMP input with '->'.  Fix that.

Two examples have extra space after '<-'.  Delete it.

A few examples neglect to show output.  Provide some.  The example
output for query-vcpu-dirty-limit could use further improvement.  Add
a TODO comment.

Use "Examples:" instead of "Example:" where multiple examples are
given.

One example section numbers its two examples.  Not done elsewhere;
drop.

Another example section separates them with "or".  Likewise.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/block-core.json | 14 ++++++--------
 qapi/block.json      |  2 +-
 qapi/char.json       |  4 ++--
 qapi/machine.json    |  7 ++++---
 qapi/migration.json  | 33 ++++++++++++++++++++++-----------
 qapi/misc.json       |  7 +++----
 qapi/net.json        |  4 +---
 qapi/qdev.json       |  2 +-
 qapi/qom.json        |  2 +-
 qapi/replay.json     |  3 +++
 qapi/run-state.json  |  5 ++---
 qapi/ui.json         |  2 +-
 12 files changed, 47 insertions(+), 38 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index eeb2ed3f16..a5a5007b28 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4574,9 +4574,8 @@
 #
 # Since: 2.9
 #
-# Example:
+# Examples:
 #
-# 1.
 # -> { "execute": "blockdev-add",
 #      "arguments": {
 #           "driver": "qcow2",
@@ -4589,7 +4588,6 @@
 #     }
 # <- { "return": {} }
 #
-# 2.
 # -> { "execute": "blockdev-add",
 #      "arguments": {
 #           "driver": "qcow2",
@@ -5596,7 +5594,7 @@
 #
 # Since: 2.7
 #
-# Example:
+# Examples:
 #
 # 1. Add a new node to a quorum
 # -> { "execute": "blockdev-add",
@@ -5646,7 +5644,7 @@
 #
 # Since: 2.12
 #
-# Example:
+# Examples:
 #
 # 1. Move a node into an IOThread
 # -> { "execute": "x-blockdev-set-iothread",
@@ -5731,18 +5729,18 @@
 #
 # Since: 2.0
 #
-# Example:
+# Examples:
 #
 # 1. Read operation
 #
-# { "event": "QUORUM_REPORT_BAD",
+# <- { "event": "QUORUM_REPORT_BAD",
 #      "data": { "node-name": "node0", "sector-num": 345435, "sectors-count": 5,
 #                "type": "read" },
 #      "timestamp": { "seconds": 1344522075, "microseconds": 745528 } }
 #
 # 2. Flush operation
 #
-# { "event": "QUORUM_REPORT_BAD",
+# <- { "event": "QUORUM_REPORT_BAD",
 #      "data": { "node-name": "node0", "sector-num": 0, "sectors-count": 2097120,
 #                "type": "flush", "error": "Broken pipe" },
 #      "timestamp": { "seconds": 1456406829, "microseconds": 291763 } }
diff --git a/qapi/block.json b/qapi/block.json
index 5fe068f903..94339a1761 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -457,7 +457,7 @@
 #
 # Since: 1.1
 #
-# Example:
+# Examples:
 #
 # -> { "execute": "block_set_io_throttle",
 #      "arguments": { "id": "virtio-blk-pci0/virtio-backend",
diff --git a/qapi/char.json b/qapi/char.json
index 923dc5056d..c9431dd0a7 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -637,7 +637,7 @@
 #
 # Since: 1.4
 #
-# Example:
+# Examples:
 #
 # -> { "execute" : "chardev-add",
 #      "arguments" : { "id" : "foo",
@@ -673,7 +673,7 @@
 #
 # Since: 2.10
 #
-# Example:
+# Examples:
 #
 # -> { "execute" : "chardev-change",
 #      "arguments" : { "id" : "baz",
diff --git a/qapi/machine.json b/qapi/machine.json
index 8c3c58c763..20541cb319 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -954,7 +954,7 @@
 #
 # Since: 2.7
 #
-# Example:
+# Examples:
 #
 # For pseries machine type started with -smp 2,cores=2,maxcpus=4 -cpu POWER8:
 #
@@ -1677,8 +1677,9 @@
 # Since: 7.2
 #
 # Example:
-#   {"execute": "dumpdtb"}
-#    "arguments": { "filename": "fdt.dtb" } }
+# -> { "execute": "dumpdtb" }
+#      "arguments": { "filename": "fdt.dtb" } }
+# <- { "return": {} }
 #
 ##
 { 'command': 'dumpdtb',
diff --git a/qapi/migration.json b/qapi/migration.json
index 87c174dca2..477ee4d35b 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -273,7 +273,7 @@
 #
 # Since: 0.14
 #
-# Example:
+# Examples:
 #
 # 1. Before the first migration
 #
@@ -521,6 +521,7 @@
 #
 # -> { "execute": "migrate-set-capabilities" , "arguments":
 #      { "capabilities": [ { "capability": "xbzrle", "state": true } ] } }
+# <- { "return": {} }
 #
 ##
 { 'command': 'migrate-set-capabilities',
@@ -989,6 +990,7 @@
 #
 # -> { "execute": "migrate-set-parameters" ,
 #      "arguments": { "compress-level": 1 } }
+# <- { "return": {} }
 #
 ##
 { 'command': 'migrate-set-parameters', 'boxed': true,
@@ -1279,8 +1281,8 @@
 #
 # Example:
 #
-# { "timestamp": {"seconds": 1449669631, "microseconds": 239225},
-#   "event": "MIGRATION_PASS", "data": {"pass": 2} }
+# <- { "timestamp": {"seconds": 1449669631, "microseconds": 239225},
+#       "event": "MIGRATION_PASS", "data": {"pass": 2} }
 #
 ##
 { 'event': 'MIGRATION_PASS',
@@ -1861,8 +1863,9 @@
 #
 # Example:
 #
-#   {"execute": "calc-dirty-rate", "arguments": {"calc-time": 1,
-#                                                'sample-pages': 512} }
+# -> {"execute": "calc-dirty-rate", "arguments": {"calc-time": 1,
+#                                                 'sample-pages': 512} }
+# <- { "return": {} }
 #
 ##
 { 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64',
@@ -1914,9 +1917,11 @@
 # Since: 7.1
 #
 # Example:
-#   {"execute": "set-vcpu-dirty-limit"}
-#    "arguments": { "dirty-rate": 200,
-#                   "cpu-index": 1 } }
+#
+# -> {"execute": "set-vcpu-dirty-limit"}
+#     "arguments": { "dirty-rate": 200,
+#                    "cpu-index": 1 } }
+# <- { "return": {} }
 #
 ##
 { 'command': 'set-vcpu-dirty-limit',
@@ -1937,8 +1942,10 @@
 # Since: 7.1
 #
 # Example:
-#   {"execute": "cancel-vcpu-dirty-limit"}
-#    "arguments": { "cpu-index": 1 } }
+#
+# -> {"execute": "cancel-vcpu-dirty-limit"},
+#     "arguments": { "cpu-index": 1 } }
+# <- { "return": {} }
 #
 ##
 { 'command': 'cancel-vcpu-dirty-limit',
@@ -1952,7 +1959,11 @@
 # Since: 7.1
 #
 # Example:
-#   {"execute": "query-vcpu-dirty-limit"}
+#
+# -> {"execute": "query-vcpu-dirty-limit"}
+# <- {"return": [
+#        { "limit-rate": 60, "current-rate": 3, "cpu-index": 0},
+#        { "limit-rate": 60, "current-rate": 3, "cpu-index": 1}]}
 #
 ##
 { 'command': 'query-vcpu-dirty-limit',
diff --git a/qapi/misc.json b/qapi/misc.json
index 7e278ca1eb..4afaee7fe7 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -580,10 +580,9 @@
 #
 # Example:
 #
-# <-   { "event": "RTC_CHANGE",
-#        "data": { "offset": 78 },
-#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
-#
+# <- { "event": "RTC_CHANGE",
+#      "data": { "offset": 78 },
+#      "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int', 'qom-path': 'str' } }
diff --git a/qapi/net.json b/qapi/net.json
index d6eb30008b..1f1e148f01 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -914,7 +914,7 @@
 #
 # Since: 7.2
 #
-# Example:
+# Examples:
 #
 # <- { "event": "NETDEV_STREAM_CONNECTED",
 #      "data": { "netdev-id": "netdev0",
@@ -922,8 +922,6 @@
 #                          "host": "::1", "type": "inet" } },
 #      "timestamp": { "seconds": 1666269863, "microseconds": 311222 } }
 #
-# or
-#
 # <- { "event": "NETDEV_STREAM_CONNECTED",
 #      "data": { "netdev-id": "netdev0",
 #                "addr": { "path": "/tmp/qemu0", "type": "unix" } },
diff --git a/qapi/qdev.json b/qapi/qdev.json
index 2708fb4e99..f309facf8d 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -100,7 +100,7 @@
 #
 # Since: 0.14
 #
-# Example:
+# Examples:
 #
 # -> { "execute": "device_del",
 #      "arguments": { "id": "net1" } }
diff --git a/qapi/qom.json b/qapi/qom.json
index 4fe7a93a75..2a3891e3cb 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -103,7 +103,7 @@
 #
 # Since: 1.2
 #
-# Example:
+# Examples:
 #
 # 1. Use absolute path
 #
diff --git a/qapi/replay.json b/qapi/replay.json
index 729470300d..fcbf10e237 100644
--- a/qapi/replay.json
+++ b/qapi/replay.json
@@ -81,6 +81,7 @@
 # Example:
 #
 # -> { "execute": "replay-break", "arguments": { "icount": 220414 } }
+# <- { "return": {} }
 #
 ##
 { 'command': 'replay-break', 'data': { 'icount': 'int' } }
@@ -96,6 +97,7 @@
 # Example:
 #
 # -> { "execute": "replay-delete-break" }
+# <- { "return": {} }
 #
 ##
 { 'command': 'replay-delete-break' }
@@ -117,5 +119,6 @@
 # Example:
 #
 # -> { "execute": "replay-seek", "arguments": { "icount": 220414 } }
+# <- { "return": {} }
 ##
 { 'command': 'replay-seek', 'data': { 'icount': 'int' } }
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 419c188dd1..bfc15ecad5 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -258,9 +258,8 @@
 #
 # Example:
 #
-# <-   { "event": "SUSPEND_DISK",
-#        "timestamp": { "seconds": 1344456160, "microseconds": 309119 } }
-#
+# <- { "event": "SUSPEND_DISK",
+#      "timestamp": { "seconds": 1344456160, "microseconds": 309119 } }
 ##
 { 'event': 'SUSPEND_DISK' }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index c383c11097..e9599dea50 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1153,7 +1153,7 @@
 #       so it is possible to map which console belongs to which device and
 #       display.
 #
-# Example:
+# Examples:
 #
 # 1. Press left mouse button.
 #
-- 
2.39.2


