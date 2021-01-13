Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224DC2F5191
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 19:00:43 +0100 (CET)
Received: from localhost ([::1]:50712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzkRk-0003Zr-4p
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 13:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPG-0001eu-Cr
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPE-0000vA-Bk
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610560683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwDLgbif8bpJ7F2UY/z831fx0M5z2L/TjfKn/9WlPTQ=;
 b=IIPt8qRPJN2Z44Bzbx6AiM066CWGsjbepquyG0Gdi++em5LUYsUBPB0bDxt0ro5+pWyZAH
 V4gv3j+VI35tUPdct/lA2OewfBDt5eel9mfJvtnRhRQQ8CcNqBg/sr9y0UPOO9A15uMZ00
 KbQxDql3Z2cdeZAMqhq6F1Vsb5zPX/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-DTGP0LwhNKi1UDXd93RdfA-1; Wed, 13 Jan 2021 12:58:00 -0500
X-MC-Unique: DTGP0LwhNKi1UDXd93RdfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F18D8066E0;
 Wed, 13 Jan 2021 17:57:59 +0000 (UTC)
Received: from localhost (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC84660BF1;
 Wed, 13 Jan 2021 17:57:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/8] iotests: Move try_remove to iotests.py
Date: Wed, 13 Jan 2021 18:57:46 +0100
Message-Id: <20210113175752.403022-3-mreitz@redhat.com>
In-Reply-To: <20210113175752.403022-1-mreitz@redhat.com>
References: <20210113175752.403022-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index dcdcd0387f..15704ca466 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -515,12 +515,15 @@ class FilePath:
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


