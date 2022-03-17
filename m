Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C419B4DD184
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 00:53:56 +0100 (CET)
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUzwJ-000787-Ry
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 19:53:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsT-0001iU-VT
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsP-0005gf-3x
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647560990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39TGOxPsVuhP8xMT9XZkedXeti4XmNk28goYPNgLQao=;
 b=SbFK44WSOo3PzJo2eNgGVGbCTOp/KajZUSj4emejE8Gz0S4tNeq+MntOuTgOAsroUJUNML
 eByVtdlqU7bqva5GwYpcwjAsVkYZPrbLDuW0O1+XzLIPSkABH+UFt0Ap4YzS7bDpTADLlt
 yYZDqAMv+P9cI/JPSLILfBFbdDltHEM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-ek8c9tveP_OA2Uji8gaLsw-1; Thu, 17 Mar 2022 19:49:44 -0400
X-MC-Unique: ek8c9tveP_OA2Uji8gaLsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49A6410115F3;
 Thu, 17 Mar 2022 23:49:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E983E112C256;
 Thu, 17 Mar 2022 23:49:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/18] iotests: make qemu_img raise on non-zero rc by
 default
Date: Thu, 17 Mar 2022 19:49:23 -0400
Message-Id: <20220317234937.569525-5-jsnow@redhat.com>
In-Reply-To: <20220317234937.569525-1-jsnow@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

re-write qemu_img() as a function that will by default raise a
VerboseProcessException (extended from CalledProcessException) on
non-zero return codes. This will produce a stack trace that will show
the command line arguments and return code from the failed process run.

Users that want something more flexible (there appears to be only one)
can use check=False and manage the return themselves. However, when the
return code is negative, the Exception will be raised no matter what.
This is done under the belief that there's no legitimate reason, even in
negative tests, to see a crash from qemu-img.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/257        |  8 +++--
 tests/qemu-iotests/iotests.py | 56 ++++++++++++++++++++++++++++++-----
 2 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index fb5359c581..e7e7a2317e 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -241,11 +241,13 @@ def compare_images(image, reference, baseimg=None, expected_match=True):
     expected_ret = 0 if expected_match else 1
     if baseimg:
         qemu_img("rebase", "-u", "-b", baseimg, '-F', iotests.imgfmt, image)
-    ret = qemu_img("compare", image, reference)
+
+    sub = qemu_img("compare", image, reference, check=False)
+
     log('qemu_img compare "{:s}" "{:s}" ==> {:s}, {:s}'.format(
         image, reference,
-        "Identical" if ret == 0 else "Mismatch",
-        "OK!" if ret == expected_ret else "ERROR!"),
+        "Identical" if sub.returncode == 0 else "Mismatch",
+        "OK!" if sub.returncode == expected_ret else "ERROR!"),
         filters=[iotests.filter_testfiles])
 
 def test_bitmap_sync(bsync_mode, msync_mode='bitmap', failure=None):
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 508adade9e..ec4568b24a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -37,9 +37,10 @@
 
 from contextlib import contextmanager
 
+from qemu.aqmp.legacy import QEMUMonitorProtocol
 from qemu.machine import qtest
 from qemu.qmp import QMPMessage
-from qemu.aqmp.legacy import QEMUMonitorProtocol
+from qemu.utils import VerboseProcessError
 
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
@@ -215,9 +216,49 @@ def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     return qemu_tool_pipe_and_status('qemu-img', full_args,
                                      drop_successful_output=is_create)
 
-def qemu_img(*args: str) -> int:
-    '''Run qemu-img and return the exit code'''
-    return qemu_img_pipe_and_status(*args)[1]
+def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
+             ) -> subprocess.CompletedProcess[str]:
+    """
+    Run qemu_img and return the status code and console output.
+
+    This function always prepends QEMU_IMG_OPTIONS and may further alter
+    the args for 'create' commands.
+
+    :param args: command-line arguments to qemu-img.
+    :param check: Enforce a return code of zero.
+    :param combine_stdio: set to False to keep stdout/stderr separated.
+
+    :raise VerboseProcessError:
+        When the return code is negative, or on any non-zero exit code
+        when 'check=True' was provided (the default). This exception has
+        'stdout', 'stderr', and 'returncode' properties that may be
+        inspected to show greater detail. If this exception is not
+        handled, the command-line, return code, and all console output
+        will be included at the bottom of the stack trace.
+
+    :return: a CompletedProcess. This object has args, returncode, and
+        stdout properties. If streams are not combined, it will also
+        have a stderr property.
+    """
+    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
+
+    subp = subprocess.run(
+        full_args,
+        stdout=subprocess.PIPE,
+        stderr=subprocess.STDOUT if combine_stdio else subprocess.PIPE,
+        universal_newlines=True,
+        check=False
+    )
+
+    if check and subp.returncode or (subp.returncode < 0):
+        raise VerboseProcessError(
+            subp.returncode, full_args,
+            output=subp.stdout,
+            stderr=subp.stderr,
+        )
+
+    return subp
+
 
 def ordered_qmp(qmsg, conv_keys=True):
     # Dictionaries are not ordered prior to 3.6, therefore:
@@ -232,7 +273,7 @@ def ordered_qmp(qmsg, conv_keys=True):
         return od
     return qmsg
 
-def qemu_img_create(*args):
+def qemu_img_create(*args: str) -> subprocess.CompletedProcess[str]:
     return qemu_img('create', *args)
 
 def qemu_img_measure(*args):
@@ -467,8 +508,9 @@ def qemu_nbd_popen(*args):
 
 def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
     '''Return True if two image files are identical'''
-    return qemu_img('compare', '-f', fmt1,
-                    '-F', fmt2, img1, img2) == 0
+    res = qemu_img('compare', '-f', fmt1,
+                   '-F', fmt2, img1, img2, check=False)
+    return res.returncode == 0
 
 def create_image(name, size):
     '''Create a fully-allocated raw image with sector markers'''
-- 
2.34.1


