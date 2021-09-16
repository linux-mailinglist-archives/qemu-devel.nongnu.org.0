Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B9840D286
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:26:13 +0200 (CEST)
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQiyS-0000la-TT
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijA-0007Am-D4
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQij8-0000fi-QG
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0a1iac4nTpG7FZF61Ypmp0dRtpDg9EXplY2A87ngkw=;
 b=HqygU3VMBNqMUAXWKD+Uiw/bNGM3e1SAfspsGZ65Gg9Kt+uWKd4Ikw3B+hN3vDLTFjBEmP
 1Tbqz7aMCvLHe1VqRiAPopLn4eHvrJZzIP8pyhXN64Xur+0Nkm8eps2O9ZcCpWoQ4tYXxe
 46jGIBcWQyLm6iPJXLjKmoXDvyqe6Nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-CJcbzZiMNIyBwkubNS3grA-1; Thu, 16 Sep 2021 00:10:19 -0400
X-MC-Unique: CJcbzZiMNIyBwkubNS3grA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3486410066F3;
 Thu, 16 Sep 2021 04:10:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8905519C79;
 Thu, 16 Sep 2021 04:10:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/16] iotests/297: Don't rely on distro-specific linter
 binaries
Date: Thu, 16 Sep 2021 00:09:46 -0400
Message-Id: <20210916040955.628560-8-jsnow@redhat.com>
In-Reply-To: <20210916040955.628560-1-jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qemu-iotests/297 | 45 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index b3a56a3a29..01dd8147d5 100755
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


