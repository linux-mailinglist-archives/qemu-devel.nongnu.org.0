Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A47B30C8C3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:01:36 +0100 (CET)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zzb-0001PU-2b
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlZ-0004p5-Kq
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlX-0008Cg-Ub
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612288023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFDyOxoGjdw/M6uGtxwmb9fdlj1TAK7OqU/iyC4IfjE=;
 b=JVqPdAo1Nti8ldi5PpWOUnTXjL4Wmg9lvg1qL8C+yCoyhbDcfjeS7ByMOIQiLk1uB09kDy
 Z4pBaT0GgF0veaYXcitTqppDuEMIEchA1Yr6051YRpAy20GXLueTzyFEDkIW1+qgNqKyM7
 4e2xDo9DRMiyjipdSeuam2TGY5+FFeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-u_6yA9MoMCq3oNaXwsaYMg-1; Tue, 02 Feb 2021 12:47:00 -0500
X-MC-Unique: u_6yA9MoMCq3oNaXwsaYMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93AAF835E22;
 Tue,  2 Feb 2021 17:46:59 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D314E5C1CF;
 Tue,  2 Feb 2021 17:46:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 07/14] qapi/introspect.py: Introduce preliminary tree typing
Date: Tue,  2 Feb 2021 12:46:44 -0500
Message-Id: <20210202174651.2274166-8-jsnow@redhat.com>
In-Reply-To: <20210202174651.2274166-1-jsnow@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
2.29.2


