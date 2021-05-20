Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1D38B5C0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 20:06:08 +0200 (CEST)
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljn3f-0007IH-73
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 14:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmrF-0002nx-AW
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmr1-0006ag-66
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621533182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrqb7lw2bTq/g8wW4I8g/x/t5ncK2P3WOmeOOeb2bzo=;
 b=T8/wooEEL8bXYUopfSorQ4ExXiuTQqvJ0r5XDoGfxdBI15CYUZLOFx50X5AuwzzkorhlyK
 G9QcOoCyBJHzDMrjIxQqm3xxS11Uux7VfVlyQ6ymAVmr2RXSVWDsFQn46z+E747eH0Rv0h
 qPepxk+2cylD1wa6G69hvml3JHsvdO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-EKMvtytvM7ePyVlfPNn6ew-1; Thu, 20 May 2021 13:53:00 -0400
X-MC-Unique: EKMvtytvM7ePyVlfPNn6ew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90923107ACF3;
 Thu, 20 May 2021 17:52:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F6255C261;
 Thu, 20 May 2021 17:52:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5872E1132D67; Thu, 20 May 2021 19:52:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] qapi/parser: Fix token membership tests when token can
 be None
Date: Thu, 20 May 2021 19:52:51 +0200
Message-Id: <20210520175256.1119684-11-armbru@redhat.com>
In-Reply-To: <20210520175256.1119684-1-armbru@redhat.com>
References: <20210520175256.1119684-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

When the token can be None (EOF), we can't use 'x in "abc"' style
membership tests to group types of tokens together, because 'None in
"abc"' is a TypeError.

Easy enough to fix. (Use a tuple: It's neither a static typing error nor
a runtime error to check for None in Tuple[str, ...])

Add tests to prevent a regression. (Note: they cannot be added prior to
this fix, as the unhandled stack trace will not match test output in the
CI system.)

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210519183951.3946870-11-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
index 48137d3fbe..9f980f7513 100644
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
index dc448e8f74..9e8f658ce3 100644
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
index 0000000000..b5f58b8c12
--- /dev/null
+++ b/tests/qapi-schema/missing-array-rsqb.err
@@ -0,0 +1 @@
+missing-array-rsqb.json:1:44: expected '{', '[', string, or boolean
diff --git a/tests/qapi-schema/missing-array-rsqb.json b/tests/qapi-schema/missing-array-rsqb.json
new file mode 100644
index 0000000000..7fca1df923
--- /dev/null
+++ b/tests/qapi-schema/missing-array-rsqb.json
@@ -0,0 +1 @@
+['Daisy,', 'Daisy,', 'Give me your answer',
diff --git a/tests/qapi-schema/missing-array-rsqb.out b/tests/qapi-schema/missing-array-rsqb.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/missing-object-member-element.err b/tests/qapi-schema/missing-object-member-element.err
new file mode 100644
index 0000000000..c08a3dc307
--- /dev/null
+++ b/tests/qapi-schema/missing-object-member-element.err
@@ -0,0 +1 @@
+missing-object-member-element.json:1:8: expected '{', '[', string, or boolean
diff --git a/tests/qapi-schema/missing-object-member-element.json b/tests/qapi-schema/missing-object-member-element.json
new file mode 100644
index 0000000000..f52d0106f3
--- /dev/null
+++ b/tests/qapi-schema/missing-object-member-element.json
@@ -0,0 +1 @@
+{'key':
diff --git a/tests/qapi-schema/missing-object-member-element.out b/tests/qapi-schema/missing-object-member-element.out
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.26.3


