Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F05421907
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:11:45 +0200 (CEST)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVFQ-0002QQ-4n
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9W-0000Bk-Qm
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9U-0007ZJ-Rq
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2RwsNnhmW4kg5zkhgDbXUp23lnGDTKQUVioF8J6DsM=;
 b=CfR0cR3hBRee+yKthckg4V1hkKFzUkj8/gkHsu9DZzv1zjfZG5ylrsO+80FN+GvML7maaF
 m/vmtPFu287OTt5Su0pJQEKCMf+0lIrs6MSjmLPqE1LDv/JRyzWfcMVPq/mysnM91UKlYU
 N7Xsh4BSs3l1Ymku+JDSGCJA0NMBH0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-IEIOxMRFOxWCt71KMP5NXg-1; Mon, 04 Oct 2021 17:05:33 -0400
X-MC-Unique: IEIOxMRFOxWCt71KMP5NXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F522802935;
 Mon,  4 Oct 2021 21:05:32 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B00719C59;
 Mon,  4 Oct 2021 21:05:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/13] iotests: split linters.py out from 297
Date: Mon,  4 Oct 2021 17:04:59 -0400
Message-Id: <20211004210503.1455391-10-jsnow@redhat.com>
In-Reply-To: <20211004210503.1455391-1-jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now, 297 is just the iotests-specific incantations and linters.py is as
minimal as I can think to make it. The only remaining element in here
that ought to be configuration and not code is the list of skip files,
but they're still numerous enough that repeating them for mypy and
pylint configurations both would be ... a hassle.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297        | 72 +++---------------------------
 tests/qemu-iotests/linters.py | 83 +++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 67 deletions(-)
 create mode 100644 tests/qemu-iotests/linters.py

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 4c54dd39b46..f79c80216bf 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -17,76 +17,14 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 import os
-import re
 import shutil
-import subprocess
 import sys
-from typing import List, Mapping, Optional
 
 import iotests
+import linters
 
 
-# TODO: Empty this list!
-SKIP_FILES = (
-    '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
-    '096', '118', '124', '132', '136', '139', '147', '148', '149',
-    '151', '152', '155', '163', '165', '194', '196', '202',
-    '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
-    '218', '219', '224', '228', '234', '235', '236', '237', '238',
-    '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
-    '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
-    '299', '302', '303', '304', '307',
-    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
-)
-
-
-def is_python_file(filename):
-    if not os.path.isfile(filename):
-        return False
-
-    if filename.endswith('.py'):
-        return True
-
-    with open(filename, encoding='utf-8') as f:
-        try:
-            first_line = f.readline()
-            return re.match('^#!.*python', first_line) is not None
-        except UnicodeDecodeError:  # Ignore binary files
-            return False
-
-
-def get_test_files() -> List[str]:
-    named_tests = [f'tests/{entry}' for entry in os.listdir('tests')]
-    check_tests = set(os.listdir('.') + named_tests) - set(SKIP_FILES)
-    return list(filter(is_python_file, check_tests))
-
-
-def run_linter(
-        tool: str,
-        args: List[str],
-        env: Optional[Mapping[str, str]] = None,
-        suppress_output: bool = False,
-) -> int:
-    """
-    Run a python-based linting tool.
-
-    If suppress_output is True, capture stdout/stderr of the child
-    process and only print that information back to stdout if the child
-    process's return code was non-zero.
-    """
-    p = subprocess.run(
-        ('python3', '-m', tool, *args),
-        env=env,
-        check=False,
-        stdout=subprocess.PIPE if suppress_output else None,
-        stderr=subprocess.STDOUT if suppress_output else None,
-        universal_newlines=True,
-    )
-
-    if suppress_output and p.returncode != 0:
-        print(p.stdout)
-
-    return p.returncode
+# Looking for the list of files to exclude from linting? See linters.py.
 
 
 def main() -> None:
@@ -94,7 +32,7 @@ def main() -> None:
         if shutil.which(linter) is None:
             iotests.notrun(f'{linter} not found')
 
-    files = get_test_files()
+    files = linters.get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
@@ -104,11 +42,11 @@ def main() -> None:
 
     print('=== pylint ===')
     sys.stdout.flush()
-    run_linter('pylint', files, env=env)
+    linters.run_linter('pylint', files, env=env)
 
     print('=== mypy ===')
     sys.stdout.flush()
-    run_linter('mypy', files, env=env, suppress_output=True)
+    linters.run_linter('mypy', files, env=env, suppress_output=True)
 
 
 iotests.script_main(main)
diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
new file mode 100644
index 00000000000..f6a2dc139fd
--- /dev/null
+++ b/tests/qemu-iotests/linters.py
@@ -0,0 +1,83 @@
+# Copyright (C) 2020 Red Hat, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+import os
+import re
+import subprocess
+from typing import List, Mapping, Optional
+
+
+# TODO: Empty this list!
+SKIP_FILES = (
+    '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
+    '096', '118', '124', '132', '136', '139', '147', '148', '149',
+    '151', '152', '155', '163', '165', '194', '196', '202',
+    '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
+    '218', '219', '224', '228', '234', '235', '236', '237', '238',
+    '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
+    '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
+    '299', '302', '303', '304', '307',
+    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
+)
+
+
+def is_python_file(filename):
+    if not os.path.isfile(filename):
+        return False
+
+    if filename.endswith('.py'):
+        return True
+
+    with open(filename, encoding='utf-8') as f:
+        try:
+            first_line = f.readline()
+            return re.match('^#!.*python', first_line) is not None
+        except UnicodeDecodeError:  # Ignore binary files
+            return False
+
+
+def get_test_files() -> List[str]:
+    named_tests = [f'tests/{entry}' for entry in os.listdir('tests')]
+    check_tests = set(os.listdir('.') + named_tests) - set(SKIP_FILES)
+    return list(filter(is_python_file, check_tests))
+
+
+def run_linter(
+        tool: str,
+        args: List[str],
+        env: Optional[Mapping[str, str]] = None,
+        suppress_output: bool = False,
+) -> int:
+    """
+    Run a python-based linting tool.
+
+    If suppress_output is True, capture stdout/stderr of the child
+    process and only print that information back to stdout if the child
+    process's return code was non-zero.
+    """
+    p = subprocess.run(
+        ('python3', '-m', tool, *args),
+        env=env,
+        check=False,
+        stdout=subprocess.PIPE if suppress_output else None,
+        stderr=subprocess.STDOUT if suppress_output else None,
+        universal_newlines=True,
+    )
+
+    if suppress_output and p.returncode != 0:
+        print(p.stdout)
+
+    return p.returncode
+
-- 
2.31.1


