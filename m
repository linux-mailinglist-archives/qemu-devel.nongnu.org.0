Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCCA3D005C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:37:44 +0200 (CEST)
Received: from localhost ([::1]:59238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tgd-0006Xn-8s
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcu-0005eT-MG
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcs-0005cp-NF
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TlW+O/Agw4fmvSQABqWMqPQidkykJu4Fz0dvqJnM6oo=;
 b=G2DosyEyL+O5vQ9WzJSAhPG86C88deDkMi9VLO4WSeqbrxlEm6cZmq8GKiCZCEt7o5dpfZ
 Li4oJcFv3BXMho228Gw7McX1+9+7em3ildNUhx//uqoui5V1qW9SsFkdLpRNTrkoNZSXBi
 WuUGYkRczPGPR3Hzgv+Mo8Y3ij26vJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-vVm6O2AAOLWweNxB8xZsuw-1; Tue, 20 Jul 2021 13:33:48 -0400
X-MC-Unique: vVm6O2AAOLWweNxB8xZsuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA8571015DA1;
 Tue, 20 Jul 2021 17:33:47 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A23C269CB4;
 Tue, 20 Jul 2021 17:33:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/17] iotests/297: Add get_files() function
Date: Tue, 20 Jul 2021 13:33:26 -0400
Message-Id: <20210720173336.1876937-8-jsnow@redhat.com>
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

Split out file discovery into its own method to begin separating out the
"environment setup" and "test execution" phases.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 493dda17fb6..0bc11958059 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -21,6 +21,7 @@ import re
 import shutil
 import subprocess
 import sys
+from typing import List
 
 import iotests
 
@@ -56,9 +57,15 @@ def is_python_file(filename: str, directory: str = '.') -> bool:
             return False
 
 
+def get_test_files(directory: str = '.') -> List[str]:
+    return [
+        f for f in (set(os.listdir(directory)) - set(SKIP_FILES))
+        if is_python_file(f, directory)
+    ]
+
+
 def run_linters():
-    files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
-             if is_python_file(filename)]
+    files = get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
-- 
2.31.1


