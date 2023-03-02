Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE16A88AE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:46:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXnwa-0001FB-Ua; Thu, 02 Mar 2023 13:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnwY-00016e-CH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:46:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnwW-00059h-HU
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677782775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6ApikPP/FgnXZsOu95/fvwfQFK7ck6XKqwLw9PSu/w=;
 b=TKKFrCZx+z/ST9N2Sc3epEjmZpTNhQXvaEXeWU0lLuBENBMajrJk97ZFyfg2CSlyLVZtwR
 n4w795DMZ+FIHXeJ2sXT3jXUv4cHBvqZFpGLSV4o4eT//VzlNzJI4Izn6sTwQLWSVHIYOC
 nvdwaAS0rAAhVxyh9Bu6TXS0js8KGbw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-k0Ui8ittNHa2MNnJBefXLA-1; Thu, 02 Mar 2023 13:46:12 -0500
X-MC-Unique: k0Ui8ittNHa2MNnJBefXLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DB4B185A78B;
 Thu,  2 Mar 2023 18:46:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83476C16027;
 Thu,  2 Mar 2023 18:46:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/5] iotests: explicitly pass source/build dir to 'check'
 command
Date: Thu,  2 Mar 2023 18:46:02 +0000
Message-Id: <20230302184606.418541-2-berrange@redhat.com>
In-Reply-To: <20230302184606.418541-1-berrange@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
 tests/qemu-iotests/check      |  8 +++++++-
 tests/qemu-iotests/testenv.py | 17 +++++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 9bdda1394e..806abc21d6 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -113,6 +113,10 @@ def make_argparser() -> argparse.ArgumentParser:
                        'middle of the process.')
     g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
                        help='tests to run, or "--" followed by a command')
+    g_sel.add_argument('--build-dir', default=None,
+                       help='Path to iotests build directory')
+    g_sel.add_argument('--source-dir', default=None,
+                       help='Path to iotests build directory')
 
     return p
 
@@ -124,7 +128,9 @@ if __name__ == '__main__':
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
-                  gdb=args.gdb, qprint=args.print)
+                  gdb=args.gdb, qprint=args.print,
+                  source_dir=args.source_dir,
+                  build_dir=args.build_dir)
 
     if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
         if not args.tests:
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index a864c74b12..9bf37cd381 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -177,7 +177,9 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  debug: bool = False,
                  valgrind: bool = False,
                  gdb: bool = False,
-                 qprint: bool = False) -> None:
+                 qprint: bool = False,
+                 source_dir: Optional[str] = None,
+                 build_dir: Optional[str] = None) -> None:
         self.imgfmt = imgfmt
         self.imgproto = imgproto
         self.aiomode = aiomode
@@ -213,12 +215,19 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
 
         if os.path.islink(sys.argv[0]):
             # called from the build tree
-            self.source_iotests = os.path.dirname(os.readlink(sys.argv[0]))
-            self.build_iotests = os.path.dirname(os.path.abspath(sys.argv[0]))
+            self.source_iotests = os.path.dirname(
+                os.readlink(sys.argv[0]))
+            self.build_iotests = os.path.dirname(
+                os.path.abspath(sys.argv[0]))
         else:
             # called from the source tree
             self.source_iotests = os.getcwd()
-            self.build_iotests = self.source_iotests
+            self.build_iotests = os.getcwd()
+
+        if source_dir is not None:
+            self.source_iotests = source_dir
+        if build_dir is not None:
+            self.build_iotests = build_dir
 
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
-- 
2.39.2


