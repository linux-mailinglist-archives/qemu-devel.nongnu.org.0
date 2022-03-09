Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A44D2656
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 05:04:13 +0100 (CET)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnYa-0005vy-IX
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 23:04:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPK-0002mn-9p
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPI-0002wl-HR
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646798075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYhTiv8EGWprPlhggPHWjxdAzIcQTsasbcjM/7beeo8=;
 b=InofcGCWHFV3DShVcuEAZK4B5w5eBZjK577Eho7DmqlZYBwkMgDhs4c9xUWgo9pVrJxsAs
 LojoIRKfVH1d4rh+qDLLPDZfa0sw3QikLoND+aoXYNVeq0p4zoeWbn6wRNsDBspQG+bKHT
 I0bkc50FaFVAjjYPzkKZ02OHMtbzCZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-f_v0Jl6UPoug6bPxmfNV0A-1; Tue, 08 Mar 2022 22:54:32 -0500
X-MC-Unique: f_v0Jl6UPoug6bPxmfNV0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DED8F1854E21;
 Wed,  9 Mar 2022 03:54:31 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 339D66C1A9;
 Wed,  9 Mar 2022 03:54:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/14] iotests: remove qemu_img_pipe_and_status()
Date: Tue,  8 Mar 2022 22:54:05 -0500
Message-Id: <20220309035407.1848654-13-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the exceptional 'create' calls removed in the prior commit, change
qemu_img_log() and img_info_log() to call qemu_img() directly
instead.

In keeping with the spirit of diff-based tests, allow these calls to
qemu_img() to return an unchecked non-zero status code -- because any
error we'd see from the output is going into the log anyway.

Every last call to qemu-img is now either checked for a return code of
zero or has its output logged. It should be very hard to accidentally
ignore the return code *or* output from qemu-img now; intentional malice
remains unhandled.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1b6e28ba64..f8d966cd73 100644
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
@@ -326,17 +317,14 @@ def qemu_img_info(*args: str) -> Any:
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
@@ -345,7 +333,7 @@ def img_info_log(filename, filter_path=None, use_image_opts=False,
     args += extra_args
     args.append(filename)
 
-    output = qemu_img_pipe(*args)
+    output = qemu_img(*args, check=False).stdout
     if not filter_path:
         filter_path = filename
     log(filter_img_info(output, filter_path))
-- 
2.34.1


