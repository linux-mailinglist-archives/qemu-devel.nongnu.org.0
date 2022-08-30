Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A8A5A6C8F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 20:50:00 +0200 (CEST)
Received: from localhost ([::1]:52714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6JD-0001s4-CC
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 14:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A2-0007L2-8A
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT69x-00054h-6L
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0wZmGF91WF9+Ut01va2IM4oyXsdYvxYKoHedmbsD4s=;
 b=DMDzj5SOghe7fZsqUC8wGVKS8vwluilz5kg118JaFJyAciAZFK1LTjl8TmuRhL8gBPWoFz
 8qFYk4AueghzZTl3HQTVMR6s/6KDlxxxCrGwbRWKJvN+8BxHM+A7v683GKd+4zQxyNZebD
 xlGlHhwAbupzPVY774x/IhzaO3qtzCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-4SQynGqqPyii23r4hv0Q4A-1; Tue, 30 Aug 2022 14:40:21 -0400
X-MC-Unique: 4SQynGqqPyii23r4hv0Q4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1429101AA4D;
 Tue, 30 Aug 2022 18:40:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 709C3141512E;
 Tue, 30 Aug 2022 18:40:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 03/23] tests: Use g_mkdir_with_parents()
Date: Tue, 30 Aug 2022 20:39:52 +0200
Message-Id: <20220830184012.77978-4-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Use the same g_mkdir_with_parents() call to create a directory on
all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20220824094029.1634519-13-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/migration/stress.c              | 2 +-
 tests/qtest/migration-test.c          | 6 +++---
 tests/unit/test-crypto-tlscredsx509.c | 4 ++--
 tests/unit/test-crypto-tlssession.c   | 6 +++---
 tests/unit/test-io-channel-tls.c      | 6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index b7240a15c8..88acf8dc25 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -232,7 +232,7 @@ static void stress(unsigned long long ramsizeGB, int ncpus)
 
 static int mount_misc(const char *fstype, const char *dir)
 {
-    if (mkdir(dir, 0755) < 0 && errno != EEXIST) {
+    if (g_mkdir_with_parents(dir, 0755) < 0 && errno != EEXIST) {
         fprintf(stderr, "%s (%05d): ERROR: cannot create %s: %s\n",
                 argv0, gettid(), dir, strerror(errno));
         return -1;
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 60f3d4e9d2..21bd76be19 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -761,14 +761,14 @@ test_migrate_tls_psk_start_common(QTestState *from,
     data->workdir = g_strdup_printf("%s/tlscredspsk0", tmpfs);
     data->pskfile = g_strdup_printf("%s/%s", data->workdir,
                                     QCRYPTO_TLS_CREDS_PSKFILE);
-    mkdir(data->workdir, 0700);
+    g_mkdir_with_parents(data->workdir, 0700);
     test_tls_psk_init(data->pskfile);
 
     if (mismatch) {
         data->workdiralt = g_strdup_printf("%s/tlscredspskalt0", tmpfs);
         data->pskfilealt = g_strdup_printf("%s/%s", data->workdiralt,
                                            QCRYPTO_TLS_CREDS_PSKFILE);
-        mkdir(data->workdiralt, 0700);
+        g_mkdir_with_parents(data->workdiralt, 0700);
         test_tls_psk_init_alt(data->pskfilealt);
     }
 
@@ -873,7 +873,7 @@ test_migrate_tls_x509_start_common(QTestState *from,
         data->clientcert = g_strdup_printf("%s/client-cert.pem", data->workdir);
     }
 
-    mkdir(data->workdir, 0700);
+    g_mkdir_with_parents(data->workdir, 0700);
 
     test_tls_init(data->keyfile);
     g_assert(link(data->keyfile, data->serverkey) == 0);
diff --git a/tests/unit/test-crypto-tlscredsx509.c b/tests/unit/test-crypto-tlscredsx509.c
index aab4149b56..3c25d75ca1 100644
--- a/tests/unit/test-crypto-tlscredsx509.c
+++ b/tests/unit/test-crypto-tlscredsx509.c
@@ -75,7 +75,7 @@ static void test_tls_creds(const void *opaque)
     QCryptoTLSCreds *creds;
 
 #define CERT_DIR "tests/test-crypto-tlscredsx509-certs/"
-    mkdir(CERT_DIR, 0700);
+    g_mkdir_with_parents(CERT_DIR, 0700);
 
     unlink(CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);
     if (data->isServer) {
@@ -141,7 +141,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_setenv("GNUTLS_FORCE_FIPS_MODE", "2", 1);
 
-    mkdir(WORKDIR, 0700);
+    g_mkdir_with_parents(WORKDIR, 0700);
 
     test_tls_init(KEYFILE);
 
diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
index f222959d36..615a1344b4 100644
--- a/tests/unit/test-crypto-tlssession.c
+++ b/tests/unit/test-crypto-tlssession.c
@@ -249,8 +249,8 @@ static void test_crypto_tls_session_x509(const void *opaque)
 
 #define CLIENT_CERT_DIR "tests/test-crypto-tlssession-client/"
 #define SERVER_CERT_DIR "tests/test-crypto-tlssession-server/"
-    mkdir(CLIENT_CERT_DIR, 0700);
-    mkdir(SERVER_CERT_DIR, 0700);
+    g_mkdir_with_parents(CLIENT_CERT_DIR, 0700);
+    g_mkdir_with_parents(SERVER_CERT_DIR, 0700);
 
     unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);
     unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_SERVER_CERT);
@@ -398,7 +398,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_setenv("GNUTLS_FORCE_FIPS_MODE", "2", 1);
 
-    mkdir(WORKDIR, 0700);
+    g_mkdir_with_parents(WORKDIR, 0700);
 
     test_tls_init(KEYFILE);
     test_tls_psk_init(PSKFILE);
diff --git a/tests/unit/test-io-channel-tls.c b/tests/unit/test-io-channel-tls.c
index f6fb988c01..cc39247556 100644
--- a/tests/unit/test-io-channel-tls.c
+++ b/tests/unit/test-io-channel-tls.c
@@ -125,8 +125,8 @@ static void test_io_channel_tls(const void *opaque)
 
 #define CLIENT_CERT_DIR "tests/test-io-channel-tls-client/"
 #define SERVER_CERT_DIR "tests/test-io-channel-tls-server/"
-    mkdir(CLIENT_CERT_DIR, 0700);
-    mkdir(SERVER_CERT_DIR, 0700);
+    g_mkdir_with_parents(CLIENT_CERT_DIR, 0700);
+    g_mkdir_with_parents(SERVER_CERT_DIR, 0700);
 
     unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);
     unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_SERVER_CERT);
@@ -273,7 +273,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_setenv("GNUTLS_FORCE_FIPS_MODE", "2", 1);
 
-    mkdir(WORKDIR, 0700);
+    g_mkdir_with_parents(WORKDIR, 0700);
 
     test_tls_init(KEYFILE);
 
-- 
2.31.1


