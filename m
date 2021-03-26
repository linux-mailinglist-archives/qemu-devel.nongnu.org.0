Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B92234A9AE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:27:00 +0100 (CET)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnQR-0004m4-CO
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNg-00020F-5n; Fri, 26 Mar 2021 10:24:09 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNd-0000h2-VE; Fri, 26 Mar 2021 10:24:07 -0400
Received: by mail-wr1-x435.google.com with SMTP id b9so5808962wrt.8;
 Fri, 26 Mar 2021 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sy7BnXpvFvOYWJ2dLQm2mMqmZUakPZXII5Bsc1E4lrM=;
 b=F1q+T86IzIroj2ii1m/XfIcIZqgGGlxQzBZQ3CcqG/pN0TNmHksYUAlpQBVlMEGol0
 v0ZKKytPAaaOuNTFnUMHvRFuw/nOsHk/Do47jhjt7qSQZ3ntHtaGxeuJyOs8yvP5ahj0
 lnDCmK2nIiL7dj/a0VXkphoH6k9PhXngHfdmLe/UYXckllTDBxorPnA7wc9hglEZu9lR
 tTrH/NEAiA+cTCzIR/okpnMq5aufTiCTgAFvfNsalSDcDFvVZxPauRM98aNEfOT+e7L3
 242p5EkkqTlY+qwM4MW/xjlE8sVhak9/B1aUUGiDk1wGP7WwkzqUOTU8pyQX1wNAdKps
 ld5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sy7BnXpvFvOYWJ2dLQm2mMqmZUakPZXII5Bsc1E4lrM=;
 b=VwX7Y1v5YHjbi36eah8CThSqydGjPZrKUAoYxWI2frgEvUqvwS0XPEKwuj8W1TBxKF
 HYK8UNv9aLYofppg2qTtmOmIKDg+CbYkBOMbBy/Jk5QiMLAkG+5g4NrCouT3KRmHc+Ha
 elnVrP4X5tStWFtTOXDjlohpdewoltvCPBBjzjIuP08B5ql5JspcQbdM7r32nRa0lJ9b
 KBdT9FdPGkBT/pBz6vPM6CrmM17JHFGoo9daTnv4j76RopL/FDGRCKE99GIH1JAzvXBj
 26vW0ARSlCr3BktOyWjG5sE0R6in+FQ19pMbrRPul5gHBC+TdBOTo2KR6ilm9wM84NRh
 9BYA==
X-Gm-Message-State: AOAM532MpnYwDLEV3X7e0MC7Y9SHtEECfxtR+iiMBtyrrGEn6sw8IV0A
 GtSxex/8L4kB7EvqVKFqLh6oJXzJ7Bw=
X-Google-Smtp-Source: ABdhPJxcyd4+oY2eACmwRcPxCqpnlmQjz03KowZ5vRP0C0fAaHPQGqVsXCHGzcgchFFpeiK7P2D9Iw==
X-Received: by 2002:adf:dd47:: with SMTP id u7mr14913984wrm.13.1616768643763; 
 Fri, 26 Mar 2021 07:24:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m5sm13084517wrq.15.2021.03.26.07.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:24:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] qemu-iotests: do not buffer the test output
Date: Fri, 26 Mar 2021 15:23:55 +0100
Message-Id: <20210326142359.431127-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210326142359.431127-1-pbonzini@redhat.com>
References: <20210326142359.431127-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_OTHER_BAD_TLD=1.999,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 mreitz@redhat.com
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
 tests/qemu-iotests/iotests.py | 70 ++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5af0182895..ccf3747ede 100644
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
+    runner = unittest.ReproducibleTestRunner(verbosity=verbosity)
+    unittest.main(testRunner=runner)
 
 def execute_setup_common(supported_fmts: Sequence[str] = (),
                          supported_platforms: Sequence[str] = (),
-- 
2.30.1



