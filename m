Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB7346878
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:05:48 +0100 (CET)
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmLb-0008OY-82
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlcw-00083N-Ib; Tue, 23 Mar 2021 14:19:42 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlct-0006gb-4v; Tue, 23 Mar 2021 14:19:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so11387688wmj.2; 
 Tue, 23 Mar 2021 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jgTZhKhS2DWM3MMib2DER4FbfRHawRaIKc8lzpzBQ4c=;
 b=b9qU7jBmMnLvLf55jr+ZvdlrQm0zb46L7WQWQr3fappU30plvP3cnH/G0Li7/Zd7vB
 XQ5lDYsSzTraHoADwB0V0GkhdexjBVPlFXNtwd/VcQSsH+SdXOx4RrgfFLPtko9OSdZ1
 O7kdBrVhAmcZ/DBsD8C8cjOPivZKBn36sS0P5Sk4RBtpUI5wesOXJOy3dnUXFIcxjS58
 4aCOidkVjwsRrRcpY2XjQk50KI4X781qoBsQ3EyZYEobM3aGThrESym6bAUUPKG7NEiX
 Zk+EBToy6FZK86EV4zNEdhMX4EihdBHSoEB1mnojUUhuGG3s8jf6qeYGHJ7qix3PuvaL
 0VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jgTZhKhS2DWM3MMib2DER4FbfRHawRaIKc8lzpzBQ4c=;
 b=JuFNtBC90GX1KUX54fdfHUcTtQTktPrDQ+npZshhgpyJ42oQln5kBq8lrQwLo5RWb9
 h4x6GjMB+AeNCtNbwTZW5KddB+Vuodm5b/W0KkMymMeGHUNQfs28HS7bLC8Sni873F1X
 AYCQm97HxRkK8NLDzwKuEdnzTN4t5ZR3Zt2ntHmKs1iUD90sHuVZJCAMPc/v+tSNA7HD
 7pmPXHdPq2J2OevxQ+JFF4SVZAxknfPVqot1FGKBvb9J7ZNx8HBKlCs+efQFylUR9Uwl
 F/bVNG3KK5ZVB50LF+Mmb42/tYlEYc0IG3OjXS6EeCs+400/jsQzKN3TvkxJJUbL196N
 ib9Q==
X-Gm-Message-State: AOAM530D7QiGztWLJfUPZHLp9VwHR5Hn6frgTxYy64hgVgl9CESkgVUS
 Z3vz2COHx5ya4Par9Xld3kUwFEyofjo=
X-Google-Smtp-Source: ABdhPJy+dX4c7fqKsKIFSYx05vuRxsPOWWORat4BSz+4aZa7Cs1Reck6yZn11fHvwiDB0EpPxb4Zlw==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr4542117wmc.126.1616523572034; 
 Tue, 23 Mar 2021 11:19:32 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u8sm24204412wrr.42.2021.03.23.11.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:19:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] qemu-iotests: move command line and environment
 handling from TestRunner to TestEnv
Date: Tue, 23 Mar 2021 19:19:25 +0100
Message-Id: <20210323181928.311862-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323181928.311862-1-pbonzini@redhat.com>
References: <20210323181928.311862-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/testenv.py    | 17 ++++++++++++++++-
 tests/qemu-iotests/testrunner.py | 14 +-------------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 1fbec854c1..341a4af4e9 100644
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



