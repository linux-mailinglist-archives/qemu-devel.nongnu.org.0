Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D7433BD3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:13:24 +0200 (CEST)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrjv-0000V0-Ck
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQq-0001hz-Cg
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQm-00087V-Ka
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51eD+Sk87Ad/lpyURfgeLuBgtkm367QKEQ1SxZoyY5Y=;
 b=M7SpGkNBZj8IuHz2SQY6rtLm+udfpcOSp6TXeqIT6jBBDPv+JJlOvZa1ucRXP4MqiCxKHp
 +wp7OPmBty/YeCNHM2RTf3T9VlWmLTX2yVgnjw5WPQZW0wUC8qy+10t6gTgFY+9UD5X4vm
 mwrG8DrIBzjxiRhZNvZFO0AuyWu0hCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-nuD_bf07Mm-j5vwgVrIM_w-1; Tue, 19 Oct 2021 10:49:28 -0400
X-MC-Unique: nuD_bf07Mm-j5vwgVrIM_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B361C11B4C04;
 Tue, 19 Oct 2021 14:49:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C90335D6D7;
 Tue, 19 Oct 2021 14:49:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] iotests/297: Split run_linters apart into run_pylint
 and run_mypy
Date: Tue, 19 Oct 2021 10:49:09 -0400
Message-Id: <20211019144918.3159078-7-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

Move environment setup into main(), and split the actual linter
execution into run_pylint and run_mypy, respectively.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/297 | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index c1bddb9ce0e..189bcaf5f94 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -21,7 +21,7 @@ import re
 import shutil
 import subprocess
 import sys
-from typing import List
+from typing import List, Mapping, Optional
 
 import iotests
 
@@ -61,23 +61,19 @@ def get_test_files() -> List[str]:
     return list(filter(is_python_file, check_tests))
 
 
-def run_linters():
-    files = get_test_files()
+def run_pylint(
+    files: List[str],
+    env: Optional[Mapping[str, str]] = None,
+) -> None:
 
-    iotests.logger.debug('Files to be checked:')
-    iotests.logger.debug(', '.join(sorted(files)))
-
-    print('=== pylint ===')
-    sys.stdout.flush()
-
-    env = os.environ.copy()
     subprocess.run(('python3', '-m', 'pylint', *files),
                    env=env, check=False)
 
-    print('=== mypy ===')
-    sys.stdout.flush()
 
-    env['MYPYPATH'] = env['PYTHONPATH']
+def run_mypy(
+    files: List[str],
+    env: Optional[Mapping[str, str]] = None,
+) -> None:
     p = subprocess.run(('python3', '-m', 'mypy', *files),
                        env=env,
                        check=False,
@@ -94,7 +90,21 @@ def main() -> None:
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
+    print('=== pylint ===')
+    sys.stdout.flush()
+    run_pylint(files, env=env)
+
+    print('=== mypy ===')
+    sys.stdout.flush()
+    run_mypy(files, env=env)
 
 
 iotests.script_main(main)
-- 
2.31.1


