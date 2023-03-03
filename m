Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE196A9B5C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:08:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7we-0007eF-8D; Fri, 03 Mar 2023 11:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wY-0007aT-5x
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wW-0005j9-IG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677859655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReqqbPShs0jLGuOzTHqYnwBo7T64XEGqJtInWVwIvRk=;
 b=XUCL8ZNURW4LFxfgLcOu4eapTML/lFXBeiNtZzHbHhnyg7wltZcHDuJirdImiDXkToq1PM
 lbOGHyqFu+JocT5/ohH5myaay0hGXZMs2fDmEDOeXF1N19Y6mg00yJrVH7P9amryORZOEj
 zwK125uYDJrZqIEEk7lHyQn087ECW84=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-m1SGgVzHML6hrTVQU7BmXw-1; Fri, 03 Mar 2023 11:07:32 -0500
X-MC-Unique: m1SGgVzHML6hrTVQU7BmXw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06FC61C06ECD;
 Fri,  3 Mar 2023 16:07:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1ECE492C14;
 Fri,  3 Mar 2023 16:07:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/8] iotests: explicitly pass source/build dir to 'check'
 command
Date: Fri,  3 Mar 2023 16:07:20 +0000
Message-Id: <20230303160727.3977246-2-berrange@redhat.com>
In-Reply-To: <20230303160727.3977246-1-berrange@redhat.com>
References: <20230303160727.3977246-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The 'check' script has some rather dubious logic whereby it assumes
that if invoked as a symlink, then it is running from a separate
source tree and build tree, otherwise it assumes the current working
directory is a combined source and build tree.

This doesn't work if you want to invoke the 'check' script using
its full source tree path while still using a split source and build
tree layout. This would be a typical situation with meson if you ask
it to find the 'check' script path using files('check').

Rather than trying to make the logic more magical, add support for
explicitly passing the dirs using --source-dir and --build-dir. If
either is omitted the current logic is maintained.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/check      | 25 +++++++++++++++++++++++--
 tests/qemu-iotests/testenv.py | 13 ++++---------
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 9bdda1394e..da7e8a87fe 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -26,9 +26,23 @@ from findtests import TestFinder
 from testenv import TestEnv
 from testrunner import TestRunner
 
+def get_default_path(follow_link=False):
+    """
+    Try to automagically figure out the path we are running from.
+    """
+    # called from the build tree?
+    if os.path.islink(sys.argv[0]):
+        if follow_link:
+            return os.path.dirname(os.readlink(sys.argv[0]))
+        else:
+            return os.path.dirname(os.path.abspath(sys.argv[0]))
+    else:  # or source tree?
+        return os.getcwd()
 
 def make_argparser() -> argparse.ArgumentParser:
-    p = argparse.ArgumentParser(description="Test run options")
+    p = argparse.ArgumentParser(
+        description="Test run options",
+        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
 
     p.add_argument('-n', '--dry-run', action='store_true',
                    help='show me, do not run tests')
@@ -113,6 +127,11 @@ def make_argparser() -> argparse.ArgumentParser:
                        'middle of the process.')
     g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
                        help='tests to run, or "--" followed by a command')
+    g_sel.add_argument('--build-dir', default=get_default_path(),
+                       help='Path to iotests build directory')
+    g_sel.add_argument('--source-dir',
+                       default=get_default_path(follow_link=True),
+                       help='Path to iotests build directory')
 
     return p
 
@@ -120,7 +139,9 @@ def make_argparser() -> argparse.ArgumentParser:
 if __name__ == '__main__':
     args = make_argparser().parse_args()
 
-    env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
+    env = TestEnv(source_dir=args.source_dir,
+                  build_dir=args.build_dir,
+                  imgfmt=args.imgfmt, imgproto=args.imgproto,
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index a864c74b12..aa9d735414 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -170,7 +170,8 @@ def root(*names: str) -> str:
             if not isxfile(b):
                 sys.exit('Not executable: ' + b)
 
-    def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
+    def __init__(self, source_dir: str, build_dir: str,
+                 imgfmt: str, imgproto: str, aiomode: str,
                  cachemode: Optional[str] = None,
                  imgopts: Optional[str] = None,
                  misalign: bool = False,
@@ -211,14 +212,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
         # which are needed to initialize some environment variables. They are
         # used by init_*() functions as well.
 
-        if os.path.islink(sys.argv[0]):
-            # called from the build tree
-            self.source_iotests = os.path.dirname(os.readlink(sys.argv[0]))
-            self.build_iotests = os.path.dirname(os.path.abspath(sys.argv[0]))
-        else:
-            # called from the source tree
-            self.source_iotests = os.getcwd()
-            self.build_iotests = self.source_iotests
+        self.source_iotests = source_dir
+        self.build_iotests = build_dir
 
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
-- 
2.39.2


