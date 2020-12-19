Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78402DEE4A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 11:58:48 +0100 (CET)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqZwl-0000mL-Qy
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 05:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtm-0004dc-6s
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtj-0007EN-Ct
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpOJQvBq1coT6r2jJ+08PmeZ5F89iddMJf8yJY1qqAg=;
 b=YKeW73vK1zhjBxUkh1NXG3S2M2P49w1jE9+y/x5vN+UHsugzgqLEoUOD3Cuy0q4Qxngb/z
 b9RbpJWinARJruy1BNsm3aXeKxQqNc/rhiDm3FnJSf3by+aam+5+NBvHrihabxDeCBMo5T
 xh8ZYmGaSGd/dqjaIelB1nR5XZL8d6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-k7O4dj0pP9m4b1V1H2orrA-1; Sat, 19 Dec 2020 05:55:36 -0500
X-MC-Unique: k7O4dj0pP9m4b1V1H2orrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E755180A089;
 Sat, 19 Dec 2020 10:55:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F2F6F98F;
 Sat, 19 Dec 2020 10:55:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6EEBD11275ED; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] test-string-output-visitor: Cover "unround" number
Date: Sat, 19 Dec 2020 11:55:09 +0100
Message-Id: <20201219105532.1734134-11-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This demonstrates rounding error due to insufficient precision: double
3.1415926535897932 gets converted to JSON 3.141593.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201210161452.2813491-8-armbru@redhat.com>
---
 tests/test-string-output-visitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/test-string-output-visitor.c b/tests/test-string-output-visitor.c
index 9f6581439a..cec20848ea 100644
--- a/tests/test-string-output-visitor.c
+++ b/tests/test-string-output-visitor.c
@@ -130,13 +130,13 @@ static void test_visitor_out_bool(TestOutputVisitorData *data,
 static void test_visitor_out_number(TestOutputVisitorData *data,
                                     const void *unused)
 {
-    double value = 3.14;
+    double value = 3.1415926535897932;
     char *str;
 
     visit_type_number(data->ov, NULL, &value, &error_abort);
 
     str = visitor_get(data);
-    g_assert_cmpstr(str, ==, "3.140000");
+    g_assert_cmpstr(str, ==, "3.141593");
 }
 
 static void test_visitor_out_string(TestOutputVisitorData *data,
-- 
2.26.2


