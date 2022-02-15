Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A724B740A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:22:23 +0100 (CET)
Received: from localhost ([::1]:46876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1Wv-0004VV-Nu
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK1Ta-0001ba-6v
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:18:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK1TW-0001ra-G2
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644945529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+5h8emc4/VYQO+YODNpU3didg0Dy2ajky6cp4LcuHr8=;
 b=X7VDgiN86ebXYFeZA359EztxUbeOUWMd5a9sSx2KpPFWAgOkAmFaYQL/B1LkMUoK6MlL89
 z5/iIv5Wok0AQrR9ycO9weS9xjZmfHEfGrEE6CAsmm6St6kAkNwbvGNzoJc0nquPRUaLG1
 GgbzNGrTMCawlQZrZlMSN20jHx4XMK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-BD0buhYmOaeKsH7r0ZMYRg-1; Tue, 15 Feb 2022 12:18:43 -0500
X-MC-Unique: BD0buhYmOaeKsH7r0ZMYRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BAFC1091DA0;
 Tue, 15 Feb 2022 17:18:42 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E15DE752C9;
 Tue, 15 Feb 2022 17:18:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable exports
Date: Tue, 15 Feb 2022 11:18:38 -0600
Message-Id: <20220215171838.2651387-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 rjones@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the NBD spec, a server advertising
NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
not see any cache inconsistencies: when properly separated by a single
flush, actions performed by one client will be visible to another
client, regardless of which client did the flush.  We satisfy these
conditions in qemu when our block layer is backed by the local
filesystem (by virtue of the semantics of fdatasync(), and the fact
that qemu itself is not buffering writes beyond flushes).  It is
harder to state whether we satisfy these conditions for network-based
protocols, so the safest course of action is to allow users to opt-in
to advertising multi-conn.  We may later tweak defaults to advertise
by default when the block layer can confirm that the underlying
protocol driver is cache consistent between multiple writers, but for
now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
explicitly start qemu-nbd or qemu-storage-daemon with multi-conn
advertisement in a known-safe setup where the client end can then
benefit from parallel clients.

Note, however, that we don't want to advertise MULTI_CONN when we know
that a second client cannot connect (for historical reasons, qemu-nbd
defaults to a single connection while nbd-server-add and QMP commands
default to unlimited connections; but we already have existing means
to let either style of NBD server creation alter those defaults).  The
harder part of this patch is setting up an iotest to demonstrate
behavior of multiple NBD clients to a single server.  It might be
possible with parallel qemu-io processes, but concisely managing that
in shell is painful.  I found it easier to do by relying on the libnbd
project's nbdsh, which means this test will be skipped on platforms
where that is not available.

Signed-off-by: Eric Blake <eblake@redhat.com>
Fixes: https://bugzilla.redhat.com/1708300
---

v1 was in Aug 2021 [1], with further replies in Sep [2] and Oct [3].

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04900.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg00038.html
[3] https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg06744.html

Since then, I've tweaked the QAPI to mention 7.0 (instead of 6.2), and
reworked the logic so that default behavior is unchanged for now
(advertising multi-conn on a writable export requires opt-in during
the command line or QMP, but remains default for a readonly export).
I've also expanded the amount of testing done in the new iotest.

 docs/interop/nbd.txt                       |   1 +
 docs/tools/qemu-nbd.rst                    |   3 +-
 qapi/block-export.json                     |  34 +++-
 include/block/nbd.h                        |   3 +-
 blockdev-nbd.c                             |   5 +
 nbd/server.c                               |  27 ++-
 MAINTAINERS                                |   1 +
 tests/qemu-iotests/tests/nbd-multiconn     | 188 +++++++++++++++++++++
 tests/qemu-iotests/tests/nbd-multiconn.out | 112 ++++++++++++
 9 files changed, 363 insertions(+), 11 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
 create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out

diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index bdb0f2a41aca..6c99070b99c8 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -68,3 +68,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
 * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
 NBD_CMD_FLAG_FAST_ZERO
 * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
+* 7.0: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 6031f9689312..1de785524c36 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -139,8 +139,7 @@ driver options if ``--image-opts`` is specified.
 .. option:: -e, --shared=NUM

   Allow up to *NUM* clients to share the device (default
-  ``1``), 0 for unlimited. Safe for readers, but for now,
-  consistency is not guaranteed between multiple writers.
+  ``1``), 0 for unlimited.

 .. option:: -t, --persistent

diff --git a/qapi/block-export.json b/qapi/block-export.json
index f183522d0d2c..0a27e8ee84f9 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -21,7 +21,9 @@
 #             recreated on the fly while the NBD server is active.
 #             If missing, it will default to denying access (since 4.0).
 # @max-connections: The maximum number of connections to allow at the same
-#                   time, 0 for unlimited. (since 5.2; default: 0)
+#                   time, 0 for unlimited. Setting this to 1 also stops
+#                   the server from advertising multiple client support
+#                   (since 5.2; default: 0)
 #
 # Since: 4.2
 ##
@@ -50,7 +52,9 @@
 #             recreated on the fly while the NBD server is active.
 #             If missing, it will default to denying access (since 4.0).
 # @max-connections: The maximum number of connections to allow at the same
-#                   time, 0 for unlimited. (since 5.2; default: 0)
+#                   time, 0 for unlimited. Setting this to 1 also stops
+#                   the server from advertising multiple client support
+#                   (since 5.2; default: 0).
 #
 # Returns: error if the server is already running.
 #
@@ -79,6 +83,26 @@
 { 'struct': 'BlockExportOptionsNbdBase',
   'data': { '*name': 'str', '*description': 'str' } }

+##
+# @NbdExportMultiConn:
+#
+# Possible settings for advertising NBD multiple client support.
+#
+# @off: Do not advertise multiple clients.
+#
+# @on: Allow multiple clients (for writable clients, this is only safe
+#      if the underlying BDS is cache-consistent, such as when backed
+#      by the raw file driver); ignored if the NBD server was set up
+#      with max-connections of 1.
+#
+# @auto: Behaves like @off if the export is writable, and @on if the
+#        export is read-only.
+#
+# Since: 7.0
+##
+{ 'enum': 'NbdExportMultiConn',
+  'data': ['off', 'on', 'auto'] }
+
 ##
 # @BlockExportOptionsNbd:
 #
@@ -95,11 +119,15 @@
 #                    the metadata context name "qemu:allocation-depth" to
 #                    inspect allocation details. (since 5.2)
 #
+# @multi-conn: Controls whether multiple client support is advertised, if the
+#              server's max-connections is not 1. (default auto, since 7.0)
+#
 # Since: 5.2
 ##
 { 'struct': 'BlockExportOptionsNbd',
   'base': 'BlockExportOptionsNbdBase',
-  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool' } }
+  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool',
+            '*multi-conn': 'NbdExportMultiConn' } }

 ##
 # @BlockExportOptionsVhostUserBlk:
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 78d101b77488..138b9857dbcb 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2020 Red Hat, Inc.
+ *  Copyright (C) 2016-2022 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device
@@ -346,6 +346,7 @@ void nbd_client_put(NBDClient *client);

 void nbd_server_is_qemu_nbd(bool value);
 bool nbd_server_is_running(void);
+int nbd_server_max_connections(void);
 void nbd_server_start(SocketAddress *addr, const char *tls_creds,
                       const char *tls_authz, uint32_t max_connections,
                       Error **errp);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index bdfa7ed3a5a9..0df222e868d8 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -44,6 +44,11 @@ bool nbd_server_is_running(void)
     return nbd_server || is_qemu_nbd;
 }

+int nbd_server_max_connections(void)
+{
+    return nbd_server ? nbd_server->max_connections : -1;
+}
+
 static void nbd_blockdev_client_closed(NBDClient *client, bool ignored)
 {
     nbd_client_put(client);
diff --git a/nbd/server.c b/nbd/server.c
index 9fb2f264023e..f17aacc8139f 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2021 Red Hat, Inc.
+ *  Copyright (C) 2016-2022 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device Server Side
@@ -1641,7 +1641,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     int64_t size;
     uint64_t perm, shared_perm;
     bool readonly = !exp_args->writable;
-    bool shared = !exp_args->writable;
+    bool multi_conn;
     strList *bitmaps;
     size_t i;
     int ret;
@@ -1679,6 +1679,23 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
         return size;
     }

+    /*
+     * Determine whether to advertise multi-conn.  Default is auto,
+     * which resolves to on for read-only and off for writable.  But
+     * if the server has max-connections 1, that forces the flag off.
+     */
+    if (!arg->has_multi_conn) {
+        arg->multi_conn = NBD_EXPORT_MULTI_CONN_AUTO;
+    }
+    if (nbd_server_max_connections() == 1) {
+        arg->multi_conn = NBD_EXPORT_MULTI_CONN_OFF;
+    }
+    if (arg->multi_conn == NBD_EXPORT_MULTI_CONN_AUTO) {
+        multi_conn = readonly;
+    } else {
+        multi_conn = arg->multi_conn == NBD_EXPORT_MULTI_CONN_ON;
+    }
+
     /* Don't allow resize while the NBD server is running, otherwise we don't
      * care what happens with the node. */
     blk_get_perm(blk, &perm, &shared_perm);
@@ -1692,11 +1709,11 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     exp->description = g_strdup(arg->description);
     exp->nbdflags = (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_FLUSH |
                      NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);
+    if (multi_conn) {
+        exp->nbdflags |= NBD_FLAG_CAN_MULTI_CONN;
+    }
     if (readonly) {
         exp->nbdflags |= NBD_FLAG_READ_ONLY;
-        if (shared) {
-            exp->nbdflags |= NBD_FLAG_CAN_MULTI_CONN;
-        }
     } else {
         exp->nbdflags |= (NBD_FLAG_SEND_TRIM | NBD_FLAG_SEND_WRITE_ZEROES |
                           NBD_FLAG_SEND_FAST_ZERO);
diff --git a/MAINTAINERS b/MAINTAINERS
index 9814580975c5..24dd800ae3f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3334,6 +3334,7 @@ F: qemu-nbd.*
 F: blockdev-nbd.c
 F: docs/interop/nbd.txt
 F: docs/tools/qemu-nbd.rst
+F: tests/qemu-iotests/tests/*nbd*
 T: git https://repo.or.cz/qemu/ericb.git nbd
 T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd

diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
new file mode 100755
index 000000000000..0261552f32f2
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-multiconn
@@ -0,0 +1,188 @@
+#!/usr/bin/env bash
+# group: rw auto quick
+#
+# Test that qemu-nbd MULTI_CONN works
+#
+# Copyright (C) 2018-2022 Red Hat, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+seq="$(basename $0)"
+echo "QA output created by $seq"
+
+status=1 # failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+    _cleanup_qemu
+    rm -f "$SOCK_DIR/nbd"
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+cd ..
+. ./common.rc
+. ./common.filter
+. ./common.qemu
+. ./common.nbd
+
+_supported_fmt qcow2
+_supported_proto file
+_supported_os Linux
+_require_command QEMU_NBD
+
+# Parallel client connections are easier with libnbd than qemu-io:
+if ! (nbdsh --version) >/dev/null 2>&1; then
+    _notrun "nbdsh utility required, skipped this test"
+fi
+
+echo
+echo "=== Initial image setup ==="
+echo
+
+_make_test_img 4M
+$QEMU_IO -c 'w -P 1 0 2M' -c 'w -P 2 2M 2M' "$TEST_IMG" | _filter_qemu_io
+_launch_qemu 2> >(_filter_nbd)
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"qmp_capabilities"}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
+  "arguments":{"driver":"qcow2", "node-name":"n",
+    "file":{"driver":"file", "filename":"'"$TEST_IMG"'"}}}' "return"
+export nbd_unix_socket
+
+echo
+echo "=== Default nbd server settings ==="
+echo
+# Default allows for unlimited connections, readonly images advertise
+# multi-conn, and writable images do not
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
+  "arguments":{"addr":{"type":"unix",
+    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
+    "name":"r"}}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
+    "name":"w", "writable":true}}' "return"
+nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
+assert h.can_multi_conn()
+h.shutdown()
+print("nbdsh passed")'
+nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
+assert not h.can_multi_conn()
+h.shutdown()
+print("nbdsh passed")'
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
+  "arguments":{"id":"r"}}' "DELETED"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
+  "arguments":{"id":"w"}}' "DELETED"
+
+echo
+echo "=== Per-export overrides of defaults ==="
+echo
+# Can explicitly disable multi-conn for readonly image, and explicitly
+# enable it for writable image
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
+    "name":"r", "multi-conn":"off"}}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
+    "name":"w", "multi-conn":"on", "writable":true}}' "return"
+nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
+assert not h.can_multi_conn()
+h.shutdown()
+print("nbdsh passed")'
+nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
+assert h.can_multi_conn()
+h.shutdown()
+print("nbdsh passed")'
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
+  "arguments":{"id":"r"}}' "DELETED"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
+  "arguments":{"id":"w"}}' "DELETED"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-stop"}' "return"
+
+echo
+echo "=== Limit nbd server max-connections ==="
+echo
+# When max-connections is 1, no images advertise multi-conn, even when
+# explicitly requested per export
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
+  "arguments":{"max-connections":1, "addr":{"type":"unix",
+    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
+    "name":"r", "multi-conn":"on"}}' "return"
+nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
+assert not h.can_multi_conn()
+h.shutdown()
+print("nbdsh passed")'
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
+  "arguments":{"id":"r"}}' "DELETED"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
+    "name":"w", "multi-conn":"on", "writable":true}}' "return"
+nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
+assert not h.can_multi_conn()
+h.shutdown()
+print("nbdsh passed")'
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
+  "arguments":{"id":"w"}}' "DELETED"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-stop"}' "return"
+
+echo
+echo "=== Demonstrate parallel writers ==="
+echo
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
+  "arguments":{"addr":{"type":"unix",
+    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
+    "name":"", "multi-conn":"on", "writable":true}}' "return"
+
+nbdsh -c '
+import os
+sock = os.getenv("nbd_unix_socket")
+h = []
+
+for i in range(3):
+  h.append(nbd.NBD())
+  h[i].connect_unix(sock)
+  assert h[i].can_multi_conn()
+
+buf1 = h[0].pread(1024 * 1024, 0)
+if buf1 != b"\x01" * 1024 * 1024:
+  print("Unexpected initial read")
+buf2 = b"\x03" * 1024 * 1024
+h[1].pwrite(buf2, 0)
+h[2].flush()
+buf1 = h[0].pread(1024 * 1024, 0)
+if buf1 == buf2:
+  print("Flush appears to be consistent across connections")
+
+for i in range(3):
+  h[i].shutdown()
+'
+
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
+  "arguments":{"id":"w"}}' "DELETED"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-stop"}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"quit"}' "return"
+wait=yes _cleanup_qemu
+
+# success, all done
+echo '*** done'
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/nbd-multiconn.out b/tests/qemu-iotests/tests/nbd-multiconn.out
new file mode 100644
index 000000000000..a06428e1536a
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-multiconn.out
@@ -0,0 +1,112 @@
+QA output created by nbd-multiconn
+
+=== Initial image setup ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4194304
+wrote 2097152/2097152 bytes at offset 0
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 2097152/2097152 bytes at offset 2097152
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+{"execute":"qmp_capabilities"}
+{"return": {}}
+{"execute":"blockdev-add",
+  "arguments":{"driver":"IMGFMT", "node-name":"n",
+    "file":{"driver":"file", "filename":"TEST_DIR/t.IMGFMT"}}}
+{"return": {}}
+
+=== Default nbd server settings ===
+
+{"execute":"nbd-server-start",
+  "arguments":{"addr":{"type":"unix",
+    "data":{"path":"SOCK_DIR/qemu-nbd.sock"}}}}
+{"return": {}}
+{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
+    "name":"r"}}
+{"return": {}}
+{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
+    "name":"w", "writable":true}}
+{"return": {}}
+nbdsh passed
+nbdsh passed
+{"execute":"block-export-del",
+  "arguments":{"id":"r"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "r"}}
+{"execute":"block-export-del",
+  "arguments":{"id":"w"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
+
+=== Per-export overrides of defaults ===
+
+{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
+    "name":"r", "multi-conn":"off"}}
+{"return": {}}
+{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
+    "name":"w", "multi-conn":"on", "writable":true}}
+{"return": {}}
+nbdsh passed
+nbdsh passed
+{"execute":"block-export-del",
+  "arguments":{"id":"r"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "r"}}
+{"execute":"block-export-del",
+  "arguments":{"id":"w"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
+{"execute":"nbd-server-stop"}
+{"return": {}}
+
+=== Limit nbd server max-connections ===
+
+{"execute":"nbd-server-start",
+  "arguments":{"max-connections":1, "addr":{"type":"unix",
+    "data":{"path":"SOCK_DIR/qemu-nbd.sock"}}}}
+{"return": {}}
+{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
+    "name":"r", "multi-conn":"on"}}
+{"return": {}}
+nbdsh passed
+{"execute":"block-export-del",
+  "arguments":{"id":"r"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "r"}}
+{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
+    "name":"w", "multi-conn":"on", "writable":true}}
+{"return": {}}
+nbdsh passed
+{"execute":"block-export-del",
+  "arguments":{"id":"w"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
+{"execute":"nbd-server-stop"}
+{"return": {}}
+
+=== Demonstrate parallel writers ===
+
+{"execute":"nbd-server-start",
+  "arguments":{"addr":{"type":"unix",
+    "data":{"path":"SOCK_DIR/qemu-nbd.sock"}}}}
+{"return": {}}
+{"execute":"block-export-add",
+  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
+    "name":"", "multi-conn":"on", "writable":true}}
+{"return": {}}
+Flush appears to be consistent across connections
+{"execute":"block-export-del",
+  "arguments":{"id":"w"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
+{"execute":"nbd-server-stop"}
+{"return": {}}
+{"execute":"quit"}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+*** done
-- 
2.35.1


