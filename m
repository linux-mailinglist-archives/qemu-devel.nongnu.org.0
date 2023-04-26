Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B96EEDD3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAB-00068S-2j; Wed, 26 Apr 2023 01:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA3-00064x-Vg
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA1-0002kp-5U
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xWPqYOxbMMcQQ0xbZRErVJpecR93so7hYbagKc2EfA=;
 b=fM0qPO543V3spLTMejw6IuJivM8DO29gWE6BFHBgW6iH434WJWsE/F/Nn0P8ibDnwu30sm
 IQ/wA6oMYxsvBFUBjDSV/KIssoO9mVK0yACCqoJWX+sYKKWmdlyIYQmtWTtSOcr91NTZni
 3SHlGseo0vhJFKMmwpF+1ev3duu0XKk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-nKHmebk0PCWVRSb-dtXn3Q-1; Wed, 26 Apr 2023 01:57:46 -0400
X-MC-Unique: nKHmebk0PCWVRSb-dtXn3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8942E3C0C89F;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D1F540C2064;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F89C21F9817; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Eric Blake <eblake@redhat.com>
Subject: [PULL 08/17] qapi: Fix to reject 'data': 'mumble' in struct
Date: Wed, 26 Apr 2023 07:57:35 +0200
Message-Id: <20230426055744.1041930-9-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A struct's 'data' must be a JSON object defining the struct's members.
The QAPI code generator incorrectly accepts a JSON string instead, and
then crashes in QAPISchema._make_members() called from
._def_struct_type().

Fix to reject it: factor check_type_implicit() out of
check_type_name_or_implicit(), and switch check_struct() to use it
instead.  Also add a test case.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230316071325.492471-9-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[More detailed commit message]
---
 scripts/qapi/expr.py                        | 24 +++++++++++++--------
 tests/qapi-schema/meson.build               |  1 +
 tests/qapi-schema/struct-data-typename.err  |  2 ++
 tests/qapi-schema/struct-data-typename.json |  2 ++
 tests/qapi-schema/struct-data-typename.out  |  0
 5 files changed, 20 insertions(+), 9 deletions(-)
 create mode 100644 tests/qapi-schema/struct-data-typename.err
 create mode 100644 tests/qapi-schema/struct-data-typename.json
 create mode 100644 tests/qapi-schema/struct-data-typename.out

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 9bae500a7d..cae0a08359 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -354,14 +354,14 @@ def check_type_name_or_array(value: Optional[object],
                            source)
 
 
-def check_type_name_or_implicit(value: Optional[object],
-                                info: QAPISourceInfo, source: str,
-                                parent_name: Optional[str]) -> None:
+def check_type_implicit(value: Optional[object],
+                        info: QAPISourceInfo, source: str,
+                        parent_name: Optional[str]) -> None:
     """
     Normalize and validate an optional implicit struct type.
 
-    Accept ``None``, ``str``, or a ``dict`` defining an implicit
-    struct type.  The latter is normalized in place.
+    Accept ``None`` or a ``dict`` defining an implicit struct type.
+    The latter is normalized in place.
 
     :param value: The value to check.
     :param info: QAPI schema source file information.
@@ -377,9 +377,6 @@ def check_type_name_or_implicit(value: Optional[object],
     if value is None:
         return
 
-    if isinstance(value, str):
-        return
-
     if not isinstance(value, dict):
         raise QAPISemError(info,
                            "%s should be an object or type name" % source)
@@ -401,6 +398,15 @@ def check_type_name_or_implicit(value: Optional[object],
         check_type_name_or_array(arg['type'], info, key_source)
 
 
+def check_type_name_or_implicit(value: Optional[object],
+                                info: QAPISourceInfo, source: str,
+                                parent_name: Optional[str]) -> None:
+    if value is None or isinstance(value, str):
+        return
+
+    check_type_implicit(value, info, source, parent_name)
+
+
 def check_features(features: Optional[object],
                    info: QAPISourceInfo) -> None:
     """
@@ -486,7 +492,7 @@ def check_struct(expr: QAPIExpression) -> None:
     name = cast(str, expr['struct'])  # Checked in check_exprs
     members = expr['data']
 
-    check_type_name_or_implicit(members, expr.info, "'data'", name)
+    check_type_implicit(members, expr.info, "'data'", name)
     check_type_name(expr.get('base'), expr.info, "'base'")
 
 
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index d85b14f28c..f88110bddf 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -164,6 +164,7 @@ schemas = [
   'struct-base-clash-deep.json',
   'struct-base-clash.json',
   'struct-data-invalid.json',
+  'struct-data-typename.json',
   'struct-member-if-invalid.json',
   'struct-member-invalid-dict.json',
   'struct-member-invalid.json',
diff --git a/tests/qapi-schema/struct-data-typename.err b/tests/qapi-schema/struct-data-typename.err
new file mode 100644
index 0000000000..8fbfe99a42
--- /dev/null
+++ b/tests/qapi-schema/struct-data-typename.err
@@ -0,0 +1,2 @@
+struct-data-typename.json: In struct 'Stru2':
+struct-data-typename.json:2: 'data' should be an object or type name
diff --git a/tests/qapi-schema/struct-data-typename.json b/tests/qapi-schema/struct-data-typename.json
new file mode 100644
index 0000000000..70fbad0ee4
--- /dev/null
+++ b/tests/qapi-schema/struct-data-typename.json
@@ -0,0 +1,2 @@
+{ 'struct': 'Stru1', 'data': {} }
+{ 'struct': 'Stru2', 'data': 'Stru1' }
diff --git a/tests/qapi-schema/struct-data-typename.out b/tests/qapi-schema/struct-data-typename.out
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.39.2


