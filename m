Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD539BEC0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:28:35 +0200 (CEST)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDcY-0003h9-9y
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCqu-00056K-2R
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCqq-000591-Kz
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622824755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uFDz24qq6jVReAegG1rk9pzB53tPt+tnOVWWIqxD0mY=;
 b=JR99DmL7wW2JnMjQjRAduIbV+xMVVZJMEIh93lWoHgjhGbgcCvoeODEiXIBELfqxVHKamF
 EzC430b2wTHk1kALPIEGVgxAAZGTgdfEiiIplgpw9fhxnJItWNez0ZDtHUYnZKGicbsj30
 RtAnfkNCu/7M5GQe7Qfn7gDnkw7ayoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-wOPE7NYwNmeVyetz1cM04A-1; Fri, 04 Jun 2021 12:39:13 -0400
X-MC-Unique: wOPE7NYwNmeVyetz1cM04A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A8DA8015F8;
 Fri,  4 Jun 2021 16:39:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A17CB19D61;
 Fri,  4 Jun 2021 16:39:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 2/3] iotests: split 'linters.py' off from 297
Date: Fri,  4 Jun 2021 12:39:06 -0400
Message-Id: <20210604163907.1511224-3-jsnow@redhat.com>
In-Reply-To: <20210604163907.1511224-1-jsnow@redhat.com>
References: <20210604163907.1511224-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

Refactor the core function of the linting configuration out of 297 and
into a new file called linters.py.

Now, linters.py represents an invocation of the linting scripts that
more resembles a "normal" execution of pylint/mypy, like you'd expect to
use if 'qemu' was a bona-fide package you obtained from PyPI.

297, by contrast, now represents the iotests-specific configuration bits
you need to get it to function correctly as a part of iotests, and with
'qemu' as a namespace package that isn't "installed" to the current
environment, but just lives elsewhere in our source tree.

By doing this, we will able to run the same linting configuration from
the Python CI tests without calling iotest logging functions or messing
around with PYTHONPATH / MYPYPATH.

iotest 297 continues to operate in a standalone fashion for now --
presumably, it's convenient for block maintainers and contributors to
run in this manner.

See the following commit for how this is used from the Python packaging side.

Signed-off-by: John Snow <jsnow@redhat.com>

---

- It's a big glob of a patch. Sorry. I can work it into smaller pieces
  if the idea is well received.

- I change the invocations of mypy/pylint to "python3 -m pylint" and
  "python3 -m mypy" respectively, which causes these linters to use the
  virtual environment's preferred version. This forces the test to use the
  test environments curated by the CI jobs.

- If you have installed Fedora's pylint package that provides
  "pylint-3", the above trick will still work correctly.

- Checking for "pylint-3" specifically in 297 was left
  alone. Theoretically, this check could be broadened to simply look for
  the presence of a 'pylint' module to allow it to be more permissive.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297        |  88 ++++-------------------
 tests/qemu-iotests/linters.py | 130 ++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+), 75 deletions(-)
 create mode 100644 tests/qemu-iotests/linters.py

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 433b732336..5c753279fc 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -17,98 +17,36 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 import os
-import re
 import shutil
-import subprocess
-import sys
 
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
-def is_python_file(filename):
-    if not os.path.isfile(filename):
-        return False
-
-    if filename.endswith('.py'):
-        return True
-
-    with open(filename) as f:
-        try:
-            first_line = f.readline()
-            return re.match('^#!.*python', first_line) is not None
-        except UnicodeDecodeError:  # Ignore binary files
-            return False
-
-
-def run_linters():
-    files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
-             if is_python_file(filename)]
+def main():
+    files = linters.get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
 
-    print('=== pylint ===')
-    sys.stdout.flush()
-
-    # Todo notes are fine, but fixme's or xxx's should probably just be
-    # fixed (in tests, at least)
     env = os.environ.copy()
-    qemu_module_path = os.path.join(os.path.dirname(__file__),
-                                    '..', '..', 'python')
+    qemu_module_path = os.path.join(
+        os.path.dirname(__file__),
+        '..', '..', 'python'
+    )
+
     try:
         env['PYTHONPATH'] += os.pathsep + qemu_module_path
     except KeyError:
         env['PYTHONPATH'] = qemu_module_path
-    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
-                   env=env, check=False)
 
-    print('=== mypy ===')
-    sys.stdout.flush()
-
-    # We have to call mypy separately for each file.  Otherwise, it
-    # will interpret all given files as belonging together (i.e., they
-    # may not both define the same classes, etc.; most notably, they
-    # must not both define the __main__ module).
     env['MYPYPATH'] = env['PYTHONPATH']
-    for filename in files:
-        p = subprocess.run(('mypy',
-                            '--warn-unused-configs',
-                            '--disallow-subclassing-any',
-                            '--disallow-any-generics',
-                            '--disallow-incomplete-defs',
-                            '--disallow-untyped-decorators',
-                            '--no-implicit-optional',
-                            '--warn-redundant-casts',
-                            '--warn-unused-ignores',
-                            '--no-implicit-reexport',
-                            '--namespace-packages',
-                            filename),
-                           env=env,
-                           check=False,
-                           stdout=subprocess.PIPE,
-                           stderr=subprocess.STDOUT,
-                           universal_newlines=True)
 
-        if p.returncode != 0:
-            print(p.stdout)
+    for linter in ('pylint-3', 'mypy'):
+        if shutil.which(linter) is None:
+            iotests.notrun(f'{linter} not found')
 
+    iotests.script_main(lambda: linters.run_linters(files, env=env))
 
-for linter in ('pylint-3', 'mypy'):
-    if shutil.which(linter) is None:
-        iotests.notrun(f'{linter} not found')
 
-iotests.script_main(run_linters)
+main()
diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
new file mode 100644
index 0000000000..1bbcfd1088
--- /dev/null
+++ b/tests/qemu-iotests/linters.py
@@ -0,0 +1,130 @@
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
+
+
+def main() -> int:
+    """
+    Used by the Python CI system as an entry point to run these linters.
+    """
+    directory = os.path.dirname(os.path.realpath(__file__))
+    files = get_test_files(directory)
+    return run_linters(files, directory)
+
+
+if __name__ == '__main__':
+    sys.exit(main())
-- 
2.31.1


