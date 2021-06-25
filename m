Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7CD3B48BB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:25:23 +0200 (CEST)
Received: from localhost ([::1]:36176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqW2-0003o6-BM
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRU-0003q5-Lq
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRR-0005hD-EQ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsK8NJ5U2WqLbHkco10ewQdZb4ZPMCWjJRMdS+ZEPvo=;
 b=YYc+AEe3pHXwfVk0YHJgbzNTYes3wawrcDvaH3Xaz2ClPoKfcYAQWJ/SvcRRc9x73wAHE7
 Kg5SpEyEtZwpicvDWk2mL7MEdZr32K49/6Qmi30R0EKmtRAMMTqwKcUj0PGp4+JHuz+Loz
 UYsm/TDfWPoUzJe5ixwYfi2s7FhsJAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-7fasYH_APsWqVOsH4vgs2Q-1; Fri, 25 Jun 2021 14:20:35 -0400
X-MC-Unique: 7fasYH_APsWqVOsH4vgs2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B314804144;
 Fri, 25 Jun 2021 18:20:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DEA55D9C6;
 Fri, 25 Jun 2021 18:20:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] iotests/297: Separate environment setup from test
 execution
Date: Fri, 25 Jun 2021 14:20:16 -0400
Message-Id: <20210625182021.803227-6-jsnow@redhat.com>
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

Move environment setup into main(), leaving pure test execution behind
in run_linters().

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index f35687d021..c7428af901 100755
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
     ]
 
 
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


