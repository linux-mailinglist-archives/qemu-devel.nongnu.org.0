Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4630B38B5C7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 20:09:55 +0200 (CEST)
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljn7K-0003Aj-Au
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 14:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmrJ-0002oX-58
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmr1-0006ab-3m
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621533182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p3t2zKU0mg+50vXcwjkyMJ2OJtWitEQR+GSzr+7nDu0=;
 b=X6oK12D1zG6cXIQ1GuSPJkWu/1DK0LHCgR1xCZau8eZrSX23SY0xWe3wmJ5Glg4WODbq+J
 zMmasRrv8owSUA/6s4VdC42HCsA/hR5NkBbSFv2XNscnJ+q2fFA9WVzRa1IJMqzs3Wfmtg
 jRw753VanfHpNPXKmlfZpBj7kgutA5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-dznmRNSaNeOHAwFdHrfynQ-1; Thu, 20 May 2021 13:53:00 -0400
X-MC-Unique: dznmRNSaNeOHAwFdHrfynQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 737BA1007B06;
 Thu, 20 May 2021 17:52:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F5CB687DB;
 Thu, 20 May 2021 17:52:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A3C71138469; Thu, 20 May 2021 19:52:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] qapi/parser: enforce all top-level expressions must be
 dict in _parse()
Date: Thu, 20 May 2021 19:52:47 +0200
Message-Id: <20210520175256.1119684-7-armbru@redhat.com>
In-Reply-To: <20210520175256.1119684-1-armbru@redhat.com>
References: <20210520175256.1119684-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Instead of using get_expr nested=False, allow get_expr to always return
any expression. In exchange, add a new error message to the top-level
parser that explains the semantic error: Top-level expressions must
always be JSON objects.

This helps mypy understand the rest of this function which assumes that
get_expr did indeed return a dict.

The exception type changes from QAPIParseError to QAPISemError as a
result, and the error message in two tests now changes.

Signed-off-by: John Snow <jsnow@redhat.com>

Message-Id: <20210519183951.3946870-7-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py                        | 14 ++++++++------
 tests/qapi-schema/non-objects.err             |  2 +-
 tests/qapi-schema/quoted-structural-chars.err |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 0bc852eda7..ffdd4298b6 100644
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
index 3a4ea36966..23bdb69c71 100644
--- a/tests/qapi-schema/non-objects.err
+++ b/tests/qapi-schema/non-objects.err
@@ -1 +1 @@
-non-objects.json:1:1: expected '{'
+non-objects.json:1: top-level expression must be an object
diff --git a/tests/qapi-schema/quoted-structural-chars.err b/tests/qapi-schema/quoted-structural-chars.err
index 07d1561d1f..af6c1e173d 100644
--- a/tests/qapi-schema/quoted-structural-chars.err
+++ b/tests/qapi-schema/quoted-structural-chars.err
@@ -1 +1 @@
-quoted-structural-chars.json:1:1: expected '{'
+quoted-structural-chars.json:1: top-level expression must be an object
-- 
2.26.3


