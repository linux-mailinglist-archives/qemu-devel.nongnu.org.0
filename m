Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199324447A9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:47:04 +0100 (CET)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKLm-000787-Pu
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK68-0001La-Bn
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK66-0001Xw-OO
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wd/r6iypcmX5AQ83gBh+ngsuji95/IwW/2rA2wNNORI=;
 b=iygmOZXw7NdWOUOvNMjjemn4oSJlMdS3Y1eLTar8l10P+4I9QFd4K9oHtlYv4rXgRpKgn3
 DM4m8z8tXwuIhVN3SZSKHX5zc4D+QELw1fhV5JoGfP64FtKWqm8Ut9GQtNBJgdGGVNT5Wt
 E5nSLHwQaq02bH5f8evud1f/nfW2H3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-XJwdJ3EfND6m9AeZsD-zGQ-1; Wed, 03 Nov 2021 13:30:48 -0400
X-MC-Unique: XJwdJ3EfND6m9AeZsD-zGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFA1B108AB60
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:27 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45C485C1C5;
 Wed,  3 Nov 2021 17:30:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/12] qapi: Create qom-config:... type for classes
Date: Wed,  3 Nov 2021 18:29:58 +0100
Message-Id: <20211103173002.209906-9-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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

For every class that has a 'config' definition, a corresponding
'qom-config:$QOM_TYPE' type is automatically created that contains the
configuration for the class and all of its parent classes.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 scripts/qapi/schema.py | 60 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index ebf69341d7..79db42b810 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -761,6 +761,13 @@ def connect_doc(self, doc):
             for f in self.features:
                 doc.connect_feature(f)
 
+    def clone(self):
+        features = [QAPISchemaFeature(f.name, f.info, f.ifcond)
+                    for f in self.features]
+        return QAPISchemaObjectTypeMember(
+            self.name, self.info, self._type_name, self.optional,
+            self.ifcond, features)
+
 
 class QAPISchemaVariant(QAPISchemaObjectTypeMember):
     role = 'branch'
@@ -783,17 +790,11 @@ def __init__(self, name, info, doc, ifcond, features, parent,
         self._config_type_name = config_type
         self.config_type = None
         self.config_boxed = config_boxed
+        self.full_config_type = None
 
-    def check(self, schema):
-        super().check(schema)
-
-        if self._parent_name:
-            self.parent = schema.lookup_entity(self._parent_name,
-                                               QAPISchemaClass)
-            if not self.parent:
-                raise QAPISemError(
-                    self.info,
-                    "Unknown parent class '%s'" % self._parent_name)
+    def get_qom_config_type(self, schema):
+        if self.full_config_type:
+            return self.full_config_type
 
         if self._config_type_name:
             self.config_type = schema.resolve_type(
@@ -809,6 +810,40 @@ def check(self, schema):
                     "class 'config' can take %s only with 'boxed': true"
                     % self.config_type.describe())
 
+            # FIXME That's a bit ugly
+            self.config_type.check(schema)
+            members = [m.clone() for m in self.config_type.members]
+        else:
+            members = []
+
+        if self._parent_name:
+            self.parent = schema.lookup_entity(self._parent_name,
+                                               QAPISchemaClass)
+            if not self.parent:
+                raise QAPISemError(
+                    self.info,
+                    "Unknown parent class '%s'" % self._parent_name)
+
+            self.parent.get_qom_config_type(schema)
+            members += [m.clone() for m in self.parent.config_type.members]
+
+        self.full_config_type = QAPISchemaObjectType(
+            f"qom-config:{self.name}", self.info, None, self._ifcond,
+            self.features, None, members, None)
+
+        return self.full_config_type
+
+    def check(self, schema):
+        super().check(schema)
+        assert self.full_config_type
+
+    def connect_doc(self, doc=None):
+        super().connect_doc(doc)
+        doc = doc or self.doc
+        if doc:
+            if self.config_type and self.config_type.is_implicit():
+                self.config_type.connect_doc(doc)
+
     def visit(self, visitor):
         super().visit(visitor)
         visitor.visit_class(self)
@@ -1236,6 +1271,11 @@ def _def_exprs(self, exprs):
             else:
                 assert False
 
+        classes = [c for c in self._entity_list
+                   if isinstance(c,QAPISchemaClass)]
+        for c in classes:
+            self._def_entity(c.get_qom_config_type(self))
+
     def check(self):
         for ent in self._entity_list:
             ent.check(self)
-- 
2.31.1


