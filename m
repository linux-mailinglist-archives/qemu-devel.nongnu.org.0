Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920836EEDDD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAC-00068m-C4; Wed, 26 Apr 2023 01:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA3-00064w-Un
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA1-0002kq-6L
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWUz8T+lNSx/aWm5bkx5op9IQO0lB55ipCHPbpWrDvw=;
 b=hVMk1zePfOSnLQIJgF5ZYttGFzl2+CtLlCNBBEzvnKmm/cDANdhK6+VRSdxhtLb7qGCoiy
 dQ3NHeARzYWDAe6L2DvTtwvFOjdTDBYxpyRe+S7077m9gI2e8KLhYongxtmGZkpVvOQLeG
 Ljsw6Lm6hZJfMmJWIqiE/vCH8mxzrdI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-kAe1fMceP2a76K3V3lYaWw-1; Wed, 26 Apr 2023 01:57:46 -0400
X-MC-Unique: kAe1fMceP2a76K3V3lYaWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F770185A792;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E116C15BA0;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2D48621F9816; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Eric Blake <eblake@redhat.com>
Subject: [PULL 07/17] qapi: Fix error message when type name or array is
 expected
Date: Wed, 26 Apr 2023 07:57:34 +0200
Message-Id: <20230426055744.1041930-8-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We incorrectly report "FOO should be a type name" when it could also
be an array.  Fix that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230316071325.492471-8-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi/expr.py                        | 15 +++++++--------
 tests/qapi-schema/event-nest-struct.err     |  2 +-
 tests/qapi-schema/nested-struct-data.err    |  2 +-
 tests/qapi-schema/returns-dict.err          |  2 +-
 tests/qapi-schema/struct-member-invalid.err |  2 +-
 5 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 8a8de9e3aa..9bae500a7d 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -344,15 +344,14 @@ def check_type_name_or_array(value: Optional[object],
     if value is None or isinstance(value, str):
         return
 
-    if isinstance(value, list):
-        if len(value) != 1 or not isinstance(value[0], str):
-            raise QAPISemError(info,
-                               "%s: array type must contain single type name" %
-                               source)
-        return
+    if not isinstance(value, list):
+        raise QAPISemError(info,
+                           "%s should be a type name or array" % source)
 
-    raise QAPISemError(info,
-                       "%s should be a type name" % source)
+    if len(value) != 1 or not isinstance(value[0], str):
+        raise QAPISemError(info,
+                           "%s: array type must contain single type name" %
+                           source)
 
 
 def check_type_name_or_implicit(value: Optional[object],
diff --git a/tests/qapi-schema/event-nest-struct.err b/tests/qapi-schema/event-nest-struct.err
index 8c5f6ed311..15fc1406f8 100644
--- a/tests/qapi-schema/event-nest-struct.err
+++ b/tests/qapi-schema/event-nest-struct.err
@@ -1,2 +1,2 @@
 event-nest-struct.json: In event 'EVENT_A':
-event-nest-struct.json:1: 'data' member 'a' should be a type name
+event-nest-struct.json:1: 'data' member 'a' should be a type name or array
diff --git a/tests/qapi-schema/nested-struct-data.err b/tests/qapi-schema/nested-struct-data.err
index c7258a0182..7dc5c7cb2d 100644
--- a/tests/qapi-schema/nested-struct-data.err
+++ b/tests/qapi-schema/nested-struct-data.err
@@ -1,2 +1,2 @@
 nested-struct-data.json: In command 'foo':
-nested-struct-data.json:2: 'data' member 'a' should be a type name
+nested-struct-data.json:2: 'data' member 'a' should be a type name or array
diff --git a/tests/qapi-schema/returns-dict.err b/tests/qapi-schema/returns-dict.err
index 9b2d90c010..bf160e754b 100644
--- a/tests/qapi-schema/returns-dict.err
+++ b/tests/qapi-schema/returns-dict.err
@@ -1,2 +1,2 @@
 returns-dict.json: In command 'oops':
-returns-dict.json:2: 'returns' should be a type name
+returns-dict.json:2: 'returns' should be a type name or array
diff --git a/tests/qapi-schema/struct-member-invalid.err b/tests/qapi-schema/struct-member-invalid.err
index 7e01a41d7c..3130d69d9f 100644
--- a/tests/qapi-schema/struct-member-invalid.err
+++ b/tests/qapi-schema/struct-member-invalid.err
@@ -1,2 +1,2 @@
 struct-member-invalid.json: In struct 'Foo':
-struct-member-invalid.json:1: 'data' member 'a' should be a type name
+struct-member-invalid.json:1: 'data' member 'a' should be a type name or array
-- 
2.39.2


