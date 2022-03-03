Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C754CC784
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:02:45 +0100 (CET)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsay-0000Fs-PV
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:02:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nPsY9-0004y8-AI
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nPsY7-00041N-OE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646341187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOdNJS00KhlKFhbCpfPKWdrYNCXz/KGnCecbuZ92tdQ=;
 b=Eev5P58llska/vaNkupQ4eZfu0I1yIwlQbItJ39mK2hJovjHQ7yMIMRNcLfjtu9t1zmnUc
 S4HZJtgXMV8lASzsCBxxnymKx87qVtyPfC34vyOuMnddMx3S1BSOFdoNkRzuqcrVdR7+oh
 Rx5eTi6nW4VMIYWrcjCbz8muecJYug4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-D100BEP1OOGwwBHq5Vb4wg-1; Thu, 03 Mar 2022 15:59:44 -0500
X-MC-Unique: D100BEP1OOGwwBHq5Vb4wg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 580438070FF;
 Thu,  3 Mar 2022 20:59:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.18.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E4FA64185;
 Thu,  3 Mar 2022 20:59:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] iotests: fortify compare_images() against crashes
Date: Thu,  3 Mar 2022 15:59:02 -0500
Message-Id: <20220303205902.4106779-6-jsnow@redhat.com>
In-Reply-To: <20220303205902.4106779-1-jsnow@redhat.com>
References: <20220303205902.4106779-1-jsnow@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fority compare_images() to be more discerning about the status codes it
receives. If qemu_img() returns an exit code that implies it didn't
actually perform the comparison, treat that as an exceptional
circumstance and force the caller to be aware of the peril.

If a negative test is desired (Perhaps to test how qemu_img compare
behaves on malformed images, for instance), it is still possible to
catch the exception in the test and deal with that circumstance
manually.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index f6c0f1b0a0..654ce834e6 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -474,11 +474,22 @@ def qemu_nbd_popen(*args):
             p.kill()
             p.wait()
 
-def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
-    '''Return True if two image files are identical'''
-    res = qemu_img('compare', '-f', fmt1,
-                   '-F', fmt2, img1, img2, check=False)
-    return res.returncode == 0
+def compare_images(img1: str, img2: str,
+                   fmt1: str = imgfmt, fmt2: str = imgfmt) -> bool:
+    """
+    Compare two images with QEMU_IMG; return True if they are identical.
+
+    :raise CalledProcessError:
+        when qemu-img crashes or returns a status code of anything other
+        than 0 (identical) or 1 (different).
+    """
+    try:
+        qemu_img('compare', '-f', fmt1, '-F', fmt2, img1, img2)
+        return True
+    except subprocess.CalledProcessError as exc:
+        if exc.returncode == 1:
+            return False
+        raise
 
 def create_image(name, size):
     '''Create a fully-allocated raw image with sector markers'''
-- 
2.34.1


