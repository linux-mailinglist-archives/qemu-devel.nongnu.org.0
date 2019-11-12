Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDFF8720
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 04:40:52 +0100 (CET)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUN2x-0003QO-7M
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 22:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43887)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iUN1u-0002vB-3P
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 22:39:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iUN1r-0007tI-Sx
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 22:39:45 -0500
Received: from relay.sw.ru ([185.231.240.75]:52174)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iUN1r-0007so-LM; Mon, 11 Nov 2019 22:39:43 -0500
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iUN1l-0006wB-Nh; Tue, 12 Nov 2019 06:39:37 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v5] iotests: Test NBD client reconnection
Date: Tue, 12 Nov 2019 06:39:36 +0300
Message-Id: <1573529976-815699-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
 rkagan@virtuozzo.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test for an NBD client. The NBD server is disconnected after the
client write request. The NBD client should reconnect and complete
the write operation.

Suggested-by: Denis V. Lunev <den@openvz.org>
Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
---
v5:  "" were replaced with '' in the test except the function comments.
    The 'quick' word was added to the 'qroup' file next to the test #277.

 tests/qemu-iotests/277                   | 96 ++++++++++++++++++++++++++++++++
 tests/qemu-iotests/277.out               |  6 ++
 tests/qemu-iotests/group                 |  1 +
 tests/qemu-iotests/iotests.py            |  5 ++
 tests/qemu-iotests/nbd-fault-injector.py |  3 +-
 5 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/277
 create mode 100644 tests/qemu-iotests/277.out

diff --git a/tests/qemu-iotests/277 b/tests/qemu-iotests/277
new file mode 100755
index 0000000..1f72dca
--- /dev/null
+++ b/tests/qemu-iotests/277
@@ -0,0 +1,96 @@
+#!/usr/bin/env python
+#
+# Test NBD client reconnection
+#
+# Copyright (c) 2019 Virtuozzo International GmbH
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
+import os
+import subprocess
+import iotests
+from iotests import file_path, log
+
+
+nbd_sock, conf_file = file_path('nbd-sock', 'nbd-fault-injector.conf')
+
+
+def make_conf_file(event):
+    """
+    Create configuration file for the nbd-fault-injector.py
+
+    :param event: which event the server should close a connection on
+    """
+    with open(conf_file, 'w') as conff:
+        conff.write('[inject-error]\nevent={}\nwhen=after'.format(event))
+
+
+def start_server_NBD(event):
+    make_conf_file(event)
+
+    srv = subprocess.Popen(['nbd-fault-injector.py', '--classic-negotiation',
+                           nbd_sock, conf_file], stdout=subprocess.PIPE,
+                           stderr=subprocess.STDOUT, universal_newlines=True)
+    line = srv.stdout.readline()
+    if 'Listening on ' in line:
+        log('NBD server: started')
+    else:
+        log('NBD server: ' + line.rstrip())
+
+    return srv
+
+
+def start_client_NBD():
+    log('NBD client: QEMU-IO write')
+    args = iotests.qemu_io_args_no_fmt + \
+        ['-c', 'write -P 0x7 0 3M', '--image-opts',
+         'driver=nbd,server.type=unix,server.path={},'
+         'reconnect-delay=7'.format(nbd_sock)]
+    clt = subprocess.Popen(args, stdout=subprocess.PIPE,
+                           stderr=subprocess.STDOUT,
+                           universal_newlines=True)
+    return clt
+
+
+def check_proc_NBD(proc, connector):
+    try:
+        outs, errs = proc.communicate(timeout=10)
+
+        if proc.returncode < 0:
+            log('NBD {}: EXIT SIGNAL {}\n'.format(connector, proc.returncode))
+            log(outs)
+        else:
+            msg = outs.split('\n', 1)
+            log('NBD {}: {}'.format(connector, msg[0]))
+
+    except subprocess.TimeoutExpired:
+        proc.kill()
+        log('NBD {}: ERROR timeout expired'.format(connector))
+    finally:
+        if connector == 'server':
+            os.remove(nbd_sock)
+            os.remove(conf_file)
+
+
+srv = start_server_NBD('data')
+clt = start_client_NBD()
+# The server should close the connection after a client write request
+check_proc_NBD(srv, 'server')
+# Start the NBD server again
+srv = start_server_NBD('reply')
+# The client should reconnect and complete the write operation
+check_proc_NBD(clt, 'client')
+# Make it sure that server terminated
+check_proc_NBD(srv, 'server')
diff --git a/tests/qemu-iotests/277.out b/tests/qemu-iotests/277.out
new file mode 100644
index 0000000..45404b3
--- /dev/null
+++ b/tests/qemu-iotests/277.out
@@ -0,0 +1,6 @@
+NBD server: started
+NBD client: QEMU-IO write
+NBD server: Closing connection on rule match inject-error
+NBD server: started
+NBD client: wrote 3145728/3145728 bytes at offset 0
+NBD server: Closing connection on rule match inject-error
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 0650403..6a9acfb 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -284,3 +284,4 @@
 268 rw auto quick
 270 rw backing quick
 272 rw
+277 rw quick
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 075f473..295b3e4 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -47,6 +47,11 @@ qemu_io_args = [os.environ.get('QEMU_IO_PROG', 'qemu-io')]
 if os.environ.get('QEMU_IO_OPTIONS'):
     qemu_io_args += os.environ['QEMU_IO_OPTIONS'].strip().split(' ')
 
+qemu_io_args_no_fmt = [os.environ.get('QEMU_IO_PROG', 'qemu-io')]
+if os.environ.get('QEMU_IO_OPTIONS_NO_FMT'):
+    qemu_io_args_no_fmt += \
+        os.environ['QEMU_IO_OPTIONS_NO_FMT'].strip().split(' ')
+
 qemu_nbd_args = [os.environ.get('QEMU_NBD_PROG', 'qemu-nbd')]
 if os.environ.get('QEMU_NBD_OPTIONS'):
     qemu_nbd_args += os.environ['QEMU_NBD_OPTIONS'].strip().split(' ')
diff --git a/tests/qemu-iotests/nbd-fault-injector.py b/tests/qemu-iotests/nbd-fault-injector.py
index 6b2d659..7e2dab6 100755
--- a/tests/qemu-iotests/nbd-fault-injector.py
+++ b/tests/qemu-iotests/nbd-fault-injector.py
@@ -115,7 +115,8 @@ class FaultInjectionSocket(object):
             if rule.match(event, io):
                 if rule.when == 0 or bufsize is None:
                     print('Closing connection on rule match %s' % rule.name)
-                    self.sock.flush()
+                    self.sock.close()
+                    sys.stdout.flush()
                     sys.exit(0)
                 if rule.when != -1:
                     return rule.when
-- 
1.8.3.1


