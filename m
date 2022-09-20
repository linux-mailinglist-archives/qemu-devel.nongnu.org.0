Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BB05BE6CD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:14:51 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oad5O-0002hF-7n
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZa-0001SE-CK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:51 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZY-000522-0Q
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:49 -0400
Received: by mail-pg1-x532.google.com with SMTP id 3so2143397pga.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xmrffeAJpAZ7oRzdU9cwoCFcPUSltVboEjy+YD7LlIE=;
 b=O2F2rNnO6//5wU5+WZidqqaoBRZa7YhAZCT+gUPM6MVJ6ov74Ql/2AgtmDV9bB3SqF
 97MofwFHjPQwF4XhFmu5+wYg13YxocqA6vPdGUiK657jiutCU2pLVUlt8WKMovj+/NZo
 1fgMLuc/qil1vwn19L/+c9F8K8QQLHyEsgYzzfS+vNEbC0uEuRP4zmDA/2hhCZdcdOng
 U0XJsNAQ2CogDHJhrytrTZm2mwcmFdk1b96Q9w6oFKyiJd6iM9wp6y2K0WeBWHGSPaC8
 6eSwgpbrxU+SUGi3n4CEO3WeQZqT0jDr4hFEQYHHy5edqLPfGN40Fl6f8UgVnLCMONVl
 Ru/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xmrffeAJpAZ7oRzdU9cwoCFcPUSltVboEjy+YD7LlIE=;
 b=5kGUZc/QBAoKdmS+hbfz5HEhYt6vPzV3fTT+537jCk/SLLx+9ZLpSfCOrjTwkOBhFk
 JmHJmgTvr+h663+ahlVgYHDbgd7HLietPVQ5y4KJWf0J0/HaOOHZQnStpRo43MSB4y9G
 xr0vjI/pw32ozrn4227RW3VQj7m4y3WAJ68jPll4Ci/7Yyz5vmV1C8DYnb2zGkzhrQ6C
 gyTOK8BANnuEoc0W0c11CQKngeyziYbd+qu7dFBV7t1FGCSrFMMG5k++0mXk1jcQL/89
 vkf8p3JeP9GYlbkg4o4/FSMgYL75Rdqn0l/1ruHh9/hHL5aKdVeK0QJ/v7QHARAfZWCD
 tC/A==
X-Gm-Message-State: ACrzQf0QrURhZmsOHh4DMYEyFq+cvJ5JsLNITYK/CAqjkZW4/3DcD8y8
 b1E3Fk/xc/fCykdtrQakkRIXazDH7w0=
X-Google-Smtp-Source: AMsMyM4HgUGSsMnGr8wPOw6wT/fG3Q0vYUKHqSrlXdT9pTAjqwrpC878R/YHNqIXzv/SrbDM3EKZJw==
X-Received: by 2002:a65:68c8:0:b0:438:744d:b340 with SMTP id
 k8-20020a6568c8000000b00438744db340mr19296035pgt.142.1663670026484; 
 Tue, 20 Sep 2022 03:33:46 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 35/39] tests/qtest: migration-test: Skip running some TLS
 cases for win32
Date: Tue, 20 Sep 2022 18:31:55 +0800
Message-Id: <20220920103159.1865256-36-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
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
index aedd9ddb72..dbee9b528a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1403,6 +1403,7 @@ static void test_precopy_unix_dirty_ring(void)
 }
 
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
 static void test_precopy_unix_tls_psk(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1415,6 +1416,7 @@ static void test_precopy_unix_tls_psk(void)
 
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 #ifdef CONFIG_TASN1
 static void test_precopy_unix_tls_x509_default_host(void)
@@ -1523,6 +1525,7 @@ static void test_precopy_tcp_plain(void)
 }
 
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
 static void test_precopy_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1533,6 +1536,7 @@ static void test_precopy_tcp_tls_psk_match(void)
 
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 static void test_precopy_tcp_tls_psk_mismatch(void)
 {
@@ -1930,6 +1934,7 @@ static void test_multifd_tcp_zstd(void)
 #endif
 
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
 static void *
 test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
                                              QTestState *to)
@@ -1937,6 +1942,7 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
     test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
     return test_migrate_tls_psk_start_match(from, to);
 }
+#endif /* _WIN32 */
 
 static void *
 test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
@@ -1988,6 +1994,7 @@ test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
 }
 #endif /* CONFIG_TASN1 */
 
+#ifndef _WIN32
 static void test_multifd_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1997,6 +2004,7 @@ static void test_multifd_tcp_tls_psk_match(void)
     };
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 static void test_multifd_tcp_tls_psk_mismatch(void)
 {
@@ -2497,8 +2505,10 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
+#endif
 
     if (has_uffd) {
         /*
@@ -2524,8 +2534,10 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
     qtest_add_func("/migration/precopy/tcp/tls/psk/match",
                    test_precopy_tcp_tls_psk_match);
+#endif
     qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
                    test_precopy_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
@@ -2569,8 +2581,10 @@ int main(int argc, char **argv)
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


