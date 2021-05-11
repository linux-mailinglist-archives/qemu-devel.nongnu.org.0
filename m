Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4977E37B157
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:08:26 +0200 (CEST)
Received: from localhost ([::1]:44714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaYD-0001hc-Aw
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW5-0007MJ-41
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW3-0006PB-EA
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDjVSiuSSGwztDqXk3c2sk74qecBq7DNE6dMOBfqomI=;
 b=O7kCd/gKNNyB7B9GQuLxXkO+lxDzX+slwMXSxPPtALrplF2+UyBtcX10vLFEKXahL2E++O
 4/ctW8dbXz+VxP0T6vStqaO7jNz4Ws37tRPp3a7ySkCmjvMJU9LSpI0LdcMaxPXVRqp9/H
 rqefpw2swBXUiJzD8Q/9A6TQ1MZSy7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-MQtRNZ9dOOWm7RfGomsZnQ-1; Tue, 11 May 2021 18:06:08 -0400
X-MC-Unique: MQtRNZ9dOOWm7RfGomsZnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D83E2FC80;
 Tue, 11 May 2021 22:06:07 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E46AABA6F;
 Tue, 11 May 2021 22:06:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/21] qapi/parser: enforce all top-level expressions must
 be dict in _parse()
Date: Tue, 11 May 2021 18:05:46 -0400
Message-Id: <20210511220601.2110055-7-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using get_expr nested=False, allow get_expr to always return
any expression. In exchange, add a new error message to the top-level
parser that explains the semantic error: Top-level expressions must
always be JSON objects.

This helps mypy understand the rest of this function which assumes that
get_expr did indeed return a dict.

The exception type changes from QAPIParseError to QAPISemError as a
result, and the error message in two tests now changes.

Signed-off-by: John Snow <jsnow@redhat.com>

---

Thanks Markus, I like this quite a bit better. I think I swung the
pendulum back too far away from "try not to change anything". This is
cleaner.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py                        | 14 ++++++++------
 tests/qapi-schema/non-objects.err             |  2 +-
 tests/qapi-schema/quoted-structural-chars.err |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index ba17f1357ad..d554b5485a6 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -78,7 +78,11 @@ def _parse(self):
                     self.docs.append(cur_doc)
                 continue
 
-            expr = self.get_expr(False)
+            expr = self.get_expr()
+            if not isinstance(expr, dict):
+                raise QAPISemError(
+                    info, "top-level expression must be an object")
+
             if 'include' in expr:
                 self.reject_expr_doc(cur_doc)
                 if len(expr) != 1:
@@ -251,7 +255,7 @@ def get_members(self):
             self.accept()
             if key in expr:
                 raise QAPIParseError(self, "duplicate key '%s'" % key)
-            expr[key] = self.get_expr(True)
+            expr[key] = self.get_expr()
             if self.tok == '}':
                 self.accept()
                 return expr
@@ -270,7 +274,7 @@ def get_values(self):
             raise QAPIParseError(
                 self, "expected '{', '[', ']', string, or boolean")
         while True:
-            expr.append(self.get_expr(True))
+            expr.append(self.get_expr())
             if self.tok == ']':
                 self.accept()
                 return expr
@@ -278,9 +282,7 @@ def get_values(self):
                 raise QAPIParseError(self, "expected ',' or ']'")
             self.accept()
 
-    def get_expr(self, nested):
-        if self.tok != '{' and not nested:
-            raise QAPIParseError(self, "expected '{'")
+    def get_expr(self):
         if self.tok == '{':
             self.accept()
             expr = self.get_members()
diff --git a/tests/qapi-schema/non-objects.err b/tests/qapi-schema/non-objects.err
index 3a4ea36966e..23bdb69c711 100644
--- a/tests/qapi-schema/non-objects.err
+++ b/tests/qapi-schema/non-objects.err
@@ -1 +1 @@
-non-objects.json:1:1: expected '{'
+non-objects.json:1: top-level expression must be an object
diff --git a/tests/qapi-schema/quoted-structural-chars.err b/tests/qapi-schema/quoted-structural-chars.err
index 07d1561d1f7..af6c1e173db 100644
--- a/tests/qapi-schema/quoted-structural-chars.err
+++ b/tests/qapi-schema/quoted-structural-chars.err
@@ -1 +1 @@
-quoted-structural-chars.json:1:1: expected '{'
+quoted-structural-chars.json:1: top-level expression must be an object
-- 
2.30.2


