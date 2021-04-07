Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1A0356E1B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 16:04:49 +0200 (CEST)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8nX-0001ge-FF
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 10:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8a0-00041q-0H
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8Zw-0005vC-LQ
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5S5DhzLgPGbm54SWrZqD1VlfyYf6LCjxyu1q4hHByYg=;
 b=Y7xpp8vk+tr9CDAFNgHMdDu8UkBaq3mcBQRvWeFGCoQrS9EblXde9NOaBZpUvyTtSe9m7e
 LxALot1vqEFKOgDUqw/MNTabm4hX4riJJ1sP/3BYR2IkAzccBSX7LqtZfrRpF8rPJye9IF
 mROve0kThY/qYn+zrgt2LMZO4KHCVxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-X5Uw1FkiNOaf9W3trLe09w-1; Wed, 07 Apr 2021 09:50:40 -0400
X-MC-Unique: X5Uw1FkiNOaf9W3trLe09w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16E6E802B5B;
 Wed,  7 Apr 2021 13:50:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-163.ams2.redhat.com
 [10.36.115.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B87BE59464;
 Wed,  7 Apr 2021 13:50:37 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 03/11] qemu-iotests: add option to attach gdbserver
Date: Wed,  7 Apr 2021 15:50:13 +0200
Message-Id: <20210407135021.48330-4-eesposit@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eesposit@redhat.com;
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
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add -gdb flag and GDB_QEMU environmental variable
to python tests to attach a gdbserver to each qemu instance.

if -gdb is not provided but $GDB_QEMU is set, ignore the
environmental variable.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/check      |  6 +++++-
 tests/qemu-iotests/iotests.py |  4 ++++
 tests/qemu-iotests/testenv.py | 18 +++++++++++++++---
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index d1c87ceaf1..6186495eee 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
                    help='pretty print output for make check')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
+    p.add_argument('-gdb', action='store_true',
+                   help="start gdbserver with $GDB_QEMU options. \
+                         Default is localhost:12345")
     p.add_argument('-misalign', action='store_true',
                    help='misalign memory allocations')
     p.add_argument('--color', choices=['on', 'off', 'auto'],
@@ -112,7 +115,8 @@ if __name__ == '__main__':
     env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
-                  debug=args.debug, valgrind=args.valgrind)
+                  debug=args.debug, valgrind=args.valgrind,
+                  gdb=args.gdb)
 
     testfinder = TestFinder(test_dir=env.source_iotests)
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 90d0b62523..05d0dc0751 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -75,6 +75,10 @@
 qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
 qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
 
+qemu_gdb = []
+if os.environ.get('GDB_QEMU'):
+    qemu_gdb = ['gdbserver'] + os.environ.get('GDB_QEMU').strip().split(' ')
+
 imgfmt = os.environ.get('IMGFMT', 'raw')
 imgproto = os.environ.get('IMGPROTO', 'file')
 output_dir = os.environ.get('OUTPUT_DIR', '.')
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 1fbec854c1..669eb6b925 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -72,7 +72,8 @@ class TestEnv(ContextManager['TestEnv']):
                      'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
                      'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
                      'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
-                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
+                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
+                     'GDB_QEMU']
 
     def get_env(self) -> Dict[str, str]:
         env = {}
@@ -163,7 +164,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  imgopts: Optional[str] = None,
                  misalign: bool = False,
                  debug: bool = False,
-                 valgrind: bool = False) -> None:
+                 valgrind: bool = False,
+                 gdb: bool = False) -> None:
         self.imgfmt = imgfmt
         self.imgproto = imgproto
         self.aiomode = aiomode
@@ -171,6 +173,14 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
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
 
@@ -268,7 +278,9 @@ def print_env(self) -> None:
 PLATFORM      -- {platform}
 TEST_DIR      -- {TEST_DIR}
 SOCK_DIR      -- {SOCK_DIR}
-SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
+SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
+GDB_QEMU      -- "{GDB_QEMU}"
+"""
 
         args = collections.defaultdict(str, self.get_env())
 
-- 
2.30.2


