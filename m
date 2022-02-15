Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD114B7A73
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:29:11 +0100 (CET)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6Jq-0003hu-79
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:29:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK60T-0003zn-8I
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:09:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK60R-0006Lh-FQ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644962947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6E7zby3oOyKUvuxJTTCy10BDB8KavoelnjEIqI4Vho=;
 b=K/OrHi8bc8bXUEViRyTEjOYipR52MGlDz89yl+sqQBZw980t12fuEbMeknJbKnJL9HsGbc
 YT64Snb9asUbhziKVqGz0LNwGe2E1/csE66UyCNF/NW1GN3nQ4pgXZzYkBEOibQdyKIqQo
 uqRGOlmC3VeL+9Bqux1vlAu+kfO2Xc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-HxwVF4HONYO0-TjZowQg2Q-1; Tue, 15 Feb 2022 17:09:03 -0500
X-MC-Unique: HxwVF4HONYO0-TjZowQg2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98854180E47D;
 Tue, 15 Feb 2022 22:09:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 864061059A77;
 Tue, 15 Feb 2022 22:09:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] iotests: make qemu_img raise on non-zero rc by default
Date: Tue, 15 Feb 2022 17:08:53 -0500
Message-Id: <20220215220853.4179173-5-jsnow@redhat.com>
In-Reply-To: <20220215220853.4179173-1-jsnow@redhat.com>
References: <20220215220853.4179173-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

re-configure qemu_img() into a function that will by default raise a
VerboseProcessException (extended from CalledProcessException) on
non-zero return codes. This will produce a stack trace that will show
the command line arguments and return code from the failed process run.

Users that want something more flexible (There appears to be only one)
can use check=False and manage the return themselves.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/257        |  8 ++++--
 tests/qemu-iotests/iotests.py | 53 +++++++++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index fb5359c581e..e7e7a2317e3 100755
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
index 7df393df2c3..8a244fafece 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -249,9 +249,51 @@ def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     return qemu_tool_pipe_and_status('qemu-img', full_args,
                                      drop_successful_output=is_create)
 
-def qemu_img(*args: str) -> int:
-    '''Run qemu-img and return the exit code'''
-    return qemu_img_pipe_and_status(*args)[1]
+def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
+             ) -> subprocess.CompletedProcess[str]:
+    """
+    Run qemu_img, returning a CompletedProcess instance.
+
+    The CompletedProcess object has args, returncode, and output properties.
+    If streams are not combined, It will also have stdout/stderr properties.
+
+    :param args: command-line arguments to qemu_img.
+    :param check: set to False to suppress VerboseProcessError.
+    :param combine_stdio: set to False to keep stdout/stderr separated.
+
+    :raise VerboseProcessError:
+        On non-zero exit code, when 'check=True' was provided. This
+        exception has 'stderr', 'stdout' and 'returncode' properties
+        that may be inspected to show greater detail. If this exception
+        is not handled, The command-line, return code, and all console
+        output will be included at the bottom of the stack trace.
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
+    # For behavioral consistency with qemu_tool_pipe_and_status():
+    # Print out an immediate error when the return code is negative.
+    if subp.returncode < 0:
+        cmd = ' '.join(full_args)
+        sys.stderr.write(
+            f'qemu-img received signal {-subp.returncode}: {cmd}\n')
+
+    if check and subp.returncode:
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
@@ -469,8 +511,9 @@ def qemu_nbd_popen(*args):
 
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


