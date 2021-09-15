Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9240CD32
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 21:27:58 +0200 (CEST)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQaZZ-0007GT-FB
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 15:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQaWn-0004Op-8g
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 15:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQaWl-0000hB-Gh
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 15:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631733902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4ljcPqWx49zpY5xGkgmlSkYIQOn+0mV82M6PNNPDV8=;
 b=PJrNT98z3kz7zmXA+Zpwo050Yp3JUGIZUnPAWQ/+tHdbLPlDIVMtHkBvT5IzT3Si1drofP
 q7gaGjHlI+j3jxgY4hs4DmDmEOwLxVg7sDutq5QJ46DV0KHU8L2mIkM6Mq+xGLQerLjJNl
 mxuR2brNmg04nRoRQG5MLR4jtNRQBA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-juAkXb4HN7WNj2E8sQ80NQ-1; Wed, 15 Sep 2021 15:25:01 -0400
X-MC-Unique: juAkXb4HN7WNj2E8sQ80NQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0881F1006AA2;
 Wed, 15 Sep 2021 19:25:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96D76196FF;
 Wed, 15 Sep 2021 19:24:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 21CB4113861E; Wed, 15 Sep 2021 21:24:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/5] qapi: Enable enum member introspection to show more
 than name
Date: Wed, 15 Sep 2021 21:24:21 +0200
Message-Id: <20210915192425.4104210-2-armbru@redhat.com>
In-Reply-To: <20210915192425.4104210-1-armbru@redhat.com>
References: <20210915192425.4104210-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next commit will add feature flags to enum members.  There's a
problem, though: query-qmp-schema shows an enum type's members as an
array of member names (SchemaInfoEnum member @values).  If it showed
an array of objects with a name member, we could simply add more
members to these objects.  Since it's just strings, we can't.

I can see three ways to correct this design mistake:

1. Do it the way we should have done it, plus compatibility goo.

   We want a ['SchemaInfoEnumMember'] member in SchemaInfoEnum.  Since
   changing @values would be a compatibility break, add a new member
   @members instead.

   @values is now redundant.  We should be able to get rid of it
   eventually.

   In my testing, output of qemu-system-x86_64's query-qmp-schema
   grows by 11% (18.5KiB).

2. Like 1, but omit "boring" elements of @member, and empty @member.

   @values does not become redundant.  Output of query-qmp-schema
   grows only as we make enum members non-boring.

3. Versioned query-qmp-schema.

   query-qmp-schema provides either @values or @members.  The QMP
   client can select which version it wants.

This commit implements 1. simply because it's the solution I thought
of first.  I'm prepared to implement one of the others if we decide
that's what we want.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/introspect.json       | 20 ++++++++++++++++++--
 scripts/qapi/introspect.py | 18 ++++++++++++++----
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/qapi/introspect.json b/qapi/introspect.json
index 39bd303778..250748cd95 100644
--- a/qapi/introspect.json
+++ b/qapi/introspect.json
@@ -142,14 +142,30 @@
 #
 # Additional SchemaInfo members for meta-type 'enum'.
 #
-# @values: the enumeration type's values, in no particular order.
+# @members: the enum type's members, in no particular order.
+#
+# @values: the enumeration type's member names, in no particular order.
+#          Redundant with @members.  Just for backward compatibility.
 #
 # Values of this type are JSON string on the wire.
 #
 # Since: 2.5
 ##
 { 'struct': 'SchemaInfoEnum',
-  'data': { 'values': ['str'] } }
+  'data': { 'members': [ 'SchemaInfoEnumMember' ],
+            'values': ['str'] } }
+
+##
+# @SchemaInfoEnumMember:
+#
+# An object member.
+#
+# @name: the member's name, as defined in the QAPI schema.
+#
+# Since: 6.1
+##
+{ 'struct': 'SchemaInfoEnumMember',
+  'data': { 'name': 'str' } }
 
 ##
 # @SchemaInfoArray:
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 4c079ee627..6334546363 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -68,6 +68,7 @@
 # TypedDict constructs, so they are broadly typed here as simple
 # Python Dicts.
 SchemaInfo = Dict[str, object]
+SchemaInfoEnumMember = Dict[str, object]
 SchemaInfoObject = Dict[str, object]
 SchemaInfoObjectVariant = Dict[str, object]
 SchemaInfoObjectMember = Dict[str, object]
@@ -274,8 +275,16 @@ def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
             obj['features'] = self._gen_features(features)
         self._trees.append(Annotated(obj, ifcond, comment))
 
-    def _gen_member(self, member: QAPISchemaObjectTypeMember
-                    ) -> Annotated[SchemaInfoObjectMember]:
+    @staticmethod
+    def _gen_enum_member(member: QAPISchemaEnumMember
+                         ) -> Annotated[SchemaInfoEnumMember]:
+        obj: SchemaInfoEnumMember = {
+            'name': member.name,
+        }
+        return Annotated(obj, member.ifcond)
+
+    def _gen_object_member(self, member: QAPISchemaObjectTypeMember
+                           ) -> Annotated[SchemaInfoObjectMember]:
         obj: SchemaInfoObjectMember = {
             'name': member.name,
             'type': self._use_type(member.type)
@@ -305,7 +314,8 @@ def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
                         prefix: Optional[str]) -> None:
         self._gen_tree(
             name, 'enum',
-            {'values': [Annotated(m.name, m.ifcond) for m in members]},
+            {'members': [self._gen_enum_member(m) for m in members],
+             'values': [Annotated(m.name, m.ifcond) for m in members]},
             ifcond, features
         )
 
@@ -322,7 +332,7 @@ def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
                                members: List[QAPISchemaObjectTypeMember],
                                variants: Optional[QAPISchemaVariants]) -> None:
         obj: SchemaInfoObject = {
-            'members': [self._gen_member(m) for m in members]
+            'members': [self._gen_object_member(m) for m in members]
         }
         if variants:
             obj['tag'] = variants.tag_member.name
-- 
2.31.1


