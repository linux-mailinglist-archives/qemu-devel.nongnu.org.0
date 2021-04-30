Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1BE36FB22
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:05:56 +0200 (CEST)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSqB-0004p0-5e
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdg-00033m-79
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007cP-RI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XJuKpyiY2vd2HpmRFb1AQJLLHDSb8Me7iGXrQxWbys=;
 b=H5J0ocZgCnKnohSjwv0RpNYYK4E1OZ9yj4Ovow06CQDl/4UzvLgvaqCichKJfdvETpyHLv
 edCaPhUEZ1V17Z5yJ+6MD6Go+Hu+OxAvsQWd5SNEwepctrl0u3uJPwk2IGQbV5xWHBrMEW
 wlxnrmKE41Zcdz19NJxZYLV740Z3Hao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-iQv5O1-oNDaDsYWWh2uefg-1; Fri, 30 Apr 2021 07:48:43 -0400
X-MC-Unique: iQv5O1-oNDaDsYWWh2uefg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 189C8A0BD0;
 Fri, 30 Apr 2021 11:48:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7D3E2BFE6;
 Fri, 30 Apr 2021 11:48:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8769711329AF; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/25] qapi/expr.py: Check type of union and alternate 'data'
 member
Date: Fri, 30 Apr 2021 13:48:20 +0200
Message-Id: <20210430114838.2912740-8-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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

Prior to this commit, specifying a non-object value here causes the QAPI
parser to crash in expr.py with a stack trace with (likely) an
AttributeError when we attempt to call that value's items() method.

This member needs to be an object (Dict), and not anything else. Add a
check for this with a nicer error message, and formalize that check with
new test cases that exercise that error.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421182032.3521476-8-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py                          | 7 +++++++
 tests/qapi-schema/alternate-data-invalid.err  | 2 ++
 tests/qapi-schema/alternate-data-invalid.json | 4 ++++
 tests/qapi-schema/alternate-data-invalid.out  | 0
 tests/qapi-schema/meson.build                 | 2 ++
 tests/qapi-schema/union-invalid-data.err      | 2 ++
 tests/qapi-schema/union-invalid-data.json     | 6 ++++++
 tests/qapi-schema/union-invalid-data.out      | 0
 8 files changed, 23 insertions(+)
 create mode 100644 tests/qapi-schema/alternate-data-invalid.err
 create mode 100644 tests/qapi-schema/alternate-data-invalid.json
 create mode 100644 tests/qapi-schema/alternate-data-invalid.out
 create mode 100644 tests/qapi-schema/union-invalid-data.err
 create mode 100644 tests/qapi-schema/union-invalid-data.json
 create mode 100644 tests/qapi-schema/union-invalid-data.out

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index c0d18dcc01..03624bdf3f 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -283,6 +283,9 @@ def check_union(expr, info):
             raise QAPISemError(info, "'discriminator' requires 'base'")
         check_name_is_str(discriminator, info, "'discriminator'")
 
+    if not isinstance(members, dict):
+        raise QAPISemError(info, "'data' must be an object")
+
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         if discriminator is None:
@@ -298,6 +301,10 @@ def check_alternate(expr, info):
 
     if not members:
         raise QAPISemError(info, "'data' must not be empty")
+
+    if not isinstance(members, dict):
+        raise QAPISemError(info, "'data' must be an object")
+
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         check_name_lower(key, info, source)
diff --git a/tests/qapi-schema/alternate-data-invalid.err b/tests/qapi-schema/alternate-data-invalid.err
new file mode 100644
index 0000000000..55f1033aef
--- /dev/null
+++ b/tests/qapi-schema/alternate-data-invalid.err
@@ -0,0 +1,2 @@
+alternate-data-invalid.json: In alternate 'Alt':
+alternate-data-invalid.json:2: 'data' must be an object
diff --git a/tests/qapi-schema/alternate-data-invalid.json b/tests/qapi-schema/alternate-data-invalid.json
new file mode 100644
index 0000000000..7d5d905581
--- /dev/null
+++ b/tests/qapi-schema/alternate-data-invalid.json
@@ -0,0 +1,4 @@
+# Alternate type requires an object for 'data'
+{ 'alternate': 'Alt',
+  'data': ['rubbish', 'nonsense']
+}
diff --git a/tests/qapi-schema/alternate-data-invalid.out b/tests/qapi-schema/alternate-data-invalid.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 8ba6917132..d7163e6601 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -14,6 +14,7 @@ schemas = [
   'alternate-conflict-string.json',
   'alternate-conflict-bool-string.json',
   'alternate-conflict-num-string.json',
+  'alternate-data-invalid.json',
   'alternate-empty.json',
   'alternate-invalid-dict.json',
   'alternate-nested.json',
@@ -192,6 +193,7 @@ schemas = [
   'union-clash-branches.json',
   'union-empty.json',
   'union-invalid-base.json',
+  'union-invalid-data.json',
   'union-optional-branch.json',
   'union-unknown.json',
   'unknown-escape.json',
diff --git a/tests/qapi-schema/union-invalid-data.err b/tests/qapi-schema/union-invalid-data.err
new file mode 100644
index 0000000000..e26cf769a3
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-data.err
@@ -0,0 +1,2 @@
+union-invalid-data.json: In union 'TestUnion':
+union-invalid-data.json:2: 'data' must be an object
diff --git a/tests/qapi-schema/union-invalid-data.json b/tests/qapi-schema/union-invalid-data.json
new file mode 100644
index 0000000000..395ba24d39
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-data.json
@@ -0,0 +1,6 @@
+# the union data type must be an object.
+{ 'union': 'TestUnion',
+  'base': 'int',
+  'discriminator': 'int',
+  'data': ['rubbish', 'nonsense']
+}
diff --git a/tests/qapi-schema/union-invalid-data.out b/tests/qapi-schema/union-invalid-data.out
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.26.3


