Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E840D28D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:28:56 +0200 (CEST)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQj15-0004wC-4M
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijE-0007P9-F5
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijB-0000ib-Bu
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1hzmYJCwUpJlt7OQgJoE7M+hEI680jZoYzlYJoPZIGU=;
 b=PmcczAA5cG6ISPYAGGMurELmhlOcAybl/Wn8HmXrE6/epH2JBKbtLkB+heyFcP7vCOh2hx
 pbbRidhfCl2lJDnLJlqz+3DYZsmRgQOaIZRLsac4bcLB41UEjAUe0MA5Rb0TKVgthJITxw
 nBcnZ7Q9BbfKNlHvB4pePAQ1wqh122E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-KB3Z0vhkPJWRIaGuBnIAcQ-1; Thu, 16 Sep 2021 00:10:22 -0400
X-MC-Unique: KB3Z0vhkPJWRIaGuBnIAcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDAD01808305;
 Thu, 16 Sep 2021 04:10:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54EFF19C79;
 Thu, 16 Sep 2021 04:10:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/16] iotests/297: Separate environment setup from test
 execution
Date: Thu, 16 Sep 2021 00:09:48 -0400
Message-Id: <20210916040955.628560-10-jsnow@redhat.com>
In-Reply-To: <20210916040955.628560-1-jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move environment setup into main(), leaving pure test execution behind
in run_linters().

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/297 | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 6df952808d..08d2b87108 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -21,7 +21,7 @@ import re
 import shutil
 import subprocess
 import sys
-from typing import List
+from typing import List, Mapping, Optional
 
 import iotests
 
@@ -64,24 +64,16 @@ def get_test_files(directory: str = '.') -> List[str]:
     return list(filter(lambda f: is_python_file(f, directory), check_tests))
 
 
-def run_linters():
-    files = get_test_files()
-
-    iotests.logger.debug('Files to be checked:')
-    iotests.logger.debug(', '.join(sorted(files)))
+def run_linters(
+    files: List[str],
+    env: Optional[Mapping[str, str]] = None,
+) -> None:
 
     print('=== pylint ===')
     sys.stdout.flush()
 
     # Todo notes are fine, but fixme's or xxx's should probably just be
     # fixed (in tests, at least)
-    env = os.environ.copy()
-    qemu_module_path = os.path.join(os.path.dirname(__file__),
-                                    '..', '..', 'python')
-    try:
-        env['PYTHONPATH'] += os.pathsep + qemu_module_path
-    except KeyError:
-        env['PYTHONPATH'] = qemu_module_path
     subprocess.run(
         ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
         env=env,
@@ -95,7 +87,6 @@ def run_linters():
     # will interpret all given files as belonging together (i.e., they
     # may not both define the same classes, etc.; most notably, they
     # must not both define the __main__ module).
-    env['MYPYPATH'] = env['PYTHONPATH']
     for filename in files:
         p = subprocess.run(
             (
@@ -128,7 +119,22 @@ def main() -> None:
         if shutil.which(linter) is None:
             iotests.notrun(f'{linter} not found')
 
-    run_linters()
+    files = get_test_files()
+
+    iotests.logger.debug('Files to be checked:')
+    iotests.logger.debug(', '.join(sorted(files)))
+
+    env = os.environ.copy()
+    qemu_module_path = os.path.join(os.path.dirname(__file__),
+                                    '..', '..', 'python')
+    try:
+        env['PYTHONPATH'] += os.pathsep + qemu_module_path
+    except KeyError:
+        env['PYTHONPATH'] = qemu_module_path
+
+    env['MYPYPATH'] = env['PYTHONPATH']
+
+    run_linters(files, env=env)
 
 
 iotests.script_main(main)
-- 
2.31.1


