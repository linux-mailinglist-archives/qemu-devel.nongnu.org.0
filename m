Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165CB4447AA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:47:29 +0100 (CET)
Received: from localhost ([::1]:35184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKMC-0007n7-6R
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK64-0001Fy-8P
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK62-0001WL-9A
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czEdOd7Z3TVGN6zMECsEDXntu810MsjqgXwnoMc17og=;
 b=Q/QwHWAhnHNHn0yKXd9VlImJkVVT9SiewKYD2aMFaBUuovzE5qnhKNq6+47RNOSls+G5TQ
 BGXLp7kU6kfj0V3FhL1mkON9+lEOPOaSm9cGDrQ0jMy9kIQJMyZs2ApxOtQoMNnwzFyZPi
 MMfxOSu7fNwqEr/ylUBdlRhyiAzlWeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-ZVTzjOdHPqqQ9wUDIr6BhA-1; Wed, 03 Nov 2021 13:30:42 -0400
X-MC-Unique: ZVTzjOdHPqqQ9wUDIr6BhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F07DF8C24C9
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:25 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D3C45C1D5;
 Wed,  3 Nov 2021 17:30:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/12] qapi: Allow defining QOM classes
Date: Wed,  3 Nov 2021 18:29:57 +0100
Message-Id: <20211103173002.209906-8-kwolf@redhat.com>
In-Reply-To: <20211103173002.209906-1-kwolf@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 scripts/qapi/expr.py   | 28 +++++++++++++++++-
 scripts/qapi/schema.py | 66 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 3cb389e875..77550629f3 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -181,6 +181,8 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
     """
     if meta == 'event':
         check_name_upper(name, info, meta)
+    elif meta == 'class':
+        check_name_str(name, info, meta)
     elif meta == 'command':
         check_name_lower(
             name, info, meta,
@@ -557,6 +559,24 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_type(value['type'], info, source)
 
 
+def check_class(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate this expression as a ``class`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError: When ``expr`` is not a valid ``class``.
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
+    config = expr.get('config')
+    config_boxed = expr.get('config-boxed', False)
+
+    if config_boxed and config is None:
+        raise QAPISemError(info, "'boxed': true requires 'config'")
+    check_type(config, info, "'config'", allow_dict=not config_boxed)
+
+
 def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
     """
     Normalize and validate this expression as a ``command`` definition.
@@ -627,7 +647,7 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
             continue
 
         metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
-                               'command', 'event'}
+                               'class', 'command', 'event'}
         if len(metas) != 1:
             raise QAPISemError(
                 info,
@@ -671,6 +691,12 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
                        ['struct', 'data'], ['base', 'if', 'features'])
             normalize_members(expr['data'])
             check_struct(expr, info)
+        elif meta == 'class':
+            check_keys(expr, info, meta,
+                       ['class'], ['if', 'features', 'parent', 'config',
+                        'config-boxed'])
+            normalize_members(expr.get('config'))
+            check_class(expr, info)
         elif meta == 'command':
             check_keys(expr, info, meta,
                        ['command'],
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index b7b3fc0ce4..ebf69341d7 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -155,6 +155,9 @@ def visit_object_type_flat(self, name, info, ifcond, features,
     def visit_alternate_type(self, name, info, ifcond, features, variants):
         pass
 
+    def visit_class(self, entity):
+        pass
+
     def visit_command(self, name, info, ifcond, features,
                       arg_type, ret_type, gen, success_response, boxed,
                       allow_oob, allow_preconfig, coroutine):
@@ -766,6 +769,50 @@ def __init__(self, name, info, typ, ifcond=None):
         super().__init__(name, info, typ, False, ifcond)
 
 
+class QAPISchemaClass(QAPISchemaEntity):
+    meta = 'class'
+
+    def __init__(self, name, info, doc, ifcond, features, parent,
+                 config_type, config_boxed):
+        super().__init__(name, info, doc, ifcond, features)
+
+        assert not parent or isinstance(parent, str)
+        assert not config_type or isinstance(config_type, str)
+        self._parent_name = parent
+        self.parent = None
+        self._config_type_name = config_type
+        self.config_type = None
+        self.config_boxed = config_boxed
+
+    def check(self, schema):
+        super().check(schema)
+
+        if self._parent_name:
+            self.parent = schema.lookup_entity(self._parent_name,
+                                               QAPISchemaClass)
+            if not self.parent:
+                raise QAPISemError(
+                    self.info,
+                    "Unknown parent class '%s'" % self._parent_name)
+
+        if self._config_type_name:
+            self.config_type = schema.resolve_type(
+                self._config_type_name, self.info, "class 'config'")
+            if not isinstance(self.config_type, QAPISchemaObjectType):
+                raise QAPISemError(
+                    self.info,
+                    "class 'config' cannot take %s"
+                    % self.config_type.describe())
+            if self.config_type.variants and not self.boxed:
+                raise QAPISemError(
+                    self.info,
+                    "class 'config' can take %s only with 'boxed': true"
+                    % self.config_type.describe())
+
+    def visit(self, visitor):
+        super().visit(visitor)
+        visitor.visit_class(self)
+
 class QAPISchemaCommand(QAPISchemaEntity):
     meta = 'command'
 
@@ -1110,6 +1157,23 @@ def _def_alternate_type(self, expr, info, doc):
                                     QAPISchemaVariants(
                                         None, info, tag_member, variants)))
 
+    def _def_class(self, expr, info, doc):
+        name = expr['class']
+        ifcond = QAPISchemaIfCond(expr.get('if'))
+        features = self._make_features(expr.get('features'), info)
+        parent = expr.get('parent')
+        config_type = expr.get('config')
+        config_boxed = expr.get('config-boxed')
+
+        if isinstance(config_type, OrderedDict):
+            config_type = self._make_implicit_object_type(
+                name, info, ifcond,
+                'config', self._make_members(config_type, info))
+
+        self._def_entity(QAPISchemaClass(
+            name, info, doc, ifcond, features, parent, config_type,
+            config_boxed))
+
     def _def_command(self, expr, info, doc):
         name = expr['command']
         data = expr.get('data')
@@ -1161,6 +1225,8 @@ def _def_exprs(self, exprs):
                 self._def_union_type(expr, info, doc)
             elif 'alternate' in expr:
                 self._def_alternate_type(expr, info, doc)
+            elif 'class' in expr:
+                self._def_class(expr, info, doc)
             elif 'command' in expr:
                 self._def_command(expr, info, doc)
             elif 'event' in expr:
-- 
2.31.1


