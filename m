Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3C40D254
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:23:32 +0200 (CEST)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQivr-00063q-Ha
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQij7-00071q-Fv
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQij4-0000aR-QI
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZiahqh99EnnpzzYlCIOhDSsZBcXqmlZj6Mfz46bLbw=;
 b=IJojKF7NLz0UbtJSwrLgRO2XK1MznDHWoOvwMBBYcVbUlZJFOYnw1mUIHoj/bgXms9GQb9
 E7SUvmx4Zdh/D00iJI3NQLM/OvLO7o/eNsgjY5dZJ3L+VAltzgM/t5u0hKVJLJpBN60AD5
 UkTvEHfaUETSF/cTew8xNHhV1Ndokws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-7m7qt3g5O5q2c0-Nrm-KlQ-1; Thu, 16 Sep 2021 00:10:17 -0400
X-MC-Unique: 7m7qt3g5O5q2c0-Nrm-KlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C389362FB;
 Thu, 16 Sep 2021 04:10:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92AD719C79;
 Thu, 16 Sep 2021 04:10:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/16] iotests/297: Add get_files() function
Date: Thu, 16 Sep 2021 00:09:45 -0400
Message-Id: <20210916040955.628560-7-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out file discovery into its own method to begin separating out the
"environment setup" and "test execution" phases.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 3e86f788fc..b3a56a3a29 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -21,6 +21,7 @@ import re
 import shutil
 import subprocess
 import sys
+from typing import List
 
 import iotests
 
@@ -56,10 +57,15 @@ def is_python_file(filename: str, directory: str = '.') -> bool:
             return False
 
 
+def get_test_files(directory: str = '.') -> List[str]:
+    named_test_dir = os.path.join(directory, 'tests')
+    named_tests = [f"tests/{entry}" for entry in os.listdir(named_test_dir)]
+    check_tests = set(os.listdir(directory) + named_tests) - set(SKIP_FILES)
+    return list(filter(lambda f: is_python_file(f, directory), check_tests))
+
+
 def run_linters():
-    named_tests = [f'tests/{entry}' for entry in os.listdir('tests')]
-    check_tests = set(os.listdir('.') + named_tests) - set(SKIP_FILES)
-    files = [filename for filename in check_tests if is_python_file(filename)]
+    files = get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
-- 
2.31.1


