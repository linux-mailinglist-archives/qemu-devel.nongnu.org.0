Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7FD345F04
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:10:36 +0100 (CET)
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgnr-0001Cn-Pj
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjm-0005Sl-5Q; Tue, 23 Mar 2021 09:06:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjk-0002Ki-6B; Tue, 23 Mar 2021 09:06:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id e18so20711232wrt.6;
 Tue, 23 Mar 2021 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W+8/8i8/ON0iKou8EKicmYr0pIq5n+4GmS672dCRAOc=;
 b=jGsniELh5/pnM5wFtWIjba2gfvLj8kruZL/AzqA81H1w8v5YNFV6YiMB8bVK4uuqLc
 rhgY8MsB0vfLYtDMQtSS5JLQBGxdwq1RbaxD4iZ5xCjtC+4kdK2m29TlrEkMRPh5W5D9
 /1fKEV90Ty2DsMAyAAcB10Wp0VHK7VULcEAFDTyL4XcnQTkllIv/4NfxC20Zy+Rs76qo
 8DGvpdDpz1gT8oumjVSQm8vmKpfX+0mXSywLJhTfYTZUCrVINy8qI5i4itXpmN5EewiY
 E5vH90KaWuw1OLQUbV/QlH8i5WYk2q97ZmFmI7PWRuWqAy069DSuedtgdcirwP8QCQm5
 8+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W+8/8i8/ON0iKou8EKicmYr0pIq5n+4GmS672dCRAOc=;
 b=eRJgINztapkZ0BgNPXcFiMvaRxcC5m9O611SFqye0GIRJAHu3bmzm1fbMYN4PmmBed
 YpTWhcEcwBqD0fW/+XFJyaGBVNTSxziBO0cAntETdkAVXSG31BnUdhuggo6u+q0w9ZGj
 QtnPkikY9n7IHIJ6kpJjZVAOT6+MNlSEcsSBAK4vEjQYUmJg0ixDu8QZI8GaUUZXUJ7g
 +S72GSBZbzFC69Ajud6T12IaE+JYpeTjPexJ8WGYwdtX9LTZtzU3iSieT6EvKlKUguRF
 uWHmgg70nhhveHsQtOvGsnyzTX5z++PFKLFaKi4LUynubDUJO4AgQgR46wxsjvSjFN7S
 rmMA==
X-Gm-Message-State: AOAM531l0M1Tkryas661WIF5z0MgZfp6EpCQP+GRCrxEQuXCUHBE13N7
 3uVVH+b6ZWSqqZnABEhrYIHUkdqDPsY=
X-Google-Smtp-Source: ABdhPJw7HMM6a+YDH1Vphci5Iw5w5F3X/AQSe3/f0c9KTp8scuFSxuJYh6JqolQ4Bg6yxENaEd+yFg==
X-Received: by 2002:a5d:534e:: with SMTP id t14mr3834502wrv.202.1616504778407; 
 Tue, 23 Mar 2021 06:06:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm2507590wmi.6.2021.03.23.06.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:06:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] qemu-iotests: move command line and environment handling
 from TestRunner to TestEnv
Date: Tue, 23 Mar 2021 14:06:12 +0100
Message-Id: <20210323130614.146399-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323130614.146399-1-pbonzini@redhat.com>
References: <20210323130614.146399-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: eesposit@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next patch, "check" will learn how to execute a test script without
going through TestRunner.  To enable this, keep only the text output
and subprocess handling in the TestRunner; move into TestEnv the logic
to prepare for running a subprocess.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/testenv.py    | 20 ++++++++++++++++++--
 tests/qemu-iotests/testrunner.py | 15 +--------------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 1fbec854c1..6767eeeb25 100644
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
@@ -268,7 +283,8 @@ def print_env(self) -> None:
 PLATFORM      -- {platform}
 TEST_DIR      -- {TEST_DIR}
 SOCK_DIR      -- {SOCK_DIR}
-SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
+SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
+"""
 
         args = collections.defaultdict(str, self.get_env())
 
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 1fc61fcaa3..2f56ac545d 100644
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
@@ -328,7 +316,6 @@ def run_tests(self, tests: List[str]) -> bool:
 
         if not self.makecheck:
             self.env.print_env()
-            print()
 
         test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
 
-- 
2.30.1



