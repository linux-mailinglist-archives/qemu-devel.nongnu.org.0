Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998155363E2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 16:14:50 +0200 (CEST)
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuajp-0002xu-Of
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 10:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nuaR3-00022Q-UC
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nuaR2-0000aA-Cx
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653659722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0DbRGMr63goT3DSBSa6lrHxSumvKxGwUlDqjMNCLcg=;
 b=Js7FG4odlus2bdja5xSh5Yb5bcWk0JycFc4jl1+1o14g97ZuCzU4fN9oaEd50/0fbswlq4
 ubsC1+p3hBvaOngDDtn/mA8mzhcNm29qnWnvhmFbF31ZyC9JixZ1ZPgX+44Sg7uuOeeJDs
 NmdDrHslCPdaZPn1bJLagKM1odNbmo0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-7vekXgUOOJi8RRugOzACRQ-1; Fri, 27 May 2022 09:55:19 -0400
X-MC-Unique: 7vekXgUOOJi8RRugOzACRQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0F8F185A7A4;
 Fri, 27 May 2022 13:55:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE45492C3B;
 Fri, 27 May 2022 13:55:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Michael Roth <michael.roth@amd.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 10/15] test/qga: use G_TEST_DIR to locate os-release test file
Date: Fri, 27 May 2022 15:54:54 +0200
Message-Id: <20220527135459.117877-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220527135459.117877-1-marcandre.lureau@redhat.com>
References: <20220527135459.117877-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This a more accurate way to lookup the test data, and will allow to move
the test in a subproject.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <20220525144140.591926-11-marcandre.lureau@redhat.com>
---
 tests/unit/test-qga.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index d6df1ee92e..ab0b12a2dd 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -914,15 +914,14 @@ static void test_qga_guest_get_osinfo(gconstpointer data)
 {
     TestFixture fixture;
     const gchar *str;
-    gchar *cwd, *env[2];
-    QDict *ret, *val;
+    QDict *ret = NULL;
+    char *env[2];
+    QDict *val;
 
-    cwd = g_get_current_dir();
     env[0] = g_strdup_printf(
-        "QGA_OS_RELEASE=%s%ctests%cdata%ctest-qga-os-release",
-        cwd, G_DIR_SEPARATOR, G_DIR_SEPARATOR, G_DIR_SEPARATOR);
+        "QGA_OS_RELEASE=%s%c..%cdata%ctest-qga-os-release",
+        g_test_get_dir(G_TEST_DIST), G_DIR_SEPARATOR, G_DIR_SEPARATOR, G_DIR_SEPARATOR);
     env[1] = NULL;
-    g_free(cwd);
     fixture_setup(&fixture, NULL, env);
 
     ret = qmp_fd(fixture.fd, "{'execute': 'guest-get-osinfo'}");
-- 
2.36.1


