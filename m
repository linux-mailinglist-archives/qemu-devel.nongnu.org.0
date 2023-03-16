Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30696BC6BB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:14:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pchoC-0003qJ-NJ; Thu, 16 Mar 2023 03:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnw-0003lt-O9
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnq-0004Ye-1W
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678950811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BC4ChxiWp8BemgmqKQbdUo68On4aRvL0LpimWfx2uuo=;
 b=HUjhs0TNv44rOLYOkPYqCIkImDinW3Owv7MnRXGdf5r/sd+sp4/Pg0TJsQiD2bXvlCi2jy
 1/SWnPJNHy9ed5P+oNz4GfPO8mLspzLU6SqzTq/67jDotgGEfFxH7kB49E0VvCPiaEbPXd
 vmzza56UeWlGA3tN5qTC/AbMtV27Ceg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-52cFFazyOxuwSeQ8vhOjhg-1; Thu, 16 Mar 2023 03:13:27 -0400
X-MC-Unique: 52cFFazyOxuwSeQ8vhOjhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B97E101A551;
 Thu, 16 Mar 2023 07:13:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F32A4202701E;
 Thu, 16 Mar 2023 07:13:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF55C21E660B; Thu, 16 Mar 2023 08:13:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
Subject: [PATCH 04/14] qapi: Split up check_type()
Date: Thu, 16 Mar 2023 08:13:15 +0100
Message-Id: <20230316071325.492471-5-armbru@redhat.com>
In-Reply-To: <20230316071325.492471-1-armbru@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

check_type() can check type names, arrays, and implicit struct types.
Callers pass flags to select from this menu.  This makes the function
somewhat hard to read.  Moreover, a few minor bugs are hiding in
there, as we'll see shortly.

Split it into check_type_name(), check_type_name_or_implicit().  Each
of them is a copy of the original specialized to a certain set of
flags.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 116 +++++++++++++++++++++++++------------------
 1 file changed, 67 insertions(+), 49 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 59bdd86024..bc04bf34c2 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -333,62 +333,74 @@ def normalize_members(members: object) -> None:
             members[key] = {'type': arg}
 
 
-def check_type(value: Optional[object],
-               info: QAPISourceInfo,
-               source: str,
-               allow_array: bool = False,
-               allow_dict: Union[bool, str] = False) -> None:
-    """
-    Normalize and validate the QAPI type of ``value``.
-
-    Python types of ``str`` or ``None`` are always allowed.
-
-    :param value: The value to check.
-    :param info: QAPI schema source file information.
-    :param source: Error string describing this ``value``.
-    :param allow_array:
-        Allow a ``List[str]`` of length 1, which indicates an array of
-        the type named by the list element.
-    :param allow_dict:
-        Allow a dict.  Its members can be struct type members or union
-        branches.  When the value of ``allow_dict`` is in pragma
-        ``member-name-exceptions``, the dict's keys may violate the
-        member naming rules.  The dict members are normalized in place.
-
-    :raise QAPISemError: When ``value`` fails validation.
-    :return: None, ``value`` is normalized in-place as needed.
-    """
+def check_type_name(value: Optional[object],
+                    info: QAPISourceInfo, source: str) -> None:
+    if value is None:
+        return
+
+    if isinstance(value, str):
+        return
+
+    if isinstance(value, list):
+        raise QAPISemError(info, "%s cannot be an array" % source)
+
+    raise QAPISemError(info, "%s should be a type name" % source)
+
+
+def check_type_name_or_array(value: Optional[object],
+                             info: QAPISourceInfo, source: str) -> None:
     if value is None:
         return
 
-    # Type name
     if isinstance(value, str):
         return
 
-    # Array type
     if isinstance(value, list):
-        if not allow_array:
-            raise QAPISemError(info, "%s cannot be an array" % source)
         if len(value) != 1 or not isinstance(value[0], str):
             raise QAPISemError(info,
                                "%s: array type must contain single type name" %
                                source)
         return
 
-    # Anonymous type
+    raise QAPISemError(info,
+                       "%s should be a type name" % source)
 
-    if not allow_dict:
-        raise QAPISemError(info, "%s should be a type name" % source)
+
+def check_type_name_or_implicit(value: Optional[object],
+                                info: QAPISourceInfo, source: str,
+                                parent_name: Optional[str]) -> None:
+    """
+    Normalize and validate an optional implicit struct type.
+
+    Accept ``None``, ``str``, or a ``dict`` defining an implicit
+    struct type.  The latter is normalized in place.
+
+    :param value: The value to check.
+    :param info: QAPI schema source file information.
+    :param source: Error string describing this ``value``.
+    :param parent_name:
+        When the value of ``parent_name`` is in pragma
+        ``member-name-exceptions``, an implicit struct type may
+        violate the member naming rules.
+
+    :raise QAPISemError: When ``value`` fails validation.
+    :return: None
+    """
+    if value is None:
+        return
+
+    if isinstance(value, str):
+        return
+
+    if isinstance(value, list):
+        raise QAPISemError(info, "%s cannot be an array" % source)
 
     if not isinstance(value, dict):
         raise QAPISemError(info,
                            "%s should be an object or type name" % source)
 
-    permissive = False
-    if isinstance(allow_dict, str):
-        permissive = allow_dict in info.pragma.member_name_exceptions
+    permissive = parent_name in info.pragma.member_name_exceptions
 
-    # value is a dictionary, check that each member is okay
     for (key, arg) in value.items():
         key_source = "%s member '%s'" % (source, key)
         if key.startswith('*'):
@@ -401,7 +413,7 @@ def check_type(value: Optional[object],
         check_keys(arg, info, key_source, ['type'], ['if', 'features'])
         check_if(arg, info, key_source)
         check_features(arg.get('features'), info)
-        check_type(arg['type'], info, key_source, allow_array=True)
+        check_type_name_or_array(arg['type'], info, key_source)
 
 
 def check_features(features: Optional[object],
@@ -489,8 +501,8 @@ def check_struct(expr: QAPIExpression) -> None:
     name = cast(str, expr['struct'])  # Checked in check_exprs
     members = expr['data']
 
-    check_type(members, expr.info, "'data'", allow_dict=name)
-    check_type(expr.get('base'), expr.info, "'base'")
+    check_type_name_or_implicit(members, expr.info, "'data'", name)
+    check_type_name(expr.get('base'), expr.info, "'base'")
 
 
 def check_union(expr: QAPIExpression) -> None:
@@ -508,7 +520,7 @@ def check_union(expr: QAPIExpression) -> None:
     members = expr['data']
     info = expr.info
 
-    check_type(base, info, "'base'", allow_dict=name)
+    check_type_name_or_implicit(base, info, "'base'", name)
     check_name_is_str(discriminator, info, "'discriminator'")
 
     if not isinstance(members, dict):
@@ -518,7 +530,7 @@ def check_union(expr: QAPIExpression) -> None:
         source = "'data' member '%s'" % key
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
-        check_type(value['type'], info, source)
+        check_type_name(value['type'], info, source)
 
 
 def check_alternate(expr: QAPIExpression) -> None:
@@ -544,7 +556,7 @@ def check_alternate(expr: QAPIExpression) -> None:
         check_name_lower(key, info, source)
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
-        check_type(value['type'], info, source, allow_array=True)
+        check_type_name_or_array(value['type'], info, source)
 
 
 def check_command(expr: QAPIExpression) -> None:
@@ -560,10 +572,13 @@ def check_command(expr: QAPIExpression) -> None:
     rets = expr.get('returns')
     boxed = expr.get('boxed', False)
 
-    if boxed and args is None:
-        raise QAPISemError(expr.info, "'boxed': true requires 'data'")
-    check_type(args, expr.info, "'data'", allow_dict=not boxed)
-    check_type(rets, expr.info, "'returns'", allow_array=True)
+    if boxed:
+        if args is None:
+            raise QAPISemError(expr.info, "'boxed': true requires 'data'")
+        check_type_name(args, expr.info, "'data'")
+    else:
+        check_type_name_or_implicit(args, expr.info, "'data'", None)
+    check_type_name_or_array(rets, expr.info, "'returns'")
 
 
 def check_event(expr: QAPIExpression) -> None:
@@ -578,9 +593,12 @@ def check_event(expr: QAPIExpression) -> None:
     args = expr.get('data')
     boxed = expr.get('boxed', False)
 
-    if boxed and args is None:
-        raise QAPISemError(expr.info, "'boxed': true requires 'data'")
-    check_type(args, expr.info, "'data'", allow_dict=not boxed)
+    if boxed:
+        if args is None:
+            raise QAPISemError(expr.info, "'boxed': true requires 'data'")
+        check_type_name(args, expr.info, "'data'")
+    else:
+        check_type_name_or_implicit(args, expr.info, "'data'", None)
 
 
 def check_exprs(exprs: List[QAPIExpression]) -> List[QAPIExpression]:
-- 
2.39.2


