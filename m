Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEC322348
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:46:57 +0100 (CET)
Received: from localhost ([::1]:59792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELqq-00062R-JY
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELgi-0002Qn-EV
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELel-0005Nk-QD
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4cuqkJAUQKR5Gdt+K1rgEmNceiXfV/hTv6w2GRuTgE=;
 b=DAnyEDWUnVeAabG16ZL9DkSHZKHbE3joxDyxIi2nF/uGqgiM3Ze2Y4ZAShaI27gLAXWEZ6
 4JUb14ciuBV2m2iAQIkavmZ+K6JTdml8IQI304LlpUTi8g3Ca62n0bkcukBIYXCYjJou3s
 TnEmdODpnFVujdE4ciFbcspKDlaz5dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-isTpgk2gMmC380BbHBmlfQ-1; Mon, 22 Feb 2021 19:34:25 -0500
X-MC-Unique: isTpgk2gMmC380BbHBmlfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48F91107ACC7;
 Tue, 23 Feb 2021 00:34:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C7D35D6D5;
 Tue, 23 Feb 2021 00:34:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 16/16] qapi/expr.py: Use an expression checker dispatch
 table
Date: Mon, 22 Feb 2021 19:34:08 -0500
Message-Id: <20210223003408.964543-17-jsnow@redhat.com>
In-Reply-To: <20210223003408.964543-1-jsnow@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

This enforces a type signature against all of the top-level expression
check routines without necessarily needing to create some
overcomplicated class hierarchy for them.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 64 +++++++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 3672637487b..f1c58483915 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -31,9 +31,12 @@
 structures and contextual semantic validation.
 """
 
+from enum import Enum
 import re
 from typing import (
+    Callable,
     Collection,
+    Dict,
     Iterable,
     List,
     MutableMapping,
@@ -505,6 +508,29 @@ def check_event(expr: Expression, info: QAPISourceInfo) -> None:
     check_type(args, info, "'data'", allow_dict=not boxed)
 
 
+class ExpressionType(str, Enum):
+    INCLUDE = 'include'
+    ENUM = 'enum'
+    UNION = 'union'
+    ALTERNATE = 'alternate'
+    STRUCT = 'struct'
+    COMMAND = 'command'
+    EVENT = 'event'
+
+    def __str__(self) -> str:
+        return str(self.value)
+
+
+_CHECK_FN: Dict[str, Callable[[Expression, QAPISourceInfo], None]] = {
+    'enum': check_enum,
+    'union': check_union,
+    'alternate': check_alternate,
+    'struct': check_struct,
+    'command': check_command,
+    'event': check_event,
+}
+
+
 def check_exprs(exprs: List[_JSObject]) -> List[_JSObject]:
     """
     Validate and normalize a list of parsed QAPI schema expressions. [RW]
@@ -531,24 +557,16 @@ def check_exprs(exprs: List[_JSObject]) -> List[_JSObject]:
         assert tmp is None or isinstance(tmp, QAPIDoc)
         doc: Optional[QAPIDoc] = tmp
 
-        if 'include' in expr:
-            continue
-
-        if 'enum' in expr:
-            meta = 'enum'
-        elif 'union' in expr:
-            meta = 'union'
-        elif 'alternate' in expr:
-            meta = 'alternate'
-        elif 'struct' in expr:
-            meta = 'struct'
-        elif 'command' in expr:
-            meta = 'command'
-        elif 'event' in expr:
-            meta = 'event'
+        for kind in ExpressionType:
+            if kind in expr:
+                meta = kind
+                break
         else:
             raise QAPISemError(info, "expression is missing metatype")
 
+        if meta == ExpressionType.INCLUDE:
+            continue
+
         name = cast(str, expr[meta])  # Asserted right below:
         check_name_is_str(name, info, "'%s'" % meta)
         info.set_defn(meta, name)
@@ -563,21 +581,7 @@ def check_exprs(exprs: List[_JSObject]) -> List[_JSObject]:
             raise QAPISemError(info,
                                "documentation comment required")
 
-        if meta == 'enum':
-            check_enum(expr, info)
-        elif meta == 'union':
-            check_union(expr, info)
-        elif meta == 'alternate':
-            check_alternate(expr, info)
-        elif meta == 'struct':
-            check_struct(expr, info)
-        elif meta == 'command':
-            check_command(expr, info)
-        elif meta == 'event':
-            check_event(expr, info)
-        else:
-            assert False, 'unexpected meta type'
-
+        _CHECK_FN[meta](expr, info)
         check_if(expr, info, meta)
         check_features(expr.get('features'), info)
         check_flags(expr, info)
-- 
2.29.2


