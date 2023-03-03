Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4756A9B5E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:08:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7wh-0007ha-3O; Fri, 03 Mar 2023 11:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wc-0007eq-Uv
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wa-0005kP-U0
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677859660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p++4zIgGZrX/Z/sDx3hiWSacNj22/J8kQgnF2nrA63w=;
 b=JMQB2qGTlOSazfDC+3aJFyqDLe6h6Jrw7YksbwMMsz4w/itOzT5a/Q3tIEJYEvfk8sHUbQ
 rT0VIBEMKMNVxbScPDgj2u73pK+4F13xnfwvLVdXCXps4I4PxdMtNP/qtybjMsmK8Bawnn
 jIGhKY0XAlI/XEtmMN/33uwY56I7xKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-VaGGxrC8PHKLho1OZdmSwg-1; Fri, 03 Mar 2023 11:07:39 -0500
X-MC-Unique: VaGGxrC8PHKLho1OZdmSwg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFC26101A52E;
 Fri,  3 Mar 2023 16:07:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37D4E492C14;
 Fri,  3 Mar 2023 16:07:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 5/8] iotests: connect stdin to /dev/null when running tests
Date: Fri,  3 Mar 2023 16:07:24 +0000
Message-Id: <20230303160727.3977246-6-berrange@redhat.com>
In-Reply-To: <20230303160727.3977246-1-berrange@redhat.com>
References: <20230303160727.3977246-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently the tests have their stdin inherited from the test harness,
meaning they are connected to a TTY. The QEMU processes spawned by
certain tests, however, modify TTY settings and if the test exits
abnormally the settings might not be restored.

The python test harness thus has some logic which will capture the
initial TTY settings and restore them once all tests are finished.

This does not, however, take into account the possibility of many
copies of the 'check' program running in parallel. With parallel
execution, a later invokation may save the TTY state that QEMU has
already modified, and thus restore bad state leaving the TTY
non-functional.

None of the I/O tests shnould actually be interactive requiring
user input and so they should not require a TTY at all. To avoid
this while TTY save/restore complexity we can connect the test
stdin to /dev/null instead.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index e734800b3d..81519ed6e2 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -24,12 +24,10 @@
 import subprocess
 import contextlib
 import json
-import termios
 import shutil
 import sys
 from multiprocessing import Pool
-from contextlib import contextmanager
-from typing import List, Optional, Iterator, Any, Sequence, Dict, \
+from typing import List, Optional, Any, Sequence, Dict, \
         ContextManager
 
 from testenv import TestEnv
@@ -56,22 +54,6 @@ def file_diff(file1: str, file2: str) -> List[str]:
         return res
 
 
-# We want to save current tty settings during test run,
-# since an aborting qemu call may leave things screwed up.
-@contextmanager
-def savetty() -> Iterator[None]:
-    isterm = sys.stdin.isatty()
-    if isterm:
-        fd = sys.stdin.fileno()
-        attr = termios.tcgetattr(fd)
-
-    try:
-        yield
-    finally:
-        if isterm:
-            termios.tcsetattr(fd, termios.TCSADRAIN, attr)
-
-
 class LastElapsedTime(ContextManager['LastElapsedTime']):
     """ Cache for elapsed time for tests, to show it during new test run
 
@@ -169,7 +151,6 @@ def __enter__(self) -> 'TestRunner':
         self._stack = contextlib.ExitStack()
         self._stack.enter_context(self.env)
         self._stack.enter_context(self.last_elapsed)
-        self._stack.enter_context(savetty())
         return self
 
     def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
@@ -294,6 +275,7 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
         t0 = time.time()
         with f_bad.open('w', encoding="utf-8") as f:
             with subprocess.Popen(args, cwd=str(f_test.parent), env=env,
+                                  stdin=subprocess.DEVNULL,
                                   stdout=f, stderr=subprocess.STDOUT) as proc:
                 try:
                     proc.wait()
-- 
2.39.2


