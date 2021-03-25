Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29134891A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:30:04 +0100 (CET)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJVL-00043s-GB
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6b-0002ST-BM
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6X-0008WF-8B
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jitr1EUtQ1t43IwpfD9osXFT9H5RNaF+IKMQtxf0DMk=;
 b=CTgqW/PuVZdGoA35g+hC4PysvmXA4Wfpo/r99eU/JvwKibjghwv6e8CkKZwd3dOmQXTSb9
 PM2mUk9vmFwgWuk8ZSYAAKVWTZ48Jet6nMVqNl0x3/g69gA+tUKXsUbwh1tuNPB9Z3OT64
 X6RigIU4UOEOEfzsjwpAJSWWdRztTHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-fw-FPec3NnC14O3JOLX_0Q-1; Thu, 25 Mar 2021 02:04:21 -0400
X-MC-Unique: fw-FPec3NnC14O3JOLX_0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3385C87A826;
 Thu, 25 Mar 2021 06:04:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B427866C7;
 Thu, 25 Mar 2021 06:04:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 19/19] qapi/expr.py: Use an expression checker dispatch
 table
Date: Thu, 25 Mar 2021 02:03:56 -0400
Message-Id: <20210325060356.4040114-20-jsnow@redhat.com>
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

This enforces a type signature against all of the top-level expression
check routines without necessarily needing to create some
overcomplicated class hierarchy for them.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 63 +++++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index aabbc255d2..c42d061e68 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -31,8 +31,10 @@
 structures and contextual semantic validation.
 """
 
+from enum import Enum
 import re
 from typing import (
+    Callable,
     Collection,
     Dict,
     Iterable,
@@ -572,6 +574,29 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
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
+_CHECK_FN: Dict[str, Callable[[_JSONObject, QAPISourceInfo], None]] = {
+    'enum': check_enum,
+    'union': check_union,
+    'alternate': check_alternate,
+    'struct': check_struct,
+    'command': check_command,
+    'event': check_event,
+}
+
+
 def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
     """
     Validate and normalize a list of parsed QAPI schema expressions.
@@ -598,24 +623,16 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
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
         check_name_is_str(expr[meta], info, "'%s'" % meta)
         name = cast(str, expr[meta])
         info.set_defn(meta, name)
@@ -630,21 +647,7 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
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
2.30.2


