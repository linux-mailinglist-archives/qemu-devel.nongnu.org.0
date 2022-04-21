Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C571050A2CF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:40:00 +0200 (CEST)
Received: from localhost ([::1]:58860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXyR-0000Y9-TC
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqS-0002jq-JI
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqP-0004Kx-4s
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650551500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21/uvnIQ4OdM8mEY2QgS4QmgQgsadSmhW3DxDkPKdEA=;
 b=F8y3UQVBeH0xjbPqniQw12ue2PLLYpYlLoLsrZco0/8MsSCmHoiVao19Y5zSRrlLOFoV2U
 c2hNnSEPzGY7i/TMpM5ftdxzHhMgTUqu65u2I2m2EDuY3xVtb2yRiK7HQMneQLvutUVn6M
 jqFkBW8d9jFykXgx7B2E+PysM3XfqpQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-U3SK-wkHNUSr0hTDGKjZEw-1; Thu, 21 Apr 2022 10:31:37 -0400
X-MC-Unique: U3SK-wkHNUSr0hTDGKjZEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E083F86B8A6;
 Thu, 21 Apr 2022 14:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD9B2200AE73;
 Thu, 21 Apr 2022 14:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A216121E6A20; Thu, 21 Apr 2022 16:31:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] qapi-schema: support alternates with array type
Date: Thu, 21 Apr 2022 16:31:29 +0200
Message-Id: <20220421143135.1491256-2-armbru@redhat.com>
In-Reply-To: <20220421143135.1491256-1-armbru@redhat.com>
References: <20220421143135.1491256-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Detect array types as alternate branches, and turn the JSON list into
a QAPISchemaArrayType.  Array types in an alternate are represented with
QTYPE_QLIST in the type field.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220321164243.200569-2-pbonzini@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py                   |  2 +-
 scripts/qapi/schema.py                 |  4 ++++
 tests/qapi-schema/alternate-array.err  |  2 --
 tests/qapi-schema/alternate-array.json |  2 --
 tests/qapi-schema/alternate-array.out  | 18 ++++++++++++++++++
 5 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 3cb389e875..48578e1698 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -554,7 +554,7 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_name_lower(key, info, source)
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
-        check_type(value['type'], info, source)
+        check_type(value['type'], info, source, allow_array=True)
 
 
 def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index b7b3fc0ce4..3728340c37 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -243,6 +243,7 @@ def alternate_qtype(self):
             'number':  'QTYPE_QNUM',
             'int':     'QTYPE_QNUM',
             'boolean': 'QTYPE_QBOOL',
+            'array':   'QTYPE_QLIST',
             'object':  'QTYPE_QDICT'
         }
         return json2qtype.get(self.json_type())
@@ -1069,6 +1070,9 @@ def _def_struct_type(self, expr, info, doc):
             None))
 
     def _make_variant(self, case, typ, ifcond, info):
+        if isinstance(typ, list):
+            assert len(typ) == 1
+            typ = self._make_array_type(typ[0], info)
         return QAPISchemaVariant(case, info, typ, ifcond)
 
     def _def_union_type(self, expr, info, doc):
diff --git a/tests/qapi-schema/alternate-array.err b/tests/qapi-schema/alternate-array.err
index b1aa1f4e8d..e69de29bb2 100644
--- a/tests/qapi-schema/alternate-array.err
+++ b/tests/qapi-schema/alternate-array.err
@@ -1,2 +0,0 @@
-alternate-array.json: In alternate 'Alt':
-alternate-array.json:5: 'data' member 'two' cannot be an array
diff --git a/tests/qapi-schema/alternate-array.json b/tests/qapi-schema/alternate-array.json
index f241aac122..b878a2db77 100644
--- a/tests/qapi-schema/alternate-array.json
+++ b/tests/qapi-schema/alternate-array.json
@@ -1,5 +1,3 @@
-# we do not allow array branches in alternates
-# TODO: should we support this?
 { 'struct': 'One',
   'data': { 'name': 'str' } }
 { 'alternate': 'Alt',
diff --git a/tests/qapi-schema/alternate-array.out b/tests/qapi-schema/alternate-array.out
index e69de29bb2..a657d85738 100644
--- a/tests/qapi-schema/alternate-array.out
+++ b/tests/qapi-schema/alternate-array.out
@@ -0,0 +1,18 @@
+module ./builtin
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module alternate-array.json
+object One
+    member name: str optional=False
+alternate Alt
+    tag type
+    case one: One
+    case two: intList
-- 
2.35.1


