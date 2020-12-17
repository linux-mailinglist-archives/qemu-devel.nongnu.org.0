Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26D2DCACE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:05:24 +0100 (CET)
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpifT-0007bj-J4
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:05:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUb-0004U8-Ex
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:54:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUM-0006Is-08
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:54:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkgHh8k+I2YPr3xwSdQOVN0Z+dMhJaGNIwtCw8MwDfo=;
 b=WS9b6R0rEJ9oT3fdR9+8YLFyngfn2nBNN5s1bD19huOOTvhM3SPMQHvMOQaEQ9PKiXtdK2
 5uyu1FQXzlSKAt/y5kMiDBkz8i7U8jPA2qbPHY7ek5QtCNlFeCtvRzopYSh6Er3Ye/U7VI
 WUDMohbdSMd/DXFqPADvU2sRPicm5Gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-HPL8xIWKP3OWArGBdygOyg-1; Wed, 16 Dec 2020 20:53:51 -0500
X-MC-Unique: HPL8xIWKP3OWArGBdygOyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9556659
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:53:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDDD760CC4;
 Thu, 17 Dec 2020 01:53:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 07/13] qapi/introspect.py: Introduce preliminary tree typing
Date: Wed, 16 Dec 2020 20:53:37 -0500
Message-Id: <20201217015343.196279-8-jsnow@redhat.com>
In-Reply-To: <20201217015343.196279-1-jsnow@redhat.com>
References: <20201217015343.196279-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The types will be used in forthcoming patches to add typing. These types
describe the layout and structure of the objects passed to
_tree_to_qlit, but lack the power to describe annotations until the next
commit.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 0aa3b77109f..b82efe16f6e 100644
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
@@ -26,6 +32,28 @@
 )
 
 
+# This module constructs a tree data structure that is used to
+# generate the introspection information for QEMU. It behaves similarly
+# to a JSON value.
+#
+# A complexity over JSON is that our values may or may not be annotated.
+#
+# Un-annotated values may be:
+#     Scalar: str, bool, None.
+#     Non-scalar: List, Dict
+# _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
+#
+# With optional annotations, the type of all values is:
+# TreeValue = Union[_value, Annotated[_value]]
+#
+# Sadly, mypy does not support recursive types, so we must approximate this.
+_stub = Any
+_scalar = Union[str, bool, None]
+_nonscalar = Union[Dict[str, _stub], List[_stub]]
+_value = Union[_scalar, _nonscalar]
+# TreeValue = Union[_value, 'Annotated[_value]']
+
+
 def _make_tree(obj, ifcond, comment=None):
     extra = {
         'if': ifcond,
-- 
2.26.2


