Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8650C3B48B6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:23:35 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqUI-0006k4-Hg
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRc-0003x2-F7
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRR-0005h5-Ee
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wb9NB4SkrkvqqM3I/jv+E6tPsJn0M3ulgHiFWY0OeXg=;
 b=J6IGLIHdcFv6z/iT305e+lG+y76zZths+hRRVdzMFF+6mV/XFxw2BQSrqHP8ltowqNUE+q
 55EqGQ1fI7HHQdcH6p605N9BkqnG8cYjlEU4eBtvMhWrGDM+TcwVQHgb28oTEXpxQ1vp0R
 AtDtCgPcEQl28aXIcPtXNSofdVFaP3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-7w7LHbv6NUKOpJ5I-OShOA-1; Fri, 25 Jun 2021 14:20:33 -0400
X-MC-Unique: 7w7LHbv6NUKOpJ5I-OShOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0063800D62;
 Fri, 25 Jun 2021 18:20:30 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 898D55D9C6;
 Fri, 25 Jun 2021 18:20:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] iotests/297: Don't rely on distro-specific linter
 binaries
Date: Fri, 25 Jun 2021 14:20:14 -0400
Message-Id: <20210625182021.803227-4-jsnow@redhat.com>
In-Reply-To: <20210625182021.803227-1-jsnow@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

'pylint-3' is another Fedora-ism. Use "python3 -m pylint" or "python3 -m
mypy" to access these scripts instead. This style of invocation will
prefer the "correct" tool when run in a virtual environment.

Note that we still check for "pylint-3" before the test begins -- this
check is now "overly strict", but shouldn't cause anything that was
already running correctly to start failing.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 45 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 0bc1195805..43af361622 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -82,8 +82,11 @@ def run_linters():
         env['PYTHONPATH'] += os.pathsep + qemu_module_path
     except KeyError:
         env['PYTHONPATH'] = qemu_module_path
-    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
-                   env=env, check=False)
+    subprocess.run(
+        ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
+        env=env,
+        check=False,
+    )
 
     print('=== mypy ===')
     sys.stdout.flush()
@@ -94,23 +97,27 @@ def run_linters():
     # must not both define the __main__ module).
     env['MYPYPATH'] = env['PYTHONPATH']
     for filename in files:
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
+            env=env,
+            check=False,
+            stdout=subprocess.PIPE,
+            stderr=subprocess.STDOUT,
+            universal_newlines=True
+        )
 
         if p.returncode != 0:
             print(p.stdout)
-- 
2.31.1


