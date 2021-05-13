Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F92837FCC6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:48:41 +0200 (CEST)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFRw-0003gd-JF
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFIk-0008H5-Vs
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFIj-0001nF-3w
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620927548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6agOGcVP7ScJaiI58ilUbgku/QFUbCu+8g5o/biKXS4=;
 b=MCvdRhhQLvhsUeqZsaa9pnVjMiUstF28AGz6SNOrHm+FBI9ozb7aUxVydFQLsq2fqfvepg
 IBEf3O9gVNr9r7taEQFZqY8ANkNuVANgUI+HRBb3SL5nO3fq4hNNVCA8XhESIEr1hvjiOj
 RxgkzwpNeGfIV00YGWudujFM/Xf8UrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-PS4jTdrpPTKQFiiiVEXjNA-1; Thu, 13 May 2021 13:39:05 -0400
X-MC-Unique: PS4jTdrpPTKQFiiiVEXjNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18A7B80006E;
 Thu, 13 May 2021 17:39:04 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-200.ams2.redhat.com
 [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D02F06267D;
 Thu, 13 May 2021 17:38:44 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 15/17] tests/migration-test: Fix "true" vs true
Date: Thu, 13 May 2021 18:37:35 +0100
Message-Id: <20210513173737.279402-16-dgilbert@redhat.com>
In-Reply-To: <20210513173737.279402-1-dgilbert@redhat.com>
References: <20210513173737.279402-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Accidental use of "true" as a boolean; spotted by coverity
and Peter.

Fixes: b99784ef6c3
Fixes: d795f47466e
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Coverity (CID 1432373, 1432292, 1432288)
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210504100545.112213-1-dgilbert@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3a711bb492..4d989f191b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -898,8 +898,8 @@ static void test_xbzrle(const char *uri)
 
     migrate_set_parameter_int(from, "xbzrle-cache-size", 33554432);
 
-    migrate_set_capability(from, "xbzrle", "true");
-    migrate_set_capability(to, "xbzrle", "true");
+    migrate_set_capability(from, "xbzrle", true);
+    migrate_set_capability(to, "xbzrle", true);
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
 
@@ -1246,8 +1246,8 @@ static void test_multifd_tcp(const char *method)
     migrate_set_parameter_str(from, "multifd-compression", method);
     migrate_set_parameter_str(to, "multifd-compression", method);
 
-    migrate_set_capability(from, "multifd", "true");
-    migrate_set_capability(to, "multifd", "true");
+    migrate_set_capability(from, "multifd", true);
+    migrate_set_capability(to, "multifd", true);
 
     /* Start incoming migration from the 1st socket */
     rsp = wait_command(to, "{ 'execute': 'migrate-incoming',"
@@ -1330,8 +1330,8 @@ static void test_multifd_tcp_cancel(void)
     migrate_set_parameter_int(from, "multifd-channels", 16);
     migrate_set_parameter_int(to, "multifd-channels", 16);
 
-    migrate_set_capability(from, "multifd", "true");
-    migrate_set_capability(to, "multifd", "true");
+    migrate_set_capability(from, "multifd", true);
+    migrate_set_capability(to, "multifd", true);
 
     /* Start incoming migration from the 1st socket */
     rsp = wait_command(to, "{ 'execute': 'migrate-incoming',"
@@ -1358,7 +1358,7 @@ static void test_multifd_tcp_cancel(void)
 
     migrate_set_parameter_int(to2, "multifd-channels", 16);
 
-    migrate_set_capability(to2, "multifd", "true");
+    migrate_set_capability(to2, "multifd", true);
 
     /* Start incoming migration from the 1st socket */
     rsp = wait_command(to2, "{ 'execute': 'migrate-incoming',"
-- 
2.31.1


