Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E526A0AC8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:40:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBpw-0002ky-ST; Thu, 23 Feb 2023 08:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBps-0002jr-G0
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBpq-0008EH-67
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Va+V6+tM/JqJ596qX7X9NCYN7PqZOR1i4yT0Ogm1LxQ=;
 b=X6R5kB5SBWu3H08EKT2SEMfpGqZ+t3OEFzGeSPPL0qmDdHKCIzLqeZyzfqmEtGU1B/NrhJ
 Y8J44SI4mjNhG5MDZtBfFsAotvYfGCGxpOz2tGzPXpRMccQxx+1bmcaZvGV8PycsTAOcmQ
 Ph/SSRbIpMfxKOZPBEc+Lr8WAP+Moa4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379--LQ8bJzXOAyYOcjPRMp0tg-1; Thu, 23 Feb 2023 08:40:32 -0500
X-MC-Unique: -LQ8bJzXOAyYOcjPRMp0tg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 290673810B13;
 Thu, 23 Feb 2023 13:40:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C69E74014CF8;
 Thu, 23 Feb 2023 13:40:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Het Gala <het.gala@nutanix.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/3] qapi: improve specificity of type/member descriptions
Date: Thu, 23 Feb 2023 13:40:25 +0000
Message-Id: <20230223134027.2294640-2-berrange@redhat.com>
In-Reply-To: <20230223134027.2294640-1-berrange@redhat.com>
References: <20230223134027.2294640-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

When describing member types always include the context of the
containing type. Although this is often redundant, in some cases
it will help to reduce ambiguity.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/qapi/schema.py                               | 5 ++---
 tests/qapi-schema/alternate-any.err                  | 2 +-
 tests/qapi-schema/alternate-conflict-bool-string.err | 2 +-
 tests/qapi-schema/alternate-conflict-dict.err        | 2 +-
 tests/qapi-schema/alternate-conflict-enum-bool.err   | 2 +-
 tests/qapi-schema/alternate-conflict-enum-int.err    | 2 +-
 tests/qapi-schema/alternate-conflict-lists.err       | 2 +-
 tests/qapi-schema/alternate-conflict-num-string.err  | 2 +-
 tests/qapi-schema/alternate-conflict-string.err      | 2 +-
 tests/qapi-schema/alternate-nested.err               | 2 +-
 tests/qapi-schema/alternate-unknown.err              | 2 +-
 tests/qapi-schema/args-member-unknown.err            | 2 +-
 tests/qapi-schema/enum-clash-member.err              | 2 +-
 tests/qapi-schema/features-duplicate-name.err        | 2 +-
 tests/qapi-schema/struct-base-clash-deep.err         | 2 +-
 tests/qapi-schema/struct-base-clash.err              | 2 +-
 tests/qapi-schema/struct-member-name-clash.err       | 2 +-
 tests/qapi-schema/union-bad-base.err                 | 2 +-
 tests/qapi-schema/union-int-branch.err               | 2 +-
 tests/qapi-schema/union-unknown.err                  | 2 +-
 20 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index cd8661125c..6c481ab0c0 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -713,9 +713,8 @@ def describe(self, info):
                 role = 'base ' + role
             else:
                 assert False
-        elif defined_in != info.defn_name:
-            return "%s '%s' of type '%s'" % (role, self.name, defined_in)
-        return "%s '%s'" % (role, self.name)
+
+        return "%s '%s' of type '%s'" % (role, self.name, defined_in)
 
 
 class QAPISchemaEnumMember(QAPISchemaMember):
diff --git a/tests/qapi-schema/alternate-any.err b/tests/qapi-schema/alternate-any.err
index baeb3f66d1..6c12358a88 100644
--- a/tests/qapi-schema/alternate-any.err
+++ b/tests/qapi-schema/alternate-any.err
@@ -1,2 +1,2 @@
 alternate-any.json: In alternate 'Alt':
-alternate-any.json:2: branch 'one' cannot use built-in type 'any'
+alternate-any.json:2: branch 'one' of type 'Alt' cannot use built-in type 'any'
diff --git a/tests/qapi-schema/alternate-conflict-bool-string.err b/tests/qapi-schema/alternate-conflict-bool-string.err
index 59ff5efa87..d7fd625632 100644
--- a/tests/qapi-schema/alternate-conflict-bool-string.err
+++ b/tests/qapi-schema/alternate-conflict-bool-string.err
@@ -1,2 +1,2 @@
 alternate-conflict-bool-string.json: In alternate 'Alt':
-alternate-conflict-bool-string.json:2: branch 'two' can't be distinguished from 'one'
+alternate-conflict-bool-string.json:2: branch 'two' of type 'Alt' can't be distinguished from 'one'
diff --git a/tests/qapi-schema/alternate-conflict-dict.err b/tests/qapi-schema/alternate-conflict-dict.err
index d4970284ba..05174ab4f1 100644
--- a/tests/qapi-schema/alternate-conflict-dict.err
+++ b/tests/qapi-schema/alternate-conflict-dict.err
@@ -1,2 +1,2 @@
 alternate-conflict-dict.json: In alternate 'Alt':
-alternate-conflict-dict.json:6: branch 'two' can't be distinguished from 'one'
+alternate-conflict-dict.json:6: branch 'two' of type 'Alt' can't be distinguished from 'one'
diff --git a/tests/qapi-schema/alternate-conflict-enum-bool.err b/tests/qapi-schema/alternate-conflict-enum-bool.err
index 5f35855274..02ed66b0bf 100644
--- a/tests/qapi-schema/alternate-conflict-enum-bool.err
+++ b/tests/qapi-schema/alternate-conflict-enum-bool.err
@@ -1,2 +1,2 @@
 alternate-conflict-enum-bool.json: In alternate 'Alt':
-alternate-conflict-enum-bool.json:4: branch 'two' can't be distinguished from 'one'
+alternate-conflict-enum-bool.json:4: branch 'two' of type 'Alt' can't be distinguished from 'one'
diff --git a/tests/qapi-schema/alternate-conflict-enum-int.err b/tests/qapi-schema/alternate-conflict-enum-int.err
index 6a6d156664..1874558f49 100644
--- a/tests/qapi-schema/alternate-conflict-enum-int.err
+++ b/tests/qapi-schema/alternate-conflict-enum-int.err
@@ -1,2 +1,2 @@
 alternate-conflict-enum-int.json: In alternate 'Alt':
-alternate-conflict-enum-int.json:4: branch 'two' can't be distinguished from 'one'
+alternate-conflict-enum-int.json:4: branch 'two' of type 'Alt' can't be distinguished from 'one'
diff --git a/tests/qapi-schema/alternate-conflict-lists.err b/tests/qapi-schema/alternate-conflict-lists.err
index f3374ec1e7..de480dc86b 100644
--- a/tests/qapi-schema/alternate-conflict-lists.err
+++ b/tests/qapi-schema/alternate-conflict-lists.err
@@ -1,2 +1,2 @@
 alternate-conflict-lists.json: In alternate 'Alt':
-alternate-conflict-lists.json:4: branch 'two' can't be distinguished from 'one'
+alternate-conflict-lists.json:4: branch 'two' of type 'Alt' can't be distinguished from 'one'
diff --git a/tests/qapi-schema/alternate-conflict-num-string.err b/tests/qapi-schema/alternate-conflict-num-string.err
index 38c805ea1f..0d21ec590c 100644
--- a/tests/qapi-schema/alternate-conflict-num-string.err
+++ b/tests/qapi-schema/alternate-conflict-num-string.err
@@ -1,2 +1,2 @@
 alternate-conflict-num-string.json: In alternate 'Alt':
-alternate-conflict-num-string.json:2: branch 'two' can't be distinguished from 'one'
+alternate-conflict-num-string.json:2: branch 'two' of type 'Alt' can't be distinguished from 'one'
diff --git a/tests/qapi-schema/alternate-conflict-string.err b/tests/qapi-schema/alternate-conflict-string.err
index 2fa08193db..97097cae97 100644
--- a/tests/qapi-schema/alternate-conflict-string.err
+++ b/tests/qapi-schema/alternate-conflict-string.err
@@ -1,2 +1,2 @@
 alternate-conflict-string.json: In alternate 'Alt':
-alternate-conflict-string.json:2: branch 'two' can't be distinguished from 'one'
+alternate-conflict-string.json:2: branch 'two' of type 'Alt' can't be distinguished from 'one'
diff --git a/tests/qapi-schema/alternate-nested.err b/tests/qapi-schema/alternate-nested.err
index 3ae9cd2f11..5603aa95e3 100644
--- a/tests/qapi-schema/alternate-nested.err
+++ b/tests/qapi-schema/alternate-nested.err
@@ -1,2 +1,2 @@
 alternate-nested.json: In alternate 'Alt2':
-alternate-nested.json:4: branch 'nested' cannot use alternate type 'Alt1'
+alternate-nested.json:4: branch 'nested' of type 'Alt2' cannot use alternate type 'Alt1'
diff --git a/tests/qapi-schema/alternate-unknown.err b/tests/qapi-schema/alternate-unknown.err
index 17fec1cd17..befd207a76 100644
--- a/tests/qapi-schema/alternate-unknown.err
+++ b/tests/qapi-schema/alternate-unknown.err
@@ -1,2 +1,2 @@
 alternate-unknown.json: In alternate 'Alt':
-alternate-unknown.json:2: branch 'unknown' uses unknown type 'MissingType'
+alternate-unknown.json:2: branch 'unknown' of type 'Alt' uses unknown type 'MissingType'
diff --git a/tests/qapi-schema/args-member-unknown.err b/tests/qapi-schema/args-member-unknown.err
index 96b6e5d289..b24c2ae572 100644
--- a/tests/qapi-schema/args-member-unknown.err
+++ b/tests/qapi-schema/args-member-unknown.err
@@ -1,2 +1,2 @@
 args-member-unknown.json: In command 'oops':
-args-member-unknown.json:2: parameter 'member' uses unknown type 'NoSuchType'
+args-member-unknown.json:2: parameter 'member' of type 'oops-arg' uses unknown type 'NoSuchType'
diff --git a/tests/qapi-schema/enum-clash-member.err b/tests/qapi-schema/enum-clash-member.err
index e4eb102ae2..0ede36d68e 100644
--- a/tests/qapi-schema/enum-clash-member.err
+++ b/tests/qapi-schema/enum-clash-member.err
@@ -1,2 +1,2 @@
 enum-clash-member.json: In enum 'MyEnum':
-enum-clash-member.json:3: value 'one_two' collides with value 'one-two'
+enum-clash-member.json:3: value 'one_two' of type 'MyEnum' collides with value 'one-two' of type 'MyEnum'
diff --git a/tests/qapi-schema/features-duplicate-name.err b/tests/qapi-schema/features-duplicate-name.err
index 0adbee6b0a..ffd124f5b0 100644
--- a/tests/qapi-schema/features-duplicate-name.err
+++ b/tests/qapi-schema/features-duplicate-name.err
@@ -1,2 +1,2 @@
 features-duplicate-name.json: In struct 'FeatureStruct0':
-features-duplicate-name.json:1: feature 'foo' collides with feature 'foo'
+features-duplicate-name.json:1: feature 'foo' of type 'FeatureStruct0' collides with feature 'foo' of type 'FeatureStruct0'
diff --git a/tests/qapi-schema/struct-base-clash-deep.err b/tests/qapi-schema/struct-base-clash-deep.err
index 79879681d9..632f78b6c0 100644
--- a/tests/qapi-schema/struct-base-clash-deep.err
+++ b/tests/qapi-schema/struct-base-clash-deep.err
@@ -1,2 +1,2 @@
 struct-base-clash-deep.json: In struct 'Sub':
-struct-base-clash-deep.json:10: member 'name' collides with member 'name' of type 'Base'
+struct-base-clash-deep.json:10: member 'name' of type 'Sub' collides with member 'name' of type 'Base'
diff --git a/tests/qapi-schema/struct-base-clash.err b/tests/qapi-schema/struct-base-clash.err
index 46473947e6..1d54079c16 100644
--- a/tests/qapi-schema/struct-base-clash.err
+++ b/tests/qapi-schema/struct-base-clash.err
@@ -1,2 +1,2 @@
 struct-base-clash.json: In struct 'Sub':
-struct-base-clash.json:5: member 'name' collides with member 'name' of type 'Base'
+struct-base-clash.json:5: member 'name' of type 'Sub' collides with member 'name' of type 'Base'
diff --git a/tests/qapi-schema/struct-member-name-clash.err b/tests/qapi-schema/struct-member-name-clash.err
index 7e53a605d2..ebf66cd5b8 100644
--- a/tests/qapi-schema/struct-member-name-clash.err
+++ b/tests/qapi-schema/struct-member-name-clash.err
@@ -1,2 +1,2 @@
 struct-member-name-clash.json: In struct 'Oops':
-struct-member-name-clash.json:5: member 'a_b' collides with member 'a-b'
+struct-member-name-clash.json:5: member 'a_b' of type 'Oops' collides with member 'a-b' of type 'Oops'
diff --git a/tests/qapi-schema/union-bad-base.err b/tests/qapi-schema/union-bad-base.err
index 42b2ed1dda..9f92b35a07 100644
--- a/tests/qapi-schema/union-bad-base.err
+++ b/tests/qapi-schema/union-bad-base.err
@@ -1,2 +1,2 @@
 union-bad-base.json: In union 'TestUnion':
-union-bad-base.json:8: member 'string' of type 'TestTypeA' collides with base member 'string'
+union-bad-base.json:8: member 'string' of type 'TestTypeA' collides with base member 'string' of type 'TestUnion-base'
diff --git a/tests/qapi-schema/union-int-branch.err b/tests/qapi-schema/union-int-branch.err
index 8fdc81edd1..302e3976e0 100644
--- a/tests/qapi-schema/union-int-branch.err
+++ b/tests/qapi-schema/union-int-branch.err
@@ -1,2 +1,2 @@
 union-int-branch.json: In union 'TestUnion':
-union-int-branch.json:8: branch 'value1' cannot use built-in type 'int'
+union-int-branch.json:8: branch 'value1' of type 'TestUnion' cannot use built-in type 'int'
diff --git a/tests/qapi-schema/union-unknown.err b/tests/qapi-schema/union-unknown.err
index dad79beae0..e60ab9421a 100644
--- a/tests/qapi-schema/union-unknown.err
+++ b/tests/qapi-schema/union-unknown.err
@@ -1,2 +1,2 @@
 union-unknown.json: In union 'Union':
-union-unknown.json:3: branch 'unknown' uses unknown type 'MissingType'
+union-unknown.json:3: branch 'unknown' of type 'Union' uses unknown type 'MissingType'
-- 
2.39.2


