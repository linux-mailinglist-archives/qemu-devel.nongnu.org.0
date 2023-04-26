Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938F6EEDE7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 08:00:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAV-0006FU-Qq; Wed, 26 Apr 2023 01:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA7-00066P-3V
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA3-0002lt-Rq
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHaz+ZyHxDWMdvVqCZzu28yAU4wKDL37BtKh3S/IF5A=;
 b=C7iyrsYFkP/4G6mVD79fvyTtmPZt/mHW/reH39Y1GyCxZSenUn/plJ3/y1G2yUujMs3ALk
 81gFf3vu3zMfPY68oFgFW5jngjUsoy3UBXDOGRt7Of/PQ7HytfApAhraCrBkPSGLiDnoHH
 xsxIieP8/h8UHGemVLvsDFjuNZBVPi4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-O8KR1VNKMeuA4mB2R9qwTw-1; Wed, 26 Apr 2023 01:57:46 -0400
X-MC-Unique: O8KR1VNKMeuA4mB2R9qwTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F72787A9E3;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E0CB2027043;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 28D7421F167D; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/17] qapi: Improve error message for unexpected array types
Date: Wed, 26 Apr 2023 07:57:32 +0200
Message-Id: <20230426055744.1041930-6-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

We reject array types in certain places with "cannot be an array".
Deleting this check improves the error message to "should be a type
name" or "should be an object or type name", depending on context, so
do that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230316071325.492471-6-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/qapi/expr.py                     | 6 ------
 tests/qapi-schema/bad-data.err           | 2 +-
 tests/qapi-schema/union-array-branch.err | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index bc04bf34c2..5abeaa19dd 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -341,9 +341,6 @@ def check_type_name(value: Optional[object],
     if isinstance(value, str):
         return
 
-    if isinstance(value, list):
-        raise QAPISemError(info, "%s cannot be an array" % source)
-
     raise QAPISemError(info, "%s should be a type name" % source)
 
 
@@ -392,9 +389,6 @@ def check_type_name_or_implicit(value: Optional[object],
     if isinstance(value, str):
         return
 
-    if isinstance(value, list):
-        raise QAPISemError(info, "%s cannot be an array" % source)
-
     if not isinstance(value, dict):
         raise QAPISemError(info,
                            "%s should be an object or type name" % source)
diff --git a/tests/qapi-schema/bad-data.err b/tests/qapi-schema/bad-data.err
index 7991c8898d..a987df4108 100644
--- a/tests/qapi-schema/bad-data.err
+++ b/tests/qapi-schema/bad-data.err
@@ -1,2 +1,2 @@
 bad-data.json: In command 'oops':
-bad-data.json:2: 'data' cannot be an array
+bad-data.json:2: 'data' should be an object or type name
diff --git a/tests/qapi-schema/union-array-branch.err b/tests/qapi-schema/union-array-branch.err
index 5db9c17481..2aa146261a 100644
--- a/tests/qapi-schema/union-array-branch.err
+++ b/tests/qapi-schema/union-array-branch.err
@@ -1,2 +1,2 @@
 union-array-branch.json: In union 'TestUnion':
-union-array-branch.json:8: 'data' member 'value1' cannot be an array
+union-array-branch.json:8: 'data' member 'value1' should be a type name
-- 
2.39.2


