Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3816351576
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:00:48 +0200 (CEST)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxsO-00033t-2t
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lRxpV-0000gF-HV
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lRxpT-0005VS-Hd
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617285466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06zkH2GcUMaNtbOjoz06jRcUceiEYuacsyKkje1TjRo=;
 b=cM96T6/abXPJp0YjtwvBWumXDHqjz5XQoADB1ATan2QQjNVsUjCdgcW0g5d8Ee2AIlOJOU
 8eX+1IxlNwUb6d70HTR1IJBbbk+iF2UAH1rAkNX/tExd/s4w5iM2+4Urn2dFnL102mQbGC
 2vrmCIhre5pV0fLhPOjk5O3PL2eOYa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-K6zz-nq5NMis-VyuGF7-6g-1; Thu, 01 Apr 2021 09:57:45 -0400
X-MC-Unique: K6zz-nq5NMis-VyuGF7-6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA9238710F4;
 Thu,  1 Apr 2021 13:57:43 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-128.ams2.redhat.com
 [10.36.113.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C37D15D6B1;
 Thu,  1 Apr 2021 13:57:41 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 2/3] qemu-iotests: add option to attach gdbserver
Date: Thu,  1 Apr 2021 15:57:32 +0200
Message-Id: <20210401135733.32177-3-eesposit@redhat.com>
In-Reply-To: <20210401135733.32177-1-eesposit@redhat.com>
References: <20210401135733.32177-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add -gdb flag and GDB_QEMU environmental variable
to python tests to attach a gdbserver to each qemu_system instance.
The GDB_QEMU will just contain the options to provide to gdbserver,
if empty and -gdb is set it will default to "localhost:12345".

The gdb option is provided to python/qemu/machine.py through
the "wrapper" parameter, currently unused by qemu-iotests.

Attaching a gdbserver implies that the qmp socket
should wait indefinitely for an answer from QEMU, otherwise
the connection will drop after 15 seconds.

if -gdb is not provided but $GDB_QEMU is set, the script will ignore the
environmental variable.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 python/qemu/machine.py        |  4 +++-
 python/qemu/qtest.py          |  4 +++-
 tests/qemu-iotests/check      |  5 ++++-
 tests/qemu-iotests/iotests.py |  7 ++++++-
 tests/qemu-iotests/testenv.py | 15 +++++++++++++--
 5 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index c721e07d63..d7fca6b3c1 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -408,7 +408,9 @@ def _launch(self) -> None:
                                        stderr=subprocess.STDOUT,
                                        shell=False,
                                        close_fds=False)
-        self._post_launch()
+
+        timer = None if 'gdbserver' in self._wrapper else 15.0
+        self._post_launch(timer)
 
     def _early_cleanup(self) -> None:
         """
diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
index 0d01715086..4c90daf430 100644
--- a/python/qemu/qtest.py
+++ b/python/qemu/qtest.py
@@ -111,6 +111,7 @@ class QEMUQtestMachine(QEMUMachine):
     def __init__(self,
                  binary: str,
                  args: Sequence[str] = (),
+                 wrapper: Sequence[str] = (),
                  name: Optional[str] = None,
                  test_dir: str = "/var/tmp",
                  socket_scm_helper: Optional[str] = None,
@@ -119,7 +120,8 @@ def __init__(self,
             name = "qemu-%d" % os.getpid()
         if sock_dir is None:
             sock_dir = test_dir
-        super().__init__(binary, args, name=name, test_dir=test_dir,
+        super().__init__(binary, args, wrapper=wrapper, name=name,
+                         test_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir)
         self._qtest: Optional[QEMUQtestProtocol] = None
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index df9fd733ff..5a1d0518f1 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -36,6 +36,8 @@ def make_argparser() -> argparse.ArgumentParser:
                    help='pretty print output for make check')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
+    p.add_argument('-gdb', action='store_true',
+                   help="start gdb server on localhost. Default port is 12345")
     p.add_argument('-misalign', action='store_true',
                    help='misalign memory allocations')
     p.add_argument('--color', choices=['on', 'off', 'auto'],
@@ -115,7 +117,8 @@ if __name__ == '__main__':
     env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
-                  debug=args.debug, valgrind=args.valgrind)
+                  debug=args.debug, valgrind=args.valgrind,
+                  gdb=args.gdb)
 
     if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
         if not args.tests:
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 2a34eef601..138cf135ea 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -74,6 +74,10 @@
 qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
 qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
 
+qemu_gdb = []
+if os.environ.get('GDB_QEMU'):
+    qemu_gdb = ['gdbserver'] + os.environ.get('GDB_QEMU').strip().split(' ')
+
 imgfmt = os.environ.get('IMGFMT', 'raw')
 imgproto = os.environ.get('IMGPROTO', 'file')
 output_dir = os.environ.get('OUTPUT_DIR', '.')
@@ -574,7 +578,8 @@ class VM(qtest.QEMUQtestMachine):
 
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
-        super().__init__(qemu_prog, qemu_opts, name=name,
+        super().__init__(qemu_prog, qemu_opts, wrapper=qemu_gdb,
+                         name=name,
                          test_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir)
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 169268f61a..62749becbd 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -72,7 +72,8 @@ class TestEnv(ContextManager['TestEnv']):
                      'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
                      'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
                      'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
-                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
+                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
+                     'GDB_QEMU']
 
     def prepare_subprocess(self, args: List[str]) -> Dict[str, str]:
         if self.debug:
@@ -178,7 +179,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  imgopts: Optional[str] = None,
                  misalign: bool = False,
                  debug: bool = False,
-                 valgrind: bool = False) -> None:
+                 valgrind: bool = False,
+                 gdb: bool = False) -> None:
         self.imgfmt = imgfmt
         self.imgproto = imgproto
         self.aiomode = aiomode
@@ -186,6 +188,14 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
         self.misalign = misalign
         self.debug = debug
 
+        self.gdb_qemu = os.getenv('GDB_QEMU')
+
+        if gdb and not self.gdb_qemu:
+            self.gdb_qemu = 'localhost:12345'
+        elif self.gdb_qemu and not gdb:
+            del self.gdb_qemu
+            del os.environ['GDB_QEMU']
+
         if valgrind:
             self.valgrind_qemu = 'y'
 
@@ -284,6 +294,7 @@ def print_env(self) -> None:
 TEST_DIR      -- {TEST_DIR}
 SOCK_DIR      -- {SOCK_DIR}
 SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
+GDB_QEMU      -- "{GDB_QEMU}"
 """
 
         args = collections.defaultdict(str, self.get_env())
-- 
2.30.2


