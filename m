Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E75861E305
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orhdF-0005tf-Tu; Sun, 06 Nov 2022 10:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhdD-0005sy-3X
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhdB-0000wE-69
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667748736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Bo3cIjdTsQ530ZGM3xL7A7C0HtvuB6dNSHa7MS8vgk=;
 b=NwSk+DW7VJJQNwW+tlgwTvUuPjxw8fbBOYxr5gT0ls7cO3C0M2N1iWsaYeEShHiY0/eWw2
 DBtUSimaa9Q5oKmjA0aQ1RUiRSSWYByzpeg4hBt12sYEPDd7lYQRRYeBv/7QGNUqXy3MzG
 jHCZZ53QGOBv7RMN4QsV8ywltRwqdNI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-fbTMLZqoNNC95q05sA7HOg-1; Sun, 06 Nov 2022 10:32:14 -0500
X-MC-Unique: fbTMLZqoNNC95q05sA7HOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E7243C02B86;
 Sun,  6 Nov 2022 15:32:14 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B308340C6EC4;
 Sun,  6 Nov 2022 15:32:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 07/12] tests/qtest: migration-test: Enable TLS PSK tests for
 win32
Date: Sun,  6 Nov 2022 16:31:51 +0100
Message-Id: <20221106153156.620150-8-thuth@redhat.com>
In-Reply-To: <20221106153156.620150-1-thuth@redhat.com>
References: <20221106153156.620150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Since commit f1018ea0a30f ("tests: avoid DOS line endings in PSK file"),
the bug of the helper test_tls_psk_init_common() that caused TLS PSK
tests to fail on Windows was fixed. Let's enable these tests on win32.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20221101035021.729669-1-bin.meng@windriver.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f574331b7b..442998d9eb 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1402,7 +1402,6 @@ static void test_precopy_unix_dirty_ring(void)
 }
 
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
 static void test_precopy_unix_tls_psk(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1415,7 +1414,6 @@ static void test_precopy_unix_tls_psk(void)
 
     test_precopy_common(&args);
 }
-#endif /* _WIN32 */
 
 #ifdef CONFIG_TASN1
 static void test_precopy_unix_tls_x509_default_host(void)
@@ -1524,7 +1522,6 @@ static void test_precopy_tcp_plain(void)
 }
 
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
 static void test_precopy_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1535,7 +1532,6 @@ static void test_precopy_tcp_tls_psk_match(void)
 
     test_precopy_common(&args);
 }
-#endif /* _WIN32 */
 
 static void test_precopy_tcp_tls_psk_mismatch(void)
 {
@@ -1933,7 +1929,6 @@ static void test_multifd_tcp_zstd(void)
 #endif
 
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
 static void *
 test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
                                              QTestState *to)
@@ -1941,7 +1936,6 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
     test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
     return test_migrate_tls_psk_start_match(from, to);
 }
-#endif /* _WIN32 */
 
 static void *
 test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
@@ -1993,7 +1987,6 @@ test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
 }
 #endif /* CONFIG_TASN1 */
 
-#ifndef _WIN32
 static void test_multifd_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -2003,7 +1996,6 @@ static void test_multifd_tcp_tls_psk_match(void)
     };
     test_precopy_common(&args);
 }
-#endif /* _WIN32 */
 
 static void test_multifd_tcp_tls_psk_mismatch(void)
 {
@@ -2505,10 +2497,8 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
-#endif
 
     if (has_uffd) {
         /*
@@ -2534,10 +2524,8 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
     qtest_add_func("/migration/precopy/tcp/tls/psk/match",
                    test_precopy_tcp_tls_psk_match);
-#endif
     qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
                    test_precopy_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
@@ -2581,10 +2569,8 @@ int main(int argc, char **argv)
                    test_multifd_tcp_zstd);
 #endif
 #ifdef CONFIG_GNUTLS
-#ifndef _WIN32
     qtest_add_func("/migration/multifd/tcp/tls/psk/match",
                    test_multifd_tcp_tls_psk_match);
-#endif
     qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
                    test_multifd_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
-- 
2.31.1


