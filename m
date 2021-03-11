Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF9B3371A9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:48:34 +0100 (CET)
Received: from localhost ([::1]:41306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJnt-0001kh-7a
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJjT-0005nP-Su
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:43:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJjS-0008UT-5p
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615463037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HyNnSGpWs1YcGmInWKR02o8cm01G1i69aVtutTTDYHY=;
 b=FUPfQoVarGWOF8LZmekO5FzWB9kKF0XjbdBDL+htQGYDIYNwu2Xwgy3LZHEues7K2YWBeq
 7Jvsq9EBzlVV8UQElxMdP+BklR03NM36zP7v+6cOsTmkJihsZAj71HlsmJBatuYYWvC+7C
 SJbNuhq9SGrxo+FpS9LjNcjGhxBFb5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-a-3abJU0MmiPyXOfHEIdkA-1; Thu, 11 Mar 2021 06:43:55 -0500
X-MC-Unique: a-3abJU0MmiPyXOfHEIdkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92175363A1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:43:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-85.ams2.redhat.com
 [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3E6060853;
 Thu, 11 Mar 2021 11:43:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] ui: introduce "password-secret" option for VNC servers
Date: Thu, 11 Mar 2021 11:43:41 +0000
Message-Id: <20210311114343.439820-2-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently when using VNC the "password" flag turns on password based
authentication. The actual password has to be provided separately via
the monitor.

This introduces a "password-secret" option which lets the password be
provided up front.

  $QEMU --object secret,id=vncsec0,file=passwd.txt \
        --vnc localhost:0,password-secret=vncsec0

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx |  5 +++++
 ui/vnc.c        | 23 ++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 90801286c6..722d56eab3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2165,6 +2165,11 @@ SRST
         time to allow <protocol> password to expire immediately or never
         expire.
 
+    ``password-secret=<secret-id>``
+        Require that password based authentication is used for client
+        connections, using the password provided by the ``secret``
+        object identified by ``secret-id``.
+
     ``tls-creds=ID``
         Provides the ID of a set of TLS credentials to use to secure the
         VNC server. They will apply to both the normal VNC server socket
diff --git a/ui/vnc.c b/ui/vnc.c
index 310abc9378..e8e3426a65 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -48,6 +48,7 @@
 #include "crypto/tlscredsanon.h"
 #include "crypto/tlscredsx509.h"
 #include "crypto/random.h"
+#include "crypto/secret_common.h"
 #include "qom/object_interfaces.h"
 #include "qemu/cutils.h"
 #include "qemu/help_option.h"
@@ -3459,6 +3460,9 @@ static QemuOptsList qemu_vnc_opts = {
         },{
             .name = "password",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "password-secret",
+            .type = QEMU_OPT_STRING,
         },{
             .name = "reverse",
             .type = QEMU_OPT_BOOL,
@@ -3931,6 +3935,7 @@ void vnc_display_open(const char *id, Error **errp)
     int lock_key_sync = 1;
     int key_delay_ms;
     const char *audiodev;
+    const char *passwordSecret;
 
     if (!vd) {
         error_setg(errp, "VNC display not active");
@@ -3948,7 +3953,23 @@ void vnc_display_open(const char *id, Error **errp)
         goto fail;
     }
 
-    password = qemu_opt_get_bool(opts, "password", false);
+
+    passwordSecret = qemu_opt_get(opts, "password-secret");
+    if (passwordSecret) {
+        if (qemu_opt_get(opts, "password")) {
+            error_setg(errp,
+                       "'password' flag is redundant with 'password-secret'");
+            goto fail;
+        }
+        vd->password = qcrypto_secret_lookup_as_utf8(passwordSecret,
+                                                     errp);
+        if (!vd->password) {
+            goto fail;
+        }
+        password = true;
+    } else {
+        password = qemu_opt_get_bool(opts, "password", false);
+    }
     if (password) {
         if (fips_get_state()) {
             error_setg(errp,
-- 
2.29.2


