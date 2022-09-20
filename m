Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B45BE507
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:56:59 +0200 (CEST)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabs1-0000Je-N5
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaY8-0000Sh-Bf
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:20 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaY6-0004lh-5t
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:19 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so10309547pja.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+1/ByEandD4GHa1nSQmGpBJTye5soxRUQPsqyjhWqFc=;
 b=SxFYyhHrXDa5p4cKqNw2mNIP4HOqGfZiW4vuSbioLVpLskSsv/ztgzj5xgaxAbfJsY
 bmC8xbGl0HyHKOF9rbSEOaTPI79W12Qk6qf2BFW+uom2ZY/GfsreIMB2Dy6bKMPNDAyh
 8Yjof1iLMqiSh39iac6IDHb/wiHX5DD8XWkW5VdOpLeOInhczHDG9y9BGu+CPRPA9FmL
 v+N8Jhg/AW5nlUNJToKfHcO1gGRtUehbZ3WCG607R3b0wvRPkU5R8RPbXIEVdiDV7SSy
 R3zhH0FCGZ3lsTJ2Ejmvm3NpjBgF1BxBercUJj2bqH8QEgV8a3PD8erkOScnixdty3ve
 6+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+1/ByEandD4GHa1nSQmGpBJTye5soxRUQPsqyjhWqFc=;
 b=lIRZwNyNA+hucona6ZyQcdc8Kib9fJMPs+0H+ext9eNHLaomVPQc+t6RUe2qFufDKh
 ot497/T0ZARFvWV2RPr9BQGY5ufqUiHPzIemYEAvraNUfCmvqVyhoqKA7t6QF/fRNHFQ
 Z9ZK5/onn0V1FUWdqdTN8J9J7YTpSYQu9aumWNfCu8vlePuU9ZJakN0P3mC9VZTO5qmj
 DBj/Uco9P/gMFU58Y31C7dmh3x5zxRePSLA2J4mBg4mIW5vxeLZAWyU2SNQkiekl8OCz
 y3CUea76L2eDgJtVKSiOnTrR8sOcJRE8TPAX1XnTn2bpR21donaHLRHD4P391A2TVK2P
 L0lQ==
X-Gm-Message-State: ACrzQf2jYatyhe3hgnsbCsOQW06sgEEO8tfeZVfNG9qO9BpjdZHXyJAX
 4tlb1dtcqTCb/5U6+vQo2vzpFlS1fh4=
X-Google-Smtp-Source: AMsMyM5T+4bxM5GK/bAQ0eEYtztW0CZOpiYiEZqGPMX2Dd3m0pPqdk2MSaGpYD2+DVlItZ2QMuQUqw==
X-Received: by 2002:a17:90b:4ad0:b0:202:e01b:2dec with SMTP id
 mh16-20020a17090b4ad000b00202e01b2decmr3111378pjb.142.1663669936404; 
 Tue, 20 Sep 2022 03:32:16 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 01/39] tests: Change to use g_mkdir()
Date: Tue, 20 Sep 2022 18:31:21 +0800
Message-Id: <20220920103159.1865256-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
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

Commit 413bebc04603 ("tests: Use g_mkdir_with_parents()") replaces
the mkdir() call in the test codes with glib's g_mkdir_with_parents(),
but the exact portable replacement for mkdir() should be g_mkdir().

I probably was misled by the GTK glib doc [1] before, thinking that
g_mkdir() is not a supported API from glib. But the glib sources do
not support this statement. It is probably that the GTK documentation
was not built to include all APIs.

[1] https://docs.gtk.org/glib/?q=mkdir

Fixes: 413bebc04603 ("tests: Use g_mkdir_with_parents()")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- new patch: "tests: Change to use g_mkdir()"

 tests/migration/stress.c              | 3 ++-
 tests/qtest/migration-test.c          | 7 ++++---
 tests/unit/test-crypto-tlscredsx509.c | 5 +++--
 tests/unit/test-crypto-tlssession.c   | 7 ++++---
 tests/unit/test-io-channel-tls.c      | 7 ++++---
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index 88acf8dc25..76b91851ad 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include <getopt.h>
+#include <glib/gstdio.h>
 #include <sys/reboot.h>
 #include <sys/syscall.h>
 #include <linux/random.h>
@@ -232,7 +233,7 @@ static void stress(unsigned long long ramsizeGB, int ncpus)
 
 static int mount_misc(const char *fstype, const char *dir)
 {
-    if (g_mkdir_with_parents(dir, 0755) < 0 && errno != EEXIST) {
+    if (g_mkdir(dir, 0755) < 0 && errno != EEXIST) {
         fprintf(stderr, "%s (%05d): ERROR: cannot create %s: %s\n",
                 argv0, gettid(), dir, strerror(errno));
         return -1;
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 4728d528bb..55892b3798 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 
 #include "libqtest.h"
 #include "qapi/error.h"
@@ -761,14 +762,14 @@ test_migrate_tls_psk_start_common(QTestState *from,
     data->workdir = g_strdup_printf("%s/tlscredspsk0", tmpfs);
     data->pskfile = g_strdup_printf("%s/%s", data->workdir,
                                     QCRYPTO_TLS_CREDS_PSKFILE);
-    g_mkdir_with_parents(data->workdir, 0700);
+    g_mkdir(data->workdir, 0700);
     test_tls_psk_init(data->pskfile);
 
     if (mismatch) {
         data->workdiralt = g_strdup_printf("%s/tlscredspskalt0", tmpfs);
         data->pskfilealt = g_strdup_printf("%s/%s", data->workdiralt,
                                            QCRYPTO_TLS_CREDS_PSKFILE);
-        g_mkdir_with_parents(data->workdiralt, 0700);
+        g_mkdir(data->workdiralt, 0700);
         test_tls_psk_init_alt(data->pskfilealt);
     }
 
@@ -873,7 +874,7 @@ test_migrate_tls_x509_start_common(QTestState *from,
         data->clientcert = g_strdup_printf("%s/client-cert.pem", data->workdir);
     }
 
-    g_mkdir_with_parents(data->workdir, 0700);
+    g_mkdir(data->workdir, 0700);
 
     test_tls_init(data->keyfile);
 #ifndef _WIN32
diff --git a/tests/unit/test-crypto-tlscredsx509.c b/tests/unit/test-crypto-tlscredsx509.c
index 3c25d75ca1..03fa48a3c5 100644
--- a/tests/unit/test-crypto-tlscredsx509.c
+++ b/tests/unit/test-crypto-tlscredsx509.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 
 #include "crypto-tls-x509-helpers.h"
 #include "crypto/tlscredsx509.h"
@@ -75,7 +76,7 @@ static void test_tls_creds(const void *opaque)
     QCryptoTLSCreds *creds;
 
 #define CERT_DIR "tests/test-crypto-tlscredsx509-certs/"
-    g_mkdir_with_parents(CERT_DIR, 0700);
+    g_mkdir(CERT_DIR, 0700);
 
     unlink(CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);
     if (data->isServer) {
@@ -141,7 +142,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_setenv("GNUTLS_FORCE_FIPS_MODE", "2", 1);
 
-    g_mkdir_with_parents(WORKDIR, 0700);
+    g_mkdir(WORKDIR, 0700);
 
     test_tls_init(KEYFILE);
 
diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
index 615a1344b4..356afbadfb 100644
--- a/tests/unit/test-crypto-tlssession.c
+++ b/tests/unit/test-crypto-tlssession.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 
 #include "crypto-tls-x509-helpers.h"
 #include "crypto-tls-psk-helpers.h"
@@ -249,8 +250,8 @@ static void test_crypto_tls_session_x509(const void *opaque)
 
 #define CLIENT_CERT_DIR "tests/test-crypto-tlssession-client/"
 #define SERVER_CERT_DIR "tests/test-crypto-tlssession-server/"
-    g_mkdir_with_parents(CLIENT_CERT_DIR, 0700);
-    g_mkdir_with_parents(SERVER_CERT_DIR, 0700);
+    g_mkdir(CLIENT_CERT_DIR, 0700);
+    g_mkdir(SERVER_CERT_DIR, 0700);
 
     unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);
     unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_SERVER_CERT);
@@ -398,7 +399,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_setenv("GNUTLS_FORCE_FIPS_MODE", "2", 1);
 
-    g_mkdir_with_parents(WORKDIR, 0700);
+    g_mkdir(WORKDIR, 0700);
 
     test_tls_init(KEYFILE);
     test_tls_psk_init(PSKFILE);
diff --git a/tests/unit/test-io-channel-tls.c b/tests/unit/test-io-channel-tls.c
index cc39247556..1d95c9f61d 100644
--- a/tests/unit/test-io-channel-tls.c
+++ b/tests/unit/test-io-channel-tls.c
@@ -22,6 +22,7 @@
 
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 
 #include "crypto-tls-x509-helpers.h"
 #include "io/channel-tls.h"
@@ -125,8 +126,8 @@ static void test_io_channel_tls(const void *opaque)
 
 #define CLIENT_CERT_DIR "tests/test-io-channel-tls-client/"
 #define SERVER_CERT_DIR "tests/test-io-channel-tls-server/"
-    g_mkdir_with_parents(CLIENT_CERT_DIR, 0700);
-    g_mkdir_with_parents(SERVER_CERT_DIR, 0700);
+    g_mkdir(CLIENT_CERT_DIR, 0700);
+    g_mkdir(SERVER_CERT_DIR, 0700);
 
     unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_CA_CERT);
     unlink(SERVER_CERT_DIR QCRYPTO_TLS_CREDS_X509_SERVER_CERT);
@@ -273,7 +274,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_setenv("GNUTLS_FORCE_FIPS_MODE", "2", 1);
 
-    g_mkdir_with_parents(WORKDIR, 0700);
+    g_mkdir(WORKDIR, 0700);
 
     test_tls_init(KEYFILE);
 
-- 
2.34.1


