Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDEC505F46
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 23:22:21 +0200 (CEST)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngYpA-0001Ym-Av
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 17:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiW-0001Ip-Sw
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiS-0004nj-1o
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650316516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=erlHxolLwAjh9ALZeny1HftdPKGfdFqkLWwzZhrYkBQ=;
 b=GN0j0cK9fHLK0m9N0BBqUNIwcXhBxAI45l9YbYky+ZJwU5v90Rm8Y0hPJW5acCOV1Nx5d2
 koDae7MgMXJsb5E2x1h//qAy964xT4cavsXCxxCLb1XrjI1DUO9syY5Ncwb5eNcX4PCO2t
 awgujssU9OVjHckCbcpmkkNmqWlz/kE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-GJOUnww9NoC1h8iEjYBAMQ-1; Mon, 18 Apr 2022 17:15:15 -0400
X-MC-Unique: GJOUnww9NoC1h8iEjYBAMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A658E101AA42;
 Mon, 18 Apr 2022 21:15:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63A54215CDCA;
 Mon, 18 Apr 2022 21:15:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/12] iotests: create generic qemu_tool() function
Date: Mon, 18 Apr 2022 17:14:58 -0400
Message-Id: <20220418211504.943969-7-jsnow@redhat.com>
In-Reply-To: <20220418211504.943969-1-jsnow@redhat.com>
References: <20220418211504.943969-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

reimplement qemu_img() in terms of qemu_tool() in preparation for doing
the same with qemu_io().

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index fcec3e51e51..e4e18a5889d 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -207,15 +207,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
 
     return result
 
-def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
-             ) -> 'subprocess.CompletedProcess[str]':
+
+def qemu_tool(*args: str, check: bool = True, combine_stdio: bool = True
+              ) -> 'subprocess.CompletedProcess[str]':
     """
-    Run qemu_img and return the status code and console output.
+    Run a qemu tool and return its status code and console output.
 
-    This function always prepends QEMU_IMG_OPTIONS and may further alter
-    the args for 'create' commands.
-
-    :param args: command-line arguments to qemu-img.
+    :param args: full command line to run.
     :param check: Enforce a return code of zero.
     :param combine_stdio: set to False to keep stdout/stderr separated.
 
@@ -232,10 +230,8 @@ def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
         properties. If streams are not combined, it will also have a
         stderr property.
     """
-    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
-
     subp = subprocess.run(
-        full_args,
+        args,
         stdout=subprocess.PIPE,
         stderr=subprocess.STDOUT if combine_stdio else subprocess.PIPE,
         universal_newlines=True,
@@ -244,7 +240,7 @@ def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
 
     if check and subp.returncode or (subp.returncode < 0):
         raise VerboseProcessError(
-            subp.returncode, full_args,
+            subp.returncode, args,
             output=subp.stdout,
             stderr=subp.stderr,
         )
@@ -252,6 +248,20 @@ def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
     return subp
 
 
+def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
+             ) -> 'subprocess.CompletedProcess[str]':
+    """
+    Run QEMU_IMG_PROG and return its status code and console output.
+
+    This function always prepends QEMU_IMG_OPTIONS and may further alter
+    the args for 'create' commands.
+
+    See `qemu_tool()` for greater detail.
+    """
+    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
+    return qemu_tool(*full_args, check=check, combine_stdio=combine_stdio)
+
+
 def ordered_qmp(qmsg, conv_keys=True):
     # Dictionaries are not ordered prior to 3.6, therefore:
     if isinstance(qmsg, list):
-- 
2.34.1


