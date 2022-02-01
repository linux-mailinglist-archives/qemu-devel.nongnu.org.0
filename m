Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F7F4A60D6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:57:53 +0100 (CET)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvXU-0003AB-WC
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:57:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRW-0002n1-KR
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRL-0002yU-2a
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwBYhDeeo8LEFYMA9aaBm+uVrBLQopeflTnpzju7Qn8=;
 b=CllokThzkmyH2krO2HxgnALeK/+pxM/DOGnOJ8qInWozt8tLjenPItfkH0xCVvYulCRbwD
 u6gDstQHZBLi36u/CFM6vNjLLG6C+lasn2obwMDZmA8fqbCa/BIDxPqaHWYebjJQZkDsQm
 EMBXnympctSQo6YhN04yQrJPuUCJmnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-Pn1ELE20NC2rQ1gn31mqCA-1; Tue, 01 Feb 2022 09:43:27 -0500
X-MC-Unique: Pn1ELE20NC2rQ1gn31mqCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7EAD64093;
 Tue,  1 Feb 2022 14:43:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7804D7DE23;
 Tue,  1 Feb 2022 14:43:25 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/24] iotests: drop qemu_img_verbose() helper
Date: Tue,  1 Feb 2022 15:42:16 +0100
Message-Id: <20220201144233.617021-8-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

qemu_img_verbose() has a drawback of not going through generic
qemu_img_pipe_and_status(). qemu_img_verbose() is not very popular, so
update the only two users to qemu_img_log() and drop qemu_img_verbose()
at all.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211223160144.1097696-6-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/044        | 5 +++--
 tests/qemu-iotests/044.out    | 1 +
 tests/qemu-iotests/209        | 7 ++++---
 tests/qemu-iotests/209.out    | 2 ++
 tests/qemu-iotests/iotests.py | 8 --------
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index d696e6442a..a5ee9a7ded 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -24,7 +24,7 @@ import os
 import qcow2
 from qcow2 import QcowHeader
 import iotests
-from iotests import qemu_img, qemu_img_verbose, qemu_io
+from iotests import qemu_img, qemu_img_log, qemu_io
 import struct
 import subprocess
 import sys
@@ -112,10 +112,11 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
 
     def test_grow_refcount_table(self):
         qemu_io('-c', 'write 3800M 1M', test_img)
-        qemu_img_verbose('check' , test_img)
+        qemu_img_log('check' , test_img)
         pass
 
 if __name__ == '__main__':
+    iotests.activate_logging()
     iotests.main(supported_fmts=['qcow2'],
                  supported_protocols=['file'],
                  unsupported_imgopts=['refcount_bits'])
diff --git a/tests/qemu-iotests/044.out b/tests/qemu-iotests/044.out
index 703cf3dee1..ff663b17d7 100644
--- a/tests/qemu-iotests/044.out
+++ b/tests/qemu-iotests/044.out
@@ -1,6 +1,7 @@
 No errors were found on the image.
 7292415/33554432 = 21.73% allocated, 0.00% fragmented, 0.00% compressed clusters
 Image end offset: 4296217088
+
 .
 ----------------------------------------------------------------------
 Ran 1 tests
diff --git a/tests/qemu-iotests/209 b/tests/qemu-iotests/209
index ff7efea11b..f6ad08ec42 100755
--- a/tests/qemu-iotests/209
+++ b/tests/qemu-iotests/209
@@ -20,8 +20,8 @@
 #
 
 import iotests
-from iotests import qemu_img_create, qemu_io, qemu_img_verbose, qemu_nbd, \
-                    file_path
+from iotests import qemu_img_create, qemu_io, qemu_img_log, qemu_nbd, \
+                    file_path, log
 
 iotests.script_initialize(supported_fmts=['qcow2'])
 
@@ -33,4 +33,5 @@ qemu_img_create('-f', iotests.imgfmt, disk, '1M')
 qemu_io('-f', iotests.imgfmt, '-c', 'write 0 512K', disk)
 
 qemu_nbd('-k', nbd_sock, '-x', 'exp', '-f', iotests.imgfmt, disk)
-qemu_img_verbose('map', '-f', 'raw', '--output=json', nbd_uri)
+qemu_img_log('map', '-f', 'raw', '--output=json', nbd_uri)
+log('done.')  # avoid new line at the end of output file
diff --git a/tests/qemu-iotests/209.out b/tests/qemu-iotests/209.out
index f27be3fa7b..515906ac7a 100644
--- a/tests/qemu-iotests/209.out
+++ b/tests/qemu-iotests/209.out
@@ -1,2 +1,4 @@
 [{ "start": 0, "length": 524288, "depth": 0, "present": true, "zero": false, "data": true, "offset": 0},
 { "start": 524288, "length": 524288, "depth": 0, "present": true, "zero": true, "data": false, "offset": 524288}]
+
+done.
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 740f8be36b..cc4bbbcf7b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -235,14 +235,6 @@ def qemu_img_measure(*args):
 def qemu_img_check(*args):
     return json.loads(qemu_img_pipe("check", "--output", "json", *args))
 
-def qemu_img_verbose(*args):
-    '''Run qemu-img without suppressing its output and return the exit code'''
-    exitcode = subprocess.call(qemu_img_args + list(args))
-    if exitcode < 0:
-        sys.stderr.write('qemu-img received signal %i: %s\n'
-                         % (-exitcode, ' '.join(qemu_img_args + list(args))))
-    return exitcode
-
 def qemu_img_pipe(*args: str) -> str:
     '''Run qemu-img and return its output'''
     return qemu_img_pipe_and_status(*args)[0]
-- 
2.34.1


