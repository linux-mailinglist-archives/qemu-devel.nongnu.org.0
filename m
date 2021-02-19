Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCB31FEF5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:49:50 +0100 (CET)
Received: from localhost ([::1]:48094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDAqb-0002DK-AP
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lDAnB-00075O-GO
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:46:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lDAn8-0007e7-P3
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613760373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQ/foB9uBR0CA11WeN72PR/8jMINUpIXOzJt4AZvhbk=;
 b=NCkblzWfJv+Ujgr6/ix8YH2uGUYr43lSKMXcRKfnpzaRahDx2uUAu2nWBYEAN35nUIBib/
 m2daw3J0uvcUDhdrF7u6PHFVuDL9fK010aDbFSkG4Dy5r31tDhFZh/y87TYsoldCwIxvzQ
 BMLdSIC53dYB2Zm8RIEGa3E7ZoVYB0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-BM_tW3-TN6eNnZfT7nDMHw-1; Fri, 19 Feb 2021 13:46:12 -0500
X-MC-Unique: BM_tW3-TN6eNnZfT7nDMHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13E18C292
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 18:46:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-33.ams2.redhat.com
 [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 742FA1970A;
 Fri, 19 Feb 2021 18:46:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] ui: introduce "password-secret" option for SPICE server
Date: Fri, 19 Feb 2021 18:45:54 +0000
Message-Id: <20210219184556.154972-3-berrange@redhat.com>
In-Reply-To: <20210219184556.154972-1-berrange@redhat.com>
References: <20210219184556.154972-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
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
 qemu-options.hx |  8 ++++++--
 ui/spice-core.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 893d0f500b..ff4ef3b708 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1898,7 +1898,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "       [,tls-ciphers=<list>]\n"
     "       [,tls-channel=[main|display|cursor|inputs|record|playback]]\n"
     "       [,plaintext-channel=[main|display|cursor|inputs|record|playback]]\n"
-    "       [,sasl][,password=<secret>][,disable-ticketing]\n"
+    "       [,sasl][,password=<string>][,password-secret=<secret-id>][,disable-ticketing]\n"
     "       [,image-compression=[auto_glz|auto_lz|quic|glz|lz|off]]\n"
     "       [,jpeg-wan-compression=[auto|never|always]]\n"
     "       [,zlib-glz-wan-compression=[auto|never|always]]\n"
@@ -1923,9 +1923,13 @@ SRST
     ``ipv4``; \ ``ipv6``; \ ``unix``
         Force using the specified IP version.
 
-    ``password=<secret>``
+    ``password=<string>``
         Set the password you need to authenticate.
 
+    ``password-secret=<secret-id>``
+        Set the ID of the ``secret`` object containing the password
+        you need to authenticate.
+
     ``sasl``
         Require that the client use SASL to authenticate with the spice.
         The exact choice of authentication method used is controlled
diff --git a/ui/spice-core.c b/ui/spice-core.c
index beee932f55..353848b244 100644
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
@@ -663,7 +669,24 @@ static void qemu_spice_init(void)
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
+        password = g_strdup(str);
+    }
 
     if (tls_port) {
         x509_dir = qemu_opt_get(opts, "x509-dir");
@@ -809,6 +832,7 @@ static void qemu_spice_init(void)
     g_free(x509_key_file);
     g_free(x509_cert_file);
     g_free(x509_cacert_file);
+    g_free(password);
 
 #ifdef HAVE_SPICE_GL
     if (qemu_opt_get_bool(opts, "gl", 0)) {
-- 
2.29.2


