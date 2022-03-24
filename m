Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A451D4E68DE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:50:45 +0100 (CET)
Received: from localhost ([::1]:47140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSXk-0005co-Gv
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:50:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEK-0000EF-IU
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEH-0005kU-Jf
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J82BdccsAPlWZOlAR+ctbS4l+I+tT6QIbxyZ5rWyjik=;
 b=E0xorQNumsA/jdHmAMNDInEvs3cyDNQU+32yTWwcL55dLqyyKcr5likk4fAmAOZ7odgkei
 66Vt/xZD6W45/RWRMOsM2MXIRvJ7h39dVjkTZnpJ24HesNJh9ljiFRFbjZLnKlSoh9gn0t
 gUPXFBfVGeHmPpGOFvAJNwKjF+IN/+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-UuDjdutIO1OFyO9MDciJUg-1; Thu, 24 Mar 2022 14:30:32 -0400
X-MC-Unique: UuDjdutIO1OFyO9MDciJUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2947B100B8EA;
 Thu, 24 Mar 2022 18:30:32 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 195D1C26EA0;
 Thu, 24 Mar 2022 18:30:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/17] iotests: create generic qemu_tool() function
Date: Thu, 24 Mar 2022 14:30:07 -0400
Message-Id: <20220324183018.2476551-7-jsnow@redhat.com>
In-Reply-To: <20220324183018.2476551-1-jsnow@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
index fcec3e51e5..e4e18a5889 100644
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


