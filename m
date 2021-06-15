Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C565D3A86E9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:53:41 +0200 (CEST)
Received: from localhost ([::1]:44820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCJo-0005sU-QX
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEn-0005BZ-1P
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEk-0003aT-Rm
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M472Jsj64cJ+peUQ7tuUXko4J1v5rGFmgGdmduX8ilQ=;
 b=BPKId9A4S5UwNFXMe4sVnRLggKg7u0EHF5gRiLolpzBstchn0JmzptLyJDO8N5q/RvDU8O
 In3hUyL05z+fvsNxopLFvgZTQCsv+SmUqLgjcoFh3xGrUH320TFdQ/qCR7ejpIvk88/d/s
 0axifDkD/NnJ7gcfMRMx0HMDKsUOa5M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-pQJrDKCTOQu13R9Mv9PPBA-1; Tue, 15 Jun 2021 12:48:24 -0400
X-MC-Unique: pQJrDKCTOQu13R9Mv9PPBA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s8-20020adff8080000b0290114e1eeb8c6so8853371wrp.23
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M472Jsj64cJ+peUQ7tuUXko4J1v5rGFmgGdmduX8ilQ=;
 b=AlB+ltep9dcG3now27m9/30MgUo86lhXXUBtkbUjlL2jLcPcWLiQoxAmqAqRGwdtTJ
 tebpjomS4kpJxVLLJkZSQ2wAZpZUgnf/Fi+gxJqywaWGWkpR3AwZxnql3kP2vKfepY8d
 FWeYFq+HDw5Kv/lZ+N+zl71gV8L53lKfe8Okz5PaQ7EKMkxhsQX+f+UsQZQX5IlaMzeY
 VX+yuy7WmCG6NM8f1wQAYabvMoUlJfA8Cfu/MutN8ZbFzKn8qS2b1qUOea+oN3sui+Nn
 gnCJEa/vu2K9wf4zcxqFmKM7cc+db2irCBV0l3gpKmcm2xPbq3+W5AvgDsicnyZyGb9d
 fTYQ==
X-Gm-Message-State: AOAM531C22xRhVZ6f17ikjCLc3ntIDAaZZVsG9Utd7cFHkp1Rhw0rPLq
 NRHsaGNNLnei4AUZlS7Eu8mmnfI3ioejCULgjqGrhyrbKm/6dLOV5aTuIGw+NQTvCt2VmGGcD52
 GQxAQ4JAMgZBxlf5ni1m1QZV0skcu8z8WC8ub3CGb1nEpjyDENGlHF7rWCIjOlLX3
X-Received: by 2002:a1c:7912:: with SMTP id l18mr196259wme.135.1623775703079; 
 Tue, 15 Jun 2021 09:48:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXai/Xjg7czV5SnWXKUoJ38Vq0i010qKWAo9xa3pu9gu46VGbniZHK0zxIHvvWDI+FvUs5Tw==
X-Received: by 2002:a1c:7912:: with SMTP id l18mr196231wme.135.1623775702833; 
 Tue, 15 Jun 2021 09:48:22 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g83sm1979864wma.10.2021.06.15.09.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:48:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] crypto: Make QCryptoTLSCreds* structures private
Date: Tue, 15 Jun 2021 18:47:51 +0200
Message-Id: <20210615164751.2192807-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615164751.2192807-1-philmd@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code consuming the "crypto/tlscreds*.h" APIs doesn't need
to access its internals. Move the structure definitions to
the implementations in crypto/. The headers still forward
declare the structures typedef.

This solves a bug introduced by commit 7de2e856533 which made
migration/qemu-file-channel.c include "io/channel-tls.h",
itself sometime depends on GNUTLS, leading to build failure
on OSX:

  [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel.c.o
  FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
  cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
  In file included from ../migration/qemu-file-channel.c:29:
  In file included from include/io/channel-tls.h:26:
  In file included from include/crypto/tlssession.h:24:
  include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
  #include <gnutls/gnutls.h>
           ^~~~~~~~~~~~~~~~~
  1 error generated.

Reported-by: Stefan Weil <sw@weilnetz.de>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 crypto/tlscredspriv.h         | 15 +++++++++++++++
 include/crypto/tlscreds.h     | 16 ----------------
 include/crypto/tlscredsanon.h | 12 ------------
 include/crypto/tlscredspsk.h  | 12 ------------
 include/crypto/tlscredsx509.h | 10 ----------
 crypto/tlscredsanon.c         | 13 +++++++++++++
 crypto/tlscredspsk.c          | 14 ++++++++++++++
 crypto/tlscredsx509.c         | 16 +++++++++++++---
 8 files changed, 55 insertions(+), 53 deletions(-)

diff --git a/crypto/tlscredspriv.h b/crypto/tlscredspriv.h
index 39f1a91c413..67e76c24539 100644
--- a/crypto/tlscredspriv.h
+++ b/crypto/tlscredspriv.h
@@ -23,6 +23,21 @@
 
 #include "crypto/tlscreds.h"
 
+#ifdef CONFIG_GNUTLS
+#include <gnutls/gnutls.h>
+#endif
+
+struct QCryptoTLSCreds {
+    Object parent_obj;
+    char *dir;
+    QCryptoTLSCredsEndpoint endpoint;
+#ifdef CONFIG_GNUTLS
+    gnutls_dh_params_t dh_params;
+#endif
+    bool verifyPeer;
+    char *priority;
+};
+
 #ifdef CONFIG_GNUTLS
 
 int qcrypto_tls_creds_get_path(QCryptoTLSCreds *creds,
diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index eb9d5e75a84..bb3f2e4f303 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -24,10 +24,6 @@
 #include "qapi/qapi-types-crypto.h"
 #include "qom/object.h"
 
-#ifdef CONFIG_GNUTLS
-#include <gnutls/gnutls.h>
-#endif
-
 #define TYPE_QCRYPTO_TLS_CREDS "tls-creds"
 typedef struct QCryptoTLSCreds QCryptoTLSCreds;
 typedef struct QCryptoTLSCredsClass QCryptoTLSCredsClass;
@@ -48,18 +44,6 @@ typedef bool (*CryptoTLSCredsReload)(QCryptoTLSCreds *, Error **);
  * certificate credentials.
  */
 
-struct QCryptoTLSCreds {
-    Object parent_obj;
-    char *dir;
-    QCryptoTLSCredsEndpoint endpoint;
-#ifdef CONFIG_GNUTLS
-    gnutls_dh_params_t dh_params;
-#endif
-    bool verifyPeer;
-    char *priority;
-};
-
-
 struct QCryptoTLSCredsClass {
     ObjectClass parent_class;
     CryptoTLSCredsReload reload;
diff --git a/include/crypto/tlscredsanon.h b/include/crypto/tlscredsanon.h
index 3f464a38095..bd3023f9ea7 100644
--- a/include/crypto/tlscredsanon.h
+++ b/include/crypto/tlscredsanon.h
@@ -92,18 +92,6 @@ typedef struct QCryptoTLSCredsAnonClass QCryptoTLSCredsAnonClass;
  *
  */
 
-
-struct QCryptoTLSCredsAnon {
-    QCryptoTLSCreds parent_obj;
-#ifdef CONFIG_GNUTLS
-    union {
-        gnutls_anon_server_credentials_t server;
-        gnutls_anon_client_credentials_t client;
-    } data;
-#endif
-};
-
-
 struct QCryptoTLSCredsAnonClass {
     QCryptoTLSCredsClass parent_class;
 };
diff --git a/include/crypto/tlscredspsk.h b/include/crypto/tlscredspsk.h
index d7e6bdb5edf..bcd07dc4f62 100644
--- a/include/crypto/tlscredspsk.h
+++ b/include/crypto/tlscredspsk.h
@@ -87,18 +87,6 @@ typedef struct QCryptoTLSCredsPSKClass QCryptoTLSCredsPSKClass;
  * The PSK file can be created and managed using psktool.
  */
 
-struct QCryptoTLSCredsPSK {
-    QCryptoTLSCreds parent_obj;
-    char *username;
-#ifdef CONFIG_GNUTLS
-    union {
-        gnutls_psk_server_credentials_t server;
-        gnutls_psk_client_credentials_t client;
-    } data;
-#endif
-};
-
-
 struct QCryptoTLSCredsPSKClass {
     QCryptoTLSCredsClass parent_class;
 };
diff --git a/include/crypto/tlscredsx509.h b/include/crypto/tlscredsx509.h
index c6d89b78819..c4daba21a6b 100644
--- a/include/crypto/tlscredsx509.h
+++ b/include/crypto/tlscredsx509.h
@@ -96,16 +96,6 @@ typedef struct QCryptoTLSCredsX509Class QCryptoTLSCredsX509Class;
  *
  */
 
-struct QCryptoTLSCredsX509 {
-    QCryptoTLSCreds parent_obj;
-#ifdef CONFIG_GNUTLS
-    gnutls_certificate_credentials_t data;
-#endif
-    bool sanityCheck;
-    char *passwordid;
-};
-
-
 struct QCryptoTLSCredsX509Class {
     QCryptoTLSCredsClass parent_class;
 };
diff --git a/crypto/tlscredsanon.c b/crypto/tlscredsanon.c
index bea5f76c55d..e7f74061ae2 100644
--- a/crypto/tlscredsanon.c
+++ b/crypto/tlscredsanon.c
@@ -26,6 +26,19 @@
 #include "qom/object_interfaces.h"
 #include "trace.h"
 
+#ifdef CONFIG_GNUTLS
+#include <gnutls/gnutls.h>
+#endif
+
+struct QCryptoTLSCredsAnon {
+    QCryptoTLSCreds parent_obj;
+#ifdef CONFIG_GNUTLS
+    union {
+        gnutls_anon_server_credentials_t server;
+        gnutls_anon_client_credentials_t client;
+    } data;
+#endif
+};
 
 #ifdef CONFIG_GNUTLS
 
diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
index f5a31108d15..b4053741b3b 100644
--- a/crypto/tlscredspsk.c
+++ b/crypto/tlscredspsk.c
@@ -26,6 +26,20 @@
 #include "qom/object_interfaces.h"
 #include "trace.h"
 
+#ifdef CONFIG_GNUTLS
+#include <gnutls/gnutls.h>
+#endif
+
+struct QCryptoTLSCredsPSK {
+    QCryptoTLSCreds parent_obj;
+    char *username;
+#ifdef CONFIG_GNUTLS
+    union {
+        gnutls_psk_server_credentials_t server;
+        gnutls_psk_client_credentials_t client;
+    } data;
+#endif
+};
 
 #ifdef CONFIG_GNUTLS
 
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index d9d6f4421e5..0a8284f930b 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -27,12 +27,22 @@
 #include "qom/object_interfaces.h"
 #include "trace.h"
 
+#ifdef CONFIG_GNUTLS
+#include <gnutls/gnutls.h>
+#include <gnutls/x509.h>
+#endif
+
+struct QCryptoTLSCredsX509 {
+    QCryptoTLSCreds parent_obj;
+#ifdef CONFIG_GNUTLS
+    gnutls_certificate_credentials_t data;
+#endif
+    bool sanityCheck;
+    char *passwordid;
+};
 
 #ifdef CONFIG_GNUTLS
 
-#include <gnutls/x509.h>
-
-
 static int
 qcrypto_tls_creds_check_cert_times(gnutls_x509_crt_t cert,
                                    const char *certFile,
-- 
2.31.1


