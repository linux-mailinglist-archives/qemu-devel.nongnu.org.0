Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B060433A57
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:29:13 +0200 (CEST)
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcr3A-0001jh-EO
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqR0-0001tc-04
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQu-0008Dq-KX
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2iVq2o0JZLP5OeiUiiheqEHME/hF8JHrhZdN7Kas0I=;
 b=I1+1N/Dm8U1P24P/nAN6GjBSdCYpKYDdA3JIW2bkW+MQmOEyxdKMQKSX/ONxODj6xDXNqF
 MUQEcndkCv3YBqCE+vgh3YvF+ous36b57aqDkgOR6i8E0FMUhU3YsKG99qXhNqtm+TDMs4
 JJdxBDQ0PCAPBU8sbekq4372EqxWMCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-RlWibRZkOHSeP-a1OrQWSQ-1; Tue, 19 Oct 2021 10:49:34 -0400
X-MC-Unique: RlWibRZkOHSeP-a1OrQWSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 498B8824FA2;
 Tue, 19 Oct 2021 14:49:33 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65E795D6D7;
 Tue, 19 Oct 2021 14:49:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] iotests: split linters.py out from 297
Date: Tue, 19 Oct 2021 10:49:14 -0400
Message-Id: <20211019144918.3159078-12-jsnow@redhat.com>
In-Reply-To: <20211019144918.3159078-1-jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 tests/qemu-iotests/297        | 72 +++++----------------------------
 tests/qemu-iotests/linters.py | 76 +++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+), 61 deletions(-)
 create mode 100644 tests/qemu-iotests/linters.py

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index b7d9d6077b3..ee78a627359 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -17,74 +17,24 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 import os
-import re
 import subprocess
 import sys
-from typing import List, Mapping, Optional
+from typing import List
 
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
-) -> None:
-    """
-    Run a python-based linting tool.
-
-    :param suppress_output: If True, suppress all stdout/stderr output.
-    :raise CalledProcessError: If the linter process exits with failure.
-    """
-    subprocess.run(
-        ('python3', '-m', tool, *args),
-        env=env,
-        check=True,
-        stdout=subprocess.PIPE if suppress_output else None,
-        stderr=subprocess.STDOUT if suppress_output else None,
-        universal_newlines=True,
-    )
+# Looking for something?
+#
+#  List of files to exclude from linting: linters.py
+#  mypy configuration:                    mypy.ini
+#  pylint configuration:                  pylintrc
 
 
 def check_linter(linter: str) -> bool:
     try:
-        run_linter(linter, ['--version'], suppress_output=True)
+        linters.run_linter(linter, ['--version'], suppress_output=True)
     except subprocess.CalledProcessError:
         iotests.case_notrun(f"'{linter}' not found")
         return False
@@ -98,7 +48,7 @@ def test_pylint(files: List[str]) -> None:
     if not check_linter('pylint'):
         return
 
-    run_linter('pylint', files)
+    linters.run_linter('pylint', files)
 
 
 def test_mypy(files: List[str]) -> None:
@@ -111,11 +61,11 @@ def test_mypy(files: List[str]) -> None:
     env = os.environ.copy()
     env['MYPYPATH'] = env['PYTHONPATH']
 
-    run_linter('mypy', files, env=env, suppress_output=True)
+    linters.run_linter('mypy', files, env=env, suppress_output=True)
 
 
 def main() -> None:
-    files = get_test_files()
+    files = linters.get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
new file mode 100644
index 00000000000..c515c7afe36
--- /dev/null
+++ b/tests/qemu-iotests/linters.py
@@ -0,0 +1,76 @@
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
+) -> None:
+    """
+    Run a python-based linting tool.
+
+    :param suppress_output: If True, suppress all stdout/stderr output.
+    :raise CalledProcessError: If the linter process exits with failure.
+    """
+    subprocess.run(
+        ('python3', '-m', tool, *args),
+        env=env,
+        check=True,
+        stdout=subprocess.PIPE if suppress_output else None,
+        stderr=subprocess.STDOUT if suppress_output else None,
+        universal_newlines=True,
+    )
-- 
2.31.1


