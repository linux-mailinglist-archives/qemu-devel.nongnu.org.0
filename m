Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BA83E41FE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:03:30 +0200 (CEST)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1Bx-0005dJ-Fo
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1AA-0001FK-Jn
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1A8-0001Y8-8x
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628499695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCipwoAQl2gpmCgyMQVW0flocujQCDYy7hMFSho5AOM=;
 b=RmqhAEL98rITLVux7N2siYuu2q9vQlREIZkPQ1NcGvSxE0x/IuJX2w43LdIZO/rTsLicxG
 kQqOGiOJUyZuBgp8jma9zGkLSmbfZcxIww0/4gfrG7Bb040k0j2Epu1v2pv+RSL9mUhXFm
 AVqpelacW2xbXFQYOrk72GQKMDMKNlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-3I_LnOlvPdeUEw0dH90UJg-1; Mon, 09 Aug 2021 05:01:32 -0400
X-MC-Unique: 3I_LnOlvPdeUEw0dH90UJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4469C801AC0;
 Mon,  9 Aug 2021 09:01:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04B0A1B49E;
 Mon,  9 Aug 2021 09:01:28 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 05/16] qemu-iotests: add option to attach gdbserver
Date: Mon,  9 Aug 2021 11:01:03 +0200
Message-Id: <20210809090114.64834-6-eesposit@redhat.com>
In-Reply-To: <20210809090114.64834-1-eesposit@redhat.com>
References: <20210809090114.64834-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define -gdb flag and GDB_OPTIONS environment variable
to python tests to attach a gdbserver to each qemu instance.
This patch only adds and parses this flag, it does not yet add
the implementation for it.

if -gdb is not provided but $GDB_OPTIONS is set, ignore the
environment variable.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/check      |  6 +++++-
 tests/qemu-iotests/iotests.py |  5 +++++
 tests/qemu-iotests/testenv.py | 17 +++++++++++++++--
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 2dd529eb75..4365bb8066 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -36,6 +36,9 @@ def make_argparser() -> argparse.ArgumentParser:
                    help='pretty print output for make check')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
+    p.add_argument('-gdb', action='store_true',
+                   help="start gdbserver with $GDB_OPTIONS options \
+                        ('localhost:12345' if $GDB_OPTIONS is empty)")
     p.add_argument('-misalign', action='store_true',
                    help='misalign memory allocations')
     p.add_argument('--color', choices=['on', 'off', 'auto'],
@@ -114,7 +117,8 @@ if __name__ == '__main__':
     env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
-                  debug=args.debug, valgrind=args.valgrind)
+                  debug=args.debug, valgrind=args.valgrind,
+                  gdb=args.gdb)
 
     if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
         if not args.tests:
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6b0db4ce54..c86f239d81 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -74,6 +74,11 @@
 qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
 qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
 
+gdb_qemu_env = os.environ.get('GDB_OPTIONS')
+qemu_gdb = []
+if gdb_qemu_env:
+    qemu_gdb = ['gdbserver'] + gdb_qemu_env.strip().split(' ')
+
 imgfmt = os.environ.get('IMGFMT', 'raw')
 imgproto = os.environ.get('IMGPROTO', 'file')
 output_dir = os.environ.get('OUTPUT_DIR', '.')
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 0c3fe75636..8501c6caf5 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -27,6 +27,7 @@
 import glob
 from typing import List, Dict, Any, Optional, ContextManager
 
+DEF_GDB_OPTIONS = 'localhost:12345'
 
 def isxfile(path: str) -> bool:
     return os.path.isfile(path) and os.access(path, os.X_OK)
@@ -72,7 +73,8 @@ class TestEnv(ContextManager['TestEnv']):
                      'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
                      'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
                      'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
-                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
+                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
+                     'GDB_OPTIONS']
 
     def prepare_subprocess(self, args: List[str]) -> Dict[str, str]:
         if self.debug:
@@ -178,7 +180,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  imgopts: Optional[str] = None,
                  misalign: bool = False,
                  debug: bool = False,
-                 valgrind: bool = False) -> None:
+                 valgrind: bool = False,
+                 gdb: bool = False) -> None:
         self.imgfmt = imgfmt
         self.imgproto = imgproto
         self.aiomode = aiomode
@@ -186,6 +189,15 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
         self.misalign = misalign
         self.debug = debug
 
+        if gdb:
+            self.gdb_options = os.getenv('GDB_OPTIONS', DEF_GDB_OPTIONS)
+            if not self.gdb_options:
+                # cover the case 'export GDB_OPTIONS='
+                self.gdb_options = DEF_GDB_OPTIONS
+        elif 'GDB_OPTIONS' in os.environ:
+            # to not propagate it in prepare_subprocess()
+            del os.environ['GDB_OPTIONS']
+
         if valgrind:
             self.valgrind_qemu = 'y'
 
@@ -285,6 +297,7 @@ def print_env(self) -> None:
 TEST_DIR      -- {TEST_DIR}
 SOCK_DIR      -- {SOCK_DIR}
 SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
+GDB_OPTIONS   -- {GDB_OPTIONS}
 """
 
         args = collections.defaultdict(str, self.get_env())
-- 
2.31.1


