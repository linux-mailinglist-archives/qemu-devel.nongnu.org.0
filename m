Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3131C594
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:37:52 +0100 (CET)
Received: from localhost ([::1]:43552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqFL-0002Qb-0s
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpww-0001sz-Qj
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwk-0003A5-K7
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613441917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mhAxduW96AZmSO+4SUDhkdACORPz0Iapanao3jJ4ys=;
 b=cNfqJrEnNifbljakHXxLK5MWDY/U8cCGgEXW1LFPNQk78pdovU01fwN2FGVkzwt6NMMS8H
 1+wLvaIAb0yGUpHMxmUQnKb0tcj3oYYEGiKYwmq+hP18JQYtyA1LmkZjp4Ap6b7klLMmJ0
 kz24kWyj5FA1A5tnAesvChUmBj6EW3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-888VQ6F3MYKc59EgNfgVUg-1; Mon, 15 Feb 2021 21:18:35 -0500
X-MC-Unique: 888VQ6F3MYKc59EgNfgVUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AB52801962;
 Tue, 16 Feb 2021 02:18:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8238F10023AF;
 Tue, 16 Feb 2021 02:18:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 17/19] qapi/introspect.py: Type _gen_tree variants as
 Sequence[str]
Date: Mon, 15 Feb 2021 21:18:07 -0500
Message-Id: <20210216021809.134886-18-jsnow@redhat.com>
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

Optional[List] is clunky; an empty sequence can more elegantly convey
"no variants". By downgrading "List" to "Sequence", we can also accept
tuples; this is useful for the empty tuple specifically, which we may
use as a default parameter because it is immutable.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 649225988d1..e4d31a59503 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -247,13 +247,13 @@ def _use_type(self, typ: QAPISchemaType) -> str:
         return self._name(typ.name)
 
     @staticmethod
-    def _gen_features(features: List[QAPISchemaFeature]
+    def _gen_features(features: Sequence[QAPISchemaFeature]
                       ) -> List[Annotated[str]]:
         return [Annotated(f.name, f.ifcond) for f in features]
 
     def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
                   ifcond: Sequence[str],
-                  features: Optional[List[QAPISchemaFeature]]) -> None:
+                  features: Sequence[QAPISchemaFeature] = ()) -> None:
         """
         Build and append a SchemaInfo object to self._trees.
 
@@ -261,7 +261,8 @@ def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
         :param mtype: The entity's meta-type.
         :param obj: Additional entity fields, as appropriate for the meta-type.
         :param ifcond: Sequence of conditionals that apply to this entity.
-        :param features: Optional features field for SchemaInfo.
+        :param features: Optional, The features field for SchemaInfo.
+                         Will be omitted from the output if empty.
         """
         comment: Optional[str] = None
         if mtype not in ('command', 'event', 'builtin', 'array'):
@@ -298,7 +299,7 @@ def _gen_variant(self, variant: QAPISchemaVariant
 
     def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
                            json_type: str) -> None:
-        self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
+        self._gen_tree(name, 'builtin', {'json-type': json_type}, [])
 
     def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
                         ifcond: Sequence[str],
@@ -316,7 +317,7 @@ def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
                          element_type: QAPISchemaType) -> None:
         element = self._use_type(element_type)
         self._gen_tree('[' + element + ']', 'array', {'element-type': element},
-                       ifcond, None)
+                       ifcond)
 
     def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
                                ifcond: Sequence[str],
-- 
2.29.2


