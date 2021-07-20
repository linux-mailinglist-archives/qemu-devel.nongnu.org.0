Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E03D00B0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:44:19 +0200 (CEST)
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tn0-0000p3-7L
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcw-0005jP-Ct
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcu-0005dv-GP
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y94/5VMGNyufcv+PB8ODzD4VPZdS8XBLnCFC8whrLW8=;
 b=Yp178no8YsoTNllQq3ekIH5WJOQSVT9BcLZy5Ej5xeT81vFxAgyt2hhB7EWRPow8SY2eNz
 J5XpeBRIzHPLoMDW+1Dmrwn3RRt4pbCiySIWqv9Pxz5FypyMoZ07hunlJdSiE2JlO20sRt
 nUw143DTlq8xAa+4AVeBYDA5eOStACM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-iEzTu7hYMkiLmSbuSUvI2A-1; Tue, 20 Jul 2021 13:33:50 -0400
X-MC-Unique: iEzTu7hYMkiLmSbuSUvI2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2E72803F5B;
 Tue, 20 Jul 2021 17:33:48 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E13AF69CB4;
 Tue, 20 Jul 2021 17:33:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/17] iotests/297: Include sub-directories when finding
 tests to lint
Date: Tue, 20 Jul 2021 13:33:27 -0400
Message-Id: <20210720173336.1876937-9-jsnow@redhat.com>
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

Choosing to interpret the SKIP_FILES list as a list of filenames instead
of a list of paths, to keep things simple.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 0bc11958059..665ac0aa361 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -40,13 +40,8 @@ SKIP_FILES = (
 )
 
 
-def is_python_file(filename: str, directory: str = '.') -> bool:
-    filepath = os.path.join(directory, filename)
-
-    if not os.path.isfile(filepath):
-        return False
-
-    if filename.endswith('.py'):
+def is_python_file(filepath: str) -> bool:
+    if filepath.endswith('.py'):
         return True
 
     with open(filepath) as f:
@@ -58,10 +53,20 @@ def is_python_file(filename: str, directory: str = '.') -> bool:
 
 
 def get_test_files(directory: str = '.') -> List[str]:
-    return [
-        f for f in (set(os.listdir(directory)) - set(SKIP_FILES))
-        if is_python_file(f, directory)
-    ]
+    files = []
+
+    iotests.logger.debug("get_test_files(%s)", directory)
+    for dirent in os.scandir(directory):
+        if dirent.name in SKIP_FILES:
+            continue
+
+        relpath = os.path.join(directory, dirent.name)
+        if dirent.is_dir():
+            files.extend(get_test_files(relpath))
+        elif is_python_file(relpath):
+            files.append(relpath)
+
+    return files
 
 
 def run_linters():
-- 
2.31.1


