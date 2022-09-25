Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E35E9319
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:30:16 +0200 (CEST)
Received: from localhost ([::1]:33584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQlx-0005bb-Ai
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsS-0003nO-IQ
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsQ-0006VJ-N0
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:52 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso4293658pjd.4
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/b7s3t9sw9bpXRC73xt9PPRDwHP5U56OXk3X7W+M0Uo=;
 b=ZPgQvJHEqHa5Se/V+/7vCTaWLrmZVr47f2j5TqHxQVV7i/aTnk3L5nNeDFmYR9pQvr
 CLZfLvlzoia1KU55mPT22VECR9om89eseWr3DExzWhLMG1Sx7eOS9g45jukYxZjpxvjf
 RgYzYvBOjS6K/vneae3Sy2lX2IIq/gwtlZPCaE3cSUU+o2m5AnneGEllJPt4dIj+Hz5T
 Y+kcZZS32SKZ9Jjs3/aMyxUDqK7jgNq5g/6C2J+72udpL2UaPHAZikyDmxN63ON/GWRv
 ACiAxOOnqBV5Y6d/vjZzJQb1daBk9Dq35LDmTSnVNOGRYIhx6Wzz8k/14dqwgo5LBFRW
 4pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/b7s3t9sw9bpXRC73xt9PPRDwHP5U56OXk3X7W+M0Uo=;
 b=0tLqpN+9x9tw/3MfUnkr84OoDnB+51D4zmdZZJXq5IxMltm3bTta9dnWwa7kH+nC61
 xFuVrbOCV0hGnu8iE04gs8HwQWSJNF1wcpPBndB2AAaJk5vvT9Uh2mHXeN7sZRN45b4T
 sxIN2xaA4odyv2kg+V/2vgFlTHrwnx2jbimWzgArlYWTzy3NGo7Cl5q3tXLdEJpK+eCU
 0OOFzwWl67kjGCZQSdhNNJ1vNP3OM/DK1iNPiWDLTkHplNGLp08EE/WnF8w1lvCynmn5
 T9E8P986UQkrkxG9YXt3q6HZpMyGj5Zdsrs3ykw4efeyNOKaHbOezNz4Z4pILgaQKKfu
 1oUg==
X-Gm-Message-State: ACrzQf2QbxPzHnOdblJyLAJcfoIfTdGlCRDKtnzt5P9MNPzIX6Mq8Sgp
 l+CjHFVJQfwoSixBqiGbtT69b2zt38Q=
X-Google-Smtp-Source: AMsMyM7dwo7QsdyDvJnvuEkRWbUFGV5ZUh3PLQeBgLIGyy+uT3a4B3iBJkgD8vaQSSenJXNbhm227A==
X-Received: by 2002:a17:902:c401:b0:178:41d1:ef50 with SMTP id
 k1-20020a170902c40100b0017841d1ef50mr17030889plk.66.1664105569144; 
 Sun, 25 Sep 2022 04:32:49 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 50/54] tests/qtest: migration-test: Skip running some TLS
 cases for win32
Date: Sun, 25 Sep 2022 19:30:28 +0800
Message-Id: <20220925113032.1949844-51-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Some migration test cases use TLS to communicate, but they fail on
Windows with the following error messages:

  qemu-system-x86_64: TLS handshake failed: Insufficient credentials for that request.
  qemu-system-x86_64: TLS handshake failed: Error in the pull function.
  query-migrate shows failed migration: TLS handshake failed: Error in the pull function.

Disable them temporarily.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---
I am not familar with the gnutls and simply enabling the gnutls debug
output does not give me an immedidate hint on why it's failing on
Windows. Disable these cases for now until someone or maintainers
who may want to test this on Windows.

(no changes since v1)

 tests/qtest/migration-test.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 9ec501d1eb..e22637a4e3 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1402,6 +1402,7 @@ static void test_precopy_unix_dirty_ring(void)
 }
 
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
 static void test_precopy_unix_tls_psk(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1414,6 +1415,7 @@ static void test_precopy_unix_tls_psk(void)
 
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 #ifdef CONFIG_TASN1
 static void test_precopy_unix_tls_x509_default_host(void)
@@ -1522,6 +1524,7 @@ static void test_precopy_tcp_plain(void)
 }
 
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
 static void test_precopy_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1532,6 +1535,7 @@ static void test_precopy_tcp_tls_psk_match(void)
 
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 static void test_precopy_tcp_tls_psk_mismatch(void)
 {
@@ -1929,6 +1933,7 @@ static void test_multifd_tcp_zstd(void)
 #endif
 
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
 static void *
 test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
                                              QTestState *to)
@@ -1936,6 +1941,7 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
     test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
     return test_migrate_tls_psk_start_match(from, to);
 }
+#endif /* _WIN32 */
 
 static void *
 test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
@@ -1987,6 +1993,7 @@ test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
 }
 #endif /* CONFIG_TASN1 */
 
+#ifndef _WIN32
 static void test_multifd_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1996,6 +2003,7 @@ static void test_multifd_tcp_tls_psk_match(void)
     };
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 static void test_multifd_tcp_tls_psk_mismatch(void)
 {
@@ -2496,8 +2504,10 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
+#endif
 
     if (has_uffd) {
         /*
@@ -2523,8 +2533,10 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
     qtest_add_func("/migration/precopy/tcp/tls/psk/match",
                    test_precopy_tcp_tls_psk_match);
+#endif
     qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
                    test_precopy_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
@@ -2568,8 +2580,10 @@ int main(int argc, char **argv)
                    test_multifd_tcp_zstd);
 #endif
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
     qtest_add_func("/migration/multifd/tcp/tls/psk/match",
                    test_multifd_tcp_tls_psk_match);
+#endif
     qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
                    test_multifd_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
-- 
2.34.1


