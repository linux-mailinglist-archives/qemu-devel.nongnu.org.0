Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE41C68E5F3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 03:14:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPZxS-0002jU-Sz; Tue, 07 Feb 2023 21:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxQ-0002iU-Qp
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxO-00040Q-7n
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675822389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJpMAPmup+OzFzYUIcSQ1E0AC85PvH7xKpNHcGZb5qM=;
 b=PCLOfMav/WksjjTh82RzG7AxP1ImDPBNcbQ+sa9ZuY/H30CvqPAAK1SIAyQm0xs/hf76oR
 Yi//ib5ppMCmPzepu43z24nduh60nvIQITmGhPWfKBJ1NrmJPbCPwJkxCVAOfbgE38Spvq
 SCDVTgO98ZRLOLcYEnsIh3TVAsWd7eU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-_zdb9GwzOuuohp5DavAxKA-1; Tue, 07 Feb 2023 21:13:07 -0500
X-MC-Unique: _zdb9GwzOuuohp5DavAxKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 408F21C29D4A;
 Wed,  8 Feb 2023 02:13:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1314D1121314;
 Wed,  8 Feb 2023 02:13:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 3/7] qapi/expr: Use TopLevelExpr where appropriate
Date: Tue,  7 Feb 2023 21:13:02 -0500
Message-Id: <20230208021306.870657-4-jsnow@redhat.com>
In-Reply-To: <20230208021306.870657-1-jsnow@redhat.com>
References: <20230208021306.870657-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove most usages of _JSONObject with a more semantically meaningful
alias. Note that this is only a semantic alias; the distinction is not
enforced by the type system. This is merely a benefit for the human:
instead of check_xyz functions operating on a representation of some
"JSON Object", we can document them as operating on QAPI's Top Level
Expressions directly; it's more semantically meaningful.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 293f830fe9d..338c9ea4131 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -44,7 +44,7 @@
 
 from .common import c_name
 from .error import QAPISemError
-from .parser import ParsedExpression
+from .parser import ParsedExpression, TopLevelExpr
 from .source import QAPISourceInfo
 
 
@@ -229,11 +229,11 @@ def pprint(elems: Iterable[str]) -> str:
                pprint(unknown), pprint(allowed)))
 
 
-def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_flags(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
     Ensure flag members (if present) have valid values.
 
-    :param expr: The expression to validate.
+    :param expr: The `TopLevelExpr` to validate.
     :param info: QAPI schema source file information.
 
     :raise QAPISemError:
@@ -447,9 +447,9 @@ def check_features(features: Optional[object],
         check_if(feat, info, source)
 
 
-def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_enum(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as an ``enum`` definition.
+    Normalize and validate this `TopLevelExpr` as an ``enum`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -486,9 +486,9 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_features(member.get('features'), info)
 
 
-def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_struct(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as a ``struct`` definition.
+    Normalize and validate this `TopLevelExpr` as a ``struct`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -503,9 +503,9 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
     check_type(expr.get('base'), info, "'base'")
 
 
-def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_union(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as a ``union`` definition.
+    Normalize and validate this `TopLevelExpr` as a ``union`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -531,9 +531,9 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_type(value['type'], info, source, allow_array=not base)
 
 
-def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_alternate(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as an ``alternate`` definition.
+    Normalize and validate this `TopLevelExpr` as an ``alternate`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -557,9 +557,9 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_type(value['type'], info, source, allow_array=True)
 
 
-def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_command(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as a ``command`` definition.
+    Normalize and validate this `TopLevelExpr` as a ``command`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -577,9 +577,9 @@ def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
     check_type(rets, info, "'returns'", allow_array=True)
 
 
-def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_event(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as an ``event`` definition.
+    Normalize and validate this `TopLevelExpr` as an ``event`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
-- 
2.39.0


