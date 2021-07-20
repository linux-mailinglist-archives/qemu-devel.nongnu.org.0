Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A03D00F4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:52:45 +0200 (CEST)
Received: from localhost ([::1]:39282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tvA-00064P-Pa
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5td6-0006N0-19
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5td2-0005kh-BI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DoVTWKVir/Qq/LuiaI9w3+7/8eKuXOHf5Iu/+9gn7uo=;
 b=VpS64/w1Vu+HOlkGXb5eA9h8dwWS3m9OiQwh8lQhwtyS7MvkRBhatb4qItZiOKTgU5/E7U
 KEANEu28iTjD1POfh4DmHHC+flHehkKmLB/NNMI9HN8mon4vF0/CoLwZfN5MxTyjvi/G1d
 HNbyqyHNrvnrcnAYXZl6x2Y6T4VZyk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-V95ziEG9MVK0e0b1FoO_ag-1; Tue, 20 Jul 2021 13:33:57 -0400
X-MC-Unique: V95ziEG9MVK0e0b1FoO_ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 807A2186840B;
 Tue, 20 Jul 2021 17:33:56 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 744A4369A;
 Tue, 20 Jul 2021 17:33:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/17] iotests/297: split linters.py off from 297
Date: Tue, 20 Jul 2021 13:33:33 -0400
Message-Id: <20210720173336.1876937-15-jsnow@redhat.com>
In-Reply-To: <20210720173336.1876937-1-jsnow@redhat.com>
References: <20210720173336.1876937-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the linter execution itself out from 297, leaving just environment
setup in 297. This is done so that non-iotest code can invoke the
linters without needing to worry about imports of unpackaged iotest
code.

Eventually, it should be possible to replace linters.py with mypy.ini
and pylintrc files that instruct these tools how to run properly in this
directory, but ... not yet, and not in this series.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297        | 110 ++-----------------------------
 tests/qemu-iotests/linters.py | 121 ++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+), 106 deletions(-)
 create mode 100755 tests/qemu-iotests/linters.py

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index ca9ee72d2fa..3d29af5b78a 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -17,115 +17,13 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 import os
-import re
 import shutil
-import subprocess
-import sys
-from typing import List, Mapping, Optional
 
 import iotests
+import linters
 
 
-# TODO: Empty this list!
-SKIP_FILES = (
-    '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
-    '096', '118', '124', '132', '136', '139', '147', '148', '149',
-    '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
-    '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
-    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
-    '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
-    '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
-    '299', '302', '303', '304', '307',
-    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
-)
-
-
-def is_python_file(filepath: str) -> bool:
-    if filepath.endswith('.py'):
-        return True
-
-    with open(filepath) as f:
-        try:
-            first_line = f.readline()
-            return re.match('^#!.*python', first_line) is not None
-        except UnicodeDecodeError:  # Ignore binary files
-            return False
-
-
-def get_test_files(directory: str = '.') -> List[str]:
-    files = []
-
-    iotests.logger.debug("get_test_files(%s)", directory)
-    for dirent in os.scandir(directory):
-        if dirent.name in SKIP_FILES:
-            continue
-
-        relpath = os.path.join(directory, dirent.name)
-        if dirent.is_dir():
-            files.extend(get_test_files(relpath))
-        elif is_python_file(relpath):
-            files.append(relpath)
-
-    return files
-
-
-def run_linters(
-    files: List[str],
-    directory: str = '.',
-    env: Optional[Mapping[str, str]] = None,
-) -> int:
-    ret = 0
-
-    print('=== pylint ===')
-    sys.stdout.flush()
-
-    # Todo notes are fine, but fixme's or xxx's should probably just be
-    # fixed (in tests, at least)
-    p = subprocess.run(
-        ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
-        cwd=directory,
-        env=env,
-        check=False,
-        universal_newlines=True,
-    )
-    ret += p.returncode
-
-    print('=== mypy ===')
-    sys.stdout.flush()
-
-    # We have to call mypy separately for each file.  Otherwise, it
-    # will interpret all given files as belonging together (i.e., they
-    # may not both define the same classes, etc.; most notably, they
-    # must not both define the __main__ module).
-    for filename in files:
-        p = subprocess.run(
-            (
-                'python3', '-m', 'mypy',
-                '--warn-unused-configs',
-                '--disallow-subclassing-any',
-                '--disallow-any-generics',
-                '--disallow-incomplete-defs',
-                '--disallow-untyped-decorators',
-                '--no-implicit-optional',
-                '--warn-redundant-casts',
-                '--warn-unused-ignores',
-                '--no-implicit-reexport',
-                '--namespace-packages',
-                filename,
-            ),
-            cwd=directory,
-            env=env,
-            check=False,
-            stdout=subprocess.PIPE,
-            stderr=subprocess.STDOUT,
-            universal_newlines=True
-        )
-
-        ret += p.returncode
-        if p.returncode != 0:
-            print(p.stdout)
-
-    return ret
+# Looking for the list of excluded tests? See linters.py !
 
 
 def main() -> None:
@@ -133,7 +31,7 @@ def main() -> None:
         if shutil.which(linter) is None:
             iotests.notrun(f'{linter} not found')
 
-    files = get_test_files()
+    files = linters.get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
@@ -148,7 +46,7 @@ def main() -> None:
 
     env['MYPYPATH'] = env['PYTHONPATH']
 
-    run_linters(files, env=env)
+    linters.run_linters(files, env=env)
 
 
 iotests.script_main(main)
diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
new file mode 100755
index 00000000000..e7e8baded02
--- /dev/null
+++ b/tests/qemu-iotests/linters.py
@@ -0,0 +1,121 @@
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
+import sys
+from typing import List, Mapping, Optional
+
+
+# TODO: Empty this list!
+SKIP_FILES = (
+    '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
+    '096', '118', '124', '132', '136', '139', '147', '148', '149',
+    '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
+    '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
+    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
+    '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
+    '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
+    '299', '302', '303', '304', '307',
+    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
+)
+
+
+def is_python_file(filepath: str) -> bool:
+    if filepath.endswith('.py'):
+        return True
+
+    with open(filepath) as f:
+        try:
+            first_line = f.readline()
+            return re.match('^#!.*python', first_line) is not None
+        except UnicodeDecodeError:  # Ignore binary files
+            return False
+
+
+def get_test_files(directory: str = '.') -> List[str]:
+    files = []
+
+    for dirent in os.scandir(directory):
+        if dirent.name in SKIP_FILES:
+            continue
+
+        relpath = os.path.join(directory, dirent.name)
+        if dirent.is_dir():
+            files.extend(get_test_files(relpath))
+        elif is_python_file(relpath):
+            files.append(relpath)
+
+    return files
+
+
+def run_linters(
+    files: List[str],
+    directory: str = '.',
+    env: Optional[Mapping[str, str]] = None,
+) -> int:
+    ret = 0
+
+    print('=== pylint ===')
+    sys.stdout.flush()
+
+    # Todo notes are fine, but fixme's or xxx's should probably just be
+    # fixed (in tests, at least)
+    p = subprocess.run(
+        ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
+        cwd=directory,
+        env=env,
+        check=False,
+        universal_newlines=True,
+    )
+    ret += p.returncode
+
+    print('=== mypy ===')
+    sys.stdout.flush()
+
+    # We have to call mypy separately for each file.  Otherwise, it
+    # will interpret all given files as belonging together (i.e., they
+    # may not both define the same classes, etc.; most notably, they
+    # must not both define the __main__ module).
+    for filename in files:
+        p = subprocess.run(
+            (
+                'python3', '-m', 'mypy',
+                '--warn-unused-configs',
+                '--disallow-subclassing-any',
+                '--disallow-any-generics',
+                '--disallow-incomplete-defs',
+                '--disallow-untyped-decorators',
+                '--no-implicit-optional',
+                '--warn-redundant-casts',
+                '--warn-unused-ignores',
+                '--no-implicit-reexport',
+                '--namespace-packages',
+                filename,
+            ),
+            cwd=directory,
+            env=env,
+            check=False,
+            stdout=subprocess.PIPE,
+            stderr=subprocess.STDOUT,
+            universal_newlines=True
+        )
+
+        ret += p.returncode
+        if p.returncode != 0:
+            print(p.stdout)
+
+    return ret
-- 
2.31.1


