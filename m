Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E5A4D8E66
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:43:07 +0100 (CET)
Received: from localhost ([::1]:45386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTrX0-0005q2-3c
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:43:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTrSs-0008H0-CT
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTrSp-00021p-IR
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647290327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUFpquGOXJCB9ZOWicjVM0sVyJWHAUVhkNPL4UK/2w8=;
 b=dkMBEs3qZyx5sq/tlEV3lQysGpEfrO0wqayMIjHLMCIcuahiQzihpvCj03gnWLLxV7LJsh
 LCQEbs/RiNnTvPkw2kEFM8Su0iiOSP81OPqVfSpDMWoQgvXx4WBNJTWDuJ/fHuQdNNYNmD
 PdjBHbkeb11zvURgQHBi0j9WDL16Lzw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-tXxFaQ06N5G_0JJ6X4DcEQ-1; Mon, 14 Mar 2022 16:38:40 -0400
X-MC-Unique: tXxFaQ06N5G_0JJ6X4DcEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D267899EC2;
 Mon, 14 Mar 2022 20:38:40 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.17.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A57CA1410F3B;
 Mon, 14 Mar 2022 20:38:39 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] nbd/server: Allow MULTI_CONN for shared writable
 exports
Date: Mon, 14 Mar 2022 15:38:18 -0500
Message-Id: <20220314203818.3681277-4-eblake@redhat.com>
In-Reply-To: <20220314203818.3681277-1-eblake@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 rjones@redhat.com, Markus Armbruster <armbru@redhat.com>, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, v.sementsov-og@ya.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the NBD spec, a server that advertises
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
explicitly start qemu-nbd (new -m command-line option) or
qemu-storage-daemon (new qapi field 'multi-conn') with multi-conn
advertisement in a known-safe setup where the client end can then
benefit from parallel clients.

Note, however, that we don't want to advertise MULTI_CONN when we know
that a second client cannot connect (for historical reasons, qemu-nbd
defaults to a single connection while nbd-server-add and QMP commands
default to unlimited connections; but we already have existing means
to let either style of NBD server creation alter those defaults).  The
harder part of this patch is setting up an iotest to demonstrate
behavior of multiple NBD clients to a single server.  It might be
possible with parallel qemu-io processes, but I found it easier to do
in python with the help of libnbd, and help from Nir and Vladimir in
writing the test.

Signed-off-by: Eric Blake <eblake@redhat.com>
Suggested-by: Nir Soffer <nsoffer@redhat.com>
Suggested-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
---
 docs/interop/nbd.txt                       |   1 +
 docs/tools/qemu-nbd.rst                    |  14 +-
 qapi/block-export.json                     |  19 ++-
 include/block/nbd.h                        |   3 +-
 blockdev-nbd.c                             |   5 +
 nbd/server.c                               |  27 +++-
 qemu-nbd.c                                 |  20 ++-
 MAINTAINERS                                |   1 +
 tests/qemu-iotests/tests/nbd-multiconn     | 157 +++++++++++++++++++++
 tests/qemu-iotests/tests/nbd-multiconn.out |   5 +
 10 files changed, 240 insertions(+), 12 deletions(-)
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
index 4c950f61998e..229414e3cdc7 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -139,8 +139,18 @@ driver options if :option:`--image-opts` is specified.
 .. option:: -e, --shared=NUM

   Allow up to *NUM* clients to share the device (default
-  ``1``), 0 for unlimited. Safe for readers, but for now,
-  consistency is not guaranteed between multiple writers.
+  ``1``), 0 for unlimited.
+
+.. option:: -m, --multi-conn=MODE
+
+  When multiple clients are allowed at once (via :option:`--shared`),
+  controls whether the NBD protocol MULTI_CONN bit is advertised to
+  clients.  This defaults to ``auto``, which advertises the bit for
+  readonly connections (:option:`--read-only`) but not for writeable
+  connections; it can also be set to ``on`` or ``off`` to override the
+  default.  Advertising this bit informs clients whether a flush from
+  one client has guaranteed consistency to subsequent access from a
+  parallel client.

 .. option:: -t, --persistent

diff --git a/qapi/block-export.json b/qapi/block-export.json
index f183522d0d2c..d9d38620156f 100644
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
@@ -95,11 +99,20 @@
 #                    the metadata context name "qemu:allocation-depth" to
 #                    inspect allocation details. (since 5.2)
 #
+# @multi-conn: Controls whether multiple client support is advertised, if the
+#              server's max-connections is not 1. "auto" advertises support
+#              for read-only clients, but not for writeable (although this
+#              may be improved in the future for writeable devices that are
+#              known to be cache-consistent, such as the raw file driver),
+#              while "on" and "off" explicitly set the bit (default auto,
+#              since 7.0).
+#
 # Since: 5.2
 ##
 { 'struct': 'BlockExportOptionsNbd',
   'base': 'BlockExportOptionsNbdBase',
-  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool' } }
+  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool',
+            '*multi-conn': 'OnOffAuto' } }

 ##
 # @BlockExportOptionsVhostUserBlk:
diff --git a/include/block/nbd.h b/include/block/nbd.h
index c5a29ce1c61b..c74b7a9d2e6e 100644
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

 void nbd_server_is_qemu_nbd(int max_connections);
 bool nbd_server_is_running(void);
+int nbd_server_max_connections(void);
 void nbd_server_start(SocketAddress *addr, const char *tls_creds,
                       const char *tls_authz, uint32_t max_connections,
                       Error **errp);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index add41a23af43..15ad7b8dbfd5 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -44,6 +44,11 @@ bool nbd_server_is_running(void)
     return nbd_server || qemu_nbd_connections >= 0;
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
index 5da884c2fc35..2cfdd56cda19 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2021 Red Hat, Inc.
+ *  Copyright (C) 2016-2022 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device Server Side
@@ -1642,7 +1642,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     int64_t size;
     uint64_t perm, shared_perm;
     bool readonly = !exp_args->writable;
-    bool shared = !exp_args->writable;
+    bool multi_conn;
     strList *bitmaps;
     size_t i;
     int ret;
@@ -1680,6 +1680,23 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
         return size;
     }

+    /*
+     * Determine whether to advertise multi-conn.  Default is auto,
+     * which resolves to on for read-only and off for writable.  But
+     * if the server has max-connections 1, that forces the flag off.
+     */
+    if (!arg->has_multi_conn) {
+        arg->multi_conn = ON_OFF_AUTO_AUTO;
+    }
+    if (nbd_server_max_connections() == 1) {
+        arg->multi_conn = ON_OFF_AUTO_OFF;
+    }
+    if (arg->multi_conn == ON_OFF_AUTO_AUTO) {
+        multi_conn = readonly;
+    } else {
+        multi_conn = arg->multi_conn == ON_OFF_AUTO_ON;
+    }
+
     /* Don't allow resize while the NBD server is running, otherwise we don't
      * care what happens with the node. */
     blk_get_perm(blk, &perm, &shared_perm);
@@ -1693,11 +1710,11 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
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
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 8c25ae93df83..ddeb2fcf7f40 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -70,6 +70,7 @@
 #define QEMU_NBD_OPT_PID_FILE      265
 #define QEMU_NBD_OPT_SELINUX_LABEL 266
 #define QEMU_NBD_OPT_TLSHOSTNAME   267
+#define QEMU_NBD_OPT_MULTI_CONN    268

 #define MBR_SIZE 512

@@ -79,6 +80,7 @@ static SocketAddress *saddr;
 static int persistent = 0;
 static enum { RUNNING, TERMINATE, TERMINATED } state;
 static int shared = 1;
+static OnOffAuto multi_conn = ON_OFF_AUTO_AUTO;
 static int nb_fds;
 static QIONetListener *server;
 static QCryptoTLSCreds *tlscreds;
@@ -100,6 +102,8 @@ static void usage(const char *name)
 "  -k, --socket=PATH         path to the unix socket\n"
 "                            (default '"SOCKET_PATH"')\n"
 "  -e, --shared=NUM          device can be shared by NUM clients (default '1')\n"
+"  -m, --multi-conn=MODE     control multi-conn advertisement with -e, MODE is\n"
+"                            'on', 'off', or 'auto' (default based on -r)\n"
 "  -t, --persistent          don't exit on the last connection\n"
 "  -v, --verbose             display extra debugging information\n"
 "  -x, --export-name=NAME    expose export by name (default is empty string)\n"
@@ -513,7 +517,7 @@ int main(int argc, char **argv)
     char *device = NULL;
     QemuOpts *sn_opts = NULL;
     const char *sn_id_or_name = NULL;
-    const char *sopt = "hVb:o:p:rsnc:dvk:e:f:tl:x:T:D:AB:L";
+    const char *sopt = "hVb:o:p:rsnc:dvk:e:m:f:tl:x:T:D:AB:L";
     struct option lopt[] = {
         { "help", no_argument, NULL, 'h' },
         { "version", no_argument, NULL, 'V' },
@@ -536,6 +540,7 @@ int main(int argc, char **argv)
         { "detect-zeroes", required_argument, NULL,
           QEMU_NBD_OPT_DETECT_ZEROES },
         { "shared", required_argument, NULL, 'e' },
+        { "multi-conn", required_argument, NULL, 'm' },
         { "format", required_argument, NULL, 'f' },
         { "persistent", no_argument, NULL, 't' },
         { "verbose", no_argument, NULL, 'v' },
@@ -709,6 +714,17 @@ int main(int argc, char **argv)
                 exit(EXIT_FAILURE);
             }
             break;
+        case 'm':
+        {
+            Error *err = NULL;
+            multi_conn = qapi_enum_parse(&OnOffAuto_lookup, optarg,
+                                         ON_OFF_AUTO_AUTO, &err);
+            if (err) {
+                error_report_err(err);
+                exit(EXIT_FAILURE);
+            }
+            break;
+        }
         case 'f':
             fmt = optarg;
             break;
@@ -1107,6 +1123,8 @@ int main(int argc, char **argv)
             .bitmaps              = bitmaps,
             .has_allocation_depth = alloc_depth,
             .allocation_depth     = alloc_depth,
+            .has_multi_conn       = true,
+            .multi_conn           = multi_conn,
         },
     };
     blk_exp_add(export_opts, &error_fatal);
diff --git a/MAINTAINERS b/MAINTAINERS
index f2e9ce1da2ac..678c34e8077f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3362,6 +3362,7 @@ F: qemu-nbd.*
 F: blockdev-nbd.c
 F: docs/interop/nbd.txt
 F: docs/tools/qemu-nbd.rst
+F: tests/qemu-iotests/tests/*nbd*
 T: git https://repo.or.cz/qemu/ericb.git nbd
 T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd

diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
new file mode 100755
index 000000000000..7d1179b33b05
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-multiconn
@@ -0,0 +1,157 @@
+#!/usr/bin/env python3
+# group: rw auto quick
+#
+# Test cases for NBD multi-conn advertisement
+#
+# Copyright (C) 2022 Red Hat, Inc.
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
+
+import os
+from contextlib import contextmanager
+import iotests
+from iotests import qemu_img_create, qemu_io_silent
+
+
+disk = os.path.join(iotests.test_dir, 'disk')
+size = '4M'
+nbd_sock = os.path.join(iotests.sock_dir, 'nbd_sock')
+nbd_uri = 'nbd+unix:///{}?socket=' + nbd_sock
+
+
+@contextmanager
+def open_nbd(export_name):
+    h = nbd.NBD()
+    try:
+        h.connect_uri(nbd_uri.format(export_name))
+        yield h
+    finally:
+        h.shutdown()
+
+class TestNbdMulticonn(iotests.QMPTestCase):
+    def setUp(self):
+        assert qemu_img_create('-f', iotests.imgfmt, disk, size) == 0
+        assert qemu_io_silent('-c', 'w -P 1 0 2M',
+                              '-c', 'w -P 2 2M 2M', disk) == 0
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+        result = self.vm.qmp('blockdev-add', {
+            'driver': 'qcow2',
+            'node-name': 'n',
+            'file': {'driver': 'file', 'filename': disk}
+        })
+        self.assert_qmp(result, 'return', {})
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(disk)
+        try:
+            os.remove(nbd_sock)
+        except OSError:
+            pass
+
+    @contextmanager
+    def run_server(self, max_connections=None):
+        args = {
+            'addr': {
+                'type': 'unix',
+                'data': {'path': nbd_sock}
+            }
+        }
+        if max_connections is not None:
+            args['max-connections'] = max_connections
+
+        result = self.vm.qmp('nbd-server-start', args)
+        self.assert_qmp(result, 'return', {})
+        yield
+
+        result = self.vm.qmp('nbd-server-stop')
+        self.assert_qmp(result, 'return', {})
+
+    def add_export(self, name, writable=None, multi_conn=None):
+        args = {
+            'type': 'nbd',
+            'id': name,
+            'node-name': 'n',
+            'name': name,
+        }
+        if writable is not None:
+            args['writable'] = writable
+        if multi_conn is not None:
+            args['multi-conn'] = multi_conn
+
+        result = self.vm.qmp('block-export-add', args)
+        self.assert_qmp(result, 'return', {})
+
+    def test_default_settings(self):
+        with self.run_server():
+            self.add_export('r')
+            self.add_export('w', writable=True)
+            with open_nbd('r') as h:
+                self.assertTrue(h.can_multi_conn())
+            with open_nbd('w') as h:
+                self.assertFalse(h.can_multi_conn())
+
+    def test_multiconn_option(self):
+        with self.run_server():
+            self.add_export('r', multi_conn='off')
+            self.add_export('w', writable=True, multi_conn='on')
+            with open_nbd('r') as h:
+                self.assertFalse(h.can_multi_conn())
+            with open_nbd('w') as h:
+                self.assertTrue(h.can_multi_conn())
+
+    def test_limited_connections(self):
+        with self.run_server(max_connections=1):
+            self.add_export('r', multi_conn='on')
+            self.add_export('w', writable=True, multi_conn='on')
+            with open_nbd('r') as h:
+                self.assertFalse(h.can_multi_conn())
+            with open_nbd('w') as h:
+                self.assertFalse(h.can_multi_conn())
+
+    def test_parallel_writes(self):
+        with self.run_server():
+            self.add_export('w', writable=True, multi_conn='on')
+
+            clients = [nbd.NBD() for _ in range(3)]
+            for c in clients:
+                c.connect_uri(nbd_uri.format('w'))
+                assert c.can_multi_conn()
+
+            initial_data = clients[0].pread(1024 * 1024, 0)
+            self.assertEqual(initial_data, b'\x01' * 1024 * 1024)
+
+            updated_data = b'\x03' * 1024 * 1024
+            clients[1].pwrite(updated_data, 0)
+            clients[2].flush()
+            current_data = clients[0].pread(1024 * 1024, 0)
+
+            self.assertEqual(updated_data, current_data)
+
+            for i in range(3):
+                clients[i].shutdown()
+
+
+if __name__ == '__main__':
+    try:
+        # Easier to use libnbd than to try and set up parallel
+        # 'qemu-nbd --list' or 'qemu-io' processes, but not all systems
+        # have libnbd installed.
+        import nbd  # type: ignore
+
+        iotests.main(supported_fmts=['qcow2'])
+    except ImportError:
+        iotests.notrun('libnbd not installed')
diff --git a/tests/qemu-iotests/tests/nbd-multiconn.out b/tests/qemu-iotests/tests/nbd-multiconn.out
new file mode 100644
index 000000000000..89968f35d783
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-multiconn.out
@@ -0,0 +1,5 @@
+....
+----------------------------------------------------------------------
+Ran 4 tests
+
+OK
-- 
2.35.1


