Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A64DD1A1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 01:08:35 +0100 (CET)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV0AU-0001s1-DN
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 20:08:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsV-0001j1-0D
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsP-0005i7-QS
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647560993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PgSRR5aAbBhCGPg0IU8t2mFunJb3MuutePQbNxIrROA=;
 b=dvka/oNL4sUiWcPkN6bDzWE7A0d4HPIH1aVwTREgPN+MHd/5uXc6p5/X0XEeCC3dOzGntJ
 x5fLMoEYqrSyAJaRuNmkM1PJ4CGk9YKtVwXKprbZvSJLGL+nr053T92Wm5VhrrM77wGrJd
 tq619g0C6CobBrIM/1AJRML34ctlj2g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-X4fKHbJuM_uONE5xUVSMHg-1; Thu, 17 Mar 2022 19:49:50 -0400
X-MC-Unique: X4fKHbJuM_uONE5xUVSMHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A811D3C01C09;
 Thu, 17 Mar 2022 23:49:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51246112C256;
 Thu, 17 Mar 2022 23:49:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/18] iotests: remove qemu_img_pipe_and_status()
Date: Thu, 17 Mar 2022 19:49:36 -0400
Message-Id: <20220317234937.569525-18-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 8491ff0477..c75c7470e2 100644
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
              ) -> subprocess.CompletedProcess[str]:
     """
@@ -320,17 +311,14 @@ def qemu_img_info(*args: str) -> Any:
 def qemu_img_map(*args: str) -> Any:
     return qemu_img_json('map', "--output", "json", *args)
 
-def qemu_img_pipe(*args: str) -> str:
-    '''Run qemu-img and return its output'''
-    return qemu_img_pipe_and_status(*args)[0]
-
-def qemu_img_log(*args):
-    result = qemu_img_pipe(*args)
-    log(result, filters=[filter_testfiles])
+def qemu_img_log(*args: str) -> subprocess.CompletedProcess[str]:
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
@@ -339,7 +327,7 @@ def img_info_log(filename, filter_path=None, use_image_opts=False,
     args += extra_args
     args.append(filename)
 
-    output = qemu_img_pipe(*args)
+    output = qemu_img(*args, check=False).stdout
     if not filter_path:
         filter_path = filename
     log(filter_img_info(output, filter_path))
-- 
2.34.1


