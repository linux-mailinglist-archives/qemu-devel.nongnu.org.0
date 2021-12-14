Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C944C4745E4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:05:20 +0100 (CET)
Received: from localhost ([::1]:53384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9Mk-0006Wc-V1
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:05:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <henry.kleynhans@gmail.com>)
 id 1mx4fH-0003o9-70
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:04:07 -0500
Received: from [2a00:1450:4864:20::434] (port=44929
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <henry.kleynhans@gmail.com>)
 id 1mx4fF-0007tC-9m
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:04:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id t18so31385437wrg.11
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxMNyEkk2mkk/ZUMhz883bmGT7JS7AqG3wLOM5JwcLw=;
 b=jJTg11i9WsUtgQCWmiwWAMc1+i28XjWb0U+FPjiGhsRLJq24CYnRI8W9LSuRHb1VRm
 RdAIRZNU7PwdHzGzHbUchT0FFYmwf7tzA8da2ZG+nH/m5o6GANVT1UuYu1d5dpoEV7lZ
 nfma5sJCk3VJPk9elg2vRG9xfuOz35/VJqvfOp5MgVQ28coElCeiLlkOsyzrFMVShooz
 KWrTdGW3SIiPAQm3qw3odyW6qEbu25WYg5ZZN0DR/BpkY7ozEN9gkJ/o2giYqBCgpbfw
 BhiGy3i6hRIsXA+63fhw4eAsriYXF8ZIo0Ma5AamOWYiE1Co/oW3Li4QadkK1TcoWiQ+
 NjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxMNyEkk2mkk/ZUMhz883bmGT7JS7AqG3wLOM5JwcLw=;
 b=M6p//t6KrnXryOI6r2QooxTgYTHL3Jmt8+zSPmXhUQk8YjGow/q+6gHLBmaKZcetLy
 0dq+wBnq+8vhmXRr9S7w8I7B5IO3SK2KfKB/y2G5q/Jo37H4LwIN9b+hYgOrmIqSbajK
 uVwq3ET+XWD9LopOb1eaEGbiG3Cna0r0HeGBZ5YMv2csfF6ZyUmN8MCFpjLphIIf6uJE
 2R4t6l8GujeK4UZxzKBUscgSzFsIhakutDJZlpbm/Sma615XTafQmDH142suYe6MTnk9
 L1V7VRjvrWy+HYn1cyl7KR6nVrqDxcqIQBrduvfSrOexYi738SuycQnl9ZKdazIgp0aS
 rKVg==
X-Gm-Message-State: AOAM530wAOpCClKwZ4v5kZ6ixDj3Bdie3ozG4ehEIJLs72Ib1UTaNjD7
 YtwjneCQkFdb1Cn7Evnkti49lEVtWVT5hZox
X-Google-Smtp-Source: ABdhPJzpz3+Yt5rGEs5JKgZNCpR7+Sg9J0tgYmlbNrjzgr259k5nEqZ8f8OrNXw5BW88ddrQzLgbQA==
X-Received: by 2002:adf:8b19:: with SMTP id n25mr759586wra.619.1639476241985; 
 Tue, 14 Dec 2021 02:04:01 -0800 (PST)
Received: from localhost ([2620:10d:c092:400::4:d4cf])
 by smtp.gmail.com with ESMTPSA id f6sm332549wri.12.2021.12.14.02.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 02:04:01 -0800 (PST)
From: Henry Kleynhans <henry.kleynhans@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Relax X509 CA cert sanity checking
Date: Tue, 14 Dec 2021 10:03:42 +0000
Message-Id: <20211214100342.97856-1-henry.kleynhans@gmail.com>
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
X-Mailman-Approved-At: Tue, 14 Dec 2021 09:54:44 -0500
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


