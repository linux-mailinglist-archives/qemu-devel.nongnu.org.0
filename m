Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C645034688F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:09:45 +0100 (CET)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmPQ-0006b2-GA
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlcu-000832-Ei; Tue, 23 Mar 2021 14:19:41 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlcq-0006dp-3E; Tue, 23 Mar 2021 14:19:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so1581294wmq.1; 
 Tue, 23 Mar 2021 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=czzHm2ccyhhF9zSRE5fhZxlUCkJ2TFJg6JtCeRoNsII=;
 b=UcGeb9ITWEsSMOagHb5hleTDdLK1TCpT8rYKJ3jGDFpugHB5u34CzyzKPrkaLTPGCt
 fteBHuesRVO8ncne+4PMjsBMGPn0Tu9Ox35fXyMgSDasrGZbl/zBZrIGhHLgmVCTcTQX
 ZI4q2avTT9/innG2P38mZH0oxkVX2un46Vmb+J5ynJEl9P9qFbdnHF9FW6PuYCYVdven
 VHZ1ZFZrW3aKZ7/ufpxdmbnOrBvEcY0l1lLtit3y9360neiHAZJF+kp0RrbKR2bXMszK
 I/F4r/NzDoyQRsF2OcDHP6nJEzss2Zw7XRTaFFMGS0goUMc/HgKmlwptf1U48/3EkQR9
 kN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=czzHm2ccyhhF9zSRE5fhZxlUCkJ2TFJg6JtCeRoNsII=;
 b=dR0tYUgc/qF7p/Wpkpw+Qu2r3MmrCsZchAeVmQJB69jwxtZqolR/eUYRxdQr6u25Zh
 nLL0fC6X1Oo05GGP0dpSWhX0PuyQirty5eZaIrl43wS83+I7HIhkPzvi3BgWaEmASMpV
 lSsgwWu3v/2o6PUooCsdDMlccxVABxtVjAh03GskQireTCf7jxIl3vKLoLupKe62ujTn
 weMCiTe/R8NAVihDbJp6UBks+TDOcgCUPyfwLZEVlKt5F2o3WimICyRWXjxR8DPnlIaj
 7t7ZYfXR2e6yQcNxtEHUXXDvPtIVlk6zO5V3oe/47rT/vQfiH347AE/USHk7XYcyIqZN
 gk2w==
X-Gm-Message-State: AOAM530YNvAy7GVfF3OMDKCTV/LQrhXCMSPjVveO7FIIO/s1WJAu5jKN
 htVYnQMn6Nb4e/i4qWDKigF6glzRQOw=
X-Google-Smtp-Source: ABdhPJzzzq1BkRmLbWQCcMug1+blxbmiWPQ+4GWRl1qSknnzePYQUH/ibYTugYGS1UCc/VQnzEKf2g==
X-Received: by 2002:a1c:6309:: with SMTP id x9mr4588914wmb.62.1616523570473;
 Tue, 23 Mar 2021 11:19:30 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u8sm24204412wrr.42.2021.03.23.11.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:19:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] qemu-iotests: do not buffer the test output
Date: Tue, 23 Mar 2021 19:19:23 +0100
Message-Id: <20210323181928.311862-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323181928.311862-1-pbonzini@redhat.com>
References: <20210323181928.311862-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PDS_OTHER_BAD_TLD=1.999,
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
Cc: eesposit@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of buffering the test output into a StringIO, patch it on
the fly by wrapping sys.stdout's write method.  This can be
done unconditionally, even if using -d, which makes execute_unittest
a bit simpler.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/iotests.py | 68 ++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 90d0b62523..0521235030 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -32,7 +32,7 @@
 import sys
 import time
 from typing import (Any, Callable, Dict, Iterable,
-                    List, Optional, Sequence, Tuple, TypeVar)
+                    List, Optional, Sequence, Tuple, Type, TypeVar)
 import unittest
 
 from contextlib import contextmanager
@@ -1271,37 +1271,49 @@ def func_wrapper(*args, **kwargs):
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
+class ReproducibleStreamWrapper(object):
+    def __init__(self, stream):
+        self.stream = stream
+
+    def __getattr__(self, attr):
+        if attr in ('stream', '__getstate__'):
+            raise AttributeError(attr)
+        return getattr(self.stream,attr)
+
+    def write(self, arg=None):
+        arg = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', arg)
+        arg = re.sub(r' \(skipped=\d+\)', r'', arg)
+        self.stream.write(arg)
+
+class ReproducibleTestRunner(unittest.TextTestRunner):
+    def __init__(self, stream: Optional[io.TextIOBase] = None,
+                 resultclass: Type = ReproducibleTestResult, *args, **kwargs):
+        rstream = ReproducibleStreamWrapper(stream or sys.stdout)
+        super().__init__(stream=rstream,           # type: ignore
+                         descriptions=True,
+                         resultclass=resultclass,
+                         *args, **kwargs)
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
+    runner = unittest.ReproducibleTestRunner(verbosity=verbosity)
+    unittest.main(testRunner=runner)
 
 def execute_setup_common(supported_fmts: Sequence[str] = (),
                          supported_platforms: Sequence[str] = (),
-- 
2.30.1



