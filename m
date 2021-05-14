Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1E3380EE4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:26:20 +0200 (CEST)
Received: from localhost ([::1]:34208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbZr-0001V6-Bv
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawX-0005Kg-ER
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawO-0005ot-AQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVZqoJDpkaz7GU4F0Jeixtx8PFamkNuGOCgLTshO2ss=;
 b=UcfKhxyffANZnEUUDKuTunwriy1McPf4TrgcxjF8DjN5mTSjJebsEbT8ExoibXxPQ4nPmv
 amP6lhnsvDA+9qFDLia0q5iqxlZ3utXLZQnvCmlbDgPfEDhwfvRTw4SsEUF2QBPQ7TANZM
 /XElOelNf8RvtgmlU9CF6LD/oQG5oX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Z33NiD4hNCSmSEz0YVA8EA-1; Fri, 14 May 2021 12:45:28 -0400
X-MC-Unique: Z33NiD4hNCSmSEz0YVA8EA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 186BF501FC;
 Fri, 14 May 2021 16:45:27 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 888BF36D5;
 Fri, 14 May 2021 16:45:26 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/19] qemu-iotests: do not buffer the test output
Date: Fri, 14 May 2021 18:45:00 +0200
Message-Id: <20210514164514.1057680-6-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Instead of buffering the test output into a StringIO, patch it on
the fly by wrapping sys.stdout's write method.  This can be
done unconditionally, even if using -d, which makes execute_unittest
a bit simpler.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210323181928.311862-2-pbonzini@redhat.com>
Message-Id: <20210503110110.476887-2-pbonzini@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
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


