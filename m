Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE33713F3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:05:19 +0200 (CEST)
Received: from localhost ([::1]:42244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWO6-0005To-Fj
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKL-0001rs-2j
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:25 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKJ-0004s3-23
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:24 -0400
Received: by mail-ed1-x529.google.com with SMTP id c22so5762900edn.7
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ICg7BIgvQas5k23bDctJ3vrOhEuRu5Sz5mmBFT/OUU=;
 b=Qw4KdZ0FS5TrBj+X8gQFEoWiQnpD1E2pVopqiYjMKujQ8ParIRLZ/NV+mNFXDmDACT
 RukM0hWNscv1F0NqVaLHw+ygjUg1ACEqJWKCOXrw6ZsfKy7mZvHNDl6MCnGQKHNLZiTq
 3uClU81oCzhj3siAyj1MyGrUFxjKueVGWZg6eyH9Dvk0N1yN2FO96XcuU0W9uO8s+cCL
 /OCR+0DX37LTJecxQhCHmxV99GAjryRhX4tf63cIjpAcqa03S/SHdkk+2h7FjOsiXw0X
 fH/3ZloU5ZkF4ZGychy7g7Gt8GYLW86/ExGIEAIeVMO36RZAwWFPHzm09xz5kFhqpMI7
 ksIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3ICg7BIgvQas5k23bDctJ3vrOhEuRu5Sz5mmBFT/OUU=;
 b=YlAXKvckjvyOM00L7VqPzQOSE41MCLPLZHPHr6AgFeHYxL3819N8/8YhAioAjNa4Ws
 tNFFQs9MtWFHtQVDhSasOF0pPwr14IHt1Tyw8tSjYlpJ4ZSUcJzhZGdMKrdkbtCwJQif
 jlOehEUkZ+jAATONiCoSEFTvAwzexGcWZcr9vbeLHfmMzxrYxo4Wa1BR2xoH+Qc2g5Zt
 OBGlMlZY+XalJRq1Y97xeabhhjsgCRmNBJh98irkIjmxPPkMwkxTpX1oCEwOUKNF0oEc
 V1QoVtw/EkIFGg5mR5GnPDRYkoE6VKFOJxRJZvt0aGjStanEDuwvAukdaI+B9OOsNOpE
 6itg==
X-Gm-Message-State: AOAM533ig/RM7dK8leEAcqW4+rBFGX+HE0I7xra35DcXyQVp5WRbpqIW
 FUlj+4famHa6ekQuUCqmONhyTKMYAlI=
X-Google-Smtp-Source: ABdhPJx93RqqyY81XKE5D4OLRM7i7MoGn+shWiX800jv3N3QFETXtl473RmPkFDKHawEJF8qqe0xJg==
X-Received: by 2002:a05:6402:51d4:: with SMTP id
 r20mr19173829edd.112.1620039676772; 
 Mon, 03 May 2021 04:01:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id v16sm12041464edt.53.2021.05.03.04.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:01:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] qemu-iotests: move command line and environment
 handling from TestRunner to TestEnv
Date: Mon,  3 May 2021 13:01:08 +0200
Message-Id: <20210503110110.476887-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503110110.476887-1-pbonzini@redhat.com>
References: <20210503110110.476887-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

In the next patch, "check" will learn how to execute a test script without
going through TestRunner.  To enable this, keep only the text output
and subprocess handling in the TestRunner; move into TestEnv the logic
to prepare for running a subprocess.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210323181928.311862-4-pbonzini@redhat.com>
---
 tests/qemu-iotests/testenv.py    | 17 ++++++++++++++++-
 tests/qemu-iotests/testrunner.py | 14 +-------------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 6d27712617..fca3a609e0 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -25,7 +25,7 @@
 import random
 import subprocess
 import glob
-from typing import Dict, Any, Optional, ContextManager
+from typing import List, Dict, Any, Optional, ContextManager
 
 
 def isxfile(path: str) -> bool:
@@ -74,6 +74,21 @@ class TestEnv(ContextManager['TestEnv']):
                      'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
                      'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
 
+    def prepare_subprocess(self, args: List[str]) -> Dict[str, str]:
+        if self.debug:
+            args.append('-d')
+
+        with open(args[0], encoding="utf-8") as f:
+            try:
+                if f.readline().rstrip() == '#!/usr/bin/env python3':
+                    args.insert(0, self.python)
+            except UnicodeDecodeError:  # binary test? for future.
+                pass
+
+        os_env = os.environ.copy()
+        os_env.update(self.get_env())
+        return os_env
+
     def get_env(self) -> Dict[str, str]:
         env = {}
         for v in self.env_variables:
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 1fc61fcaa3..519924dc81 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -129,7 +129,6 @@ class TestRunner(ContextManager['TestRunner']):
     def __init__(self, env: TestEnv, makecheck: bool = False,
                  color: str = 'auto') -> None:
         self.env = env
-        self.test_run_env = self.env.get_env()
         self.makecheck = makecheck
         self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
 
@@ -243,18 +242,7 @@ def do_run_test(self, test: str) -> TestResult:
             silent_unlink(p)
 
         args = [str(f_test.resolve())]
-        if self.env.debug:
-            args.append('-d')
-
-        with f_test.open(encoding="utf-8") as f:
-            try:
-                if f.readline().rstrip() == '#!/usr/bin/env python3':
-                    args.insert(0, self.env.python)
-            except UnicodeDecodeError:  # binary test? for future.
-                pass
-
-        env = os.environ.copy()
-        env.update(self.test_run_env)
+        env = self.env.prepare_subprocess(args)
 
         t0 = time.time()
         with f_bad.open('w', encoding="utf-8") as f:
-- 
2.31.1



