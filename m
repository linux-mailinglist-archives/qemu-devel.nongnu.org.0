Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D224331F967
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:27:36 +0100 (CET)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4sh-0007IC-S4
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WW-0007Ru-L8
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WM-0001zj-8i
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFJUMEgmzp9ShLD1CNoKzN/+zy9PhhNGNH8ZDfqz2Gk=;
 b=A+0KabaJzr/iyB63re0Kk4oLKBeE0wUtjUps5SmZOmJ7xjevXlSl+uxSdzprdYOQfIHEdO
 XdxzloEI2z2KgbXugUUO/rQ8e6lgOmMYfr2Eauay6aUCpJoXA81TdQanZ3cTAKEVEywX1S
 c1wgKoZbDG38DPZKWk7j4g21cobLGnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-IWX7hGESMBC9-EkZ7SywvQ-1; Fri, 19 Feb 2021 07:04:27 -0500
X-MC-Unique: IWX7hGESMBC9-EkZ7SywvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 721C5107ACE6;
 Fri, 19 Feb 2021 12:04:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35D2E13470;
 Fri, 19 Feb 2021 12:04:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 22CDD1132A01; Fri, 19 Feb 2021 13:04:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/18] qapi/introspect.py: Introduce preliminary tree typing
Date: Fri, 19 Feb 2021 13:04:13 +0100
Message-Id: <20210219120422.600850-10-armbru@redhat.com>
In-Reply-To: <20210219120422.600850-1-armbru@redhat.com>
References: <20210219120422.600850-1-armbru@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The types will be used in forthcoming patches to add typing. These types
describe the layout and structure of the objects passed to
_tree_to_qlit, but lack the power to describe annotations until the next
commit.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-10-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 88af5383d5..c271006100 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -10,7 +10,13 @@
 See the COPYING file in the top-level directory.
 """
 
-from typing import Optional
+from typing import (
+    Any,
+    Dict,
+    List,
+    Optional,
+    Union,
+)
 
 from .common import (
     c_name,
@@ -26,6 +32,29 @@
 )
 
 
+# This module constructs a tree data structure that is used to
+# generate the introspection information for QEMU. It is shaped
+# like a JSON value.
+#
+# A complexity over JSON is that our values may or may not be annotated.
+#
+# Un-annotated values may be:
+#     Scalar: str, bool, None.
+#     Non-scalar: List, Dict
+# _value = Union[str, bool, None, Dict[str, JSONValue], List[JSONValue]]
+#
+# With optional annotations, the type of all values is:
+# JSONValue = Union[_Value, Annotated[_Value]]
+#
+# Sadly, mypy does not support recursive types; so the _Stub alias is used to
+# mark the imprecision in the type model where we'd otherwise use JSONValue.
+_Stub = Any
+_Scalar = Union[str, bool, None]
+_NonScalar = Union[Dict[str, _Stub], List[_Stub]]
+_Value = Union[_Scalar, _NonScalar]
+# JSONValue = TODO, in a forthcoming commit.
+
+
 def _make_tree(obj, ifcond, comment=None):
     extra = {
         'if': ifcond,
-- 
2.26.2


