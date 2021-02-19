Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2A31FBD3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:17:09 +0100 (CET)
Received: from localhost ([::1]:36494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Wm-0000k8-Rv
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76R-0004pZ-5O
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76L-0004ho-DO
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613746187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5G6Uult3K5VI6ei7HCvvqbEYUw3mZuVFNs0bUUVkXeQ=;
 b=DYs34X4N9/D0CHXOYx22FKRa7AEBdc0oIbr+n5nJ4T3Tt8fSa+78F6q/1nUvp+eYPi3yB8
 ztTNB7K3L3BKpZteX2Wm/JQ8WUQN+6bKXQzeURr+QpdmTc4b+UmgPLfAdZNynkQYwWD5lZ
 v/PzWtolNCLA/wcMLgtFcTnfKMV6NkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-I46xMaV-OBi09X8zp8_sWg-1; Fri, 19 Feb 2021 09:49:44 -0500
X-MC-Unique: I46xMaV-OBi09X8zp8_sWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0202100CC8D;
 Fri, 19 Feb 2021 14:49:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1794189C4;
 Fri, 19 Feb 2021 14:49:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8401C112F00D; Fri, 19 Feb 2021 15:49:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] qapi/introspect.py: Type _gen_tree variants as
 Sequence[str]
Date: Fri, 19 Feb 2021 15:49:38 +0100
Message-Id: <20210219144939.604488-18-armbru@redhat.com>
In-Reply-To: <20210219144939.604488-1-armbru@redhat.com>
References: <20210219144939.604488-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Optional[List] is clunky; an empty sequence can more elegantly convey
"no variants". By downgrading "List" to "Sequence", we can also accept
tuples; this is useful for the empty tuple specifically, which we may
use as a default parameter because it is immutable.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-18-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Doc string touched up]
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index e770c9432b..d0b0fd19ed 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -249,13 +249,13 @@ const QLitObject %(c_name)s = %(c_string)s;
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
 
@@ -302,7 +302,7 @@ const QLitObject %(c_name)s = %(c_string)s;
 
     def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
                            json_type: str) -> None:
-        self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
+        self._gen_tree(name, 'builtin', {'json-type': json_type}, [])
 
     def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
                         ifcond: Sequence[str],
@@ -320,7 +320,7 @@ const QLitObject %(c_name)s = %(c_string)s;
                          element_type: QAPISchemaType) -> None:
         element = self._use_type(element_type)
         self._gen_tree('[' + element + ']', 'array', {'element-type': element},
-                       ifcond, None)
+                       ifcond)
 
     def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
                                ifcond: Sequence[str],
-- 
2.26.2


