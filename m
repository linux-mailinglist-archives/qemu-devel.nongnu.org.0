Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645074028B6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:26:50 +0200 (CEST)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaBd-0007ax-Di
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa6J-0007ej-8T
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa6G-0006gQ-IW
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MdWjztreNk1HSfZb6qrkgsYAfbyLwZ8/w91WuKIhg24=;
 b=KJ+Pw2PtuEXXINPk8XnHXcrl8fNXDaeEtCVIfDN3IHTpQ2ZKxdwFawrcZ3KdyoE2VXuTBj
 o/6xxTztHutU2G1A09rp7uK/aa1JIPrf0DxzZ6o2QXXp4hSlx8KptPlAPsToq/UrjB3Qw0
 6io5GpyfJfUzOAB3DHEmwVnGtP1Ok9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-lo3dDzczOC-GVelyvUgisA-1; Tue, 07 Sep 2021 08:21:11 -0400
X-MC-Unique: lo3dDzczOC-GVelyvUgisA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99A806D58F
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:21:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2801C5D6CF;
 Tue,  7 Sep 2021 12:20:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 06/32] scripts/qapi: add a CABI module
Date: Tue,  7 Sep 2021 16:19:17 +0400
Message-Id: <20210907121943.3498701-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
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

This module will help to build C ABI tests for both Rust and C QAPI
generated types.

Currently, it will simply print basic struct layout (size and offset of
members) and the enum size and maximum values. By diffing the output, it
will help to ensure that the Rust definition is compatible with the C
version, including with configuration specifics.

Example output:

GuestDeviceAddress struct: sizeof=16
 type member: sizeof=4 offset=0

GuestDeviceAddressKind enum: sizeof=4
 max=1

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build          |   1 +
 scripts/qapi/cabi.py | 137 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 scripts/qapi/cabi.py

diff --git a/meson.build b/meson.build
index 6e871af4d0..cbf3ce19ae 100644
--- a/meson.build
+++ b/meson.build
@@ -1966,6 +1966,7 @@ hxtool = find_program('scripts/hxtool')
 shaderinclude = find_program('scripts/shaderinclude.pl')
 qapi_gen = find_program('scripts/qapi-gen.py')
 qapi_gen_depends = [ meson.source_root() / 'scripts/qapi/__init__.py',
+                     meson.source_root() / 'scripts/qapi/cabi.py',
                      meson.source_root() / 'scripts/qapi/commands.py',
                      meson.source_root() / 'scripts/qapi/common.py',
                      meson.source_root() / 'scripts/qapi/error.py',
diff --git a/scripts/qapi/cabi.py b/scripts/qapi/cabi.py
new file mode 100644
index 0000000000..f33680477f
--- /dev/null
+++ b/scripts/qapi/cabi.py
@@ -0,0 +1,137 @@
+#
+# QAPI helper library
+# C ABI verification test generator
+#
+# pylint: disable=too-few-public-methods
+
+from typing import List, Optional
+
+from .common import c_enum_const, c_name, mcgen
+from .schema import (
+    QAPISchemaEnumMember,
+    QAPISchemaIfCond,
+    QAPISchemaObjectType,
+    QAPISchemaObjectTypeMember,
+    QAPISchemaVariants,
+)
+
+
+class CABI:
+    def __init__(self, name: str, ifcond: QAPISchemaIfCond):
+        self.name = name
+        self.ifcond = ifcond
+
+    def gen_c(self) -> str:
+        raise NotImplementedError()
+
+
+class CABIEnum(CABI):
+    def __init__(
+        self,
+        name: str,
+        ifcond: QAPISchemaIfCond,
+        members: List[QAPISchemaEnumMember],
+        prefix: Optional[str] = None,
+    ):
+        super().__init__(name, ifcond)
+        self.members = members
+        self.prefix = prefix
+
+    def gen_c(self) -> str:
+        last = c_enum_const(self.name, "_MAX", self.prefix)
+        ret = self.ifcond.gen_if()
+        ret += mcgen("""
+    printf("%(name)s enum: sizeof=%%zu\\n", sizeof(%(cname)s));
+    printf(" max=%%d\\n", %(last)s);
+    printf("\\n");
+""", name=self.name, cname=c_name(self.name), last=last)
+        ret += self.ifcond.gen_endif()
+        return ret
+
+
+class CABIStruct(CABI):
+    def __init__(self, name: str, ifcond: QAPISchemaIfCond):
+        super().__init__(name, ifcond)
+        self.members: List[CABIStructMember] = []
+
+    def add_members(self, members: List[QAPISchemaObjectTypeMember]) -> None:
+        for memb in members:
+            if memb.optional:
+                self.add_member(memb.name, memb.ifcond, "has_")
+            self.add_member(memb.name, memb.ifcond)
+
+    def add_variants(self, variants: QAPISchemaVariants) -> None:
+        for var in variants.variants:
+            if var.type.name == "q_empty":
+                continue
+            self.add_member(var.name, var.ifcond, "u.")
+
+    def add_member(self, member: str,
+                   ifcond: Optional[QAPISchemaIfCond] = None,
+                   prefix: str = '') -> None:
+        self.members.append(CABIStructMember(self, member, ifcond, prefix))
+
+    def gen_c(self) -> str:
+        ret = self.ifcond.gen_if()
+        ret += mcgen("""
+    printf("%(name)s struct: sizeof=%%zu\\n", sizeof(%(name)s));
+""", name=self.name)
+        for member in self.members:
+            ret += member.gen_c()
+        ret += mcgen("""
+    printf("\\n");
+""")
+        ret += self.ifcond.gen_endif()
+        return ret
+
+
+class CABIStructMember:
+    def __init__(self, struct: CABIStruct, name: str,
+                 ifcond: Optional[QAPISchemaIfCond] = None,
+                 prefix: str = ''):
+        self.struct = struct
+        self.name = name
+        self.ifcond = ifcond or QAPISchemaIfCond()
+        self.prefix = prefix
+
+    def gen_c(self) -> str:
+        ret = self.ifcond.gen_if()
+        cmember = self.prefix + c_name(self.name)
+        ret += mcgen("""
+    printf(" %(member)s member: sizeof=%%zu offset=%%zu\\n",
+            G_SIZEOF_MEMBER(struct %(sname)s, %(cmember)s),
+            offsetof(struct %(sname)s, %(cmember)s));
+""", member=self.name, sname=self.struct.name, cmember=cmember)
+        ret += self.ifcond.gen_endif()
+        return ret
+
+
+def gen_object_cabi(
+    name: str,
+    ifcond: QAPISchemaIfCond,
+    base: Optional[QAPISchemaObjectType],
+    members: List[QAPISchemaObjectTypeMember],
+    variants: Optional[QAPISchemaVariants],
+) -> List[CABI]:
+    if name == 'q_empty':
+        return []
+    ret = []
+    for var in variants.variants if variants else ():
+        obj = var.type
+        if not isinstance(obj, QAPISchemaObjectType):
+            continue
+        ret.extend(
+            gen_object_cabi(
+                obj.name, obj.ifcond, obj.base, obj.local_members, obj.variants
+            )
+        )
+    cabi = CABIStruct(c_name(name), ifcond)
+    if base:
+        cabi.add_members(base.members)
+    cabi.add_members(members)
+    if variants:
+        cabi.add_variants(variants)
+    if (not base or base.is_empty()) and not members and not variants:
+        cabi.add_member('qapi_dummy_for_empty_struct')
+    ret.append(cabi)
+    return ret
-- 
2.33.0.113.g6c40894d24


