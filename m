Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0734E31B5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:27:36 +0100 (CET)
Received: from localhost ([::1]:58390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOcp-00072M-Pj
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:27:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOSB-0006La-9I
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS5-0001lL-Re
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8BTP0xTHyJsNTepJudwLNiq8i42FMQJWIDSSes9wsNY=;
 b=VcZuSfiWpvelqTaTvRnY1zkqw/rBtTB+lSjHGY+Apj+gas3ASa/PkvOKKikkvxzfv+06F6
 2QtiYBZf8nh5CUAn2Jb6UMZ5SepVNQoEJouTnCL0lQxD4i3tuupT4mjrv6Bn+lsakb96uq
 hs9TBrei6RXftYoH9MbIOEtTAkNSoFk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-z0iuMp8QNR6wKAPTT9DltQ-1; Mon, 21 Mar 2022 16:16:27 -0400
X-MC-Unique: z0iuMp8QNR6wKAPTT9DltQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 580893C23FA0;
 Mon, 21 Mar 2022 20:16:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 070AF454D60;
 Mon, 21 Mar 2022 20:16:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/18] iotests: remove qemu_img_pipe_and_status()
Date: Mon, 21 Mar 2022 16:16:17 -0400
Message-Id: <20220321201618.903471-18-jsnow@redhat.com>
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

With the exceptional 'create' calls removed in the prior commit, change
qemu_img_log() and img_info_log() to call qemu_img() directly
instead.

For now, allow these calls to qemu-img to return non-zero on the basis
that any unusual output will be logged anyway. The very next commit
begins to enforce a successful exit code by default even for the logged
functions.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index d006f56127..1771d01977 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -207,15 +207,6 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
 
     return result
 
-def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
-    """
-    Run qemu-img and return both its output and its exit code
-    """
-    is_create = bool(args and args[0] == 'create')
-    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
-    return qemu_tool_pipe_and_status('qemu-img', full_args,
-                                     drop_successful_output=is_create)
-
 def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
              ) -> 'subprocess.CompletedProcess[str]':
     """
@@ -321,17 +312,14 @@ def qemu_img_info(*args: str) -> Any:
 def qemu_img_map(*args: str) -> Any:
     return qemu_img_json('map', "--output", "json", *args)
 
-def qemu_img_pipe(*args: str) -> str:
-    '''Run qemu-img and return its output'''
-    return qemu_img_pipe_and_status(*args)[0]
-
-def qemu_img_log(*args):
-    result = qemu_img_pipe(*args)
-    log(result, filters=[filter_testfiles])
+def qemu_img_log(*args: str) -> 'subprocess.CompletedProcess[str]':
+    result = qemu_img(*args, check=False)
+    log(result.stdout, filters=[filter_testfiles])
     return result
 
-def img_info_log(filename, filter_path=None, use_image_opts=False,
-                 extra_args=()):
+def img_info_log(filename: str, filter_path: Optional[str] = None,
+                 use_image_opts: bool = False, extra_args: Sequence[str] = (),
+                 ) -> None:
     args = ['info']
     if use_image_opts:
         args.append('--image-opts')
@@ -340,7 +328,7 @@ def img_info_log(filename, filter_path=None, use_image_opts=False,
     args += extra_args
     args.append(filename)
 
-    output = qemu_img_pipe(*args)
+    output = qemu_img(*args, check=False).stdout
     if not filter_path:
         filter_path = filename
     log(filter_img_info(output, filter_path))
-- 
2.34.1


