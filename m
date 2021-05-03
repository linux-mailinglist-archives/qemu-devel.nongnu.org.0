Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA23713F0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:03:09 +0200 (CEST)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWM1-00039W-2J
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKK-0001rm-Oc
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:24 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKI-0004qx-0E
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:24 -0400
Received: by mail-ed1-x534.google.com with SMTP id c22so5762837edn.7
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ml1ydu8XKSxP1Q8Lrnm8dec/A8hAffqNR+5PqaZfm2o=;
 b=EQcZawyVDL2cBkBqNDk4mt4PMwQKsxJMuTizNqA2C189sOq93rjNSNHtoKl9IDEuib
 baXVVTLArQG5tqJCbv+qXD1xV5XrkOJIX2nx2YQk1SjN0IuxKZeiNMkc1uni4HJdAuyM
 9YkRq+5qubm9KI4wx3Vpc/ZfLrtaTPWv8zgJnF4DpgeKJPQQ1q6s27G8ERuoUayjALUm
 jNJl6vb55VqhFoOB7NwU2ql8oYX89yFVQH3wQL/79HWgVZpI0OhDJFjgL5ZfJvO5y3kC
 /dx1R98dETLJaIr4aRcpIYRiFrsRMkucLLlDRA6eC7+iR/etM43m3O1PjMl3JVNpSHJc
 bQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ml1ydu8XKSxP1Q8Lrnm8dec/A8hAffqNR+5PqaZfm2o=;
 b=e9QLSBmyDkqIgp2HUj0iCzXF7DK+8km3d5Ghx04R3x1vkI4hoEKroo3OdwL0/Bmk1n
 syykfWfVTkzypsHgM4iNmzWqNPGJ4H5VXC2KRBTvJ10JlZUOKKVek5E2VF69PJ41aeZ0
 YU24xAr0rpVzuhD1K+K1e4KjH2D9WKYNEjqnzpO/Ot+6TWE4gYOzcbFc76oe4fIz7h5S
 OXK8ko28vLh2PBkHf8/Y3fHZ1woPtg/h04stUfwOICJ4zZUeKTGLeQchAk3zsCPCJKs/
 Iob5GAiv5fdjFrmiHKzdbp+/MBNavpHAwmsVxCAWERB43ay18kh6NhzKagNNKv+R9WGk
 Hfgg==
X-Gm-Message-State: AOAM5314z8Cul5WmCpY2UsMLpmIis2C7YW2ZOIT2BJdMuIkmO8cFOiiB
 BYTo6+M7XgWKWEvN4saqz5mHngbizEQ=
X-Google-Smtp-Source: ABdhPJyj06e6rwmVP4YprZVTEJ51E3X8/KVlswX2yo2WVYpjBdm0O2pt9CTz9/GQyagiPjremLLR9A==
X-Received: by 2002:aa7:c34b:: with SMTP id j11mr19778380edr.188.1620039675072; 
 Mon, 03 May 2021 04:01:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id v16sm12041464edt.53.2021.05.03.04.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:01:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] qemu-iotests: do not buffer the test output
Date: Mon,  3 May 2021 13:01:06 +0200
Message-Id: <20210503110110.476887-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503110110.476887-1-pbonzini@redhat.com>
References: <20210503110110.476887-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PDS_OTHER_BAD_TLD=1.997,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of buffering the test output into a StringIO, patch it on
the fly by wrapping sys.stdout's write method.  This can be
done unconditionally, even if using -d, which makes execute_unittest
a bit simpler.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210323181928.311862-2-pbonzini@redhat.com>
---
 tests/qemu-iotests/240.out    |  8 ++--
 tests/qemu-iotests/245.out    |  8 ++--
 tests/qemu-iotests/295.out    |  6 +--
 tests/qemu-iotests/296.out    |  8 ++--
 tests/qemu-iotests/iotests.py | 70 ++++++++++++++++++++---------------
 5 files changed, 56 insertions(+), 44 deletions(-)

diff --git a/tests/qemu-iotests/240.out b/tests/qemu-iotests/240.out
index e0982831ae..89ed25e506 100644
--- a/tests/qemu-iotests/240.out
+++ b/tests/qemu-iotests/240.out
@@ -15,7 +15,7 @@
 {"return": {}}
 {"execute": "blockdev-del", "arguments": {"node-name": "hd0"}}
 {"return": {}}
-==Attach two SCSI disks using the same block device and the same iothread==
+.==Attach two SCSI disks using the same block device and the same iothread==
 {"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "hd0", "read-only": true, "read-zeroes": true}}
 {"return": {}}
 {"execute": "object-add", "arguments": {"id": "iothread0", "qom-type": "iothread"}}
@@ -32,7 +32,7 @@
 {"return": {}}
 {"execute": "blockdev-del", "arguments": {"node-name": "hd0"}}
 {"return": {}}
-==Attach two SCSI disks using the same block device but different iothreads==
+.==Attach two SCSI disks using the same block device but different iothreads==
 {"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "hd0", "read-only": true, "read-zeroes": true}}
 {"return": {}}
 {"execute": "object-add", "arguments": {"id": "iothread0", "qom-type": "iothread"}}
@@ -55,7 +55,7 @@
 {"return": {}}
 {"execute": "blockdev-del", "arguments": {"node-name": "hd0"}}
 {"return": {}}
-==Attach a SCSI disks using the same block device as a NBD server==
+.==Attach a SCSI disks using the same block device as a NBD server==
 {"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "hd0", "read-only": true, "read-zeroes": true}}
 {"return": {}}
 {"execute": "nbd-server-start", "arguments": {"addr": {"data": {"path": "SOCK_DIR/PID-nbd.sock"}, "type": "unix"}}}
@@ -68,7 +68,7 @@
 {"return": {}}
 {"execute": "device_add", "arguments": {"drive": "hd0", "driver": "scsi-hd", "id": "scsi-hd0"}}
 {"return": {}}
-....
+.
 ----------------------------------------------------------------------
 Ran 4 tests
 
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index 4b33dcaf5c..99c12f4f98 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -1,16 +1,16 @@
-{"execute": "job-finalize", "arguments": {"id": "commit0"}}
+..{"execute": "job-finalize", "arguments": {"id": "commit0"}}
 {"return": {}}
 {"data": {"id": "commit0", "type": "commit"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "commit0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-{"execute": "job-finalize", "arguments": {"id": "stream0"}}
+...{"execute": "job-finalize", "arguments": {"id": "stream0"}}
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-{"execute": "job-finalize", "arguments": {"id": "stream0"}}
+.{"execute": "job-finalize", "arguments": {"id": "stream0"}}
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-.....................
+...............
 ----------------------------------------------------------------------
 Ran 21 tests
 
diff --git a/tests/qemu-iotests/295.out b/tests/qemu-iotests/295.out
index ad34b2ca2c..5ff91f116c 100644
--- a/tests/qemu-iotests/295.out
+++ b/tests/qemu-iotests/295.out
@@ -4,7 +4,7 @@
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job_erase_key"}}
 {"return": {}}
-{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+.{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job_erase_key"}}
 {"return": {}}
@@ -13,7 +13,7 @@ Job failed: Invalid password, cannot unlock any keyslot
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
 {"return": {}}
-{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+.{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
 {"return": {}}
@@ -33,7 +33,7 @@ Job failed: All the active keyslots match the (old) password that was given and
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job_erase_key"}}
 {"return": {}}
-...
+.
 ----------------------------------------------------------------------
 Ran 3 tests
 
diff --git a/tests/qemu-iotests/296.out b/tests/qemu-iotests/296.out
index cb2859a15c..6c69735604 100644
--- a/tests/qemu-iotests/296.out
+++ b/tests/qemu-iotests/296.out
@@ -13,7 +13,7 @@ Job failed: Failed to get shared "consistent read" lock
 qemu-img: Failed to get shared "consistent read" lock
 Is another process using the image [TEST_DIR/test.img]?
 
-Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
+.Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
 
 Job failed: Block node is read-only
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
@@ -26,15 +26,15 @@ Job failed: Failed to get shared "consistent read" lock
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
+.Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
 
 {"return": {}}
 {"error": {"class": "GenericError", "desc": "Failed to get \"write\" lock"}}
-Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
+.Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
 
 {"return": {}}
 {"return": {}}
-....
+.
 ----------------------------------------------------------------------
 Ran 4 tests
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5af0182895..55a017577f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -20,7 +20,6 @@
 import bz2
 from collections import OrderedDict
 import faulthandler
-import io
 import json
 import logging
 import os
@@ -32,7 +31,7 @@
 import sys
 import time
 from typing import (Any, Callable, Dict, Iterable,
-                    List, Optional, Sequence, Tuple, TypeVar)
+                    List, Optional, Sequence, TextIO, Tuple, Type, TypeVar)
 import unittest
 
 from contextlib import contextmanager
@@ -1271,37 +1270,50 @@ def func_wrapper(*args, **kwargs):
             return func(*args, **kwargs)
     return func_wrapper
 
+# We need to filter out the time taken from the output so that
+# qemu-iotest can reliably diff the results against master output,
+# and hide skipped tests from the reference output.
+
+class ReproducibleTestResult(unittest.TextTestResult):
+    def addSkip(self, test, reason):
+        # Same as TextTestResult, but print dot instead of "s"
+        unittest.TestResult.addSkip(self, test, reason)
+        if self.showAll:
+            self.stream.writeln("skipped {0!r}".format(reason))
+        elif self.dots:
+            self.stream.write(".")
+            self.stream.flush()
+
+class ReproducibleStreamWrapper:
+    def __init__(self, stream: TextIO):
+        self.stream = stream
+
+    def __getattr__(self, attr):
+        if attr in ('stream', '__getstate__'):
+            raise AttributeError(attr)
+        return getattr(self.stream, attr)
+
+    def write(self, arg=None):
+        arg = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', arg)
+        arg = re.sub(r' \(skipped=\d+\)', r'', arg)
+        self.stream.write(arg)
+
+class ReproducibleTestRunner(unittest.TextTestRunner):
+    def __init__(self, stream: Optional[TextIO] = None,
+             resultclass: Type[unittest.TestResult] = ReproducibleTestResult,
+             **kwargs: Any) -> None:
+        rstream = ReproducibleStreamWrapper(stream or sys.stdout)
+        super().__init__(stream=rstream,           # type: ignore
+                         descriptions=True,
+                         resultclass=resultclass,
+                         **kwargs)
+
 def execute_unittest(debug=False):
     """Executes unittests within the calling module."""
 
     verbosity = 2 if debug else 1
-
-    if debug:
-        output = sys.stdout
-    else:
-        # We need to filter out the time taken from the output so that
-        # qemu-iotest can reliably diff the results against master output.
-        output = io.StringIO()
-
-    runner = unittest.TextTestRunner(stream=output, descriptions=True,
-                                     verbosity=verbosity)
-    try:
-        # unittest.main() will use sys.exit(); so expect a SystemExit
-        # exception
-        unittest.main(testRunner=runner)
-    finally:
-        # We need to filter out the time taken from the output so that
-        # qemu-iotest can reliably diff the results against master output.
-        if not debug:
-            out = output.getvalue()
-            out = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', out)
-
-            # Hide skipped tests from the reference output
-            out = re.sub(r'OK \(skipped=\d+\)', 'OK', out)
-            out_first_line, out_rest = out.split('\n', 1)
-            out = out_first_line.replace('s', '.') + '\n' + out_rest
-
-            sys.stderr.write(out)
+    runner = ReproducibleTestRunner(verbosity=verbosity)
+    unittest.main(testRunner=runner)
 
 def execute_setup_common(supported_fmts: Sequence[str] = (),
                          supported_platforms: Sequence[str] = (),
-- 
2.31.1



