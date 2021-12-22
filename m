Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6AD47D420
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 16:10:56 +0100 (CET)
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n03GZ-0003lS-Fa
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 10:10:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <henry.kleynhans@gmail.com>)
 id 1n03C0-0008Du-IO
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:06:13 -0500
Received: from [2a00:1450:4864:20::333] (port=36795
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <henry.kleynhans@gmail.com>)
 id 1n03By-0000VE-Rh
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:06:12 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 n10-20020a7bc5ca000000b00345c520d38eso1227045wmk.1
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 07:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kh2us2IPoFMMDsZOIxjGMomqrmIIqVtPrqyAbiVHM9Q=;
 b=DilZtAU+iqPvA0c2JGJUTezd9EtjrO+Zb1CRq6G0mZvkpIwa6ubRMxg6cAJgmU8PRV
 Orq+UivJHUrxIRiPjvkqvQnuABe8VX6U56A7hpglla4sR5lUeNoKciBDLWcofYZbSGeg
 2VB85OKl4cmsloX+GGLMWD3/dSKhJTgu80TY8HJa1I69KScN4S3ROiI0TqhMrz3DpoFK
 mZODuxg4W8+BlQ92mozyPjY29GMyLrig/xkBYeU2bvKPKTNED3nQ/M63wrqQMA42AhL+
 3oNuSpKDIpOyHyE+3FOWxKoUagwMpKI3LN/O+QXT3yiJ3v6Mhmv5vU8bCoZdSzkrJjDr
 KTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kh2us2IPoFMMDsZOIxjGMomqrmIIqVtPrqyAbiVHM9Q=;
 b=jnPhn24+Q9wi/uDeMmXt9WUa2kqL/vEGYjtJrfYPZgwIdXoxwcDyxpeNBr/u9ZzLjN
 VM4yq1w8lFjzoK7b98HA2tgZnMlV2ITc0VmIg1Y8quCOJpwIcmdAjKNx2LJMBVWC86bn
 2ddw4MDp90ne7GaN+OB/ctmNWdj8aJhkMWFvboimVQRVjR4P0okifHXmpSK8zz+9SlZf
 s39EcW/rdryk0ggTYaV/NeYFVToNiqTEFPWVnV1JywbklA/PIvYyl2/RCi6o2kc9Pux7
 TkdHCORPdlJzagPgs5IyP6AgrKmNj3LSwmlwEwA0wwPF04pTF1jKgsXJLHumXY/WHayk
 JRNg==
X-Gm-Message-State: AOAM530IzqhowzhKX03n6jiogKbSpjlJ/4mItIdCPhLotNrb3vPGRWSY
 VmIWhfRA65eE21hMgmZz6mKlUXrQcU/5Emhm
X-Google-Smtp-Source: ABdhPJzN28KyPCp4u/tmwr9w0n6DXxJ099rtS/ilbfeCdfgb/ehnO6j7NPASmqeYtXJMA4sx/SxxkA==
X-Received: by 2002:a7b:c92a:: with SMTP id h10mr1230171wml.26.1640185568575; 
 Wed, 22 Dec 2021 07:06:08 -0800 (PST)
Received: from localhost ([2620:10d:c092:400::4:79fd])
 by smtp.gmail.com with ESMTPSA id p1sm5202471wma.42.2021.12.22.07.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 07:06:08 -0800 (PST)
From: Henry Kleynhans <henry.kleynhans@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] [crypto] Only verify CA certs in chain of trust
Date: Wed, 22 Dec 2021 15:06:00 +0000
Message-Id: <20211222150600.37677-2-henry.kleynhans@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211222150600.37677-1-henry.kleynhans@gmail.com>
References: <20211222150600.37677-1-henry.kleynhans@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=henry.kleynhans@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Henry Kleynhans <hkleynhans@fb.com>, berrange@redhat.com,
 henry.kleynhans@fb.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Henry Kleynhans <hkleynhans@fb.com>

The CA file provided to qemu may contain CA certificates which do not
form part of the chain of trust for the specific certificate we are
sanity checking.

This patch changes the sanity checking from validating every CA
certificate to only checking the CA certificates which are part of the
chain of trust (issuer chain).  Other certificates are ignored.

Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
---
 crypto/tlscredsx509.c                 | 50 +++++++++++++++++++++++----
 tests/unit/test-crypto-tlscredsx509.c | 25 +++++++++++++-
 2 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index d061c68253..841f80aac6 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -315,6 +315,44 @@ qcrypto_tls_creds_check_cert(QCryptoTLSCredsX509 *creds,
     return 0;
 }
 
+static int
+qcrypto_tls_creds_check_authority_chain(QCryptoTLSCredsX509 *creds,
+                                        gnutls_x509_crt_t cert,
+                                        gnutls_x509_crt_t *cacerts,
+                                        unsigned int ncacerts,
+                                        const char *cacertFile,
+                                        bool isServer,
+                                        bool isCA,
+                                        Error **errp)
+{
+    gnutls_x509_crt_t *cert_to_check = &cert;
+    int checking_issuer = 1;
+    int retval = 0;
+
+    while (checking_issuer) {
+        checking_issuer = 0;
+
+        if (gnutls_x509_crt_check_issuer(*cert_to_check, *cert_to_check)) {
+            /* The cert is self-signed indicating we have reached the root of trust. */
+            return qcrypto_tls_creds_check_cert(creds, *cert_to_check, cacertFile,
+                                                isServer, isCA, errp);
+        }
+        for (int i = 0; i < ncacerts; i++) {
+            if (gnutls_x509_crt_check_issuer(*cert_to_check, cacerts[i])) {
+                retval = qcrypto_tls_creds_check_cert(creds, cacerts[i], cacertFile,
+                                                      isServer, isCA, errp);
+                if (retval < 0) {
+                    return retval;
+                }
+                cert_to_check = &cacerts[i];
+                checking_issuer = 1;
+                break;
+            }
+        }
+    }
+
+    return -1;
+}
 
 static int
 qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t cert,
@@ -500,12 +538,12 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
         goto cleanup;
     }
 
-    for (i = 0; i < ncacerts; i++) {
-        if (qcrypto_tls_creds_check_cert(creds,
-                                         cacerts[i], cacertFile,
-                                         isServer, true, errp) < 0) {
-            goto cleanup;
-        }
+    if (cert && 
+        qcrypto_tls_creds_check_authority_chain(creds, cert, 
+                                                cacerts, ncacerts,
+                                                cacertFile, isServer,
+                                                true, errp) < 0) {
+        goto cleanup;
     }
 
     if (cert && ncacerts &&
diff --git a/tests/unit/test-crypto-tlscredsx509.c b/tests/unit/test-crypto-tlscredsx509.c
index aab4149b56..e4d657ba61 100644
--- a/tests/unit/test-crypto-tlscredsx509.c
+++ b/tests/unit/test-crypto-tlscredsx509.c
@@ -589,6 +589,12 @@ int main(int argc, char **argv)
                  true, true, GNUTLS_KEY_KEY_CERT_SIGN,
                  false, false, NULL, NULL,
                  0, 0);
+    TLS_CERT_REQ(cacertlevel1creq_invalid, cacertrootreq,
+                 "UK", "qemu level 1c invalid", NULL, NULL, NULL, NULL,
+                 true, true, true,
+                 true, true, GNUTLS_KEY_KEY_CERT_SIGN,
+                 false, false, NULL, NULL,
+                 360, 400);
     TLS_CERT_REQ(cacertlevel2areq, cacertlevel1areq,
                  "UK", "qemu level 2a", NULL, NULL, NULL, NULL,
                  true, true, true,
@@ -617,16 +623,32 @@ int main(int argc, char **argv)
         cacertlevel2areq.crt,
     };
 
+
     test_tls_write_cert_chain(WORKDIR "cacertchain-ctx.pem",
                               certchain,
                               G_N_ELEMENTS(certchain));
 
+    gnutls_x509_crt_t certchain_with_invalid[] = {
+        cacertrootreq.crt,
+        cacertlevel1areq.crt,
+        cacertlevel1breq.crt,
+        cacertlevel1creq_invalid.crt,
+        cacertlevel2areq.crt,
+    };
+
+    test_tls_write_cert_chain(WORKDIR "cacertchain-with-invalid-ctx.pem",
+                              certchain_with_invalid,
+                              G_N_ELEMENTS(certchain_with_invalid));
+
     TLS_TEST_REG(chain1, true,
                  WORKDIR "cacertchain-ctx.pem",
                  servercertlevel3areq.filename, false);
     TLS_TEST_REG(chain2, false,
                  WORKDIR "cacertchain-ctx.pem",
                  clientcertlevel2breq.filename, false);
+    TLS_TEST_REG(certchainwithexpiredcert, false,
+                 WORKDIR "cacertchain-with-invalid-ctx.pem",
+                 clientcertlevel2breq.filename, false);
 
     /* Some missing certs - first two are fatal, the last
      * is ok
@@ -640,7 +662,6 @@ int main(int argc, char **argv)
     TLS_TEST_REG(missingclient, false,
                  cacert1req.filename,
                  "clientcertdoesnotexist.pem", false);
-
     ret = g_test_run();
 
     test_tls_discard_cert(&cacertreq);
@@ -694,10 +715,12 @@ int main(int argc, char **argv)
     test_tls_discard_cert(&cacertrootreq);
     test_tls_discard_cert(&cacertlevel1areq);
     test_tls_discard_cert(&cacertlevel1breq);
+    test_tls_discard_cert(&cacertlevel1creq_invalid);
     test_tls_discard_cert(&cacertlevel2areq);
     test_tls_discard_cert(&servercertlevel3areq);
     test_tls_discard_cert(&clientcertlevel2breq);
     unlink(WORKDIR "cacertchain-ctx.pem");
+    unlink(WORKDIR "cacertchain-with-invalid-ctx.pem");
 
     test_tls_cleanup(KEYFILE);
     rmdir(WORKDIR);
-- 
2.34.1


