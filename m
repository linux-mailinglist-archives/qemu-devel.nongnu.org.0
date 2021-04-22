Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120953677DF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:23:58 +0200 (CEST)
Received: from localhost ([::1]:47818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPwb-0005gw-4i
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPh2-0006dG-4X
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgr-0006VC-3d
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4jp8cAAn1x1QPx55eEH2P8Gg4s33gFRJr6p0MqE0aw=;
 b=UswRAuH3XOq5nOqRyDX+EBe0QdiT4gIKLaVwybvSiQbTzLOey5GYQUZdx+TyDkTsC2ePB9
 B/etzfjjPCBiRUanBmnQdQAKoRfk0ppmIidjV0Smv7B8QaNKVgELD8anThdqs4/wyG/PSg
 cO9yD+p2EDFql7t+f3saaHjH9qBhlPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-6mmcbhxOMi28tE5k_tukAg-1; Wed, 21 Apr 2021 23:07:33 -0400
X-MC-Unique: 6mmcbhxOMi28tE5k_tukAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AF4F107ACC7;
 Thu, 22 Apr 2021 03:07:33 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 334EC607CB;
 Thu, 22 Apr 2021 03:07:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/22] qapi/parser: [RFC] overload the return type of get_expr
Date: Wed, 21 Apr 2021 23:07:11 -0400
Message-Id: <20210422030720.3685766-14-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Teach mypy that there are two possible return types here: either an
Expression, or ... something else.

Not a SLOC reduction, but it does remove an assertion. It also isn't
much safer than a cast, mypy has no insight into if overloads are true
or not. It's on the honor system.

I thought I'd demonstrate its use, though.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index f2b57d5642a..cbdddc344e7 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -23,6 +23,7 @@
     Optional,
     Set,
     Union,
+    overload,
 )
 
 from .common import match_nofail
@@ -95,8 +96,7 @@ def _parse(self) -> None:
                     self.docs.append(cur_doc)
                 continue
 
-            expr = self.get_expr(False)
-            assert isinstance(expr, dict)  # Guaranteed when nested=False
+            expr = self.get_expr()
 
             if 'include' in expr:
                 self.reject_expr_doc(cur_doc)
@@ -304,8 +304,15 @@ def get_values(self) -> List[object]:
                 raise QAPIParseError(self, "expected ',' or ']'")
             self.accept()
 
+    @overload
+    # No nesting, must be an Expression.
+    def get_expr(self) -> Expression: ...
+
+    @overload
+    # Possibly nested, might be anything.
+    def get_expr(self, nested: bool) -> _ExprValue: ...
+
     def get_expr(self, nested: bool = False) -> _ExprValue:
-        # TODO: Teach mypy that nested=False means the retval is a Dict.
         expr: _ExprValue
         if self.tok != '{' and not nested:
             raise QAPIParseError(self, "expected '{'")
-- 
2.30.2


