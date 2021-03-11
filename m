Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E83371A5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:46:09 +0100 (CET)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJlY-0006qu-Vc
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJjV-0005r5-P3
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJjT-0008V9-VL
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615463038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGYE/U7BhfD8vIboF6hqHLC2OyL7kb/ES78ULF+IPBc=;
 b=ZLKx03E3o+DsLocDMVPmHmQbrfxcph2eKEoFgMicwcotAm+i5WcLG9GryabWLPkIk/2H/P
 DasMZQXFJ5YQNt/SfEdGs4j54t7L/Su/HHRzvKU9Op4ztUFd9pcBjVDt157YFZIo+lsO44
 5iMvmZApHd++2VMmuZxnXGJpYRj7afc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-9hfn355oMYqV45wKKw46Zw-1; Thu, 11 Mar 2021 06:43:57 -0500
X-MC-Unique: 9hfn355oMYqV45wKKw46Zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A1D8801817
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:43:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-85.ams2.redhat.com
 [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4B4260853;
 Thu, 11 Mar 2021 11:43:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] ui: introduce "password-secret" option for SPICE server
Date: Thu, 11 Mar 2021 11:43:42 +0000
Message-Id: <20210311114343.439820-3-berrange@redhat.com>
In-Reply-To: <20210311114343.439820-1-berrange@redhat.com>
References: <20210311114343.439820-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently when using SPICE the "password" option provides the password
in plain text on the command line. This is insecure as it is visible
to all processes on the host. As an alternative, the password can be
provided separately via the monitor.

This introduces a "password-secret" option which lets the password be
provided up front.

  $QEMU --object secret,id=vncsec0,file=passwd.txt \
        --spice port=5901,password-secret=vncsec0

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx |  9 +++++++--
 ui/spice-core.c | 30 ++++++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 722d56eab3..77bb834e37 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1899,7 +1899,8 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "       [,tls-ciphers=<list>]\n"
     "       [,tls-channel=[main|display|cursor|inputs|record|playback]]\n"
     "       [,plaintext-channel=[main|display|cursor|inputs|record|playback]]\n"
-    "       [,sasl=on|off][,password=<secret>][,disable-ticketing=on|off]\n"
+    "       [,sasl=on|off][,disable-ticketing=on|off]\n"
+    "       [,password=<string>][,password-secret=<secret-id>]\n"
     "       [,image-compression=[auto_glz|auto_lz|quic|glz|lz|off]]\n"
     "       [,jpeg-wan-compression=[auto|never|always]]\n"
     "       [,zlib-glz-wan-compression=[auto|never|always]]\n"
@@ -1924,9 +1925,13 @@ SRST
     ``ipv4=on|off``; \ ``ipv6=on|off``; \ ``unix=on|off``
         Force using the specified IP version.
 
-    ``password=<secret>``
+    ``password=<string>``
         Set the password you need to authenticate.
 
+    ``password-secret=<secret-id>``
+        Set the ID of the ``secret`` object containing the password
+        you need to authenticate.
+
     ``sasl=on|off``
         Require that the client use SASL to authenticate with the spice.
         The exact choice of authentication method used is controlled
diff --git a/ui/spice-core.c b/ui/spice-core.c
index beee932f55..7f0e005ca9 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -34,6 +34,7 @@
 #include "qapi/qapi-events-ui.h"
 #include "qemu/notify.h"
 #include "qemu/option.h"
+#include "crypto/secret_common.h"
 #include "migration/misc.h"
 #include "hw/pci/pci_bus.h"
 #include "ui/spice-display.h"
@@ -415,6 +416,9 @@ static QemuOptsList qemu_spice_opts = {
         },{
             .name = "password",
             .type = QEMU_OPT_STRING,
+        },{
+            .name = "password-secret",
+            .type = QEMU_OPT_STRING,
         },{
             .name = "disable-ticketing",
             .type = QEMU_OPT_BOOL,
@@ -636,7 +640,9 @@ void qemu_spice_display_init_done(void)
 static void qemu_spice_init(void)
 {
     QemuOpts *opts = QTAILQ_FIRST(&qemu_spice_opts.head);
-    const char *password, *str, *x509_dir, *addr,
+    char *password = NULL;
+    const char *passwordSecret;
+    const char *str, *x509_dir, *addr,
         *x509_key_password = NULL,
         *x509_dh_file = NULL,
         *tls_ciphers = NULL;
@@ -663,7 +669,26 @@ static void qemu_spice_init(void)
         error_report("spice tls-port is out of range");
         exit(1);
     }
-    password = qemu_opt_get(opts, "password");
+    passwordSecret = qemu_opt_get(opts, "password-secret");
+    if (passwordSecret) {
+        Error *local_err = NULL;
+        if (qemu_opt_get(opts, "password")) {
+            error_report("'password' option is mutually exclusive with "
+                         "'password-secret'");
+            exit(1);
+        }
+        password = qcrypto_secret_lookup_as_utf8(passwordSecret,
+                                                 &local_err);
+        if (!password) {
+            error_report_err(local_err);
+            exit(1);
+        }
+    } else {
+        str = qemu_opt_get(opts, "password");
+        if (str) {
+            password = g_strdup(str);
+        }
+    }
 
     if (tls_port) {
         x509_dir = qemu_opt_get(opts, "x509-dir");
@@ -809,6 +834,7 @@ static void qemu_spice_init(void)
     g_free(x509_key_file);
     g_free(x509_cert_file);
     g_free(x509_cacert_file);
+    g_free(password);
 
 #ifdef HAVE_SPICE_GL
     if (qemu_opt_get_bool(opts, "gl", 0)) {
-- 
2.29.2


