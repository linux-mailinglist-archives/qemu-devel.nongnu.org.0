Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E0B4AD571
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:22:16 +0100 (CET)
Received: from localhost ([::1]:43882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNdX-0008M1-BM
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:22:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNV2-0006Zv-90
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNV0-0003WV-2A
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644315205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJ7ga4OVxPAFbEoiqCPWMcvTKn1SeVT+NFgRh/tiCf4=;
 b=IT4gEH50R2Yj6nLSOrknASs2T8LFOxZXLgl27MiMU9xw5QRB0NUc3DU0hcPVs0z1geg524
 ccU0RalfCMfPK1KcVGF1WFtUKtEjShxZmybJ5QWQCDvI8MUdA4lkmCh0iSo6XIKJ9Uv+YK
 VpETO7P1/Ifee/KhZhebSezYS44PEzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-sxYn3gV2OrS8C-TjKviiiQ-1; Tue, 08 Feb 2022 05:13:22 -0500
X-MC-Unique: sxYn3gV2OrS8C-TjKviiiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89AF0835B74;
 Tue,  8 Feb 2022 10:13:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4E1E2A182;
 Tue,  8 Feb 2022 10:13:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 3/6] tests/qemu-iotests: Allow to run "./check -n" from the
 source directory, too
Date: Tue,  8 Feb 2022 11:13:08 +0100
Message-Id: <20220208101311.1511083-4-thuth@redhat.com>
In-Reply-To: <20220208101311.1511083-1-thuth@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For better integration of the iotests into the meson build system, it
would be very helpful to get the list of the tests in the "auto" group
during the "configure" step already. However, "check -n -g auto"
currently only works if the binaries have already been built. Re-order
the code in the "check" a little bit so that we can use the -n option
without building the binaries first.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/check | 52 ++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 75de1b4691..0fa75abf13 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -120,6 +120,30 @@ def make_argparser() -> argparse.ArgumentParser:
 if __name__ == '__main__':
     args = make_argparser().parse_args()
 
+    if os.path.islink(sys.argv[0]):
+        # called from the build tree
+        source_iotests = os.path.dirname(os.readlink(sys.argv[0]))
+    else:
+        source_iotests = os.getcwd()
+
+    testfinder = TestFinder(source_iotests)
+
+    groups = args.groups.split(',') if args.groups else None
+    x_groups = args.exclude_groups.split(',') if args.exclude_groups else None
+
+    try:
+        tests = testfinder.find_tests(groups=groups, exclude_groups=x_groups,
+                                      tests=args.tests,
+                                      start_from=args.start_from)
+        if not tests:
+            raise ValueError('No tests selected')
+    except ValueError as e:
+        sys.exit(e)
+
+    if args.dry_run:
+        print('\n'.join(tests))
+        sys.exit(0)
+
     env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
@@ -140,11 +164,6 @@ if __name__ == '__main__':
         os.chdir(exec_path.parent)
         os.execve(cmd[0], cmd, full_env)
 
-    testfinder = TestFinder(test_dir=env.source_iotests)
-
-    groups = args.groups.split(',') if args.groups else None
-    x_groups = args.exclude_groups.split(',') if args.exclude_groups else None
-
     group_local = os.path.join(env.source_iotests, 'group.local')
     if os.path.isfile(group_local):
         try:
@@ -152,21 +171,8 @@ if __name__ == '__main__':
         except ValueError as e:
             sys.exit(f"Failed to parse group file '{group_local}': {e}")
 
-    try:
-        tests = testfinder.find_tests(groups=groups, exclude_groups=x_groups,
-                                      tests=args.tests,
-                                      start_from=args.start_from)
-        if not tests:
-            raise ValueError('No tests selected')
-    except ValueError as e:
-        sys.exit(e)
-
-    if args.dry_run:
-        print('\n'.join(tests))
-    else:
-        with TestRunner(env, tap=args.tap,
-                        color=args.color) as tr:
-            paths = [os.path.join(env.source_iotests, t) for t in tests]
-            ok = tr.run_tests(paths, args.jobs)
-            if not ok:
-                sys.exit(1)
+    with TestRunner(env, tap=args.tap, color=args.color) as tr:
+        paths = [os.path.join(env.source_iotests, t) for t in tests]
+        ok = tr.run_tests(paths, args.jobs)
+        if not ok:
+            sys.exit(1)
-- 
2.27.0


