Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5934A9B7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:29:05 +0100 (CET)
Received: from localhost ([::1]:35758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnSS-0007nl-KB
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNh-00021r-UE; Fri, 26 Mar 2021 10:24:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNg-0000jA-8K; Fri, 26 Mar 2021 10:24:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id j7so5859892wrd.1;
 Fri, 26 Mar 2021 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ry8amss7iWhBMOaCfIPTZByXJU/zbqjNZn+N1JV98jo=;
 b=BOU5v7g1E6zvtC3UKKCQGzr7j9MFfIc+5jjn6bgf4V9be9PbrMXRBPr9g89e/R4pjV
 Hjvlcm+sOYMN/3nK2Sb4wWFUN0DBtDmAmgO/TfvAN9FA7JJyRAz8Sb9IiYoqsgAqfB+x
 htFIHjQJdVFqt3WiqGXfUxy1snX0Cpb3KkRrXYGenHama54Y9H1jfMPfy5cF2KEWSW0v
 nF7mGULAns7Wh52f3pKbFI16ADqxCgkeatZh0CFWA24uyrxFMKNsTVqVTcqVoSlN6iPn
 utNgNnmiDaoA2L1tcTXsROfiFrV8odogZTdpwAdddYqBucpZxFYQfxCoenUFO8l9w/41
 BbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ry8amss7iWhBMOaCfIPTZByXJU/zbqjNZn+N1JV98jo=;
 b=tgJl4cmfOz0CORDByAbNlFG30sSznBMVdBy27SG2zDD4B3bdCb0onqjN7VVEt//4cE
 9IBE940vSzvpb/cdsB9+yETenxHGLfxDXE59fnknKdS15fn8F6aBsoeKcPlJNG7Bb0TB
 rLXgWO2StSpJ99XopavC3AGQvrHVOMxwr5TaLB92mvLRsTUsyAFzGSgyK4pk+MME+4tR
 ixJoE4LSiAz4s9OVY9uOGD5VrQSKBuItP6HOskBBUJW8PcrtfJ8W1SRynoZXKZViSi5t
 MUhm4dD3gEO+ZAFUj6jIl6re5RiXbKZUTxLq66aDnfVvu2RhIwmlCCVBbtJKntU4hudK
 297g==
X-Gm-Message-State: AOAM530m8bQGBdh+Pu1CB+jd/JzqOaO3dg3SDnRQva+IgFbJiPsL+WkC
 E2tbTu1njk0+6Z6pzsalo7mOmzkRqfk=
X-Google-Smtp-Source: ABdhPJyCxjMgTzW8uI+d7CHMmOlvwQKbro5VPbDHPMc2sfNcBn3wzqdfvHeUfvhBLVfjvLYLT8zNOA==
X-Received: by 2002:a5d:4b43:: with SMTP id w3mr6635977wrs.406.1616768646228; 
 Fri, 26 Mar 2021 07:24:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m5sm13084517wrq.15.2021.03.26.07.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:24:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] qemu-iotests: let "check" spawn an arbitrary test
 command
Date: Fri, 26 Mar 2021 15:23:58 +0100
Message-Id: <20210326142359.431127-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210326142359.431127-1-pbonzini@redhat.com>
References: <20210326142359.431127-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 mreitz@redhat.com
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
 tests/qemu-iotests/check         | 18 +++++++++++++++++-
 tests/qemu-iotests/testenv.py    |  3 ++-
 tests/qemu-iotests/testrunner.py |  1 -
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index d1c87ceaf1..df9fd733ff 100755
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
 
@@ -114,6 +117,19 @@ if __name__ == '__main__':
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind)
 
+    if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
+        if not args.tests:
+            sys.exit("missing command after '--'")
+        cmd = args.tests
+        env.print_env()
+        exec_path = Path(shutil.which(cmd[0]))
+        if exec_path is None:
+            sys.exit('command not found: ' + cmd[0])
+        cmd[0] = exec_path.resolve()
+        full_env = env.prepare_subprocess(cmd)
+        os.chdir(Path(exec_path).parent)
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
2.30.1



