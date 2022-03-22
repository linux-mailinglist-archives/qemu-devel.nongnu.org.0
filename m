Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD3A4E3E09
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:02:51 +0100 (CET)
Received: from localhost ([::1]:46524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdDu-0004uU-EM
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:02:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8Q-0002WX-T1
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8P-0006Rc-AM
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LnsVSFfaeMRLkFpVUnMbr/ry+iO9MWG5xODvgji4WfE=;
 b=YcIBNgSkApKsVXMaK9UPAVV0Kxg5x/Wj1XuluibN8Stp48fCU5291NztQVH6HBlSNp6RjB
 f9Qj+bLs9wQSY3wOnS8c0kW1qgQfJ+snmRsQrXY01PxozFrQ+IZG61D0K3eC1WIUgF2XOP
 NRNEc2dLauN9RY4UASLIIb3T7wVUHVI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-61DzY8d6MZud2VVt7pp73A-1; Tue, 22 Mar 2022 07:57:05 -0400
X-MC-Unique: 61DzY8d6MZud2VVt7pp73A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C2E410726A5;
 Tue, 22 Mar 2022 11:57:05 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 086D740CF8EF;
 Tue, 22 Mar 2022 11:57:04 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/25] iotests: fortify compare_images() against crashes
Date: Tue, 22 Mar 2022 12:56:32 +0100
Message-Id: <20220322115647.726044-11-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220321201618.903471-6-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 4afe63df07..9351f9c6ac 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -507,11 +507,22 @@ def qemu_nbd_popen(*args):
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
2.35.1


