Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772AB433BFB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:21:06 +0200 (CEST)
Received: from localhost ([::1]:49136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrrN-0006g5-IQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQs-0001pK-Ur
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQr-0008BS-3A
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVtyAdbRBc2Y0+kMVQs8JXlxwsZDnAEVndjgEBtkfKw=;
 b=g1QAekP/7PH4VUDqfxj5i5siYbsHvn3RjJWaDUYjHp5XC/3TjNk+xIoYtYAyWFBwR+aG1H
 5Lg4RZRMA/PvPAmdz/nrL+KP1HPLsfBRtBmODJLtsdbnc/TdyLsO3jnZh1IhAtDMy3RoYO
 yHYvFfHzulQ8ZgU9OJEfntmoxtSsPVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-XpMu-CIZMrG67SmRP5dxLg-1; Tue, 19 Oct 2021 10:49:33 -0400
X-MC-Unique: XpMu-CIZMrG67SmRP5dxLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40DDA101F001;
 Tue, 19 Oct 2021 14:49:32 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AE7C5D6D7;
 Tue, 19 Oct 2021 14:49:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/15] iotests/297: split test into sub-cases
Date: Tue, 19 Oct 2021 10:49:13 -0400
Message-Id: <20211019144918.3159078-11-jsnow@redhat.com>
In-Reply-To: <20211019144918.3159078-1-jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Take iotest 297's main() test function and split it into two sub-cases
that can be skipped individually. We can also drop custom environment
setup from the pylint test as it isn't needed.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 63 ++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index b2ad8d1cbe0..b7d9d6077b3 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -82,36 +82,51 @@ def run_linter(
     )
 
 
+def check_linter(linter: str) -> bool:
+    try:
+        run_linter(linter, ['--version'], suppress_output=True)
+    except subprocess.CalledProcessError:
+        iotests.case_notrun(f"'{linter}' not found")
+        return False
+    return True
+
+
+def test_pylint(files: List[str]) -> None:
+    print('=== pylint ===')
+    sys.stdout.flush()
+
+    if not check_linter('pylint'):
+        return
+
+    run_linter('pylint', files)
+
+
+def test_mypy(files: List[str]) -> None:
+    print('=== mypy ===')
+    sys.stdout.flush()
+
+    if not check_linter('mypy'):
+        return
+
+    env = os.environ.copy()
+    env['MYPYPATH'] = env['PYTHONPATH']
+
+    run_linter('mypy', files, env=env, suppress_output=True)
+
+
 def main() -> None:
-    for linter in ('pylint', 'mypy'):
-        try:
-            run_linter(linter, ['--version'], suppress_output=True)
-        except subprocess.CalledProcessError:
-            iotests.notrun(f"'{linter}' not found")
-
     files = get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
 
-    env = os.environ.copy()
-    env['MYPYPATH'] = env['PYTHONPATH']
-
-    print('=== pylint ===')
-    sys.stdout.flush()
-    try:
-        run_linter('pylint', files, env=env)
-    except subprocess.CalledProcessError:
-        # pylint failure will be caught by diffing the IO.
-        pass
-
-    print('=== mypy ===')
-    sys.stdout.flush()
-    try:
-        run_linter('mypy', files, env=env, suppress_output=True)
-    except subprocess.CalledProcessError as exc:
-        if exc.output:
-            print(exc.output)
+    for test in (test_pylint, test_mypy):
+        try:
+            test(files)
+        except subprocess.CalledProcessError as exc:
+            # Linter failure will be caught by diffing the IO.
+            if exc.output:
+                print(exc.output)
 
 
 iotests.script_main(main)
-- 
2.31.1


