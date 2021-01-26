Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC7304054
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:31:52 +0100 (CET)
Received: from localhost ([::1]:34256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PNn-0004QO-KG
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDY-0008V9-Ah
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDP-00067X-Di
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdCAT2smUD477ged1iTW9c8NxprToGvyiAS2fEMPaJU=;
 b=NY68mfpuHB3+dnASh0pnJwm1S42oDRLttC0WuT84Dnx+VQmNDUFpGMmWSPaeZhkc7sW2e6
 Phv3h95Oa+sno9pj60rkc0NAvb5NsGgSslr85u67Z+mC/xupEnfMRXIzt1GsBlvmYjVt66
 i8G2UQp5mKKxXrZLziq2vp5disGy+xU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-wH4APw6COeGSxWob5Km5fg-1; Tue, 26 Jan 2021 09:21:02 -0500
X-MC-Unique: wH4APw6COeGSxWob5Km5fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FFBE8015C8;
 Tue, 26 Jan 2021 14:20:55 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E769519D6C;
 Tue, 26 Jan 2021 14:20:54 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/53] iotests/297: Rewrite in Python and extend reach
Date: Tue, 26 Jan 2021 15:19:39 +0100
Message-Id: <20210126142016.806073-17-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of checking iotests.py only, check all Python files in the
qemu-iotests/ directory.  Of course, most of them do not pass, so there
is an extensive skip list for now.  (The only files that do pass are
209, 254, 283, and iotests.py.)

(Alternatively, we could have the opposite, i.e. an explicit list of
files that we do want to check, but I think it is better to check files
by default.)

Unless started in debug mode (./check -d), the output has no information
on which files are tested, so we will not have a problem e.g. with
backports, where some files may be missing when compared to upstream.

Besides the technical rewrite, some more things are changed:

- For the pylint invocation, PYTHONPATH is adjusted.  This mirrors
  setting MYPYPATH for mypy.

- Also, MYPYPATH is now derived from PYTHONPATH, so that we include
  paths set by the environment.  Maybe at some point we want to let the
  check script add '../../python/' to PYTHONPATH so that iotests.py does
  not need to do that.

- Passing --notes=FIXME,XXX to pylint suppresses warnings for TODO
  comments.  TODO is fine, we do not need 297 to complain about such
  comments.

- The "Success" line from mypy's output is suppressed, because (A) it
  does not add useful information, and (B) it would leak information
  about the files having been tested to the reference output, which we
  decidedly do not want.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210118105720.14824-3-mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/297     | 112 +++++++++++++++++++++++++++++--------
 tests/qemu-iotests/297.out |   5 +-
 2 files changed, 92 insertions(+), 25 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 85bc1c0c85..b138b0539c 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+#!/usr/bin/env python3
 # group: meta
 #
 # Copyright (C) 2020 Red Hat, Inc.
@@ -16,30 +16,98 @@
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
-seq=$(basename $0)
-echo "QA output created by $seq"
+import os
+import re
+import shutil
+import subprocess
+import sys
 
-status=1	# failure is the default!
+import iotests
 
-# get standard environment
-. ./common.rc
 
-if ! type -p "pylint-3" > /dev/null; then
-    _notrun "pylint-3 not found"
-fi
-if ! type -p "mypy" > /dev/null; then
-    _notrun "mypy not found"
-fi
+# TODO: Empty this list!
+SKIP_FILES = (
+    '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
+    '096', '118', '124', '129', '132', '136', '139', '147', '148', '149',
+    '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
+    '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
+    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
+    '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
+    '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
+    '299', '300', '302', '303', '304', '307',
+    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
+)
 
-pylint-3 --score=n iotests.py
 
-MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
-    --disallow-any-generics --disallow-incomplete-defs \
-    --disallow-untyped-decorators --no-implicit-optional \
-    --warn-redundant-casts --warn-unused-ignores \
-    --no-implicit-reexport iotests.py
+def is_python_file(filename):
+    if not os.path.isfile(filename):
+        return False
 
-# success, all done
-echo "*** done"
-rm -f $seq.full
-status=0
+    if filename.endswith('.py'):
+        return True
+
+    with open(filename) as f:
+        try:
+            first_line = f.readline()
+            return re.match('^#!.*python', first_line) is not None
+        except UnicodeDecodeError:  # Ignore binary files
+            return False
+
+
+def run_linters():
+    files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
+             if is_python_file(filename)]
+
+    iotests.logger.debug('Files to be checked:')
+    iotests.logger.debug(', '.join(sorted(files)))
+
+    print('=== pylint ===')
+    sys.stdout.flush()
+
+    # Todo notes are fine, but fixme's or xxx's should probably just be
+    # fixed (in tests, at least)
+    env = os.environ.copy()
+    qemu_module_path = os.path.join(os.path.dirname(__file__),
+                                    '..', '..', 'python')
+    try:
+        env['PYTHONPATH'] += os.pathsep + qemu_module_path
+    except KeyError:
+        env['PYTHONPATH'] = qemu_module_path
+    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
+                   env=env, check=False)
+
+    print('=== mypy ===')
+    sys.stdout.flush()
+
+    # We have to call mypy separately for each file.  Otherwise, it
+    # will interpret all given files as belonging together (i.e., they
+    # may not both define the same classes, etc.; most notably, they
+    # must not both define the __main__ module).
+    env['MYPYPATH'] = env['PYTHONPATH']
+    for filename in files:
+        p = subprocess.run(('mypy',
+                            '--warn-unused-configs',
+                            '--disallow-subclassing-any',
+                            '--disallow-any-generics',
+                            '--disallow-incomplete-defs',
+                            '--disallow-untyped-decorators',
+                            '--no-implicit-optional',
+                            '--warn-redundant-casts',
+                            '--warn-unused-ignores',
+                            '--no-implicit-reexport',
+                            filename),
+                           env=env,
+                           check=False,
+                           stdout=subprocess.PIPE,
+                           stderr=subprocess.STDOUT,
+                           universal_newlines=True)
+
+        if p.returncode != 0:
+            print(p.stdout)
+
+
+for linter in ('pylint-3', 'mypy'):
+    if shutil.which(linter) is None:
+        iotests.notrun(f'{linter} not found')
+
+iotests.script_main(run_linters)
diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
index 6acc843649..f2e1314d10 100644
--- a/tests/qemu-iotests/297.out
+++ b/tests/qemu-iotests/297.out
@@ -1,3 +1,2 @@
-QA output created by 297
-Success: no issues found in 1 source file
-*** done
+=== pylint ===
+=== mypy ===
-- 
2.29.2


