Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC359F73C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:15:47 +0200 (CEST)
Received: from localhost ([::1]:44580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnQI-0004Yj-PA
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtp-0002zl-KK
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:14 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtn-0001XG-Pg
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso948658pjr.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PVY8h/tTrArd5DSKz6bRlz61yqGVT8tU2bwvHb4Unqc=;
 b=WxF1douoWH8KazljzpJ5yLjNHi0hLOKo9lyYLRBSQrWBJM3WGtNE/AaQTx0xGx7Do+
 JGGci4dx32MP3bfFdLQBi4XxfYilHUjdihe17B8h+CKkoQcpLW0lI3Lk88PJWvEaWaHH
 4djOkyDQBwtjOD7zktx78NF8oj8FYdrunvOOV6yp5wgqk2sN3oov7RYeFBOZqHo7n1oM
 WcMVBvF9y9fRMj1a8eH9v7iF748+TIL3bXrwHUKZGRl2Kn0myHWz5nA5YZ0s5vyWbjAa
 +awnweay1AJ7Hln8GX5DyeucdSXKDAMip6+pGuusxZJuOXvythjlN2NjfD/llNeKLnlo
 P3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PVY8h/tTrArd5DSKz6bRlz61yqGVT8tU2bwvHb4Unqc=;
 b=QNEIyUm1WLjQQ8tku1pdRTqKGC7IvLkUG/Dgs7azGHW75W9509Rn08r2Lnkts5PMWD
 Oh8NAnX1lZ5nBE22HupTcTdkvmJcouzoOnsJoxa9ixmlRjMIHNAZBxj0M9jT/p6gis46
 5kH8xd7fixdzz1yN0PP6U4QxqmD9TvPm4sr2aC3WarLufDBGy3I/Hu/dVLlc4MBIOL0T
 HTWs7qBakKBF4u22tEkm7wN5UjoGy18W/3MMNK3mQIB16jrPD83swFNo+2brNZe4gwls
 +18xdDVghmTw4m5nGLr8+iAHkGZtvAagoFUABXis7Z6UKgDPWJzKV/rPArwJl4f7Xgmh
 YIkw==
X-Gm-Message-State: ACgBeo1j0P7Z8+2n67DuOk5Q+xh+pXh4tLHbjY6xlUFPDwHyzQxZn9cs
 YnQEuoxqo64gj4ls+aDwnekzq/xH2Yo=
X-Google-Smtp-Source: AA6agR5qiODdXLnZnXyZiVGECY1Dw3npyrjo9fPV63p4ULNYkJCXUUXCl9kEmSve0I+880unBC7z2Q==
X-Received: by 2002:a17:90a:ee88:b0:1fa:aac3:6fb7 with SMTP id
 i8-20020a17090aee8800b001faaac36fb7mr7379816pjz.62.1661334127901; 
 Wed, 24 Aug 2022 02:42:07 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 12/51] tests: Use g_mkdir_with_parents()
Date: Wed, 24 Aug 2022 17:39:50 +0800
Message-Id: <20220824094029.1634519-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Use the same g_mkdir_with_parents() call to create a directory on
all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
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
index 5fa4ffeff0..38356d4aba 100644
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
2.34.1


