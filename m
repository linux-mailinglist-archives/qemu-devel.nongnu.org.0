Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB51031C59E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:40:06 +0100 (CET)
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqHV-0006Pq-VQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwa-0001d7-Iv
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwY-00036l-W2
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613441906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8ItUfgk19UqYErZWTP4mxz5owKMRR5BUpTeXsR1rwk=;
 b=cxwV6qFNRfMYd94hwwCPn/L1WpTOT20hdz/VZafnSdG6jdJszs8unVj+jVD0k+4wl+LycR
 9urbR0Be3nLET6iTWCSjnXVBYDF5ZJh6rSrFdXq1DOgCbrjIvl0nx3/xIjlbtXSBn/A/N4
 qms1Atc1ebqYRYqjAHXWpgbIeJP40sU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-43S76pUHPf2x1eAGlrUdgQ-1; Mon, 15 Feb 2021 21:18:24 -0500
X-MC-Unique: 43S76pUHPf2x1eAGlrUdgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C33180196C;
 Tue, 16 Feb 2021 02:18:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0712110023AF;
 Tue, 16 Feb 2021 02:18:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 09/19] qapi/introspect.py: Introduce preliminary tree typing
Date: Mon, 15 Feb 2021 21:17:59 -0500
Message-Id: <20210216021809.134886-10-jsnow@redhat.com>
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

The types will be used in forthcoming patches to add typing. These types
describe the layout and structure of the objects passed to
_tree_to_qlit, but lack the power to describe annotations until the next
commit.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 45231d2abc3..3c37c138013 100644
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
2.29.2


