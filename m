Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1556BC6DF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcho6-0003mW-HG; Thu, 16 Mar 2023 03:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchns-0003j4-Po
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchno-0004YD-CO
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678950810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcyB48MUTsNeYNzfdaDmyRLIeBWZB+Bt/g8SlJWXkEg=;
 b=dnuEv4rb/PUm6GK7suhgiavutqUXpEN6IP+HeADqiSuTniIV+8SLPBgOhV9P79N9t0sepe
 /g++SrA6KJTHOWaHH4zV+SgcwMCJKMoHWb5MFHmQb4bxTOnU0H6cRWMQ+wm6DDFKowZ2iw
 bSCjUTHPV0LLUyoj95VlSL90eJHkn4s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-OvqlNSxCNTKtOJKLb8AZig-1; Thu, 16 Mar 2023 03:13:28 -0400
X-MC-Unique: OvqlNSxCNTKtOJKLb8AZig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25CE33C0F236;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0474235454;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F1DF421E5A75; Thu, 16 Mar 2023 08:13:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
Subject: [PATCH 05/14] qapi: Improve error message for unexpected array types
Date: Thu, 16 Mar 2023 08:13:16 +0100
Message-Id: <20230316071325.492471-6-armbru@redhat.com>
In-Reply-To: <20230316071325.492471-1-armbru@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

We reject array types in certain places with "cannot be an array".
Deleting this check improves the error message to "should be a type
name" or "should be an object or type name", depending on context, so
do that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


