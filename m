Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B93713F2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:05:17 +0200 (CEST)
Received: from localhost ([::1]:42168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWO4-0005Ru-Sv
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKL-0001ry-FN
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:25 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKJ-0004t4-RF
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:25 -0400
Received: by mail-ed1-x529.google.com with SMTP id b17so2744272ede.0
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CiZrOooOA5sLacn8XFpn97ElSByrel0Yqy/GkIYhy78=;
 b=qe6JWCPTGRVjPNg/ZPqM+ZBd8qV1uPqAEYTFuDj5hzSxCoRrqeNHY6JWk2nuhQk9B/
 zhTy8btk3sMU1WFfVz7OAxXau6qgU9PnGo+4/WiTYLW8V2RRe4KqaJgovr6qTUdgSdKU
 gE71huYr6Vx94DuS+jmolgBYtmtzDxwAv7NePRf97xhRhUZ2sh5U+QwZhlr0rh+xRyuI
 dWUYqXOZ7NCGayeWn72XlmhHZGQbQHKp4xjge+s/Imq7rGOwYhBqEJ+FiuKUj55XJdmP
 5BSxZUIhMKkmHT5w8vASjuKyb53hKA9uyQGU6MQgYShhXuHPw6JlXuYvACdRW1a5UrtI
 t+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CiZrOooOA5sLacn8XFpn97ElSByrel0Yqy/GkIYhy78=;
 b=jioyCBxGy0GwU0ihjoGqlsCDB9CfkHRNFqT8him1tv+3tBAO7g7Mqace92QsclNuns
 MV1v2LsaBHb+DvmSBZsr2nkFkj9GT5luQErreQHSpryZW/aN3Tw5L1WVks5PlbIuN9Yl
 ZDJ71dP7SurCObUklE12oegH83GV99Td1TcXTB0xCcqlxMI/OIlpRjpxXBTEJIzWxo0m
 s4Oj3oLPF3/0noV166DWAs8AbCPqcZHPCmWsnuKQXcesyO6fMxCKJtarK+pIGwY+q8BE
 uTVFv+0AQ+0OiB5vuLOW3wT7oHIpkHi54fqCkGNaWSnjFJnMBvx866xXwSskdaAfgwcA
 6xOA==
X-Gm-Message-State: AOAM5310SszdZGF2Q1I3dIvyf0OY4j/Wn1PRnrYW7KCZVs0TWZoD0QZX
 49Lyb3s4p7EpQWunKJ7h1rjjkD2U6hs=
X-Google-Smtp-Source: ABdhPJzPqIt0rS9K5kqoXgUqv1j80lYsU77kaI2oCagpTfiDLrsIuu996nkcXPQhulPsn4B7SWApMg==
X-Received: by 2002:aa7:ccc4:: with SMTP id y4mr18841994edt.171.1620039677727; 
 Mon, 03 May 2021 04:01:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id v16sm12041464edt.53.2021.05.03.04.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:01:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] qemu-iotests: let "check" spawn an arbitrary test
 command
Date: Mon,  3 May 2021 13:01:09 +0200
Message-Id: <20210503110110.476887-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503110110.476887-1-pbonzini@redhat.com>
References: <20210503110110.476887-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 tests/qemu-iotests/check         | 19 ++++++++++++++++++-
 tests/qemu-iotests/testenv.py    |  3 ++-
 tests/qemu-iotests/testrunner.py |  1 -
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index d1c87ceaf1..7c9d3a0852 100755
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
@@ -101,7 +104,7 @@ def make_argparser() -> argparse.ArgumentParser:
                        'rerun failed ./check command, starting from the '
                        'middle of the process.')
     g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
-                       help='tests to run')
+                       help='tests to run, or "--" followed by a command')
 
     return p
 
@@ -114,6 +117,20 @@ if __name__ == '__main__':
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



