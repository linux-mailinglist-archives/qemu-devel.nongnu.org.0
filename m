Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D699F4E3E34
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:13:41 +0100 (CET)
Received: from localhost ([::1]:44060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdOO-0005ZF-U3
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:13:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8k-0003Pk-2c
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8i-0006X5-87
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hxa0Atc6mxnf9pqzb/UvncJLg3k9vxIvOUSksLw490c=;
 b=D5WfNAquNZfQ5qu2ZTGxiAuSpRItq3nZuWNqe6ZFap0JDVIxamMIh8vvwZqVAYzjFG1lVk
 qu517iEaONqQ/SAM/QaDIPY/5nwHJt/rB7L0XIIPINWivOoU7LsCENchiz8voVoalYZJt/
 gLqdz4gtqSdU5V+hIkfKuQnuE8iFmMA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-tGbnybd6O0GY689aOvku7w-1; Tue, 22 Mar 2022 07:57:26 -0400
X-MC-Unique: tGbnybd6O0GY689aOvku7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CA973801EC4;
 Tue, 22 Mar 2022 11:57:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 068B61121314;
 Tue, 22 Mar 2022 11:57:25 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/25] iotests: remove qemu_img_pipe_and_status()
Date: Tue, 22 Mar 2022 12:56:44 +0100
Message-Id: <20220322115647.726044-23-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

With the exceptional 'create' calls removed in the prior commit, change
qemu_img_log() and img_info_log() to call qemu_img() directly
instead.

For now, allow these calls to qemu-img to return non-zero on the basis
that any unusual output will be logged anyway. The very next commit
begins to enforce a successful exit code by default even for the logged
functions.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20220321201618.903471-18-jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.35.1


