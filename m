Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4034DE2A3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:39:42 +0100 (CET)
Received: from localhost ([::1]:54198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJNs-00060z-Tx
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:39:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLK-0002GZ-De
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLH-0005Vo-SH
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUb41VY02U+Uhz3seQ+bxDve0B5jiBuop7l1o+z2L10=;
 b=GTA2/Vm2x3KVPqG5kM7uU7I45Jc8RMZLVK7eUoD586YMnxK4gY0azONuYDSZLRLEl2peUN
 NqNidErOahIw1ah5+zl4VrTjCvpEpwtO9XT0gHfh2dWuMefsof/phmhV65PV4L29ojhpKo
 MeFFWEt68s3nYSmAamADh/EGrXS/7tg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-j4JPnC4EMU6HwUwkOWlPWQ-1; Fri, 18 Mar 2022 16:36:58 -0400
X-MC-Unique: j4JPnC4EMU6HwUwkOWlPWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD3D0801585;
 Fri, 18 Mar 2022 20:36:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F6FE403373;
 Fri, 18 Mar 2022 20:36:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/15] iotests: rebase qemu_io() on top of qemu_tool()
Date: Fri, 18 Mar 2022 16:36:46 -0400
Message-Id: <20220318203655.676907-7-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rework qemu_io() to be analogous to qemu_img(); a function that requires
a return code of zero by default unless disabled explicitly.

Tests that use qemu_io():
030 040 041 044 055 056 093 124 129 132 136 148 149 151 152 163 165 205
209 219 236 245 248 254 255 257 260 264 280 298 300 302 304
image-fleecing migrate-bitmaps-postcopy-test migrate-bitmaps-test
migrate-during-backup migration-permissions

Test that use qemu_io_log():
242 245 255 274 303 307 nbd-reconnect-on-open

Signed-off-by: John Snow <jsnow@redhat.com>

---

Note: This breaks several tests at this point. I'll be fixing each
broken test one by one in the subsequent commits. We can squash them all
on merge to avoid test regressions.

(Seems like a way to have your cake and eat it too with regards to
maintaining bisectability while also having nice mailing list patches.)

Copy-pastables:

./check -qcow2 030 040 041 044 055 056 124 129 132 151 152 163 165 209 \
               219 236 242 245 248 254 255 257 260 264 274 \
               280 298 300 302 303 304 307 image-fleecing \
               migrate-bitmaps-postcopy-test migrate-bitmaps-test \
               migrate-during-backup nbd-reconnect-on-open

./check -raw 093 136 148 migration-permissions

./check -nbd 205

# ./configure configure --disable-gnutls --enable-gcrypt
# this ALSO requires passwordless sudo.
./check -luks 149


# Just the ones that fail:
./check -qcow2 030 040 242 245
./check -raw migration-permissions
./check -nbd 205
./check -luks 149

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 974a2b0c8d..58ea766568 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -354,16 +354,23 @@ def qemu_io_wrap_args(args: Sequence[str]) -> List[str]:
 def qemu_io_popen(*args):
     return qemu_tool_popen(qemu_io_wrap_args(args))
 
-def qemu_io(*args):
-    '''Run qemu-io and return the stdout data'''
-    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
+def qemu_io(*args: str, check: bool = True, combine_stdio: bool = True
+            ) -> subprocess.CompletedProcess[str]:
+    """
+    Run QEMU_IO_PROG and return the status code and console output.
+
+    This function always prepends either QEMU_IO_OPTIONS or
+    QEMU_IO_OPTIONS_NO_FMT.
+    """
+    return qemu_tool(*qemu_io_wrap_args(args),
+                     check=check, combine_stdio=combine_stdio)
 
 def qemu_io_pipe_and_status(*args):
     return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))
 
-def qemu_io_log(*args):
-    result = qemu_io(*args)
-    log(result, filters=[filter_testfiles, filter_qemu_io])
+def qemu_io_log(*args: str) -> subprocess.CompletedProcess[str]:
+    result = qemu_io(*args, check=False)
+    log(result.stdout, filters=[filter_testfiles, filter_qemu_io])
     return result
 
 def qemu_io_silent(*args):
-- 
2.34.1


