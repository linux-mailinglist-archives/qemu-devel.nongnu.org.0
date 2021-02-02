Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE0B30C869
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:53:48 +0100 (CET)
Received: from localhost ([::1]:33008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zs3-0002f4-BA
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlb-0004sk-Cn
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlY-0008D2-S1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612288024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YH/r0keMcLdV84njaSdaWHfrPxmjV8hvfdDHSpdMn8A=;
 b=B6CnyJw8i96eRMT2pZQnAtFd5MCQ7/bZEizEXlKeMnN0jPDQ3EHYdmTPsiaDUY8VtQnhbT
 aCFnbJVNlMOVq25FBupKHrq4bL8p4xGGQm0I8ApQK0q3Ca9aYhtne00uw19P2ExzmUHSe6
 SQvT5VWNNC/Q8OIoJbN8wfCv93M6xBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-AOVPclDqN1yW1fhQUiWjgA-1; Tue, 02 Feb 2021 12:47:01 -0500
X-MC-Unique: AOVPclDqN1yW1fhQUiWjgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA5C106BAE4;
 Tue,  2 Feb 2021 17:47:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB0CE5C1CF;
 Tue,  2 Feb 2021 17:46:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 08/14] qapi/introspect.py: create a typed 'Annotated' data
 strutcure
Date: Tue,  2 Feb 2021 12:46:45 -0500
Message-Id: <20210202174651.2274166-9-jsnow@redhat.com>
In-Reply-To: <20210202174651.2274166-1-jsnow@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Presently, we use a tuple to attach a dict containing annotations
(comments and compile-time conditionals) to a tree node. This is
undesirable because dicts are difficult to strongly type; promoting it
to a real class allows us to name the values and types of the
annotations we are expecting.

In terms of typing, the Annotated<T> type serves as a generic container
where the annotated node's type is preserved, allowing for greater
specificity than we'd be able to provide without a generic.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 77 ++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index b82efe16f6e..2b90a52f016 100644
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
 
@@ -51,15 +55,25 @@
 _scalar = Union[str, bool, None]
 _nonscalar = Union[Dict[str, _stub], List[_stub]]
 _value = Union[_scalar, _nonscalar]
-# TreeValue = Union[_value, 'Annotated[_value]']
+TreeValue = Union[_value, 'Annotated[_value]']
 
 
-def _make_tree(obj, ifcond, comment=None):
-    extra = {
-        'if': ifcond,
-        'comment': comment,
-    }
-    return (obj, extra)
+_NodeT = TypeVar('_NodeT', bound=TreeValue)
+
+
+class Annotated(Generic[_NodeT]):
+    """
+    Annotated generally contains a SchemaInfo-like type (as a dict),
+    But it also used to wrap comments/ifconds around scalar leaf values,
+    for the benefit of features and enums.
+    """
+    # Remove after 3.7 adds @dataclass:
+    # pylint: disable=too-few-public-methods
+    def __init__(self, value: _NodeT, ifcond: Iterable[str],
+                 comment: Optional[str] = None):
+        self.value = value
+        self.comment: Optional[str] = comment
+        self.ifcond: Tuple[str, ...] = tuple(ifcond)
 
 
 def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
@@ -67,24 +81,20 @@ def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
     def indent(level):
         return level * 4 * ' '
 
-    if isinstance(obj, tuple):
-        ifobj, extra = obj
-        ifcond = extra.get('if')
-        comment = extra.get('comment')
-
+    if isinstance(obj, Annotated):
         # NB: _tree_to_qlit is called recursively on the values of a key:value
         # pair; those values can't be decorated with comments or conditionals.
         msg = "dict values cannot have attached comments or if-conditionals."
         assert not suppress_first_indent, msg
 
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
+        ret += _tree_to_qlit(obj.value, level, suppress_first_indent)
+        if obj.ifcond:
+            ret += '\n' + gen_endif(obj.ifcond)
         return ret
 
     ret = ''
@@ -201,7 +211,7 @@ def _use_type(self, typ):
 
     @staticmethod
     def _gen_features(features):
-        return [_make_tree(f.name, f.ifcond) for f in features]
+        return [Annotated(f.name, f.ifcond) for f in features]
 
     def _gen_tree(self, name, mtype, obj, ifcond, features):
         comment: Optional[str] = None
@@ -215,7 +225,7 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
         obj['meta-type'] = mtype
         if features:
             obj['features'] = self._gen_features(features)
-        self._trees.append(_make_tree(obj, ifcond, comment))
+        self._trees.append(Annotated(obj, ifcond, comment))
 
     def _gen_member(self, member):
         obj = {'name': member.name, 'type': self._use_type(member.type)}
@@ -223,7 +233,7 @@ def _gen_member(self, member):
             obj['default'] = None
         if member.features:
             obj['features'] = self._gen_features(member.features)
-        return _make_tree(obj, member.ifcond)
+        return Annotated(obj, member.ifcond)
 
     def _gen_variants(self, tag_name, variants):
         return {'tag': tag_name,
@@ -231,16 +241,17 @@ def _gen_variants(self, tag_name, variants):
 
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
@@ -257,12 +268,12 @@ def visit_object_type_flat(self, name, info, ifcond, features,
         self._gen_tree(name, 'object', obj, ifcond, features)
 
     def visit_alternate_type(self, name, info, ifcond, features, variants):
-        self._gen_tree(name, 'alternate',
-                       {'members': [
-                           _make_tree({'type': self._use_type(m.type)},
-                                      m.ifcond, None)
-                           for m in variants.variants]},
-                       ifcond, features)
+        self._gen_tree(name, 'alternate', {'members': [
+                Annotated({'type': self._use_type(m.type)}, m.ifcond)
+                for m in variants.variants
+            ]},
+            ifcond, features
+        )
 
     def visit_command(self, name, info, ifcond, features,
                       arg_type, ret_type, gen, success_response, boxed,
-- 
2.29.2


