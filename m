Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC64028CF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:30:22 +0200 (CEST)
Received: from localhost ([::1]:52268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaF2-00040e-Uu
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa6T-00080E-EZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa6Q-0006kV-Kr
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjfIS7D5gRlY8u0FConsY0Eqp5GrMUohAFdsVp3sruY=;
 b=ViLOBIizEk9QdbBB88YGjKARHdaTvUqNvKHj7ZmRnPW3RKEwlUM9+SPFIm4V2bl8hWD6bi
 776BUnbAZvLBzXPZtNSJ8FKihwArMkE38UuNTfeH5AFk2KpejfUFODVT88QwjMX8h8f3sb
 5NxahAKzrbD8ao7PCEYRlceXSh52dKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-P1qsUGyAP-K7NWmjOvNxuw-1; Tue, 07 Sep 2021 08:21:24 -0400
X-MC-Unique: P1qsUGyAP-K7NWmjOvNxuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CBBF6D58A
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:21:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79AA61B46B;
 Tue,  7 Sep 2021 12:21:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 07/32] scripts/qapi: generate CABI dump for C types
Date: Tue,  7 Sep 2021 16:19:18 +0400
Message-Id: <20210907121943.3498701-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

With type units, generate the C ABI dump functions (as blocks protected
with QAPI_CABI define). The top-level function is qapi_cabi(), and it
calls the sub-modules dump functions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/types.py | 58 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 831294fe42..7ac3645d18 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -13,8 +13,15 @@
 # See the COPYING file in the top-level directory.
 """
 
-from typing import List, Optional
+from pathlib import Path
+from typing import (
+    Dict,
+    List,
+    Optional,
+    Set,
+)
 
+from .cabi import CABI, CABIEnum, gen_object_cabi
 from .common import c_enum_const, c_name, mcgen
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import (
@@ -22,6 +29,7 @@
     QAPISchemaEnumMember,
     QAPISchemaFeature,
     QAPISchemaIfCond,
+    QAPISchemaModule,
     QAPISchemaObjectType,
     QAPISchemaObjectTypeMember,
     QAPISchemaType,
@@ -265,6 +273,13 @@ def __init__(self, prefix: str):
         super().__init__(
             prefix, 'qapi-types', ' * Schema-defined QAPI types',
             ' * Built-in QAPI types', __doc__)
+        self._cabi_functions: List[str] = []
+        self._cabi_functions_called: Set[str] = set()
+        self._cabi: Dict[str, CABI] = {}
+
+    def _cabi_add(self, cabis: List[CABI]) -> None:
+        for cabi in cabis:
+            self._cabi.setdefault(cabi.name, cabi)
 
     def _begin_builtin_module(self) -> None:
         self._genc.preamble_add(mcgen('''
@@ -295,6 +310,43 @@ def visit_begin(self, schema: QAPISchema) -> None:
         # gen_object() is recursive, ensure it doesn't visit the empty type
         objects_seen.add(schema.the_empty_object_type.name)
 
+    def _get_qapi_cabi_fn(self, name: str) -> str:
+        fn_name = 'qapi_cabi'
+        if QAPISchemaModule.is_builtin_module(name):
+            fn_name += '_builtin'
+        elif name != self._main_module:
+            name = Path(name).stem
+            fn_name += '_' + c_name(name)
+        return fn_name
+
+    def visit_include(self, name: str, info: Optional[QAPISourceInfo]) -> None:
+        super().visit_include(name, info)
+        cabi_fn = self._get_qapi_cabi_fn(name)
+        if cabi_fn not in self._cabi_functions_called:
+            self._cabi_functions.append(cabi_fn)
+
+    def visit_module_end(self, name: str) -> None:
+        cabi_gen = "".join(f'    {fn}();\n' for fn in self._cabi_functions)
+        self._cabi_functions_called |= set(self._cabi_functions)
+        self._cabi_functions = []
+        cabi_gen += "".join([c.gen_c() for _, c in sorted(self._cabi.items())])
+        self._cabi = {}
+        fn_name = self._get_qapi_cabi_fn(name)
+        self._genh.add(mcgen('''
+
+#ifdef QAPI_CABI
+void %(fn_name)s(void);
+#endif
+''', fn_name=fn_name))
+        self._genc.add(mcgen('''
+
+#ifdef QAPI_CABI
+void %(fn_name)s(void) {
+%(cabi_gen)s
+}
+#endif
+''', fn_name=fn_name, cabi_gen=cabi_gen))
+
     def _gen_type_cleanup(self, name: str) -> None:
         self._genh.add(gen_type_cleanup_decl(name))
         self._genc.add(gen_type_cleanup(name))
@@ -309,6 +361,7 @@ def visit_enum_type(self,
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.preamble_add(gen_enum(name, members, prefix))
             self._genc.add(gen_enum_lookup(name, members, prefix))
+        self._cabi_add([CABIEnum(name, ifcond, members, prefix)])
 
     def visit_array_type(self,
                          name: str,
@@ -334,6 +387,7 @@ def visit_object_type(self,
         with ifcontext(ifcond, self._genh):
             self._genh.preamble_add(gen_fwd_object_or_array(name))
         self._genh.add(gen_object(name, ifcond, base, members, variants))
+        self._cabi_add(gen_object_cabi(name, ifcond, base, members, variants))
         with ifcontext(ifcond, self._genh, self._genc):
             if base and not base.is_implicit():
                 self._genh.add(gen_upcast(name, base))
@@ -353,6 +407,8 @@ def visit_alternate_type(self,
             self._genh.preamble_add(gen_fwd_object_or_array(name))
         self._genh.add(gen_object(name, ifcond, None,
                                   [variants.tag_member], variants))
+        self._cabi_add(gen_object_cabi(name, ifcond, None,
+                                       [variants.tag_member], variants))
         with ifcontext(ifcond, self._genh, self._genc):
             self._gen_type_cleanup(name)
 
-- 
2.33.0.113.g6c40894d24


