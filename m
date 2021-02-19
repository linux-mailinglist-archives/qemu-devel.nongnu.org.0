Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F731F95E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:24:09 +0100 (CET)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4pM-0002vr-Tc
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4Wa-0007UH-Le
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WY-00025M-5G
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0+VQCPmpUXewWLR26r1TmdOavYrqSAd+/iJvZtMDcQ=;
 b=CZRzIKJLbXXyxAufuckQ+wfjUX7mOtzjQxs3uEXHbZhTH+pnboHYx9WZD2MSQAADsY/vs7
 TADCPQHpqUIARieaka6nUlZVm2A5RS1cZWmmTpRhaOtk+G3kixK3fJhpL3S9e6xi0z/8en
 TE2WBt+SlUlFdL2XDqx2vGdLr4ziph0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-jSLj8ZdNNuSvNbvnCS1heQ-1; Fri, 19 Feb 2021 07:04:27 -0500
X-MC-Unique: jSLj8ZdNNuSvNbvnCS1heQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99160107ACE3;
 Fri, 19 Feb 2021 12:04:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CAFC5D734;
 Fri, 19 Feb 2021 12:04:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2605F11329C9; Fri, 19 Feb 2021 13:04:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/18] qapi/introspect.py: create a typed 'Annotated' data
 strutcure
Date: Fri, 19 Feb 2021 13:04:14 +0100
Message-Id: <20210219120422.600850-11-armbru@redhat.com>
In-Reply-To: <20210219120422.600850-1-armbru@redhat.com>
References: <20210219120422.600850-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Presently, we use a tuple to attach a dict containing annotations
(comments and compile-time conditionals) to a tree node. This is
undesirable because dicts are difficult to strongly type; promoting it
to a real class allows us to name the values and types of the
annotations we are expecting.

In terms of typing, the Annotated<T> type serves as a generic container
where the annotated node's type is preserved, allowing for greater
specificity than we'd be able to provide without a generic.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-11-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 78 ++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 33 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index c271006100..715220afe7 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -13,8 +13,12 @@
 from typing import (
     Any,
     Dict,
+    Generic,
+    Iterable,
     List,
     Optional,
+    Tuple,
+    TypeVar,
     Union,
 )
 
@@ -52,15 +56,25 @@
 _Scalar = Union[str, bool, None]
 _NonScalar = Union[Dict[str, _Stub], List[_Stub]]
 _Value = Union[_Scalar, _NonScalar]
-# JSONValue = TODO, in a forthcoming commit.
+JSONValue = Union[_Value, 'Annotated[_Value]']
 
 
-def _make_tree(obj, ifcond, comment=None):
-    extra = {
-        'if': ifcond,
-        'comment': comment
-    }
-    return (obj, extra)
+_ValueT = TypeVar('_ValueT', bound=_Value)
+
+
+class Annotated(Generic[_ValueT]):
+    """
+    Annotated generally contains a SchemaInfo-like type (as a dict),
+    But it also used to wrap comments/ifconds around scalar leaf values,
+    for the benefit of features and enums.
+    """
+    # TODO: Remove after Python 3.7 adds @dataclass:
+    # pylint: disable=too-few-public-methods
+    def __init__(self, value: _ValueT, ifcond: Iterable[str],
+                 comment: Optional[str] = None):
+        self.value = value
+        self.comment: Optional[str] = comment
+        self.ifcond: Tuple[str, ...] = tuple(ifcond)
 
 
 def _tree_to_qlit(obj, level=0, dict_value=False):
@@ -68,11 +82,7 @@ def _tree_to_qlit(obj, level=0, dict_value=False):
     def indent(level):
         return level * 4 * ' '
 
-    if isinstance(obj, tuple):
-        ifobj, extra = obj
-        ifcond = extra.get('if')
-        comment = extra.get('comment')
-
+    if isinstance(obj, Annotated):
         # NB: _tree_to_qlit is called recursively on the values of a
         # key:value pair; those values can't be decorated with
         # comments or conditionals.
@@ -80,13 +90,13 @@ def indent(level):
         assert not dict_value, msg
 
         ret = ''
-        if comment:
-            ret += indent(level) + '/* %s */\n' % comment
-        if ifcond:
-            ret += gen_if(ifcond)
-        ret += _tree_to_qlit(ifobj, level)
-        if ifcond:
-            ret += '\n' + gen_endif(ifcond)
+        if obj.comment:
+            ret += indent(level) + '/* %s */\n' % obj.comment
+        if obj.ifcond:
+            ret += gen_if(obj.ifcond)
+        ret += _tree_to_qlit(obj.value, level)
+        if obj.ifcond:
+            ret += '\n' + gen_endif(obj.ifcond)
         return ret
 
     ret = ''
@@ -203,7 +213,7 @@ def _use_type(self, typ):
 
     @staticmethod
     def _gen_features(features):
-        return [_make_tree(f.name, f.ifcond) for f in features]
+        return [Annotated(f.name, f.ifcond) for f in features]
 
     def _gen_tree(self, name, mtype, obj, ifcond, features):
         comment: Optional[str] = None
@@ -217,7 +227,7 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
         obj['meta-type'] = mtype
         if features:
             obj['features'] = self._gen_features(features)
-        self._trees.append(_make_tree(obj, ifcond, comment))
+        self._trees.append(Annotated(obj, ifcond, comment))
 
     def _gen_member(self, member):
         obj = {'name': member.name, 'type': self._use_type(member.type)}
@@ -225,7 +235,7 @@ def _gen_member(self, member):
             obj['default'] = None
         if member.features:
             obj['features'] = self._gen_features(member.features)
-        return _make_tree(obj, member.ifcond)
+        return Annotated(obj, member.ifcond)
 
     def _gen_variants(self, tag_name, variants):
         return {'tag': tag_name,
@@ -233,16 +243,17 @@ def _gen_variants(self, tag_name, variants):
 
     def _gen_variant(self, variant):
         obj = {'case': variant.name, 'type': self._use_type(variant.type)}
-        return _make_tree(obj, variant.ifcond)
+        return Annotated(obj, variant.ifcond)
 
     def visit_builtin_type(self, name, info, json_type):
         self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
 
     def visit_enum_type(self, name, info, ifcond, features, members, prefix):
-        self._gen_tree(name, 'enum',
-                       {'values': [_make_tree(m.name, m.ifcond, None)
-                                   for m in members]},
-                       ifcond, features)
+        self._gen_tree(
+            name, 'enum',
+            {'values': [Annotated(m.name, m.ifcond) for m in members]},
+            ifcond, features
+        )
 
     def visit_array_type(self, name, info, ifcond, element_type):
         element = self._use_type(element_type)
@@ -259,12 +270,13 @@ def visit_object_type_flat(self, name, info, ifcond, features,
         self._gen_tree(name, 'object', obj, ifcond, features)
 
     def visit_alternate_type(self, name, info, ifcond, features, variants):
-        self._gen_tree(name, 'alternate',
-                       {'members': [
-                           _make_tree({'type': self._use_type(m.type)},
-                                      m.ifcond, None)
-                           for m in variants.variants]},
-                       ifcond, features)
+        self._gen_tree(
+            name, 'alternate',
+            {'members': [Annotated({'type': self._use_type(m.type)},
+                                   m.ifcond)
+                         for m in variants.variants]},
+            ifcond, features
+        )
 
     def visit_command(self, name, info, ifcond, features,
                       arg_type, ret_type, gen, success_response, boxed,
-- 
2.26.2


