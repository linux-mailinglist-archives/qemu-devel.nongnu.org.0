Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DCD30E8A1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 01:38:07 +0100 (CET)
Received: from localhost ([::1]:45780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ses-0006zI-Dq
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 19:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZQ-0001GJ-5Q
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZF-0000d7-Gd
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612398736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1SsbOm4FHH0XCOp+wutYMrVH+yv5sFpo6JYVyifERMA=;
 b=BoDTVDqa7C4Z2E83Ns+f55F251pKvDYBei6kgBzU8Dg00mlxqrWZqNGvKO+sqWTczQJLvT
 sCPkNXrEKQXZwDwhyIBtQcZkLFA+4h+aWpnpsr9FkMN4ckAHt1zOf1jCDWfvzEK0OdBzii
 yg/LKVI7iRH6Ag86yLOpSBCvN+WOSXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-KFbLMwg9O0WT08nSIlobFg-1; Wed, 03 Feb 2021 19:32:15 -0500
X-MC-Unique: KFbLMwg9O0WT08nSIlobFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FF1D107ACF5
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 00:32:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEBEB1007622;
 Thu,  4 Feb 2021 00:32:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 08/15] qapi/introspect.py: Introduce preliminary tree typing
Date: Wed,  3 Feb 2021 19:32:00 -0500
Message-Id: <20210204003207.2856909-9-jsnow@redhat.com>
In-Reply-To: <20210204003207.2856909-1-jsnow@redhat.com>
References: <20210204003207.2856909-1-jsnow@redhat.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
index 45231d2abc3..8e019b4a26a 100644
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
+# TreeValue = TODO, in a forthcoming commit.
+
+
 def _make_tree(obj, ifcond, comment=None):
     extra = {
         'if': ifcond,
-- 
2.29.2


