Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D973B48BC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:25:27 +0200 (CEST)
Received: from localhost ([::1]:36472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqW6-00041Q-K4
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRh-0003yW-Ok
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRW-0005k7-7T
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wo36FDWzF1MYo7jlo158g+uIjoUi1gGo4HT6fgSn9OM=;
 b=IhNOQTsbdPBlVm4D0r7+8685onu/Fm1YwIZypvvQFCLB6ErX0HqtWigT9o5GIgQl5ou8m5
 ++8mOfJ57+XZ/jQL1OGd7I8fpimTcItW0NSzDE63h3VGLSyahwCDsju0b/M6Xw/FSlzrfW
 Acc2OxD9FJAP9OIlcOpmWXAlzblDINE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-FE4WMexFPlqVc1v-khWlCQ-1; Fri, 25 Jun 2021 14:20:39 -0400
X-MC-Unique: FE4WMexFPlqVc1v-khWlCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94C9E804145;
 Fri, 25 Jun 2021 18:20:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D52F5D9C6;
 Fri, 25 Jun 2021 18:20:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] iotests/297: split linters.py off from 297
Date: Fri, 25 Jun 2021 14:20:19 -0400
Message-Id: <20210625182021.803227-9-jsnow@redhat.com>
In-Reply-To: <20210625182021.803227-1-jsnow@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
 tests/qemu-iotests/297        | 105 ++----------------------------
 tests/qemu-iotests/linters.py | 117 ++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 101 deletions(-)
 create mode 100755 tests/qemu-iotests/linters.py

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 7db1f9ed45..3d29af5b78 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -17,110 +17,13 @@
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
-def is_python_file(filename: str, directory: str = '.') -> bool:
-    filepath = os.path.join(directory, filename)
-
-    if not os.path.isfile(filepath):
-        return False
-
-    if filename.endswith('.py'):
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
-    return [
-        f for f in (set(os.listdir(directory)) - set(SKIP_FILES))
-        if is_python_file(f, directory)
-    ]
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
@@ -128,7 +31,7 @@ def main() -> None:
         if shutil.which(linter) is None:
             iotests.notrun(f'{linter} not found')
 
-    files = get_test_files()
+    files = linters.get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
@@ -143,7 +46,7 @@ def main() -> None:
 
     env['MYPYPATH'] = env['PYTHONPATH']
 
-    run_linters(files, env=env)
+    linters.run_linters(files, env=env)
 
 
 iotests.script_main(main)
diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
new file mode 100755
index 0000000000..6fa7ba2d22
--- /dev/null
+++ b/tests/qemu-iotests/linters.py
@@ -0,0 +1,117 @@
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
+def is_python_file(filename: str, directory: str = '.') -> bool:
+    filepath = os.path.join(directory, filename)
+
+    if not os.path.isfile(filepath):
+        return False
+
+    if filename.endswith('.py'):
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
+    return [
+        f for f in (set(os.listdir(directory)) - set(SKIP_FILES))
+        if is_python_file(f, directory)
+    ]
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


