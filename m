Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A453AE7C2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:58:55 +0200 (CEST)
Received: from localhost ([::1]:55316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHdn-0002l2-1d
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvHGD-0000qq-25
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvHG9-0002bM-WF
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624271668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLQnv5zn/wkHLxH5PJzmEXsZfcApWl5ld1HVjGqhGvw=;
 b=cjWaAY6dDjzM1Kt1K2810A27M8Wn3LwqrpsZ7t1ON8kGGWufPQO1gSV2D/KXupvJ4+uQQv
 Kjy6mh3ESNwD/S1Wltm+q+Nt0f64gvhSC+CdYyc4N1N8ClJZy4aahuSim+KWb91xmt1H8u
 ZGVY0aDQ+Hfqw5OWKRJMvfbRSrHLSjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-LHPimOhsPrq5TSFFXzNyCg-1; Mon, 21 Jun 2021 06:34:26 -0400
X-MC-Unique: LHPimOhsPrq5TSFFXzNyCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7477A40C6;
 Mon, 21 Jun 2021 10:34:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-100.ams2.redhat.com
 [10.36.113.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2B835D741;
 Mon, 21 Jun 2021 10:34:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 15/16] qemu-iotests: add option to show qemu binary logs on
 stdout
Date: Mon, 21 Jun 2021 12:33:36 +0200
Message-Id: <20210621103337.36637-16-eesposit@redhat.com>
In-Reply-To: <20210621103337.36637-1-eesposit@redhat.com>
References: <20210621103337.36637-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the flag -p, allow the qemu binary to print to stdout.

Also create the common function _close_qemu_log_file() to
avoid accessing machine.py private fields directly and have
duplicate code.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 python/qemu/machine/machine.py | 9 ++++++---
 tests/qemu-iotests/check       | 4 +++-
 tests/qemu-iotests/iotests.py  | 8 ++++++++
 tests/qemu-iotests/testenv.py  | 9 +++++++--
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index fdf2fc0e9c..c9d344d955 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -338,6 +338,11 @@ def _post_launch(self) -> None:
         if self._qmp_connection:
             self._qmp.accept(self._qmp_timer)
 
+    def _close_qemu_log_file(self) -> None:
+        if self._qemu_log_file is not None:
+            self._qemu_log_file.close()
+            self._qemu_log_file = None
+
     def _post_shutdown(self) -> None:
         """
         Called to cleanup the VM instance after the process has exited.
@@ -350,9 +355,7 @@ def _post_shutdown(self) -> None:
             self._qmp.close()
             self._qmp_connection = None
 
-        if self._qemu_log_file is not None:
-            self._qemu_log_file.close()
-            self._qemu_log_file = None
+        self._close_qemu_log_file()
 
         self._load_io_log()
 
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index ebd27946db..da1bfb839e 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -36,6 +36,8 @@ def make_argparser() -> argparse.ArgumentParser:
                    help='pretty print output for make check')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
+    p.add_argument('-p', dest='print', action='store_true',
+                help='redirects qemu\'s stdout and stderr to the test output')
     p.add_argument('-gdb', action='store_true',
                    help="start gdbserver with $GDB_OPTIONS options \
                         ('localhost:12345' if $GDB_OPTIONS is empty)")
@@ -119,7 +121,7 @@ if __name__ == '__main__':
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
-                  gdb=args.gdb)
+                  gdb=args.gdb, qprint=args.print)
 
     if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
         if not args.tests:
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 7aa6707032..eee6fb7a9f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -79,6 +79,8 @@
 if gdb_qemu_env:
     qemu_gdb = ['gdbserver'] + gdb_qemu_env.strip().split(' ')
 
+qemu_print = os.environ.get('PRINT_QEMU', False)
+
 imgfmt = os.environ.get('IMGFMT', 'raw')
 imgproto = os.environ.get('IMGPROTO', 'file')
 output_dir = os.environ.get('OUTPUT_DIR', '.')
@@ -613,6 +615,12 @@ def _post_shutdown(self) -> None:
         else:
             os.remove(valgrind_filename)
 
+    def _pre_launch(self) -> None:
+        super()._pre_launch()
+        if qemu_print:
+            # set QEMU binary output to stdout
+            self._close_qemu_log_file()
+
     def add_object(self, opts):
         self._args.append('-object')
         self._args.append(opts)
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 8bf154376f..70da0d60c8 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -74,7 +74,7 @@ class TestEnv(ContextManager['TestEnv']):
                      'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
                      'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
                      'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
-                     'GDB_OPTIONS']
+                     'GDB_OPTIONS', 'PRINT_QEMU']
 
     def prepare_subprocess(self, args: List[str]) -> Dict[str, str]:
         if self.debug:
@@ -181,7 +181,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  misalign: bool = False,
                  debug: bool = False,
                  valgrind: bool = False,
-                 gdb: bool = False) -> None:
+                 gdb: bool = False,
+                 qprint: bool = False) -> None:
         self.imgfmt = imgfmt
         self.imgproto = imgproto
         self.aiomode = aiomode
@@ -189,6 +190,9 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
         self.misalign = misalign
         self.debug = debug
 
+        if qprint:
+            self.print_qemu = 'y'
+
         if gdb:
             self.gdb_options = os.getenv('GDB_OPTIONS', DEF_GDB_OPTIONS)
             if not self.gdb_options:
@@ -299,6 +303,7 @@ def print_env(self) -> None:
 SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
 GDB_OPTIONS   -- {GDB_OPTIONS}
 VALGRIND_QEMU -- {VALGRIND_QEMU}
+PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
 """
 
         args = collections.defaultdict(str, self.get_env())
-- 
2.31.1


