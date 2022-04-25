Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088F450E2F3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:21:59 +0200 (CEST)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizbC-0002gi-4b
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOJ-00055P-1D
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOH-0001yh-6q
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzFgDRpsqWvATTHZbBNfuBzm7uWVHHVkHtNIloMnHVs=;
 b=Z9cZOrOxnFj5aUPnPYBjNm0p4xKd+gx1pgfSD/PX5RrSOY1Mk2sZtGQO7uOSkHXPCZDClx
 w6PFwGxv7pCxmeB6eJEgvi0zvH8rfDeeD/4AJgYvi4NarcxKVukhE69b9lzIZ9AX+l5Hwz
 K8RjfwbubVm1/YF8jmiWDSW/4yneOdE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-ioSka_RzPBavRgEKZChWDg-1; Mon, 25 Apr 2022 10:08:35 -0400
X-MC-Unique: ioSka_RzPBavRgEKZChWDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 913D3811E78;
 Mon, 25 Apr 2022 14:08:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B517400F8F6;
 Mon, 25 Apr 2022 14:08:34 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/14] iotests: create generic qemu_tool() function
Date: Mon, 25 Apr 2022 16:08:14 +0200
Message-Id: <20220425140821.957511-8-hreitz@redhat.com>
In-Reply-To: <20220425140821.957511-1-hreitz@redhat.com>
References: <20220425140821.957511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

reimplement qemu_img() in terms of qemu_tool() in preparation for doing
the same with qemu_io().

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220418211504.943969-7-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 33a44671aa..6800c67bea 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -206,15 +206,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
 
     return result
 
-def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
-             ) -> 'subprocess.CompletedProcess[str]':
-    """
-    Run qemu_img and return the status code and console output.
 
-    This function always prepends QEMU_IMG_OPTIONS and may further alter
-    the args for 'create' commands.
+def qemu_tool(*args: str, check: bool = True, combine_stdio: bool = True
+              ) -> 'subprocess.CompletedProcess[str]':
+    """
+    Run a qemu tool and return its status code and console output.
 
-    :param args: command-line arguments to qemu-img.
+    :param args: full command line to run.
     :param check: Enforce a return code of zero.
     :param combine_stdio: set to False to keep stdout/stderr separated.
 
@@ -231,10 +229,8 @@ def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
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
@@ -243,7 +239,7 @@ def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
 
     if check and subp.returncode or (subp.returncode < 0):
         raise VerboseProcessError(
-            subp.returncode, full_args,
+            subp.returncode, args,
             output=subp.stdout,
             stderr=subp.stderr,
         )
@@ -251,6 +247,20 @@ def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
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
2.35.1


