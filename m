Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6036837B16D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:11:25 +0200 (CEST)
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgab6-0001ju-E8
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWA-0007Z4-6U
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW8-0006SS-5s
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rIOtzahELHFPo7dqKUXPYk1QumpQPPrSmIDVsNa1JFI=;
 b=Dn1M8LI1xt2MjMPEK44Z2/nbeiIDuE08nRPkaF3OqaDEnk43cN8SbQ7aWXD3MD3dlwsSiW
 L6+gWKG4YSc7qa24pZJ9MyJ7prIM+4Pn0kBEkupCzTNwfjFn+VIm9bsfxihz0RcjrPKauT
 UzqcV4lKT5vFr5ytog1EHsO1+tYM7/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-jilDcniJPN6gg22fxyFniw-1; Tue, 11 May 2021 18:06:13 -0400
X-MC-Unique: jilDcniJPN6gg22fxyFniw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B199107ACE4;
 Tue, 11 May 2021 22:06:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4B8D60CC9;
 Tue, 11 May 2021 22:06:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/21] qapi/parser: Fix token membership tests when token
 can be None
Date: Tue, 11 May 2021 18:05:50 -0400
Message-Id: <20210511220601.2110055-11-jsnow@redhat.com>
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

When the token can be None (EOF), we can't use 'x in "abc"' style
membership tests to group types of tokens together, because 'None in
"abc"' is a TypeError.

Easy enough to fix. (Use a tuple: It's neither a static typing error nor
a runtime error to check for None in Tuple[str, ...])

Add tests to prevent a regression. (Note: they cannot be added prior to
this fix, as the unhandled stack trace will not match test output in the
CI system.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py                               | 5 +++--
 tests/qapi-schema/meson.build                        | 2 ++
 tests/qapi-schema/missing-array-rsqb.err             | 1 +
 tests/qapi-schema/missing-array-rsqb.json            | 1 +
 tests/qapi-schema/missing-array-rsqb.out             | 0
 tests/qapi-schema/missing-object-member-element.err  | 1 +
 tests/qapi-schema/missing-object-member-element.json | 1 +
 tests/qapi-schema/missing-object-member-element.out  | 0
 8 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 tests/qapi-schema/missing-array-rsqb.err
 create mode 100644 tests/qapi-schema/missing-array-rsqb.json
 create mode 100644 tests/qapi-schema/missing-array-rsqb.out
 create mode 100644 tests/qapi-schema/missing-object-member-element.err
 create mode 100644 tests/qapi-schema/missing-object-member-element.json
 create mode 100644 tests/qapi-schema/missing-object-member-element.out

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 39de24785ac..959214b7042 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -275,7 +275,7 @@ def get_values(self):
         if self.tok == ']':
             self.accept()
             return expr
-        if self.tok not in "{['tf":
+        if self.tok not in tuple("{['tf"):
             raise QAPIParseError(
                 self, "expected '{', '[', ']', string, or boolean")
         while True:
@@ -294,7 +294,8 @@ def get_expr(self):
         elif self.tok == '[':
             self.accept()
             expr = self.get_values()
-        elif self.tok in "'tf":
+        elif self.tok in tuple("'tf"):
+            assert isinstance(self.val, (str, bool))
             expr = self.val
             self.accept()
         else:
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index dc448e8f74d..9e8f658ce38 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -134,9 +134,11 @@ schemas = [
   'indented-expr.json',
   'leading-comma-list.json',
   'leading-comma-object.json',
+  'missing-array-rsqb.json',
   'missing-colon.json',
   'missing-comma-list.json',
   'missing-comma-object.json',
+  'missing-object-member-element.json',
   'missing-type.json',
   'nested-struct-data.json',
   'nested-struct-data-invalid-dict.json',
diff --git a/tests/qapi-schema/missing-array-rsqb.err b/tests/qapi-schema/missing-array-rsqb.err
new file mode 100644
index 00000000000..b5f58b8c12a
--- /dev/null
+++ b/tests/qapi-schema/missing-array-rsqb.err
@@ -0,0 +1 @@
+missing-array-rsqb.json:1:44: expected '{', '[', string, or boolean
diff --git a/tests/qapi-schema/missing-array-rsqb.json b/tests/qapi-schema/missing-array-rsqb.json
new file mode 100644
index 00000000000..7fca1df923c
--- /dev/null
+++ b/tests/qapi-schema/missing-array-rsqb.json
@@ -0,0 +1 @@
+['Daisy,', 'Daisy,', 'Give me your answer',
diff --git a/tests/qapi-schema/missing-array-rsqb.out b/tests/qapi-schema/missing-array-rsqb.out
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/qapi-schema/missing-object-member-element.err b/tests/qapi-schema/missing-object-member-element.err
new file mode 100644
index 00000000000..c08a3dc307f
--- /dev/null
+++ b/tests/qapi-schema/missing-object-member-element.err
@@ -0,0 +1 @@
+missing-object-member-element.json:1:8: expected '{', '[', string, or boolean
diff --git a/tests/qapi-schema/missing-object-member-element.json b/tests/qapi-schema/missing-object-member-element.json
new file mode 100644
index 00000000000..f52d0106f31
--- /dev/null
+++ b/tests/qapi-schema/missing-object-member-element.json
@@ -0,0 +1 @@
+{'key':
diff --git a/tests/qapi-schema/missing-object-member-element.out b/tests/qapi-schema/missing-object-member-element.out
new file mode 100644
index 00000000000..e69de29bb2d
-- 
2.30.2


