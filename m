Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7874F31C58C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:32:48 +0100 (CET)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqAR-0003y4-Go
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwX-0001Tr-28
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwO-00031w-55
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613441895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQB24nfAxz/Y6GQBu3FfiR/mrF6wbsVJL1x/oHAyuTs=;
 b=bMaLiJKNjYBvQfkE+4fo2qWCmb+gFWD4AHOG5p5ukBxR9AF4bTF+oKXt6zeGSKOdR37hJp
 9cWYOHOnZT/7JIVgbGzPIhhIfNUqZ7EqRXGK6TOyWjxg+JEKTgVoIa31dPXygUa5Pm4ftz
 QCv0xOWPbtkpGSx23qESugMvVKokLXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-L4KPa5cPOZmFYfewvBt-Sg-1; Mon, 15 Feb 2021 21:18:13 -0500
X-MC-Unique: L4KPa5cPOZmFYfewvBt-Sg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D59B18A08BD;
 Tue, 16 Feb 2021 02:18:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4899810023AF;
 Tue, 16 Feb 2021 02:18:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 01/19] qapi: Replace List[str] with Sequence[str] for ifcond
Date: Mon, 15 Feb 2021 21:17:51 -0500
Message-Id: <20210216021809.134886-2-jsnow@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It does happen to be a list (as of now), but we can describe it in more
general terms with no loss in accuracy to allow tuples and other
constructs.

In the future, we can write "ifcond: Sequence[str] = ()" as a default
parameter, which we could not do with a Mutable type like a List.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/commands.py |  3 ++-
 scripts/qapi/events.py   |  4 ++--
 scripts/qapi/gen.py      | 12 ++++++------
 scripts/qapi/types.py    | 12 ++++++------
 scripts/qapi/visit.py    | 10 +++++-----
 5 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 54af519f44d..0a75a9371ba 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -17,6 +17,7 @@
     Dict,
     List,
     Optional,
+    Sequence,
     Set,
 )
 
@@ -297,7 +298,7 @@ def visit_end(self) -> None:
     def visit_command(self,
                       name: str,
                       info: Optional[QAPISourceInfo],
-                      ifcond: List[str],
+                      ifcond: Sequence[str],
                       features: List[QAPISchemaFeature],
                       arg_type: Optional[QAPISchemaObjectType],
                       ret_type: Optional[QAPISchemaType],
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 8c57deb2b89..90d2f6156d8 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -12,7 +12,7 @@
 See the COPYING file in the top-level directory.
 """
 
-from typing import List, Optional
+from typing import List, Optional, Sequence
 
 from .common import c_enum_const, c_name, mcgen
 from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
@@ -214,7 +214,7 @@ def visit_end(self) -> None:
     def visit_event(self,
                     name: str,
                     info: Optional[QAPISourceInfo],
-                    ifcond: List[str],
+                    ifcond: Sequence[str],
                     features: List[QAPISchemaFeature],
                     arg_type: Optional[QAPISchemaObjectType],
                     boxed: bool) -> None:
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 63549cc8d47..1fa503bdbdf 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -17,8 +17,8 @@
 from typing import (
     Dict,
     Iterator,
-    List,
     Optional,
+    Sequence,
     Tuple,
 )
 
@@ -85,7 +85,7 @@ def write(self, output_dir: str) -> None:
                 fp.write(text)
 
 
-def _wrap_ifcond(ifcond: List[str], before: str, after: str) -> str:
+def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> str:
     if before == after:
         return after   # suppress empty #if ... #endif
 
@@ -127,9 +127,9 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
 class QAPIGenCCode(QAPIGen):
     def __init__(self, fname: str):
         super().__init__(fname)
-        self._start_if: Optional[Tuple[List[str], str, str]] = None
+        self._start_if: Optional[Tuple[Sequence[str], str, str]] = None
 
-    def start_if(self, ifcond: List[str]) -> None:
+    def start_if(self, ifcond: Sequence[str]) -> None:
         assert self._start_if is None
         self._start_if = (ifcond, self._body, self._preamble)
 
@@ -187,11 +187,11 @@ def _bottom(self) -> str:
 
 
 @contextmanager
-def ifcontext(ifcond: List[str], *args: QAPIGenCCode) -> Iterator[None]:
+def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -> Iterator[None]:
     """
     A with-statement context manager that wraps with `start_if()` / `end_if()`.
 
-    :param ifcond: A list of conditionals, passed to `start_if()`.
+    :param ifcond: A sequence of conditionals, passed to `start_if()`.
     :param args: any number of `QAPIGenCCode`.
 
     Example::
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 2bdd6268476..20d572a23aa 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -13,7 +13,7 @@
 # See the COPYING file in the top-level directory.
 """
 
-from typing import List, Optional
+from typing import List, Optional, Sequence
 
 from .common import (
     c_enum_const,
@@ -139,7 +139,7 @@ def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     return ret
 
 
-def gen_object(name: str, ifcond: List[str],
+def gen_object(name: str, ifcond: Sequence[str],
                base: Optional[QAPISchemaObjectType],
                members: List[QAPISchemaObjectTypeMember],
                variants: Optional[QAPISchemaVariants]) -> str:
@@ -307,7 +307,7 @@ def _gen_type_cleanup(self, name: str) -> None:
     def visit_enum_type(self,
                         name: str,
                         info: Optional[QAPISourceInfo],
-                        ifcond: List[str],
+                        ifcond: Sequence[str],
                         features: List[QAPISchemaFeature],
                         members: List[QAPISchemaEnumMember],
                         prefix: Optional[str]) -> None:
@@ -318,7 +318,7 @@ def visit_enum_type(self,
     def visit_array_type(self,
                          name: str,
                          info: Optional[QAPISourceInfo],
-                         ifcond: List[str],
+                         ifcond: Sequence[str],
                          element_type: QAPISchemaType) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.preamble_add(gen_fwd_object_or_array(name))
@@ -328,7 +328,7 @@ def visit_array_type(self,
     def visit_object_type(self,
                           name: str,
                           info: Optional[QAPISourceInfo],
-                          ifcond: List[str],
+                          ifcond: Sequence[str],
                           features: List[QAPISchemaFeature],
                           base: Optional[QAPISchemaObjectType],
                           members: List[QAPISchemaObjectTypeMember],
@@ -351,7 +351,7 @@ def visit_object_type(self,
     def visit_alternate_type(self,
                              name: str,
                              info: Optional[QAPISourceInfo],
-                             ifcond: List[str],
+                             ifcond: Sequence[str],
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
         with ifcontext(ifcond, self._genh):
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 22e62df9017..9aa0b1e11e9 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -13,7 +13,7 @@
 See the COPYING file in the top-level directory.
 """
 
-from typing import List, Optional
+from typing import List, Optional, Sequence
 
 from .common import (
     c_enum_const,
@@ -337,7 +337,7 @@ def _begin_user_module(self, name: str) -> None:
     def visit_enum_type(self,
                         name: str,
                         info: Optional[QAPISourceInfo],
-                        ifcond: List[str],
+                        ifcond: Sequence[str],
                         features: List[QAPISchemaFeature],
                         members: List[QAPISchemaEnumMember],
                         prefix: Optional[str]) -> None:
@@ -348,7 +348,7 @@ def visit_enum_type(self,
     def visit_array_type(self,
                          name: str,
                          info: Optional[QAPISourceInfo],
-                         ifcond: List[str],
+                         ifcond: Sequence[str],
                          element_type: QAPISchemaType) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_visit_decl(name))
@@ -357,7 +357,7 @@ def visit_array_type(self,
     def visit_object_type(self,
                           name: str,
                           info: Optional[QAPISourceInfo],
-                          ifcond: List[str],
+                          ifcond: Sequence[str],
                           features: List[QAPISchemaFeature],
                           base: Optional[QAPISchemaObjectType],
                           members: List[QAPISchemaObjectTypeMember],
@@ -379,7 +379,7 @@ def visit_object_type(self,
     def visit_alternate_type(self,
                              name: str,
                              info: Optional[QAPISourceInfo],
-                             ifcond: List[str],
+                             ifcond: Sequence[str],
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
-- 
2.29.2


