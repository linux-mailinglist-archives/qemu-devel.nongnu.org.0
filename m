Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75EA31F94E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:19:30 +0100 (CET)
Received: from localhost ([::1]:35350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4kr-0006IM-MN
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WU-0007Po-Do
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WO-00020Y-2D
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RK2zRVkCSKZ4dL1RSHg4gMDiBqy3XP4VMhg5NukAtto=;
 b=GDkK3oqDwkfJVrR9nTSWZ3F4a1duB/1CdIC9Ie9vmeVX3Y7Zz5hhglF+A5eDtwVzE2gUjg
 mO1Ol6zQy3iZj5J5eSHRmpESWt5UAQiy/XBmR+A09IDQL2ZTNxnbBr6MbfChkImMhB9YRV
 ajgi9fsLgYT3mt7Iy1zhu7842TOsG6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-WJ0RLHjONdeb9341vPe50w-1; Fri, 19 Feb 2021 07:04:28 -0500
X-MC-Unique: WJ0RLHjONdeb9341vPe50w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7AEA192AB7A;
 Fri, 19 Feb 2021 12:04:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B988E6085D;
 Fri, 19 Feb 2021 12:04:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 367B0112EFE5; Fri, 19 Feb 2021 13:04:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/18] qapi/introspect.py: Add docstrings to _gen_tree and
 _tree_to_qlit
Date: Fri, 19 Feb 2021 13:04:19 +0100
Message-Id: <20210219120422.600850-16-armbru@redhat.com>
In-Reply-To: <20210219120422.600850-1-armbru@redhat.com>
References: <20210219120422.600850-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-16-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Doc string improvements squashed in]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 05c1a196e9..15cce6854d 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -100,6 +100,15 @@ def __init__(self, value: _ValueT, ifcond: Iterable[str],
 def _tree_to_qlit(obj: JSONValue,
                   level: int = 0,
                   dict_value: bool = False) -> str:
+    """
+    Convert the type tree into a QLIT C string, recursively.
+
+    :param obj: The value to convert.
+                This value may not be Annotated when dict_value is True.
+    :param level: The indentation level for this particular value.
+    :param dict_value: True when the value being processed belongs to a
+                       dict key; which suppresses the output indent.
+    """
 
     def indent(level: int) -> str:
         return level * 4 * ' '
@@ -246,6 +255,17 @@ def _gen_features(features: List[QAPISchemaFeature]
     def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
                   ifcond: Sequence[str],
                   features: Optional[List[QAPISchemaFeature]]) -> None:
+        """
+        Build and append a SchemaInfo object to self._trees.
+
+        :param name: The SchemaInfo's name.
+        :param mtype: The SchemaInfo's meta-type.
+        :param obj: Additional SchemaInfo members, as appropriate for
+                    the meta-type.
+        :param ifcond: Conditionals to apply to the SchemaInfo.
+        :param features: The SchemaInfo's features.
+                         Will be omitted from the output if empty.
+        """
         comment: Optional[str] = None
         if mtype not in ('command', 'event', 'builtin', 'array'):
             if not self._unmask:
-- 
2.26.2


