Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DF352691B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:19:45 +0200 (CEST)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZtA-0007zG-2J
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZih-0001R5-6x
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZif-00071s-Dp
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652465332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1vDNkyDxENYzuxXRNo3L5BE9SMj1BnRZK7GnlyDWoE=;
 b=Z/ILGxGzoUGGFAPj63B/53+EZ+1nhBe2TcsFBf+u/9PlYrgl8bZ0SFc8s+zavqnDuxkwpK
 P108EYefXKaPHPND3wkKSJ4b24p+h6Y1ZMTNRJm4WSVT64eVPlaTkxF+b1SuBjmba6Uifg
 zuxwi9l7/tbP174LLGW9OvaK+wt7sz8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-o_pkEWuaPnOjhPSoxigmIQ-1; Fri, 13 May 2022 14:08:51 -0400
X-MC-Unique: o_pkEWuaPnOjhPSoxigmIQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65FD010665A0;
 Fri, 13 May 2022 18:08:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC95640D1CF;
 Fri, 13 May 2022 18:08:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 10/15] test/qga: use G_TEST_DIR to locate os-release test
 file
Date: Fri, 13 May 2022 20:08:16 +0200
Message-Id: <20220513180821.905149-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-1-marcandre.lureau@redhat.com>
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


