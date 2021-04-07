Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675A356DEC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:54:44 +0200 (CEST)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8dn-0007sg-6y
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8aa-0004QQ-Vb
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8aL-0006BO-HY
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFLD9XLnlHBVfcqnc6zU/UvOnyMs2jmm0RJGLWbvG68=;
 b=T2Q86ITFYOhNGQSAeddLgT1X4xJ1z1AbKzXhX34rBI4vL9BPzvBRJVWUfUuuUS8gMz27hd
 jUn80tg2D2xZNDIdfD24W0M63hYZkly+3yYfvu4VliB40DZ54nDpbkLTfdKpMm1VuKqqM0
 FbOqjbJwctaMKTd2oiJhRSr2hS0PaYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-f-Kzx1QCMPmB1M5awGgKYQ-1; Wed, 07 Apr 2021 09:51:06 -0400
X-MC-Unique: f-Kzx1QCMPmB1M5awGgKYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D1CD107ACED;
 Wed,  7 Apr 2021 13:51:05 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-163.ams2.redhat.com
 [10.36.115.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EC6719CB4;
 Wed,  7 Apr 2021 13:51:00 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 11/11] qemu_iotests: add option to show qemu binary
 logs on stdout
Date: Wed,  7 Apr 2021 15:50:21 +0200
Message-Id: <20210407135021.48330-12-eesposit@redhat.com>
In-Reply-To: <20210407135021.48330-1-eesposit@redhat.com>
References: <20210407135021.48330-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the flag -p, allow the qemu binary to print to stdout.
This is helpful especially for print-debugging.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/check      | 3 ++-
 tests/qemu-iotests/iotests.py | 9 +++++++++
 tests/qemu-iotests/testenv.py | 9 +++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 6186495eee..6c469c14ff 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -33,6 +33,7 @@ def make_argparser() -> argparse.ArgumentParser:
                    help='pretty print output for make check')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
+    p.add_argument('-p', dest='print', action='store_true', help='enable prints')
     p.add_argument('-gdb', action='store_true',
                    help="start gdbserver with $GDB_QEMU options. \
                          Default is localhost:12345")
@@ -116,7 +117,7 @@ if __name__ == '__main__':
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
-                  gdb=args.gdb)
+                  gdb=args.gdb, qprint=args.print)
 
     testfinder = TestFinder(test_dir=env.source_iotests)
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index b23bfdfdff..bb29074b63 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -79,6 +79,8 @@
 if os.environ.get('GDB_QEMU'):
     qemu_gdb = ['gdbserver'] + os.environ.get('GDB_QEMU').strip().split(' ')
 
+qemu_print = os.environ.get('PRINT_QEMU', False)
+
 imgfmt = os.environ.get('IMGFMT', 'raw')
 imgproto = os.environ.get('IMGPROTO', 'file')
 output_dir = os.environ.get('OUTPUT_DIR', '.')
@@ -618,6 +620,13 @@ def _post_shutdown(self) -> None:
         super()._post_shutdown()
         self.subprocess_check_valgrind(qemu_valgrind)
 
+    def _pre_launch(self) -> None:
+        super()._pre_launch()
+        if qemu_print and self._qemu_log_file != None:
+            # set QEMU binary output to stdout
+            self._qemu_log_file.close()
+            self._qemu_log_file = None
+
     def add_object(self, opts):
         self._args.append('-object')
         self._args.append(opts)
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 86798bf752..9192d7154b 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -73,7 +73,7 @@ class TestEnv(ContextManager['TestEnv']):
                      'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
                      'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
                      'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
-                     'GDB_QEMU']
+                     'GDB_QEMU', 'PRINT_QEMU']
 
     def get_env(self) -> Dict[str, str]:
         env = {}
@@ -165,7 +165,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  misalign: bool = False,
                  debug: bool = False,
                  valgrind: bool = False,
-                 gdb: bool = False) -> None:
+                 gdb: bool = False,
+                 qprint: bool = False) -> None:
         self.imgfmt = imgfmt
         self.imgproto = imgproto
         self.aiomode = aiomode
@@ -173,6 +174,9 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
         self.misalign = misalign
         self.debug = debug
 
+        if qprint:
+            self.print_qemu = 'y'
+
         self.gdb_qemu = os.getenv('GDB_QEMU')
 
         if gdb and not self.gdb_qemu:
@@ -281,6 +285,7 @@ def print_env(self) -> None:
 SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
 GDB_QEMU      -- "{GDB_QEMU}"
 VALGRIND_QEMU     -- "{VALGRIND_QEMU}"
+PRINT_QEMU    --  "{PRINT_QEMU}"
 """
 
         args = collections.defaultdict(str, self.get_env())
-- 
2.30.2


