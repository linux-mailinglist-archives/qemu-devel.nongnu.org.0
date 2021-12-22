Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E647D41B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 16:08:20 +0100 (CET)
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n03E2-0001GS-ST
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 10:08:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <henry.kleynhans@gmail.com>)
 id 1n03Bw-0008C6-Tc
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:06:09 -0500
Received: from [2a00:1450:4864:20::329] (port=34779
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <henry.kleynhans@gmail.com>)
 id 1n03Bv-0000Uy-E8
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:06:08 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so2395404wmb.1
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 07:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j/geLIPqlMB2Ob3Njlqvm8gz4tBT0k29rmT561CyZD8=;
 b=TqN5cbUzGrCSDjT989H3yNKLAZnql2ArUKceUiT6plB1+csYkVty4+Fr5aE1te2UpH
 AjavejDbouQcpfs4+s+9W3S9zsfCvxlOo2y29TLJFnWUX1uZTomI3m18B8qFXpTiF65T
 +/ABDwPEi7gFKQzhocM8fOAbId8GhR9R8pDRpPndcVMvm0E899EsK2Sua+OJYa3Nx4sr
 T7OwQUqtF6HyEl5l7yUHJTbOXj85lutS9ZL9wPG7CHnf7ovqLAVGkBF3Xn6ogFol5BxL
 zYZn0HjhsK/SUWaMAxDnKT+yBOyEgiP/ZOsqsc8VCuFTjG34LRPG7j3HuqUV/KcBudTs
 uD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j/geLIPqlMB2Ob3Njlqvm8gz4tBT0k29rmT561CyZD8=;
 b=cuXFBkmNmtV5bizZCI5b7KtBdA4T2Xncv3V9c33JZ98E77F3gkIgXcheLL66BWZHct
 tO1yajPc5cQTO4pB2QnQ0lrFJc8p1nRcmMfPm0M+O18ELDlWq/Yf+M3FCzCsOz0hJpyR
 MueestkhsuPwtoEkDnf4UeFZxExeNUGdobMe1XJKQ6+RPW2MrfbepFuV39WHfVcLNkSL
 btbn37vtlH0UZhD3AygjPj7kp9yktc7JO3f2rqciXzUECZ7hlwKisboiTJC26DhT7GHi
 e3OFvwevCnZfTo5SdTqnLpaUXcCdhaYzDwRaGqQXidEfbPOKg4+vtQ9hf66Q58RTmTG8
 igoA==
X-Gm-Message-State: AOAM533+pOO2dzgKlWtMPwnLaCQvIi/wPLQs3F0D9F7ujvUSqSsLHoDL
 h82NQ9lBVQjwbPwBRcPg2cXzlYPX/eftmty3
X-Google-Smtp-Source: ABdhPJx0wSyn0gIfSPSgS7ZuSodwz7m/PbogxJjyXh6sSlssjhMarjRURfAbO79yuSR216sLVVD5fw==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr1188910wme.181.1640185564918; 
 Wed, 22 Dec 2021 07:06:04 -0800 (PST)
Received: from localhost ([2620:10d:c092:400::4:79fd])
 by smtp.gmail.com with ESMTPSA id bg12sm2550497wmb.5.2021.12.22.07.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 07:06:04 -0800 (PST)
From: Henry Kleynhans <henry.kleynhans@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] [crypto] Load all certificates in X509 CA file
Date: Wed, 22 Dec 2021 15:05:59 +0000
Message-Id: <20211222150600.37677-1-henry.kleynhans@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=henry.kleynhans@gmail.com; helo=mail-wm1-x329.google.com
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

Some CA files may contain multiple intermediaries and roots of trust.
These may not fit into the hard-coded limit of 16.

Extend the validation code to allocate enough space to load all of the
certificates present in the CA file and ensure they are cleaned up.

Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
---
 crypto/tlscredsx509.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index 32948a6bdc..d061c68253 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -426,9 +426,8 @@ qcrypto_tls_creds_load_cert(QCryptoTLSCredsX509 *creds,
 static int
 qcrypto_tls_creds_load_ca_cert_list(QCryptoTLSCredsX509 *creds,
                                     const char *certFile,
-                                    gnutls_x509_crt_t *certs,
-                                    unsigned int certMax,
-                                    size_t *ncerts,
+                                    gnutls_x509_crt_t **certs,
+                                    unsigned int *ncerts,
                                     Error **errp)
 {
     gnutls_datum_t data;
@@ -449,14 +448,13 @@ qcrypto_tls_creds_load_ca_cert_list(QCryptoTLSCredsX509 *creds,
     data.data = (unsigned char *)buf;
     data.size = strlen(buf);
 
-    if (gnutls_x509_crt_list_import(certs, &certMax, &data,
+    if (gnutls_x509_crt_list_import2(certs, ncerts, &data,
                                     GNUTLS_X509_FMT_PEM, 0) < 0) {
         error_setg(errp,
                    "Unable to import CA certificate list %s",
                    certFile);
         return -1;
     }
-    *ncerts = certMax;
 
     return 0;
 }
@@ -471,12 +469,11 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
                                     Error **errp)
 {
     gnutls_x509_crt_t cert = NULL;
-    gnutls_x509_crt_t cacerts[MAX_CERTS];
-    size_t ncacerts = 0;
+    gnutls_x509_crt_t *cacerts = NULL;
+    unsigned int ncacerts = 0;
     size_t i;
     int ret = -1;
 
-    memset(cacerts, 0, sizeof(cacerts));
     if (certFile &&
         access(certFile, R_OK) == 0) {
         cert = qcrypto_tls_creds_load_cert(creds,
@@ -488,8 +485,9 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
     }
     if (access(cacertFile, R_OK) == 0) {
         if (qcrypto_tls_creds_load_ca_cert_list(creds,
-                                                cacertFile, cacerts,
-                                                MAX_CERTS, &ncacerts,
+                                                cacertFile,
+                                                &cacerts,
+                                                &ncacerts,
                                                 errp) < 0) {
             goto cleanup;
         }
@@ -526,6 +524,8 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
     for (i = 0; i < ncacerts; i++) {
         gnutls_x509_crt_deinit(cacerts[i]);
     }
+    gnutls_free(cacerts);
+
     return ret;
 }
 
-- 
2.34.1


