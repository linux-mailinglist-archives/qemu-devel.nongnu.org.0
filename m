Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE80E5251A5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:53:26 +0200 (CEST)
Received: from localhost ([::1]:58860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB81-0001Xp-P8
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApj-0006DT-0s
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApf-0003TA-6W
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652369666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbTpvtLEVzwjRk2+8JuUmLmJDFvkRzxxk82q6SYJGQw=;
 b=cSUI/1KsPWny3lk4bHAN3TrpyqHdjyWlSH39Tpxhy3l6wstZdsXvmiBij7LFUCB1DHoq/v
 +EGfhvL39mCDk9CLWQfl+fpfVafpCWCToRv0lj7ZwoNRtWiSub859FFpCb+RxwlTpRTjHW
 A2U/FLA2LqroohaN3PP00MeJ/elCe88=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-HYhUE1duPJeAMAlckRmZ3A-1; Thu, 12 May 2022 11:34:21 -0400
X-MC-Unique: HYhUE1duPJeAMAlckRmZ3A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF04929324AC;
 Thu, 12 May 2022 15:34:20 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36295416156;
 Thu, 12 May 2022 15:34:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 09/10] nbd/server: Allow MULTI_CONN for shared writable exports
Date: Thu, 12 May 2022 17:34:00 +0200
Message-Id: <20220512153401.202863-10-kwolf@redhat.com>
In-Reply-To: <20220512153401.202863-1-kwolf@redhat.com>
References: <20220512153401.202863-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Eric Blake <eblake@redhat.com>

According to the NBD spec, a server that advertises
NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
not see any cache inconsistencies: when properly separated by a single
flush, actions performed by one client will be visible to another
client, regardless of which client did the flush.

We always satisfy these conditions in qemu - even when we support
multiple clients, ALL clients go through a single point of reference
into the block layer, with no local caching.  The effect of one client
is instantly visible to the next client.  Even if our backend were a
network device, we argue that any multi-path caching effects that
would cause inconsistencies in back-to-back actions not seeing the
effect of previous actions would be a bug in that backend, and not the
fault of caching in qemu.  As such, it is safe to unconditionally
advertise CAN_MULTI_CONN for any qemu NBD server situation that
supports parallel clients.

Note, however, that we don't want to advertise CAN_MULTI_CONN when we
know that a second client cannot connect (for historical reasons,
qemu-nbd defaults to a single connection while nbd-server-add and QMP
commands default to unlimited connections; but we already have
existing means to let either style of NBD server creation alter those
defaults).  This is visible by no longer advertising MULTI_CONN for
'qemu-nbd -r' without -e, as in the iotest nbd-qemu-allocation.

The harder part of this patch is setting up an iotest to demonstrate
behavior of multiple NBD clients to a single server.  It might be
possible with parallel qemu-io processes, but I found it easier to do
in python with the help of libnbd, and help from Nir and Vladimir in
writing the test.

Signed-off-by: Eric Blake <eblake@redhat.com>
Suggested-by: Nir Soffer <nsoffer@redhat.com>
Suggested-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Message-Id: <20220512004924.417153-3-eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json                        |   8 +-
 docs/interop/nbd.txt                          |   1 +
 docs/tools/qemu-nbd.rst                       |   3 +-
 include/block/nbd.h                           |   3 +-
 blockdev-nbd.c                                |   5 +
 nbd/server.c                                  |  10 +-
 MAINTAINERS                                   |   1 +
 tests/qemu-iotests/tests/nbd-multiconn        | 145 ++++++++++++++++++
 tests/qemu-iotests/tests/nbd-multiconn.out    |   5 +
 .../tests/nbd-qemu-allocation.out             |   2 +-
 10 files changed, 172 insertions(+), 11 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
 create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 1de16d2589..7776248435 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -22,7 +22,9 @@
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
@@ -51,7 +53,9 @@
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
diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index bdb0f2a41a..f5ca25174a 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -68,3 +68,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
 * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
 NBD_CMD_FLAG_FAST_ZERO
 * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
+* 7.1: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 4c950f6199..8e08a29e89 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -139,8 +139,7 @@ driver options if :option:`--image-opts` is specified.
 .. option:: -e, --shared=NUM
 
   Allow up to *NUM* clients to share the device (default
-  ``1``), 0 for unlimited. Safe for readers, but for now,
-  consistency is not guaranteed between multiple writers.
+  ``1``), 0 for unlimited.
 
 .. option:: -t, --persistent
 
diff --git a/include/block/nbd.h b/include/block/nbd.h
index c5a29ce1c6..c74b7a9d2e 100644
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
index 711e0e72bd..012256bb02 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -44,6 +44,11 @@ bool nbd_server_is_running(void)
     return nbd_server || qemu_nbd_connections >= 0;
 }
 
+int nbd_server_max_connections(void)
+{
+    return nbd_server ? nbd_server->max_connections : qemu_nbd_connections;
+}
+
 static void nbd_blockdev_client_closed(NBDClient *client, bool ignored)
 {
     nbd_client_put(client);
diff --git a/nbd/server.c b/nbd/server.c
index 4cdbc062c1..213e00e761 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2021 Red Hat, Inc.
+ *  Copyright (C) 2016-2022 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device Server Side
@@ -1642,7 +1642,6 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     int64_t size;
     uint64_t perm, shared_perm;
     bool readonly = !exp_args->writable;
-    bool shared = !exp_args->writable;
     BlockDirtyBitmapOrStrList *bitmaps;
     size_t i;
     int ret;
@@ -1693,11 +1692,12 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     exp->description = g_strdup(arg->description);
     exp->nbdflags = (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_FLUSH |
                      NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);
+
+    if (nbd_server_max_connections() != 1) {
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
index 571556d279..fbc0662627 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3367,6 +3367,7 @@ F: qemu-nbd.*
 F: blockdev-nbd.c
 F: docs/interop/nbd.txt
 F: docs/tools/qemu-nbd.rst
+F: tests/qemu-iotests/tests/*nbd*
 T: git https://repo.or.cz/qemu/ericb.git nbd
 T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd
 
diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
new file mode 100755
index 0000000000..b121f2e363
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-multiconn
@@ -0,0 +1,145 @@
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
+from iotests import qemu_img_create, qemu_io
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
+        qemu_img_create('-f', iotests.imgfmt, disk, size)
+        qemu_io('-c', 'w -P 1 0 2M', '-c', 'w -P 2 2M 2M', disk)
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
+    def add_export(self, name, writable=None):
+        args = {
+            'type': 'nbd',
+            'id': name,
+            'node-name': 'n',
+            'name': name,
+        }
+        if writable is not None:
+            args['writable'] = writable
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
+                self.assertTrue(h.can_multi_conn())
+
+    def test_limited_connections(self):
+        with self.run_server(max_connections=1):
+            self.add_export('r')
+            self.add_export('w', writable=True)
+            with open_nbd('r') as h:
+                self.assertFalse(h.can_multi_conn())
+            with open_nbd('w') as h:
+                self.assertFalse(h.can_multi_conn())
+
+    def test_parallel_writes(self):
+        with self.run_server():
+            self.add_export('w', writable=True)
+
+            clients = [nbd.NBD() for _ in range(3)]
+            for c in clients:
+                c.connect_uri(nbd_uri.format('w'))
+                self.assertTrue(c.can_multi_conn())
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
index 0000000000..8d7e996700
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-multiconn.out
@@ -0,0 +1,5 @@
+...
+----------------------------------------------------------------------
+Ran 3 tests
+
+OK
diff --git a/tests/qemu-iotests/tests/nbd-qemu-allocation.out b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
index 0bf1abb063..9d938db24e 100644
--- a/tests/qemu-iotests/tests/nbd-qemu-allocation.out
+++ b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
@@ -17,7 +17,7 @@ wrote 2097152/2097152 bytes at offset 1048576
 exports available: 1
  export: ''
   size:  4194304
-  flags: 0x58f ( readonly flush fua df multi cache )
+  flags: 0x48f ( readonly flush fua df cache )
   min block: 1
   opt block: 4096
   max block: 33554432
-- 
2.35.3


