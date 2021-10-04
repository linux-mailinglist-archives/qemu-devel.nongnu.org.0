Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25655421913
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:14:16 +0200 (CEST)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVHp-0007bt-KB
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9Q-00006O-Ao
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9O-0007Uu-GT
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6c5KJqUBPGjOMB5qC981y/85tPXg6c6GV27yYeRj0DM=;
 b=C4uxuwYz0D7zgD+CyL+rh96hpDiuUd7GIanjiQJRbkFT4sQ36OAFLvevzUzjhvP8Ihfl8f
 dvqU515BRWYhIwu9NcuAiLEqwpa3nSb/4EuBCB/zH+5btMoa7acc1F2r/8Kx6J5JY5i/0X
 EzUBBpfEwxX9JoCPpe1NwUgZcP36Pxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-_5G-ySmUMmWuhFh9pIogmg-1; Mon, 04 Oct 2021 17:05:28 -0400
X-MC-Unique: _5G-ySmUMmWuhFh9pIogmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDA0A802947;
 Mon,  4 Oct 2021 21:05:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D379F19C59;
 Mon,  4 Oct 2021 21:05:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/13] iotests/297: Separate environment setup from test
 execution
Date: Mon,  4 Oct 2021 17:04:56 -0400
Message-Id: <20211004210503.1455391-7-jsnow@redhat.com>
In-Reply-To: <20211004210503.1455391-1-jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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

Move environment setup into main(), leaving pure test execution behind
in run_linters().

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index f9fcb039e27..fcbab0631be 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -21,7 +21,7 @@ import re
 import shutil
 import subprocess
 import sys
-from typing import List
+from typing import List, Mapping, Optional
 
 import iotests
 
@@ -61,23 +61,20 @@ def get_test_files() -> List[str]:
     return list(filter(is_python_file, check_tests))
 
 
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
 
-    env = os.environ.copy()
     subprocess.run(('python3', '-m', 'pylint', *files),
                    env=env, check=False)
 
     print('=== mypy ===')
     sys.stdout.flush()
 
-    env['MYPYPATH'] = env['PYTHONPATH']
     p = subprocess.run((('python3', '-m', 'mypy', *files),
                        env=env,
                        check=False,
@@ -94,7 +91,15 @@ def main() -> None:
         if shutil.which(linter) is None:
             iotests.notrun(f'{linter} not found')
 
-    run_linters()
+    files = get_test_files()
+
+    iotests.logger.debug('Files to be checked:')
+    iotests.logger.debug(', '.join(sorted(files)))
+
+    env = os.environ.copy()
+    env['MYPYPATH'] = env['PYTHONPATH']
+
+    run_linters(files, env=env)
 
 
 iotests.script_main(main)
-- 
2.31.1


