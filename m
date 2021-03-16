Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96433CD73
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 06:44:22 +0100 (CET)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM2VB-00035l-9U
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 01:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2Pj-0006Fg-UH
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PZ-0004nc-HB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615873112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtFvwJ2Uusl4aWYl7AJp9/hgsHYUPRXKIIANJX76L+c=;
 b=Kj48ieYmYi2nYvFMaCfmtczsgEaTfy9LFJ6RF07qSJbYl5jyTUdAWS4ODuA6VaUYJIY7qm
 bVTPU027y5S0I7vJiURx4mxH4keNb4KjEKJVzkNHpdQoYjUGFiE0RnRJXa3XSctqyi6/Oj
 wjn3SesxxKmRzAwMHb4arvLatnbR2C4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-SEbr59N7ODWDftHPueatGg-1; Tue, 16 Mar 2021 01:38:23 -0400
X-MC-Unique: SEbr59N7ODWDftHPueatGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21DA9100C619;
 Tue, 16 Mar 2021 05:38:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C95E25B4BF;
 Tue, 16 Mar 2021 05:38:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2209A18000AE; Tue, 16 Mar 2021 06:38:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] ui: introduce "password-secret" option for VNC servers
Date: Tue, 16 Mar 2021 06:38:03 +0100
Message-Id: <20210316053813.1719442-2-kraxel@redhat.com>
In-Reply-To: <20210316053813.1719442-1-kraxel@redhat.com>
References: <20210316053813.1719442-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Currently when using VNC the "password" flag turns on password based
authentication. The actual password has to be provided separately via
the monitor.

This introduces a "password-secret" option which lets the password be
provided up front.

  $QEMU --object secret,id=vncsec0,file=passwd.txt \
        --vnc localhost:0,password-secret=vncsec0

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210311114343.439820-2-berrange@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c        | 23 ++++++++++++++++++++++-
 qemu-options.hx |  5 +++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 310abc937812..e8e3426a65c4 100644
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
diff --git a/qemu-options.hx b/qemu-options.hx
index 622d3bfa5a7d..357fc4596ecc 100644
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
-- 
2.29.2


