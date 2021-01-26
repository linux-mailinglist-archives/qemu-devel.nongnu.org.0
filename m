Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A752830404A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:29:53 +0100 (CET)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PLs-0002V1-Ot
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDZ-000071-PQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDR-00068c-0D
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6un0LQgCw+slyWXZTlB11dFdTUK7EMjnmoLwfKCeFk=;
 b=WKNBefrfT7UxCO6DI+c76dEqjBEW/rMTlqADwQ8yGZ2c4Gj7o6SIECXl82qOequt/Wnxga
 u4hmoHXZnItFglvgTRezeTyMy7Afv/B2W/S9soL17EPHEO/wV3BdGOvWgC8UwHg/fsvtC7
 QQd10szr6RPMLK+pM7uNqPFKEe+xR9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-SktHpSy7Nz-x_cblQ4FaLg-1; Tue, 26 Jan 2021 09:21:06 -0500
X-MC-Unique: SktHpSy7Nz-x_cblQ4FaLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABE9357203;
 Tue, 26 Jan 2021 14:20:57 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46D9919D6C;
 Tue, 26 Jan 2021 14:20:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/53] iotests: Move try_remove to iotests.py
Date: Tue, 26 Jan 2021 15:19:40 +0100
Message-Id: <20210126142016.806073-18-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210118105720.14824-4-mreitz@redhat.com>
---
 tests/qemu-iotests/124        |  8 +-------
 tests/qemu-iotests/iotests.py | 11 +++++++----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/124 b/tests/qemu-iotests/124
index 3b21bc497f..90cdbd8e24 100755
--- a/tests/qemu-iotests/124
+++ b/tests/qemu-iotests/124
@@ -23,6 +23,7 @@
 
 import os
 import iotests
+from iotests import try_remove
 
 
 def io_write_patterns(img, patterns):
@@ -30,13 +31,6 @@ def io_write_patterns(img, patterns):
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
index 45cb9bd288..335e6feb70 100644
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


