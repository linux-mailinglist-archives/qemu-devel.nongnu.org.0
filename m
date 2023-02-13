Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468C69522D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:49:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfkt-0000lI-Gp; Mon, 13 Feb 2023 15:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matoro_mailinglist_qemu@matoro.tk>)
 id 1pReO4-0005U4-9b
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:21:21 -0500
Received: from [2600:1700:4b10:9d80::2] (helo=matoro.tk)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <matoro_mailinglist_qemu@matoro.tk>)
 id 1pReO2-0006YF-5o
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:21:16 -0500
DKIM-Signature: a=rsa-sha256; bh=GM3MlQR3nW7zVGDZxvDxDKtZInW/6E0LPtgHxL54XH4=; 
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20221223; t=1676311254; v=1; x=1676743254;
 b=QLhjdK87gMv5lFhnZcG/VF/NyKK3EbLPvzrMSosF+jVwTTOdqTMWL3XE8Q0b1BcQ9yL0jp7q
 Y+zvlVCDiHdUayXa1iqn8PYAGx/7IoIHhc44fWYX9md1w9Qt1czWc+Swb+OOiIe7tywgnN15PnW
 AL0dQLbcb53Sp2XHeULJF7xzPkbBfrqyXbOFQLLtFqaNihLNQdZAwT6ppE56bJN9i+Ro75UULYp
 MPDo/pDSzke8u/DQhbXyK69OQ92K61gRpafyMBDGYqDhZ+jvw9O73hP7rf+2mPd4mzxPpUnA8FI
 Az58CkYTI5im9zajL0BsP0c1cNkyUSE91YHJMu0foILYEBOqBc1DZp8zbuuFA6wO6opFc/YDEd4
 nX00FYsIVLsJZA6VFg83UT01uDXOsuufqd1g7VVj+LcFZVoAHghsCPNJG/n/Isku0z6nz00bL/w
 ORxHdHGTxdljknAQ5FqX+rJE5jCDCInzfih0R27hyItFGLBUL3wimlIdZdGTgWaUUQHEU+1WeDS
 YQsHpJcrI+FIRTjeNTzWHoKnyZhNBeNxT20ENTJTPC8ZgkD9mpPnglWS2HERx9uTRDhobebxBqE
 4QdpauuRuShPelhc8kCFrUVM1ylCSVOU8yMJOqgHRigs9MiO1RygblLZfXXxVSd38P+yq1BTFHU
 4500CXkVj1Q=
Received: by matoro.tk (envelope-sender <matoro_mailinglist_qemu@matoro.tk>)
 with ESMTPS id 40107b43; Mon, 13 Feb 2023 13:00:54 -0500
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, matoro <matoro@users.noreply.github.com>,
 matoro <matoro_mailinglist_qemu@matoro.tk>
Subject: [PATCH] crypto: allow client/server cert chains
Date: Mon, 13 Feb 2023 13:00:49 -0500
Message-Id: <20230213180049.19093-1-matoro_mailinglist_qemu@matoro.tk>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2600:1700:4b10:9d80::2
 (failed)
Received-SPF: pass client-ip=2600:1700:4b10:9d80::2;
 envelope-from=matoro_mailinglist_qemu@matoro.tk; helo=matoro.tk
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 15:48:53 -0500
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
Reply-to:  matoro_mailinglist_qemu@matoro.tk
From: matoro_mailinglist_qemu--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: matoro <matoro@users.noreply.github.com>

The existing implementation assumes that client/server certificates are
single individual certificates.  If using publicly-issued certificates,
or internal CAs that use an intermediate issuer, this is unlikely to be
the case, and they will instead be certificate chains.  While this can
be worked around by moving the intermediate certificates to the CA
certificate, which DOES currently support multiple certificates, this
instead allows the issued certificate chains to be used as-is, without
requiring the overhead of shuffling certificates around.

Corresponding libvirt change is available here:
https://gitlab.com/libvirt/libvirt/-/merge_requests/222

Signed-off-by: matoro <matoro_mailinglist_qemu@matoro.tk>
---
 crypto/tlscredsx509.c                 | 130 +++++++++-----------------
 tests/unit/test-crypto-tlscredsx509.c |  78 ++++++++++++++++
 2 files changed, 122 insertions(+), 86 deletions(-)

diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index d14313925d..5bb793e2c7 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -317,7 +317,8 @@ qcrypto_tls_creds_check_cert(QCryptoTLSCredsX509 *creds,
 
 
 static int
-qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t cert,
+qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t *certs,
+                                  size_t ncerts,
                                   const char *certFile,
                                   gnutls_x509_crt_t *cacerts,
                                   size_t ncacerts,
@@ -327,7 +328,7 @@ qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t cert,
 {
     unsigned int status;
 
-    if (gnutls_x509_crt_list_verify(&cert, 1,
+    if (gnutls_x509_crt_list_verify(certs, ncerts,
                                     cacerts, ncacerts,
                                     NULL, 0,
                                     0, &status) < 0) {
@@ -369,67 +370,15 @@ qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t cert,
 }
 
 
-static gnutls_x509_crt_t
-qcrypto_tls_creds_load_cert(QCryptoTLSCredsX509 *creds,
-                            const char *certFile,
-                            bool isServer,
-                            Error **errp)
-{
-    gnutls_datum_t data;
-    gnutls_x509_crt_t cert = NULL;
-    g_autofree char *buf = NULL;
-    gsize buflen;
-    GError *gerr = NULL;
-    int ret = -1;
-    int err;
-
-    trace_qcrypto_tls_creds_x509_load_cert(creds, isServer, certFile);
-
-    err = gnutls_x509_crt_init(&cert);
-    if (err < 0) {
-        error_setg(errp, "Unable to initialize certificate: %s",
-                   gnutls_strerror(err));
-        goto cleanup;
-    }
-
-    if (!g_file_get_contents(certFile, &buf, &buflen, &gerr)) {
-        error_setg(errp, "Cannot load CA cert list %s: %s",
-                   certFile, gerr->message);
-        g_error_free(gerr);
-        goto cleanup;
-    }
-
-    data.data = (unsigned char *)buf;
-    data.size = strlen(buf);
-
-    err = gnutls_x509_crt_import(cert, &data, GNUTLS_X509_FMT_PEM);
-    if (err < 0) {
-        error_setg(errp, isServer ?
-                   "Unable to import server certificate %s: %s" :
-                   "Unable to import client certificate %s: %s",
-                   certFile,
-                   gnutls_strerror(err));
-        goto cleanup;
-    }
-
-    ret = 0;
-
- cleanup:
-    if (ret != 0) {
-        gnutls_x509_crt_deinit(cert);
-        cert = NULL;
-    }
-    return cert;
-}
-
-
 static int
-qcrypto_tls_creds_load_ca_cert_list(QCryptoTLSCredsX509 *creds,
-                                    const char *certFile,
-                                    gnutls_x509_crt_t *certs,
-                                    unsigned int certMax,
-                                    size_t *ncerts,
-                                    Error **errp)
+qcrypto_tls_creds_load_cert_list(QCryptoTLSCredsX509 *creds,
+                                 const char *certFile,
+                                 gnutls_x509_crt_t *certs,
+                                 unsigned int certMax,
+                                 size_t *ncerts,
+                                 bool isServer,
+                                 bool isCA,
+                                 Error **errp)
 {
     gnutls_datum_t data;
     g_autofree char *buf = NULL;
@@ -450,9 +399,15 @@ qcrypto_tls_creds_load_ca_cert_list(QCryptoTLSCredsX509 *creds,
     data.size = strlen(buf);
 
     if (gnutls_x509_crt_list_import(certs, &certMax, &data,
-                                    GNUTLS_X509_FMT_PEM, 0) < 0) {
+                                    GNUTLS_X509_FMT_PEM,
+                                    isCA ?
+                                    GNUTLS_X509_CRT_LIST_IMPORT_FAIL_IF_EXCEED :
+                                    GNUTLS_X509_CRT_LIST_IMPORT_FAIL_IF_EXCEED |
+                                    GNUTLS_X509_CRT_LIST_FAIL_IF_UNSORTED) < 0){
         error_setg(errp,
-                   "Unable to import CA certificate list %s",
+                   isCA ? "Unable to import CA certificate list %s" :
+                   (isServer ? "Unable to import server certificate %s" :
+                   "Unable to import client certificate %s"),
                    certFile);
         return -1;
     }
@@ -462,7 +417,7 @@ qcrypto_tls_creds_load_ca_cert_list(QCryptoTLSCredsX509 *creds,
 }
 
 
-#define MAX_CERTS 16
+#define MAX_CERTS 200
 static int
 qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
                                     bool isServer,
@@ -470,36 +425,39 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
                                     const char *certFile,
                                     Error **errp)
 {
-    gnutls_x509_crt_t cert = NULL;
+    gnutls_x509_crt_t certs[MAX_CERTS];
     gnutls_x509_crt_t cacerts[MAX_CERTS];
-    size_t ncacerts = 0;
+    size_t ncerts = 0, ncacerts = 0;
     size_t i;
     int ret = -1;
 
+    memset(certs, 0, sizeof(certs));
     memset(cacerts, 0, sizeof(cacerts));
     if (certFile &&
         access(certFile, R_OK) == 0) {
-        cert = qcrypto_tls_creds_load_cert(creds,
-                                           certFile, isServer,
-                                           errp);
-        if (!cert) {
+        if (qcrypto_tls_creds_load_cert_list(creds,
+                                             certFile, certs,
+                                             MAX_CERTS, &ncerts,
+                                             isServer, false, errp) < 0) {
             goto cleanup;
         }
     }
-    if (access(cacertFile, R_OK) == 0) {
-        if (qcrypto_tls_creds_load_ca_cert_list(creds,
-                                                cacertFile, cacerts,
-                                                MAX_CERTS, &ncacerts,
-                                                errp) < 0) {
+    if (cacertFile &&
+        access(cacertFile, R_OK) == 0) {
+        if (qcrypto_tls_creds_load_cert_list(creds,
+                                             cacertFile, cacerts,
+                                             MAX_CERTS, &ncacerts,
+                                             isServer, true, errp) < 0) {
             goto cleanup;
         }
     }
 
-    if (cert &&
-        qcrypto_tls_creds_check_cert(creds,
-                                     cert, certFile, isServer,
-                                     false, errp) < 0) {
-        goto cleanup;
+    for (i = 0; i < ncerts; i++) {
+        if (qcrypto_tls_creds_check_cert(creds,
+                                         certs[i], certFile,
+                                         isServer, (i != 0), errp) < 0) {
+            goto cleanup;
+        }
     }
 
     for (i = 0; i < ncacerts; i++) {
@@ -510,9 +468,9 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
         }
     }
 
-    if (cert && ncacerts &&
-        qcrypto_tls_creds_check_cert_pair(cert, certFile, cacerts,
-                                          ncacerts, cacertFile,
+    if (ncerts && ncacerts &&
+        qcrypto_tls_creds_check_cert_pair(certs, ncerts, certFile,
+                                          cacerts, ncacerts, cacertFile,
                                           isServer, errp) < 0) {
         goto cleanup;
     }
@@ -520,8 +478,8 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
     ret = 0;
 
  cleanup:
-    if (cert) {
-        gnutls_x509_crt_deinit(cert);
+    for (i = 0; i < ncerts; i++) {
+        gnutls_x509_crt_deinit(certs[i]);
     }
     for (i = 0; i < ncacerts; i++) {
         gnutls_x509_crt_deinit(cacerts[i]);
diff --git a/tests/unit/test-crypto-tlscredsx509.c b/tests/unit/test-crypto-tlscredsx509.c
index 3c25d75ca1..660335ce98 100644
--- a/tests/unit/test-crypto-tlscredsx509.c
+++ b/tests/unit/test-crypto-tlscredsx509.c
@@ -577,6 +577,12 @@ int main(int argc, char **argv)
                  true, true, GNUTLS_KEY_KEY_CERT_SIGN,
                  false, false, NULL, NULL,
                  0, 0);
+    TLS_ROOT_REQ(someotherrootreq,
+                 "UK", "some other random CA", NULL, NULL, NULL, NULL,
+                 true, true, true,
+                 true, true, GNUTLS_KEY_KEY_CERT_SIGN,
+                 false, false, NULL, NULL,
+                 0, 0);
     TLS_CERT_REQ(cacertlevel1areq, cacertrootreq,
                  "UK", "qemu level 1a", NULL, NULL, NULL, NULL,
                  true, true, true,
@@ -617,6 +623,33 @@ int main(int argc, char **argv)
         cacertlevel2areq.crt,
     };
 
+    gnutls_x509_crt_t cabundle[] = {
+        someotherrootreq.crt,
+        cacertrootreq.crt,
+    };
+
+    gnutls_x509_crt_t servercertchain[] = {
+        servercertlevel3areq.crt,
+        cacertlevel2areq.crt,
+        cacertlevel1areq.crt,
+    };
+
+    gnutls_x509_crt_t servercertchain_incomplete[] = {
+        servercertlevel3areq.crt,
+        cacertlevel2areq.crt,
+    };
+
+    gnutls_x509_crt_t servercertchain_unsorted[] = {
+        servercertlevel3areq.crt,
+        cacertlevel1areq.crt,
+        cacertlevel2areq.crt,
+    };
+
+    gnutls_x509_crt_t clientcertchain[] = {
+        clientcertlevel2breq.crt,
+        cacertlevel1breq.crt,
+    };
+
     test_tls_write_cert_chain(WORKDIR "cacertchain-ctx.pem",
                               certchain,
                               G_N_ELEMENTS(certchain));
@@ -628,6 +661,46 @@ int main(int argc, char **argv)
                  WORKDIR "cacertchain-ctx.pem",
                  clientcertlevel2breq.filename, false);
 
+    test_tls_write_cert_chain(WORKDIR "servercertchain-ctx.pem",
+                              servercertchain,
+                              G_N_ELEMENTS(servercertchain));
+
+    TLS_TEST_REG(serverchain, true,
+                 cacertrootreq.filename,
+                 WORKDIR "servercertchain-ctx.pem", false);
+
+    test_tls_write_cert_chain(WORKDIR "cabundle-ctx.pem",
+                              cabundle,
+                              G_N_ELEMENTS(cabundle));
+
+    TLS_TEST_REG(multiplecaswithchain, true,
+                 WORKDIR "cabundle-ctx.pem",
+                 WORKDIR "servercertchain-ctx.pem", false);
+
+    test_tls_write_cert_chain(WORKDIR "servercertchain_incomplete-ctx.pem",
+                              servercertchain_incomplete,
+                              G_N_ELEMENTS(servercertchain_incomplete));
+
+    TLS_TEST_REG(incompleteserverchain, true,
+                 cacertrootreq.filename,
+                 WORKDIR "servercertchain_incomplete-ctx.pem", true);
+
+    test_tls_write_cert_chain(WORKDIR "servercertchain_unsorted-ctx.pem",
+                              servercertchain_unsorted,
+                              G_N_ELEMENTS(servercertchain_unsorted));
+
+    TLS_TEST_REG(unsortedserverchain, true,
+                 cacertrootreq.filename,
+                 WORKDIR "servercertchain_unsorted-ctx.pem", true);
+
+    test_tls_write_cert_chain(WORKDIR "clientcertchain-ctx.pem",
+                              clientcertchain,
+                              G_N_ELEMENTS(clientcertchain));
+
+    TLS_TEST_REG(clientchain, false,
+                 cacertrootreq.filename,
+                 WORKDIR "clientcertchain-ctx.pem", false);
+
     /* Some missing certs - first two are fatal, the last
      * is ok
      */
@@ -697,7 +770,12 @@ int main(int argc, char **argv)
     test_tls_discard_cert(&cacertlevel2areq);
     test_tls_discard_cert(&servercertlevel3areq);
     test_tls_discard_cert(&clientcertlevel2breq);
+    test_tls_discard_cert(&someotherrootreq);
     unlink(WORKDIR "cacertchain-ctx.pem");
+    unlink(WORKDIR "servercertchain-ctx.pem");
+    unlink(WORKDIR "servercertchain_incomplete-ctx.pem");
+    unlink(WORKDIR "servercertchain_unsorted-ctx.pem");
+    unlink(WORKDIR "clientcertchain-ctx.pem");
 
     test_tls_cleanup(KEYFILE);
     rmdir(WORKDIR);
-- 
2.39.1


