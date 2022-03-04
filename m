Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616024CDD73
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:54:50 +0100 (CET)
Received: from localhost ([::1]:53006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQE0n-0002Kv-38
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:54:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQDuM-0008K9-2l
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:48:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQDuJ-0005wn-Ni
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646423287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dv3LVR63EO6azWLu5MyiN6A/MIvj9jFUcv5q2Nqggfo=;
 b=I+aOfwTu4rCT5qoDIxKGhTb1t+5XtpWTis3h87Mo+KpOAKiGAH9cFgGcVfqeA19sCAz1vs
 hrW/YMK75DGVxZI9tFp41J3AYYg6am6grPhEcCt3Qf9iYG93n3mkbq/uzyz9nfGmN5dH1K
 0HwOxDzDRU+jyihhSU5PfwV2gq4l+VM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-P6sI7TKSO0aVeQGWXlDYYw-1; Fri, 04 Mar 2022 14:48:04 -0500
X-MC-Unique: P6sI7TKSO0aVeQGWXlDYYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13D498014BE;
 Fri,  4 Mar 2022 19:48:03 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 379D95DF21;
 Fri,  4 Mar 2022 19:48:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] iotests: fortify compare_images() against crashes
Date: Fri,  4 Mar 2022 14:47:46 -0500
Message-Id: <20220304194746.486226-6-jsnow@redhat.com>
In-Reply-To: <20220304194746.486226-1-jsnow@redhat.com>
References: <20220304194746.486226-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Fortify compare_images() to be more discerning about the status codes it
receives. If qemu_img() returns an exit code that implies it didn't
actually perform the comparison, treat that as an exceptional
circumstance and force the caller to be aware of the peril.

If a negative test is desired (perhaps to test how qemu_img compare
behaves on malformed images, for instance), it is still possible to
catch the exception in the test and deal with that circumstance
manually.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/iotests.py | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index f97eeb5f91..cc10ad47c6 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -504,11 +504,22 @@ def qemu_nbd_popen(*args):
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


