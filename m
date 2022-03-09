Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD1B4D2655
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 05:04:03 +0100 (CET)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnYQ-0005Xs-TR
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 23:04:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPS-0003GZ-AN
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPQ-0002xv-P1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646798084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ry1ENCgZDPUVVTcMkZ3v+26XUHnErnWXaNZgkRXd0Pk=;
 b=W9yew4ZUfbJLq7wNvN3GuG/HOi1nkDeM/g8rnVTTexdonloxMftPn1hBMaAn8OEOsCezN8
 bVbQH1GoVj3hToLlJ4PEW5CQUd2cpL7igkX0ybDnE1jJFc1NoMLI3JKd7YGnhX1YNYf2S/
 okWKtZk7zFEMHiveXzpfQhBUMnhK2bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-IersrFBrNK6pKXKEHh6l5w-1; Tue, 08 Mar 2022 22:54:43 -0500
X-MC-Unique: IersrFBrNK6pKXKEHh6l5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 036B71854E26;
 Wed,  9 Mar 2022 03:54:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48F306C180;
 Wed,  9 Mar 2022 03:54:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/14] iotests: make img_info_log() call qemu_img_log()
Date: Tue,  8 Mar 2022 22:54:07 -0500
Message-Id: <20220309035407.1848654-15-jsnow@redhat.com>
In-Reply-To: <20220309035407.1848654-1-jsnow@redhat.com>
References: <20220309035407.1848654-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add configurable filters to qemu_img_log(), and re-write img_info_log()
to call into qemu_img_log() with a custom filter instead.

After this patch, every last call to qemu_img() is now guaranteed to
either have its return code checked for zero, OR have its output
actually visibly logged somewhere.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6af503058f..0c69327c00 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -317,10 +317,14 @@ def qemu_img_info(*args: str) -> Any:
 def qemu_img_map(*args: str) -> Any:
     return qemu_img_json('map', "--output", "json", *args)
 
-def qemu_img_log(*args: str) -> subprocess.CompletedProcess[str]:
+def qemu_img_log(
+        *args: str,
+        filters: Iterable[Callable[[str], str]] = (),
+) -> subprocess.CompletedProcess[str]:
     """
     Logged, unchecked variant of qemu_img() that allows non-zero exit codes.
 
+    By default, output will be filtered through filter_testfiles().
     If logging is perceived to be disabled, this function will fall back
     to prohibiting non-zero return codes.
 
@@ -331,7 +335,7 @@ def qemu_img_log(*args: str) -> subprocess.CompletedProcess[str]:
     :return: a CompletedProcess instance with returncode and console output.
     """
     result = qemu_img(*args, check=not logging_enabled())
-    log(result.stdout, filters=[filter_testfiles])
+    log(result.stdout, filters=filters or [filter_testfiles])
     return result
 
 def img_info_log(filename: str, filter_path: Optional[str] = None,
@@ -345,10 +349,11 @@ def img_info_log(filename: str, filter_path: Optional[str] = None,
     args += extra_args
     args.append(filename)
 
-    output = qemu_img(*args, check=False).stdout
     if not filter_path:
         filter_path = filename
-    log(filter_img_info(output, filter_path))
+    qemu_img_log(
+        *args,
+        filters=[lambda output: filter_img_info(output, filter_path)])
 
 def qemu_io_wrap_args(args: Sequence[str]) -> List[str]:
     if '-f' in args or '--image-opts' in args:
-- 
2.34.1


