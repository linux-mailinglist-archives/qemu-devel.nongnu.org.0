Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA631FEF3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:48:21 +0100 (CET)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDApA-0008RE-Iy
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lDAnA-00074y-Qe
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:46:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lDAn6-0007di-Ek
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613760371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtXOAq6it1BcF5yzBIOic/BpRKe8WNEUHKw406Fxt4M=;
 b=N9TQfItHx8+Q6c2SIdLYmuAADr7ghmFsTkns8iKIo8Bsxw67lufCJRdx1aEiwePqByvArN
 OU5k8pKtJBpf2QChcYvyQaDfpM1z+4gfeqXdMhU7uFn7GGx3QnlP0NRyIS+IS6BnYxmBHh
 qtUjf/TDW5dor7MdKqruuG94z/t35qU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-_rWxJG7BNd6avcGKF56-Qw-1; Fri, 19 Feb 2021 13:46:09 -0500
X-MC-Unique: _rWxJG7BNd6avcGKF56-Qw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD23D804023
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 18:46:08 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-33.ams2.redhat.com
 [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B087019D9B;
 Fri, 19 Feb 2021 18:46:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] ui: introduce "password-secret" option for VNC servers
Date: Fri, 19 Feb 2021 18:45:53 +0000
Message-Id: <20210219184556.154972-2-berrange@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
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
index 6c34c7050f..893d0f500b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2164,6 +2164,11 @@ SRST
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
index 16bb3be770..77e07ac351 100644
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
@@ -3469,6 +3470,9 @@ static QemuOptsList qemu_vnc_opts = {
         },{
             .name = "password",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "password-secret",
+            .type = QEMU_OPT_STRING,
         },{
             .name = "reverse",
             .type = QEMU_OPT_BOOL,
@@ -3941,6 +3945,7 @@ void vnc_display_open(const char *id, Error **errp)
     int lock_key_sync = 1;
     int key_delay_ms;
     const char *audiodev;
+    const char *passwordSecret;
 
     if (!vd) {
         error_setg(errp, "VNC display not active");
@@ -3958,7 +3963,23 @@ void vnc_display_open(const char *id, Error **errp)
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


