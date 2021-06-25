Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1263B48C3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:27:45 +0200 (CEST)
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqYK-0008Eu-Dr
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRV-0003ry-O8
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRM-0005f0-O5
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mame4HQPDWbV868hCi4po3XFIQyBxQT18b4NcI6B/5g=;
 b=WmIvEn4kJFQc5d9PyKA2CbR5wg8w9cUyUzcgNW02rRucvDSHnIhekaqPtL272p/fs4KADo
 gi7R0D4u/AyrWyRBgUG8NMIYJt1rjwAPXp77JzRIRcjLjQxKX2jOaOspGyVUKSdRfywqUt
 ki3enqwvY2jSJj0lq3cf8XjEQUQMGp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-KXaZ3oQvMR6QtfGlgjbRRw-1; Fri, 25 Jun 2021 14:20:30 -0400
X-MC-Unique: KXaZ3oQvMR6QtfGlgjbRRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7285918A0733;
 Fri, 25 Jun 2021 18:20:29 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CF8D5D9C6;
 Fri, 25 Jun 2021 18:20:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] iotests/297: Add get_files() function
Date: Fri, 25 Jun 2021 14:20:13 -0400
Message-Id: <20210625182021.803227-3-jsnow@redhat.com>
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

Split out file discovery into its own method to begin separating out the
"environment setup" and "test execution" phases.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 493dda17fb..0bc1195805 100755
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


