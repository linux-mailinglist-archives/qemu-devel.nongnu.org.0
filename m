Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C7A380EFA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:30:59 +0200 (CEST)
Received: from localhost ([::1]:45056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbeM-0000R2-Tz
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawb-0005U4-Pm
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawX-0005pY-7U
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOc+/g7m9oWYt+8Oxptge2HGmYpG8zv7pfMiBoMrVnI=;
 b=L7HmB4FZxyEUmHauub1xlGsphIPehaKvoKciMpdBwqfhkxXpNxhIfUfWMNYntH8bcNjXHP
 nfdgxW4NA76mwgxfH1KaFob7grcc7htjHqVZpCCDicq20o7ckB2Il6985GyfQ8KR1lhg8L
 G29CbjhOtoOeVtHdXblRIIhwdhMEAZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-S9ta_hu3O9674mnA8_YXXA-1; Fri, 14 May 2021 12:45:34 -0400
X-MC-Unique: S9ta_hu3O9674mnA8_YXXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D438049D0;
 Fri, 14 May 2021 16:45:33 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF88C5C1C4;
 Fri, 14 May 2021 16:45:32 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/19] qemu-iotests: let "check" spawn an arbitrary test command
Date: Fri, 14 May 2021 18:45:03 +0200
Message-Id: <20210514164514.1057680-9-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

From: Paolo Bonzini <pbonzini@redhat.com>

Right now there is no easy way for "check" to print a reproducer command.
Because such a reproducer command line would be huge, we can instead teach
check to start a command of our choice.  This can be for example a Python
unit test with arguments to only run a specific subtest.

Move the trailing empty line to print_env(), since it always looks better
and one caller was not adding it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210323181928.311862-5-pbonzini@redhat.com>
Message-Id: <20210503110110.476887-5-pbonzini@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/check         | 19 ++++++++++++++++++-
 tests/qemu-iotests/testenv.py    |  3 ++-
 tests/qemu-iotests/testrunner.py |  1 -
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 08f51366f1..2dd529eb75 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -19,6 +19,9 @@
 import os
 import sys
 import argparse
+import shutil
+from pathlib import Path
+
 from findtests import TestFinder
 from testenv import TestEnv
 from testrunner import TestRunner
@@ -100,7 +103,7 @@ def make_argparser() -> argparse.ArgumentParser:
                        'rerun failed ./check command, starting from the '
                        'middle of the process.')
     g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
-                       help='tests to run')
+                       help='tests to run, or "--" followed by a command')
 
     return p
 
@@ -113,6 +116,20 @@ if __name__ == '__main__':
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind)
 
+    if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
+        if not args.tests:
+            sys.exit("missing command after '--'")
+        cmd = args.tests
+        env.print_env()
+        exec_pathstr = shutil.which(cmd[0])
+        if exec_pathstr is None:
+            sys.exit('command not found: ' + cmd[0])
+        exec_path = Path(exec_pathstr).resolve()
+        cmd[0] = str(exec_path)
+        full_env = env.prepare_subprocess(cmd)
+        os.chdir(exec_path.parent)
+        os.execve(cmd[0], cmd, full_env)
+
     testfinder = TestFinder(test_dir=env.source_iotests)
 
     groups = args.groups.split(',') if args.groups else None
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index fca3a609e0..cd0e39b789 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -284,7 +284,8 @@ def print_env(self) -> None:
 PLATFORM      -- {platform}
 TEST_DIR      -- {TEST_DIR}
 SOCK_DIR      -- {SOCK_DIR}
-SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
+SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
+"""
 
         args = collections.defaultdict(str, self.get_env())
 
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 519924dc81..2f56ac545d 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -316,7 +316,6 @@ def run_tests(self, tests: List[str]) -> bool:
 
         if not self.makecheck:
             self.env.print_env()
-            print()
 
         test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
 
-- 
2.31.1


