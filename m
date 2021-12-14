Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AD4741B6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:42:25 +0100 (CET)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx6CO-00050b-3l
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:42:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <henry.kleynhans@gmail.com>)
 id 1mx69i-0003GZ-QE
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:39:38 -0500
Received: from [2a00:1450:4864:20::434] (port=34503
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <henry.kleynhans@gmail.com>)
 id 1mx69g-0003K7-LP
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:39:38 -0500
Received: by mail-wr1-x434.google.com with SMTP id j3so31925544wrp.1
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 03:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxMNyEkk2mkk/ZUMhz883bmGT7JS7AqG3wLOM5JwcLw=;
 b=A2MlkDVd4qCFpyT2+GhJ/tVLmqAxzB0ECeRpd7aOW8ZEA8Gwp2oMMlA1WdUFw/NMS4
 2UkRdGEI4q13x51tgbN7dBMGPFI918cXaiNr4JTxEiDE9C50vQXwZLQFyxjF9w851f2e
 PR6QdNZse5wJeC7bq9G0FXMKw6+/ywUOnUKByrwMp75RU4nasMpXMwXXPkqhOu+C4HAw
 hC+CaXkfZP7bBI+26W9QkQpVKSMrqUTOTYSan9Xy/B3nqEqD76MzPY73GbFi6M9s13Ct
 bt9Pbbv5TbiZKuqish+j0pOp1Uudg+bUuTMyE5pYB3M/7WADTJaWQ0+f40V1MxzNpQV3
 rSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxMNyEkk2mkk/ZUMhz883bmGT7JS7AqG3wLOM5JwcLw=;
 b=PbuuSsyml0m0Q0cXTSTGqPMPH7awZOxjBklZLS+1/qkMndrLV/a2V5CkpwaBFsd1Oh
 jei8WoavDTIwxhUQNGCw5ltr+kMdzVZ1gdvPuaFVRy9QwcdMcYKzErXFvDQJJ0dUkOsn
 aUoziL5Ru7ZE/Vp4sUk7T7eZP4ZOKMGDBFDyZZRCMfd0cqRuM1ZbJoLqF6t8KnEiuTze
 g+K4U6FI1DQK10KQCl87z+EvP+UN7vG9wsqo54u9Ltpm69xM9os/82PkHmXZsSiJgHs7
 mpyagHBPWATTEbJLe+iHs+nwxscuPJpndBI/OfRG12PYl/HpJW3/Q1iVnzD7fOnebkcN
 BZ/w==
X-Gm-Message-State: AOAM531smDLQ/tVu9LEokMHY6EetObK20FnIIiIS8Rt0ZBEnr2h/DsGZ
 l4beOJ09gL0otXPVHX7vZdBW62mqt0l7n/Si
X-Google-Smtp-Source: ABdhPJwvQWuCexAuRuG8R9/rTIngTMnLks0asQ4hvedN5uEiVsbbPPh2gYiSkGJqXX0s7EA4aCQM5g==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr5317322wrr.228.1639481974749; 
 Tue, 14 Dec 2021 03:39:34 -0800 (PST)
Received: from localhost ([2620:10d:c092:400::4:d4cf])
 by smtp.gmail.com with ESMTPSA id i3sm12438380wro.117.2021.12.14.03.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 03:39:34 -0800 (PST)
From: Henry Kleynhans <henry.kleynhans@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Relax X509 CA cert sanity checking
Date: Tue, 14 Dec 2021 11:39:30 +0000
Message-Id: <20211214113930.9205-1-henry.kleynhans@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=henry.kleynhans@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Henry Kleynhans <hkleynhans@fb.com>, henry.kleynhans@fb.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Henry Kleynhans <hkleynhans@fb.com>

The sanity checking function attempts to validate all the certificates
in the provided CA file.  These checks are performed on certificates
which may or may not be part of the signing chain and duplicates checks
that should be performed by the TLS library.

In real life this causes a problem if the certificate chain I want to
use is valid, but there exist another expired certificate in the CA
file.

This patch relaxes the sanity checks to only ensure we have at least one
valid certificate in the CA certificate file and leave the actual
validation to the TLS library.

Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
---
 crypto/tlscredsx509.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index 32948a6bdc..fb056f96a2 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -473,6 +473,7 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
     gnutls_x509_crt_t cert = NULL;
     gnutls_x509_crt_t cacerts[MAX_CERTS];
     size_t ncacerts = 0;
+    size_t nvalidca = 0;
     size_t i;
     int ret = -1;
 
@@ -505,11 +506,15 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
     for (i = 0; i < ncacerts; i++) {
         if (qcrypto_tls_creds_check_cert(creds,
                                          cacerts[i], cacertFile,
-                                         isServer, true, errp) < 0) {
-            goto cleanup;
+                                         isServer, true, errp) == 0) {
+            ++nvalidca;
         }
     }
 
+    if (nvalidca == 0) {
+        goto cleanup;
+    }
+
     if (cert && ncacerts &&
         qcrypto_tls_creds_check_cert_pair(cert, certFile, cacerts,
                                           ncacerts, cacertFile,
-- 
2.34.1


