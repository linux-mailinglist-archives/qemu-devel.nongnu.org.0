Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605FD6BC6DD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:15:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pchoD-0003qr-56; Thu, 16 Mar 2023 03:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnu-0003l6-Ly
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnp-0004Z7-DG
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678950812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3RGgon6mQxy3kqt5Bg8manIx6MhIABbBysqLNQDdBU=;
 b=J/StTzxCaDhc4MbAotek/7PVDFRrDV4i8RLTxaXZvyGABbo3d/c78zyz7xGHjjubJvm1qM
 0MnmIJySfo6T6ObdWvBPviQOrQkJ5Fhj/0AN2zJZLP5997XxAWHn1RaN3GhDgLjb08/h/e
 FtN4XjTNUXaJaSD3c3NyIPph1P9VN4E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-65CMKaNEOwGrPDqms6Nqbg-1; Thu, 16 Mar 2023 03:13:28 -0400
X-MC-Unique: 65CMKaNEOwGrPDqms6Nqbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F53D85A5B1;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F39C140E95F;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D84F21F4F7D; Thu, 16 Mar 2023 08:13:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
Subject: [PATCH 12/14] tests/qapi-schema: Cover optional conditional struct
 member
Date: Thu, 16 Mar 2023 08:13:23 +0100
Message-Id: <20230316071325.492471-13-armbru@redhat.com>
In-Reply-To: <20230316071325.492471-1-armbru@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/qapi-schema-test.json | 3 ++-
 tests/qapi-schema/qapi-schema-test.out  | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 8f0ee95d23..f1f742d38c 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -220,7 +220,8 @@
 
 { 'struct': 'TestIfStruct',
   'data': { 'foo': 'int',
-            'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_MEMBER'} },
+            'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_MEMBER'},
+            '*baz': { 'type': 'str', 'if': 'TEST_IF_STRUCT_MEMBER'} },
   'if': 'TEST_IF_STRUCT' }
 
 { 'enum': 'TestIfEnum',
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 715f3a3f23..cee92c0d2e 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -247,6 +247,8 @@ object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
         if TEST_IF_STRUCT_MEMBER
+    member baz: str optional=True
+        if TEST_IF_STRUCT_MEMBER
     if TEST_IF_STRUCT
 enum TestIfEnum
     member foo
-- 
2.39.2


