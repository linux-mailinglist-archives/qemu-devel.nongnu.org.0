Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7130306494
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:59:50 +0100 (CET)
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qyj-0004ro-LM
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4qxC-00037k-Nm
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:58:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4qxA-0007aC-Ja
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611777491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCL3YSt8kWQ87XZgZwYGoxeLbXG2QrNyCgaGhyExj3I=;
 b=b4fQufT31WGzBbiKlq7MGeaC9YmWomRY7lU1/6RpRZ9nu0NZA5R9s2MfWy5Q/t+LWS4zVw
 qeOzBl12keXKWflxjywzKWkrfrFhjRmdNiipLv1ke0OT5VMbhPW6p98W3tU31QDcvtkfAj
 HU6U5KuSfz9B8mVRrZ7futzf0Hxdlxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4--DNVQx3DNnK2G3l811AjLg-1; Wed, 27 Jan 2021 14:58:06 -0500
X-MC-Unique: -DNVQx3DNnK2G3l811AjLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5C0C180A09F;
 Wed, 27 Jan 2021 19:58:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB31810023B6;
 Wed, 27 Jan 2021 19:58:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 4/8] iotests: add findtests.py
Date: Wed, 27 Jan 2021 20:57:49 +0100
Message-Id: <20210127195753.59773-5-kwolf@redhat.com>
In-Reply-To: <20210127195753.59773-1-kwolf@redhat.com>
References: <20210127195753.59773-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add python script with new logic of searching for tests:

Current ./check behavior:
 - tests are named [0-9][0-9][0-9]
 - tests must be registered in group file (even if test doesn't belong
   to any group, like 142)

Behavior of findtests.py:
 - group file is dropped
 - tests are all files in tests/ subdirectory (except for .out files),
   so it's not needed more to "register the test", just create it with
   appropriate name in tests/ subdirectory. Old names like
   [0-9][0-9][0-9] (in root iotests directory) are supported too, but
   not recommended for new tests
 - groups are parsed from '# group: ' line inside test files
 - optional file group.local may be used to define some additional
   groups for downstreams
 - 'disabled' group is used to temporary disable tests. So instead of
   commenting tests in old 'group' file you now can add them to
   disabled group with help of 'group.local' file
 - selecting test ranges like 5-15 are not supported more
   (to support restarting failed ./check command from the middle of the
    process, new argument is added: --start-from)

Benefits:
 - no rebase conflicts in group file on patch porting from branch to
   branch
 - no conflicts in upstream, when different series want to occupy same
   test number
 - meaningful names for test files
   For example, with digital number, when some person wants to add some
   test about block-stream, he most probably will just create a new
   test. But if there would be test-block-stream test already, he will
   at first look at it and may be just add a test-case into it.
   And anyway meaningful names are better.

This commit doesn't update check behavior (which will be done in
further commit), still, the documentation changed like new behavior is
already here.  Let's live with this small inconsistency for the
following few commits, until final change.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210125185056.129513-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/devel/testing.rst          |  50 +++++++++-
 tests/qemu-iotests/findtests.py | 159 ++++++++++++++++++++++++++++++++
 2 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 tests/qemu-iotests/findtests.py

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 0aa7a13bba..454b706141 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -111,7 +111,7 @@ check-block
 -----------
 
 ``make check-block`` runs a subset of the block layer iotests (the tests that
-are in the "auto" group in ``tests/qemu-iotests/group``).
+are in the "auto" group).
 See the "QEMU iotests" section below for more information.
 
 GCC gcov support
@@ -224,6 +224,54 @@ another application on the host may have locked the file, possibly leading to a
 test failure.  If using such devices are explicitly desired, consider adding
 ``locking=off`` option to disable image locking.
 
+Test case groups
+----------------
+
+"Tests may belong to one or more test groups, which are defined in the form
+of a comment in the test source file. By convention, test groups are listed
+in the second line of the test file, after the "#!/..." line, like this:
+
+.. code::
+
+  #!/usr/bin/env python3
+  # group: auto quick
+  #
+  ...
+
+Another way of defining groups is creating the tests/qemu-iotests/group.local
+file. This should be used only for downstream (this file should never appear
+in upstream). This file may be used for defining some downstream test groups
+or for temporarily disabling tests, like this:
+
+.. code::
+
+  # groups for some company downstream process
+  #
+  # ci - tests to run on build
+  # down - our downstream tests, not for upstream
+  #
+  # Format of each line is:
+  # TEST_NAME TEST_GROUP [TEST_GROUP ]...
+
+  013 ci
+  210 disabled
+  215 disabled
+  our-ugly-workaround-test down ci
+
+Note that the following group names have a special meaning:
+
+- quick: Tests in this group should finish within a few seconds.
+
+- auto: Tests in this group are used during "make check" and should be
+  runnable in any case. That means they should run with every QEMU binary
+  (also non-x86), with every QEMU configuration (i.e. must not fail if
+  an optional feature is not compiled in - but reporting a "skip" is ok),
+  work at least with the qcow2 file format, work with all kind of host
+  filesystems and users (e.g. "nobody" or "root") and must not take too
+  much memory and disk space (since CI pipelines tend to fail otherwise).
+
+- disabled: Tests in this group are disabled and ignored by check.
+
 .. _docker-ref:
 
 Docker based tests
diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
new file mode 100644
index 0000000000..dd77b453b8
--- /dev/null
+++ b/tests/qemu-iotests/findtests.py
@@ -0,0 +1,159 @@
+# TestFinder class, define set of tests to run.
+#
+# Copyright (c) 2020-2021 Virtuozzo International GmbH
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
+#
+
+import os
+import glob
+import re
+from collections import defaultdict
+from contextlib import contextmanager
+from typing import Optional, List, Iterator, Set
+
+
+@contextmanager
+def chdir(path: Optional[str] = None) -> Iterator[None]:
+    if path is None:
+        yield
+        return
+
+    saved_dir = os.getcwd()
+    os.chdir(path)
+    try:
+        yield
+    finally:
+        os.chdir(saved_dir)
+
+
+class TestFinder:
+    def __init__(self, test_dir: Optional[str] = None) -> None:
+        self.groups = defaultdict(set)
+
+        with chdir(test_dir):
+            self.all_tests = glob.glob('[0-9][0-9][0-9]')
+            self.all_tests += [f for f in glob.iglob('tests/*')
+                               if not f.endswith('.out') and
+                               os.path.isfile(f + '.out')]
+
+            for t in self.all_tests:
+                with open(t, encoding="utf-8") as f:
+                    for line in f:
+                        if line.startswith('# group: '):
+                            for g in line.split()[2:]:
+                                self.groups[g].add(t)
+                            break
+
+    def add_group_file(self, fname: str) -> None:
+        with open(fname, encoding="utf-8") as f:
+            for line in f:
+                line = line.strip()
+
+                if (not line) or line[0] == '#':
+                    continue
+
+                words = line.split()
+                test_file = self.parse_test_name(words[0])
+                groups = words[1:]
+
+                for g in groups:
+                    self.groups[g].add(test_file)
+
+    def parse_test_name(self, name: str) -> str:
+        if '/' in name:
+            raise ValueError('Paths are unsupported for test selection, '
+                             f'requiring "{name}" is wrong')
+
+        if re.fullmatch(r'\d+', name):
+            # Numbered tests are old naming convention. We should convert them
+            # to three-digit-length, like 1 --> 001.
+            name = f'{int(name):03}'
+        else:
+            # Named tests all should be in tests/ subdirectory
+            name = os.path.join('tests', name)
+
+        if name not in self.all_tests:
+            raise ValueError(f'Test "{name}" is not found')
+
+        return name
+
+    def find_tests(self, groups: Optional[List[str]] = None,
+                   exclude_groups: Optional[List[str]] = None,
+                   tests: Optional[List[str]] = None,
+                   start_from: Optional[str] = None) -> List[str]:
+        """Find tests
+
+        Algorithm:
+
+        1. a. if some @groups specified
+             a.1 Take all tests from @groups
+             a.2 Drop tests, which are in at least one of @exclude_groups or in
+                 'disabled' group (if 'disabled' is not listed in @groups)
+             a.3 Add tests from @tests (don't exclude anything from them)
+
+           b. else, if some @tests specified:
+             b.1 exclude_groups must be not specified, so just take @tests
+
+           c. else (only @exclude_groups list is non-empty):
+             c.1 Take all tests
+             c.2 Drop tests, which are in at least one of @exclude_groups or in
+                 'disabled' group
+
+        2. sort
+
+        3. If start_from specified, drop tests from first one to @start_from
+           (not inclusive)
+        """
+        if groups is None:
+            groups = []
+        if exclude_groups is None:
+            exclude_groups = []
+        if tests is None:
+            tests = []
+
+        res: Set[str] = set()
+        if groups:
+            # Some groups specified. exclude_groups supported, additionally
+            # selecting some individual tests supported as well.
+            res.update(*(self.groups[g] for g in groups))
+        elif tests:
+            # Some individual tests specified, but no groups. In this case
+            # we don't support exclude_groups.
+            if exclude_groups:
+                raise ValueError("Can't exclude from individually specified "
+                                 "tests.")
+        else:
+            # No tests no groups: start from all tests, exclude_groups
+            # supported.
+            res.update(self.all_tests)
+
+        if 'disabled' not in groups and 'disabled' not in exclude_groups:
+            # Don't want to modify function argument, so create new list.
+            exclude_groups = exclude_groups + ['disabled']
+
+        res = res.difference(*(self.groups[g] for g in exclude_groups))
+
+        # We want to add @tests. But for compatibility with old test names,
+        # we should convert any number < 100 to number padded by
+        # leading zeroes, like 1 -> 001 and 23 -> 023.
+        for t in tests:
+            res.add(self.parse_test_name(t))
+
+        sequence = sorted(res)
+
+        if start_from is not None:
+            del sequence[:sequence.index(self.parse_test_name(start_from))]
+
+        return sequence
-- 
2.29.2


