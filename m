Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87EF380EA5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:11:07 +0200 (CEST)
Received: from localhost ([::1]:35140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbL8-0007fL-ES
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawe-0005fU-J3
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawX-0005pD-9q
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xaWlUHkXk0yIJbXgfnbRkewFmEtLhEPWkCX4UdUsxNQ=;
 b=ezm2NWmO7FFVYFhwagWVtFmpcZE+g9hZmOuXxB7YWGbr/qkHeKolDonYxiNM44f/IFz1hW
 QdFKCWNWpmSnZspsEezG5zc/Jga6LJI34wB3j5txMnvAo72TgaO5b0HA6stkx/vQTWDlw3
 P7053SKp7PN5bhoE3d3AdV9bZPh7MH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-0decN8QJN_u2B2VVJik52Q-1; Fri, 14 May 2021 12:45:32 -0400
X-MC-Unique: 0decN8QJN_u2B2VVJik52Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D6010074CE;
 Fri, 14 May 2021 16:45:31 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C621F61156;
 Fri, 14 May 2021 16:45:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/19] qemu-iotests: move command line and environment handling
 from TestRunner to TestEnv
Date: Fri, 14 May 2021 18:45:02 +0200
Message-Id: <20210514164514.1057680-8-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

In the next patch, "check" will learn how to execute a test script without
going through TestRunner.  To enable this, keep only the text output
and subprocess handling in the TestRunner; move into TestEnv the logic
to prepare for running a subprocess.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210323181928.311862-4-pbonzini@redhat.com>
Message-Id: <20210503110110.476887-4-pbonzini@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
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


