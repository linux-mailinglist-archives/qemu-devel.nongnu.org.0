Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56D83F9B7F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 17:12:38 +0200 (CEST)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJdX3-0004ox-K1
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 11:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJdU5-0003IB-LR
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJdU1-0004xB-VH
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630076968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FG3bCkqWxQVSEzIavrFuJdg8rr9M8qOOL17NqmnRPFQ=;
 b=C0FkIWZIcM0iPtwD2ePloQS8PEAmDFNv3tXAfdtu7FMlRuu26Z4vBorfIcZh5foIeWcaoP
 uVC8iCDanoZPCfF4kHkfSDY+2w0grmLHZV/HWTvZvAOof63wY1s5FMdGB4P5pk1GHmHb6u
 yXYqO9x9kg6HPIUQVE3PURSTIHa7Ng4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-yTFrWzX1OqWXOLcqdRyK8A-1; Fri, 27 Aug 2021 11:09:23 -0400
X-MC-Unique: yTFrWzX1OqWXOLcqdRyK8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DD451082922;
 Fri, 27 Aug 2021 15:09:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C68F460BD9;
 Fri, 27 Aug 2021 15:09:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] nbd/server: Advertise MULTI_CONN for shared writable exports
Date: Fri, 27 Aug 2021 10:09:16 -0500
Message-Id: <20210827150916.532260-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, rjones@redhat.com,
 Markus Armbruster <armbru@redhat.com>, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the NBD spec, a server advertising
NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
not see any cache inconsistencies: when properly separated by a single
flush, actions performed by one client will be visible to another
client, regardless of which client did the flush.  We satisfy these
conditions in qemu because our block layer serializes any overlapping
operations (see bdrv_find_conflicting_request and friends): no matter
which client performs a flush, parallel requests coming from distinct
NBD clients will still be well-ordered by the time they are passed on
to the underlying device, with no caching in qemu proper to allow
stale results to leak after a flush.

We don't want to advertise MULTI_CONN when we know that a second
client can connect (which is the default for qemu-nbd, but not for QMP
nbd-server-add), so it does require a QAPI addition.  But other than
that, the actual change to advertise the bit for writable servers is
fairly small.  The harder part of this patch is setting up an iotest
to demonstrate behavior of multiple NBD clients to a single server.
It might be possible with parallel qemu-io processes, but concisely
managing that in shell is painful.  I found it easier to do by relying
on the libnbd project's nbdsh, which means this test will be skipped
on platforms where that is not available.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/interop/nbd.txt                       |  1 +
 docs/tools/qemu-nbd.rst                    |  3 +-
 qapi/block-export.json                     |  6 +-
 blockdev-nbd.c                             |  4 +
 nbd/server.c                               | 10 +--
 qemu-nbd.c                                 |  2 +
 MAINTAINERS                                |  1 +
 tests/qemu-iotests/tests/nbd-multiconn     | 91 ++++++++++++++++++++++
 tests/qemu-iotests/tests/nbd-multiconn.out | 14 ++++
 9 files changed, 124 insertions(+), 8 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
 create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out

diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index 10ce098a29bf..d03910f1e9eb 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -68,3 +68,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
 * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
 NBD_CMD_FLAG_FAST_ZERO
 * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
+* 6.2: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 5643da26e982..81be32164a55 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -138,8 +138,7 @@ driver options if ``--image-opts`` is specified.
 .. option:: -e, --shared=NUM

   Allow up to *NUM* clients to share the device (default
-  ``1``), 0 for unlimited. Safe for readers, but for now,
-  consistency is not guaranteed between multiple writers.
+  ``1``), 0 for unlimited.

 .. option:: -t, --persistent

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 0ed63442a819..b2085a9fdd4c 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -95,11 +95,15 @@
 #                    the metadata context name "qemu:allocation-depth" to
 #                    inspect allocation details. (since 5.2)
 #
+# @shared: True if the server should advertise that multiple clients may
+#          connect, default false. (since 6.2)
+#
 # Since: 5.2
 ##
 { 'struct': 'BlockExportOptionsNbd',
   'base': 'BlockExportOptionsNbdBase',
-  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool' } }
+  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool',
+             '*shared': 'bool' } }

 ##
 # @BlockExportOptionsVhostUserBlk:
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index bdfa7ed3a5a9..258feaa76e02 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -221,6 +221,10 @@ void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
         QAPI_LIST_PREPEND(export_opts->u.nbd.bitmaps, g_strdup(arg->bitmap));
     }

+    /* nbd-server-add always permits parallel clients */
+    export_opts->u.nbd.has_shared = true;
+    export_opts->u.nbd.shared = true;
+
     /*
      * nbd-server-add doesn't complain when a read-only device should be
      * exported as writable, but simply downgrades it. This is an error with
diff --git a/nbd/server.c b/nbd/server.c
index 3927f7789dcf..1646796a4798 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2020 Red Hat, Inc.
+ *  Copyright (C) 2016-2021 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device Server Side
@@ -1634,7 +1634,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     int64_t size;
     uint64_t perm, shared_perm;
     bool readonly = !exp_args->writable;
-    bool shared = !exp_args->writable;
+    bool shared = arg->shared;
     strList *bitmaps;
     size_t i;
     int ret;
@@ -1685,11 +1685,11 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     exp->description = g_strdup(arg->description);
     exp->nbdflags = (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_FLUSH |
                      NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);
+    if (shared) {
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
index f68fcceadd9e..198b1c55729d 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1084,6 +1084,8 @@ int main(int argc, char **argv)
             .bitmaps              = bitmaps,
             .has_allocation_depth = alloc_depth,
             .allocation_depth     = alloc_depth,
+            .has_shared           = true,
+            .shared               = shared != 1,
         },
     };
     blk_exp_add(export_opts, &error_fatal);
diff --git a/MAINTAINERS b/MAINTAINERS
index 6b3697962c1b..6eab82e6b982 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3142,6 +3142,7 @@ F: qemu-nbd.*
 F: blockdev-nbd.c
 F: docs/interop/nbd.txt
 F: docs/tools/qemu-nbd.rst
+F: tests/qemu-iotests/tests/*nbd*
 T: git https://repo.or.cz/qemu/ericb.git nbd
 T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd

diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
new file mode 100755
index 000000000000..66b410546e2f
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-multiconn
@@ -0,0 +1,91 @@
+#!/usr/bin/env bash
+# group: rw auto quick
+#
+# Test that qemu-nbd MULTI_CONN works
+#
+# Copyright (C) 2018-2021 Red Hat, Inc.
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
+    nbd_server_stop
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+cd ..
+. ./common.rc
+. ./common.filter
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
+IMG="driver=nbd,server.type=unix,server.path=$nbd_unix_socket"
+nbd_server_start_unix_socket -f qcow2 -e 5 "$TEST_IMG"
+
+echo
+echo "=== Demonstrate parallel clients ==="
+echo
+
+export nbd_unix_socket
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
+# success, all done
+echo '*** done'
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/nbd-multiconn.out b/tests/qemu-iotests/tests/nbd-multiconn.out
new file mode 100644
index 000000000000..4554099e4d62
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-multiconn.out
@@ -0,0 +1,14 @@
+QA output created by nbd-multiconn
+
+=== Initial image setup ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4194304
+wrote 2097152/2097152 bytes at offset 0
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 2097152/2097152 bytes at offset 2097152
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+=== Demonstrate parallel clients ===
+
+Flush appears to be consistent across connections
+*** done
-- 
2.31.1


