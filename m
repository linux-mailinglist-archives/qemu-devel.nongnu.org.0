Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437624E31C7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:30:01 +0100 (CET)
Received: from localhost ([::1]:39098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOfA-0004ad-Be
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:30:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOSB-0006Ly-EG
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS6-0001lW-3V
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfTH8zk4EXalFNycb1zJXBJANpEx2IcFSv4cylYj6gI=;
 b=FyCEtQMKQT6AYMUDy4WD4ctmK8Ziv28eCcC+o4SXdjKfQ0Zd2GDR6wxkbZdCVlMdlhaOWS
 4nYLei++rPK4mTwkTEzim4wdeWXtLr1QH6sk/1ccdBc6/ArWowE/PBsei/fQ0LmS9iVdio
 A1B3euQdIdMtyH2dYdwCIb5d+way7R0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-TUfH9M1pOWKqEuSVbvSskw-1; Mon, 21 Mar 2022 16:16:28 -0400
X-MC-Unique: TUfH9M1pOWKqEuSVbvSskw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC60C80005D;
 Mon, 21 Mar 2022 20:16:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69B23454D60;
 Mon, 21 Mar 2022 20:16:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/18] iotests: make qemu_img_log and img_info_log raise on
 error
Date: Mon, 21 Mar 2022 16:16:18 -0400
Message-Id: <20220321201618.903471-19-jsnow@redhat.com>
In-Reply-To: <20220321201618.903471-1-jsnow@redhat.com>
References: <20220321201618.903471-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

Add a `check: bool = True` parameter to both functions and make their
qemu_img() invocations raise on error by default.

users of img_info_log:
206, 207, 210, 211, 212, 213, 237, 242, 266, 274, 302

users of qemu_img_log:
044, 209, 274, 302, 304

iotests 242 and 266 need to use check=False for their negative tests.
iotests 206, 210, 211, 212, 213, 237, 274 and 302 continue working
normally.

As of this commit, all calls to QEMU_IMG made from iotests enforce a
return code of zero by default unless explicitly disabled or suppressed
by passing check=False or with an exception handler.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/242        | 2 +-
 tests/qemu-iotests/266        | 2 +-
 tests/qemu-iotests/iotests.py | 8 +++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index 547bf382e3..b3afd36d72 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -100,7 +100,7 @@ add_bitmap(1, True, False)
 log('Write an unknown bitmap flag \'{}\' into a new QCOW2 image at offset {}'
     .format(hex(bitmap_flag_unknown), flag_offset))
 toggle_flag(flag_offset)
-img_info_log(disk)
+img_info_log(disk, check=False)
 toggle_flag(flag_offset)
 log('Unset the unknown bitmap flag \'{}\' in the bitmap directory entry:\n'
     .format(hex(bitmap_flag_unknown)))
diff --git a/tests/qemu-iotests/266 b/tests/qemu-iotests/266
index 71ce81d0df..8fc3807ac5 100755
--- a/tests/qemu-iotests/266
+++ b/tests/qemu-iotests/266
@@ -137,7 +137,7 @@ def main():
             iotests.log('')
 
             vm.shutdown()
-            iotests.img_info_log(file_path)
+            iotests.img_info_log(file_path, check=False)
 
 
 iotests.script_main(main,
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1771d01977..4b788c7491 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -312,13 +312,15 @@ def qemu_img_info(*args: str) -> Any:
 def qemu_img_map(*args: str) -> Any:
     return qemu_img_json('map', "--output", "json", *args)
 
-def qemu_img_log(*args: str) -> 'subprocess.CompletedProcess[str]':
-    result = qemu_img(*args, check=False)
+def qemu_img_log(*args: str, check: bool = True
+                 ) -> 'subprocess.CompletedProcess[str]':
+    result = qemu_img(*args, check=check)
     log(result.stdout, filters=[filter_testfiles])
     return result
 
 def img_info_log(filename: str, filter_path: Optional[str] = None,
                  use_image_opts: bool = False, extra_args: Sequence[str] = (),
+                 check: bool = True,
                  ) -> None:
     args = ['info']
     if use_image_opts:
@@ -328,7 +330,7 @@ def img_info_log(filename: str, filter_path: Optional[str] = None,
     args += extra_args
     args.append(filename)
 
-    output = qemu_img(*args, check=False).stdout
+    output = qemu_img(*args, check=check).stdout
     if not filter_path:
         filter_path = filename
     log(filter_img_info(output, filter_path))
-- 
2.34.1


