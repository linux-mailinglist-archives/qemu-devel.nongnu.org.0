Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A834A9AF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:27:21 +0100 (CET)
Received: from localhost ([::1]:58250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnQm-0005SN-3J
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNh-00021s-Ul; Fri, 26 Mar 2021 10:24:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNf-0000iQ-41; Fri, 26 Mar 2021 10:24:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so5806204wrw.10;
 Fri, 26 Mar 2021 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jsUgwlZXJuyBPDp8GpUlu0IW/hCCv8e/Mr49HtzzOyc=;
 b=p+YHTywunEDyOqqHA6xH2dpX2doAM+oIaGVjBYpX9eIDPxaPvyY6qYIZB5+WFzvQ0v
 NiWiBjslBS8PHkCX7zhrPho+dt2JjGlHkm9FlmD9Lf3V4AS5lbbUWxIRIK3yagj6kBOl
 z4gy4TScrq1Cj7ThPlCjbZUjEABf0oLf5m+Ko/Zxo9YG2ARHhh2P/x1MjPIO5GvoTB9d
 xW9AITQmul1jsicgJYFH3Gj1Nphbh6Q1KS1V6KdJ9gLpGia6qnRDuU9+HJCfZF6HDYnm
 IhIIqm1Cjw46Gsmkgk8Na74lCkdQG4MmTujua44+6zkOlUnBID3eGxg5MHFYCsGtzvXX
 ld2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jsUgwlZXJuyBPDp8GpUlu0IW/hCCv8e/Mr49HtzzOyc=;
 b=kUUCOgUT9/9l+NN6/rwM4G1ZSWRxkUR9+Pw9NWwEn5DvLuMc+qhqW5uCAZtdOWFXe+
 fbSMHp6DTT6cFdfVz5mfmrFTNbWL2t6CS9/tVg+THJ1jAkBKmpHtUEBBsh+qX25I2DOW
 jCVkJtfxD0aOU4mkyP5YpWfLUTW2ygFe5Nd0KEAhxGcrcTv4N6bVn0JkkS2BLiNdgtlU
 M+hug5nIs1TcV/8Ia507GKFcRIHqDJngCInmdcGPMgIdBn2bPHkiFZTZov0pxkuy08tw
 HufIySJ8+xPGNxlvTRbsJpVFH+xb0nqXoBufzETZGThoK9Z2Caxyg9az5asb2jM7Vf/v
 lFUA==
X-Gm-Message-State: AOAM532wJaZ59chZa3iIjr+/CrjLs/RfCIU9YsWJVHw67Zp1RFEuC+TB
 PtgsQuN3H/dai7ljuO9/95+Ui+DCTwY=
X-Google-Smtp-Source: ABdhPJx0RSik8IEFDuCyZuXir/8IaBI+VaNRJPDKusuE/ABHphiZaU0/ZUBy+RmOfEP8hJlzTs22yQ==
X-Received: by 2002:a5d:4bce:: with SMTP id l14mr14926057wrt.99.1616768645354; 
 Fri, 26 Mar 2021 07:24:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m5sm13084517wrq.15.2021.03.26.07.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:24:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] qemu-iotests: move command line and environment
 handling from TestRunner to TestEnv
Date: Fri, 26 Mar 2021 15:23:57 +0100
Message-Id: <20210326142359.431127-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210326142359.431127-1-pbonzini@redhat.com>
References: <20210326142359.431127-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
2.30.1



