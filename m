Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482422F68AC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:02:47 +0100 (CET)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06xK-0005Nx-AT
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l061x-0007Jo-8E
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l061m-0006rE-JS
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610643798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcJKj6wXMF7lgVQPcnR3ZE7i+jQrH9qvRgCCeOxzi3Y=;
 b=Jx9NjWhpb0aLdGmxRXCQ1NZTo1Ycxknmdnu+YnBojKqDcNhgKgHsFBPB/MOqhomwTbS5IV
 juk/M4CpjDXFddZ+fJMGaLS3pzOtBbwG712ABjG0UrNH9hDWPd7CtatmW8XvyP1XJRtN2s
 qeIRH8+dKHcdMALL7+RM/rMTxMJ4Hv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-b7h50Gl7MRmbE7KOabrgQQ-1; Thu, 14 Jan 2021 12:03:15 -0500
X-MC-Unique: b7h50Gl7MRmbE7KOabrgQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F03C2100D671;
 Thu, 14 Jan 2021 17:03:13 +0000 (UTC)
Received: from localhost (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8759612D7E;
 Thu, 14 Jan 2021 17:03:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 03/10] iotests: Move try_remove to iotests.py
Date: Thu, 14 Jan 2021 18:02:57 +0100
Message-Id: <20210114170304.87507-4-mreitz@redhat.com>
In-Reply-To: <20210114170304.87507-1-mreitz@redhat.com>
References: <20210114170304.87507-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/124        |  8 +-------
 tests/qemu-iotests/iotests.py | 11 +++++++----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/124 b/tests/qemu-iotests/124
index 3705cbb6b3..e40eeb50b9 100755
--- a/tests/qemu-iotests/124
+++ b/tests/qemu-iotests/124
@@ -22,6 +22,7 @@
 
 import os
 import iotests
+from iotests import try_remove
 
 
 def io_write_patterns(img, patterns):
@@ -29,13 +30,6 @@ def io_write_patterns(img, patterns):
         iotests.qemu_io('-c', 'write -P%s %s %s' % pattern, img)
 
 
-def try_remove(img):
-    try:
-        os.remove(img)
-    except OSError:
-        pass
-
-
 def transaction_action(action, **kwargs):
     return {
         'type': action,
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 52facb8e04..a69b4cdc4e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -523,12 +523,15 @@ class FilePath:
         return False
 
 
+def try_remove(img):
+    try:
+        os.remove(img)
+    except OSError:
+        pass
+
 def file_path_remover():
     for path in reversed(file_path_remover.paths):
-        try:
-            os.remove(path)
-        except OSError:
-            pass
+        try_remove(path)
 
 
 def file_path(*names, base_dir=test_dir):
-- 
2.29.2


