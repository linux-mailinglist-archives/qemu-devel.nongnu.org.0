Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71631C5A7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:45:42 +0100 (CET)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqMv-0004wQ-Ub
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwz-0001wi-UT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwk-0003A8-KE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613441917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEfdHr2hSQ3ttgCVRtTxTbMXcAw0ZbXM4l5D1Tamb6Y=;
 b=ejgFk2L7IiGAKNKAwGySK5lxdz6ExsNrKVgOMhcn/yt+gKK8aRBVsIaXs9jZaSFu7/+bg8
 GExh+ly6CMZgaClOL7t8P327Y62vRY40nupKlM2fe8zixRk9FrYjoUrDsLIoP19b6nrBod
 CE3bTQUBfOIqk30cdxtZb5790+86wmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-U_Bs24DYNb2CkdC5n9vEig-1; Mon, 15 Feb 2021 21:18:25 -0500
X-MC-Unique: U_Bs24DYNb2CkdC5n9vEig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93D6118A08BD;
 Tue, 16 Feb 2021 02:18:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A90E910023AF;
 Tue, 16 Feb 2021 02:18:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 10/19] qapi/introspect.py: create a typed 'Annotated' data
 strutcure
Date: Mon, 15 Feb 2021 21:18:00 -0500
Message-Id: <20210216021809.134886-11-jsnow@redhat.com>
In-Reply-To: <20210216021809.134886-1-jsnow@redhat.com>
References: <20210216021809.134886-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 scripts/qapi/introspect.py | 78 ++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 33 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 3c37c138013..5224be1a333 100644
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
@@ -68,24 +82,20 @@ def _tree_to_qlit(obj, level=0, dict_value=False):
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
@@ -202,7 +212,7 @@ def _use_type(self, typ):
 
     @staticmethod
     def _gen_features(features):
-        return [_make_tree(f.name, f.ifcond) for f in features]
+        return [Annotated(f.name, f.ifcond) for f in features]
 
     def _gen_tree(self, name, mtype, obj, ifcond, features):
         comment: Optional[str] = None
@@ -216,7 +226,7 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
         obj['meta-type'] = mtype
         if features:
             obj['features'] = self._gen_features(features)
-        self._trees.append(_make_tree(obj, ifcond, comment))
+        self._trees.append(Annotated(obj, ifcond, comment))
 
     def _gen_member(self, member):
         obj = {'name': member.name, 'type': self._use_type(member.type)}
@@ -224,7 +234,7 @@ def _gen_member(self, member):
             obj['default'] = None
         if member.features:
             obj['features'] = self._gen_features(member.features)
-        return _make_tree(obj, member.ifcond)
+        return Annotated(obj, member.ifcond)
 
     def _gen_variants(self, tag_name, variants):
         return {'tag': tag_name,
@@ -232,16 +242,17 @@ def _gen_variants(self, tag_name, variants):
 
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
@@ -258,12 +269,13 @@ def visit_object_type_flat(self, name, info, ifcond, features,
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
2.29.2


