Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0E434677D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:23:27 +0100 (CET)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlgc-0002Fv-L5
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlcw-00083O-Iq; Tue, 23 Mar 2021 14:19:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlct-0006gh-4U; Tue, 23 Mar 2021 14:19:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id 61so21761704wrm.12;
 Tue, 23 Mar 2021 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uTL85snKqZD+x0TbRPkYuMyCQH1BBmhkWDzvtSAkqEU=;
 b=gdImYuo9Dr8Cd/OLpVuQwFM47DUhW/hNQHZGKOcsGFQfuiiT5VNva2ZwzXlbyq/qjX
 sZ/jP0NnkPFaql3NJSQ4rZvCgYasczdXCQKrOk+gC5btLii2eVTavwMSbpveTv2Vjnv7
 GKn+JhpL6rTXMDtj+gdC10WGhlzIWVor46GMHxQ9pL0KjRy9zFi87HmhWU6sCP09HqNc
 dyTtKD+DS9JhCVwD1wEo0usPL7vYJyW3nQobJpc0bnsg14Q+QtznHA29EGkOU8/v8oxs
 v1QhuE95GmM0Fce68eYfyyFbxDiXVJXc2Ya6oa9ack3fEsQjxXUOBv9IzO8yK0CjdqJ7
 3ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uTL85snKqZD+x0TbRPkYuMyCQH1BBmhkWDzvtSAkqEU=;
 b=NxvkVw8ptGTV6YWr4trZB4m/Uc5q6xtuM1QotGRJBp7dITzH7n/zu52C/PErGhpe3j
 jZH5r4tigI3hd+i/uFboVsGtHB1PeXDnEeIJ6I6c824ULoEaXo8aFh7DMr7VCAZ5l27L
 C+g+mxsqHY6s366uSry6Zy5aKOw4Q2PtLqwtram54CE58D6SgmZoxJQISjW3hhV0Xw9E
 JYlXb55N7b5FSqODEvQN6YLgqQF6QAsVBu1mK387q2/OZCrbv8HXKEIqohWiZij8j2EH
 t9UlffQ7tGk/GHlb00CwHYRnFgkgg2BJLTBax+VA494GFBc9CXHPAExJ4T/NC6nJnylH
 Joug==
X-Gm-Message-State: AOAM530cmw3tqkwzaMWTfBx0PzeBX5hZfDOzI7/OV5sczRkYmA4q3Kpg
 HV/07PcZ8ToFO71lBuSfyK/pwDIPO/o=
X-Google-Smtp-Source: ABdhPJzqsXFRK1Nv685GgY3NU7h2byJMenuXNp00h+y58FOWIQYj7aCi6d5UjsFkPLu/IZewv2rOlg==
X-Received: by 2002:a5d:6443:: with SMTP id d3mr5367171wrw.292.1616523572810; 
 Tue, 23 Mar 2021 11:19:32 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u8sm24204412wrr.42.2021.03.23.11.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:19:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] qemu-iotests: let "check" spawn an arbitrary test
 command
Date: Tue, 23 Mar 2021 19:19:26 +0100
Message-Id: <20210323181928.311862-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323181928.311862-1-pbonzini@redhat.com>
References: <20210323181928.311862-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: eesposit@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now there is no easy way for "check" to print a reproducer command.
Because such a reproducer command line would be huge, we can instead teach
check to start a command of our choice.  This can be for example a Python
unit test with arguments to only run a specific subtest.

Move the trailing empty line to print_env(), since it always looks better
and one caller was not adding it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/check         | 15 ++++++++++++++-
 tests/qemu-iotests/testenv.py    |  3 ++-
 tests/qemu-iotests/testrunner.py |  1 -
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index d1c87ceaf1..478d74e509 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -19,6 +19,7 @@
 import os
 import sys
 import argparse
+import shutil
 from findtests import TestFinder
 from testenv import TestEnv
 from testrunner import TestRunner
@@ -101,7 +102,7 @@ def make_argparser() -> argparse.ArgumentParser:
                        'rerun failed ./check command, starting from the '
                        'middle of the process.')
     g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
-                       help='tests to run')
+                       help='tests to run, or "--" followed by a command')
 
     return p
 
@@ -114,6 +115,18 @@ if __name__ == '__main__':
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind)
 
+    if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
+        if not args.tests:
+            sys.exit("missing command after '--'")
+        cmd = args.tests
+        env.print_env()
+        exec_path = shutil.which(cmd[0])
+        if exec_path is None:
+            sys.exit('command not found: ' + cmd[0])
+        cmd[0] = exec_path
+        full_env = env.prepare_subprocess(cmd)
+        os.execve(cmd[0], cmd, full_env)
+
     testfinder = TestFinder(test_dir=env.source_iotests)
 
     groups = args.groups.split(',') if args.groups else None
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 341a4af4e9..6767eeeb25 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -283,7 +283,8 @@ def print_env(self) -> None:
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
2.30.1



