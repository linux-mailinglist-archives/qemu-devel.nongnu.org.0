Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466503D00D2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:48:11 +0200 (CEST)
Received: from localhost ([::1]:54982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tqk-0005sz-8v
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcw-0005ki-Nz
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcv-0005eA-24
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSLa34YY4+NqHwZotV63ArZkyZ/DYSJWfeGmgDeChRM=;
 b=ZDNbA5CsAnf4XCLk7WwCOulobkNS9fgDrEskD8Oiroihjtjpg62oQ1HmfRiPlgvTgvfY4X
 dVVstli7k45nMD76lcf4NAQXblfKk+ie3WptJZwj0CrJ450x57KoN524897hOtWnggMJZk
 NEF70Zo6fvsJux/1ChCJGICHi5Ap7MU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-lB-1I-dgPWi5XFTIHLs1ig-1; Tue, 20 Jul 2021 13:33:51 -0400
X-MC-Unique: lB-1I-dgPWi5XFTIHLs1ig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27E3410C1ADC;
 Tue, 20 Jul 2021 17:33:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27CC669CB4;
 Tue, 20 Jul 2021 17:33:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/17] iotests/297: Don't rely on distro-specific linter
 binaries
Date: Tue, 20 Jul 2021 13:33:28 -0400
Message-Id: <20210720173336.1876937-10-jsnow@redhat.com>
In-Reply-To: <20210720173336.1876937-1-jsnow@redhat.com>
References: <20210720173336.1876937-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/297 | 45 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 665ac0aa361..dc4460dd84b 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -87,8 +87,11 @@ def run_linters():
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
@@ -99,23 +102,27 @@ def run_linters():
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


