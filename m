Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2663ED86
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ggG-0004Em-45; Thu, 01 Dec 2022 05:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0gfp-0004AD-Nq
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:20:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0gfm-000701-Hk
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669890005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Kn+tNmmscq5cwH/JccS5h+jn40kG1PqnRKxOuC5oGU=;
 b=Lc7vcx5akkJNCGLwARk0VQ56J7ExhKfW1Rj8sTs3r+zSG0hJmPGyBIZdEEud3VSLL0xfVq
 Fq7whVdoHATX1KMn4KltJVkJqsKAhn6BtNp0kE8c7T0l1htgcHfQrbjNU8eJAm9PGzTe7F
 4SSVbPrM0pyfnX1oeJjRsFDBJZ+mQJ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-LDSq-kSNON-UmCbx8MyRDw-1; Thu, 01 Dec 2022 05:20:02 -0500
X-MC-Unique: LDSq-kSNON-UmCbx8MyRDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECF9A381A720;
 Thu,  1 Dec 2022 10:20:01 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F8C52166B49;
 Thu,  1 Dec 2022 10:20:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, libvir-list@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/3] ui: remove deprecated 'password' option for SPICE
Date: Thu,  1 Dec 2022 05:19:59 -0500
Message-Id: <20221201101959.419545-4-berrange@redhat.com>
In-Reply-To: <20221201101959.419545-1-berrange@redhat.com>
References: <20221201101959.419545-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This has been replaced by the 'password-secret' option,
which references a 'secret' object instance.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/about/deprecated.rst       |  8 --------
 docs/about/removed-features.rst |  7 +++++++
 qemu-options.hx                 |  9 +--------
 ui/spice-core.c                 | 15 ---------------
 4 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2cc8924fe9..ee4301f96d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -73,14 +73,6 @@ Input parameters that take a size value should only use a size suffix
 the value is hexadecimal.  That is, '0x20M' is deprecated, and should
 be written either as '32M' or as '0x2000000'.
 
-``-spice password=string`` (since 6.0)
-''''''''''''''''''''''''''''''''''''''
-
-This option is insecure because the SPICE password remains visible in
-the process listing. This is replaced by the new ``password-secret``
-option which lets the password be securely provided on the command
-line using a ``secret`` object instance.
-
 ``-smp`` ("parameter=0" SMP configurations) (since 6.2)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 63df9848fd..e04e095320 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -408,6 +408,13 @@ pcspk-audiodev=<name>``.
 
 Use ``-device`` instead.
 
+``-spice password=string`` (removed in 8.0)
+'''''''''''''''''''''''''''''''''''''''''''
+
+This option is insecure because the SPICE password remains visible in
+the process listing. This is replaced by the new ``password-secret``
+option which lets the password be securely provided on the command
+line using a ``secret`` object instance.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index 055df73306..8a326f4dbb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2132,7 +2132,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "       [,tls-channel=[main|display|cursor|inputs|record|playback]]\n"
     "       [,plaintext-channel=[main|display|cursor|inputs|record|playback]]\n"
     "       [,sasl=on|off][,disable-ticketing=on|off]\n"
-    "       [,password=<string>][,password-secret=<secret-id>]\n"
+    "       [,password-secret=<secret-id>]\n"
     "       [,image-compression=[auto_glz|auto_lz|quic|glz|lz|off]]\n"
     "       [,jpeg-wan-compression=[auto|never|always]]\n"
     "       [,zlib-glz-wan-compression=[auto|never|always]]\n"
@@ -2158,13 +2158,6 @@ SRST
     ``ipv4=on|off``; \ ``ipv6=on|off``; \ ``unix=on|off``
         Force using the specified IP version.
 
-    ``password=<string>``
-        Set the password you need to authenticate.
-
-        This option is deprecated and insecure because it leaves the
-        password visible in the process listing. Use ``password-secret``
-        instead.
-
     ``password-secret=<secret-id>``
         Set the ID of the ``secret`` object containing the password
         you need to authenticate.
diff --git a/ui/spice-core.c b/ui/spice-core.c
index c3ac20ad43..15fba68e31 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -413,9 +413,6 @@ static QemuOptsList qemu_spice_opts = {
             .name = "unix",
             .type = QEMU_OPT_BOOL,
 #endif
-        },{
-            .name = "password",
-            .type = QEMU_OPT_STRING,
         },{
             .name = "password-secret",
             .type = QEMU_OPT_STRING,
@@ -671,20 +668,8 @@ static void qemu_spice_init(void)
     }
     passwordSecret = qemu_opt_get(opts, "password-secret");
     if (passwordSecret) {
-        if (qemu_opt_get(opts, "password")) {
-            error_report("'password' option is mutually exclusive with "
-                         "'password-secret'");
-            exit(1);
-        }
         password = qcrypto_secret_lookup_as_utf8(passwordSecret,
                                                  &error_fatal);
-    } else {
-        str = qemu_opt_get(opts, "password");
-        if (str) {
-            warn_report("'password' option is deprecated and insecure, "
-                        "use 'password-secret' instead");
-            password = g_strdup(str);
-        }
     }
 
     if (tls_port) {
-- 
2.38.1


