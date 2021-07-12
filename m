Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F03C5DC1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:50:37 +0200 (CEST)
Received: from localhost ([::1]:56930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wKT-0007ky-1e
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vdR-0005hl-Gd
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vdP-0006no-2s
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626095165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmuK5nVz36ToUXC20zqmxc1O3b/QNe8AXnN8A50ZLWo=;
 b=LH/7sGoyTIYuGjtxH2qXsMMCabvH5eg1UXOqSt6eIJc2jjuF8uCMCeF9ajMNenDeTpuHI3
 SD+8+bIQcOQilldcdb3d4mw/+eErTuNnPYRa226PnOSxEgFOdvkukTtAYIY6yQSe4Cy9Cu
 pTZYBVPEIQ2ek1SgaWCUIKpsbI+4fhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-2BhijSBXOGe0Zz06UahXcA-1; Mon, 12 Jul 2021 09:06:01 -0400
X-MC-Unique: 2BhijSBXOGe0Zz06UahXcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0E0D100CF78;
 Mon, 12 Jul 2021 13:06:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-105.ams2.redhat.com
 [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FE605C1D1;
 Mon, 12 Jul 2021 13:05:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/22] crypto: prefer gnutls as the crypto backend if new enough
Date: Mon, 12 Jul 2021 14:02:19 +0100
Message-Id: <20210712130223.1825930-19-berrange@redhat.com>
In-Reply-To: <20210712130223.1825930-1-berrange@redhat.com>
References: <20210712130223.1825930-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we have gnutls >= 3.6.13, then it has enough functionality
and performance that we can use it as the preferred crypto
backend.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 59 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/meson.build b/meson.build
index 29fcbbe81f..fc123c467d 100644
--- a/meson.build
+++ b/meson.build
@@ -850,39 +850,50 @@ if not get_option('gnutls').auto() or have_system
   endif
 endif
 
-# Gcrypt has priority over nettle
+# We prefer use of gnutls for crypto, unless the options
+# explicitly asked for nettle or gcrypt.
+#
+# If gnutls isn't available for crypto, then we'll prefer
+# gcrypt over nettle for performance reasons.
 gcrypt = not_found
 nettle = not_found
 xts = 'none'
+
 if get_option('nettle').enabled() and get_option('gcrypt').enabled()
   error('Only one of gcrypt & nettle can be enabled')
-elif (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
-  gcrypt = dependency('libgcrypt', version: '>=1.8',
-                         method: 'config-tool',
-                         required: get_option('gcrypt'),
-                         kwargs: static_kwargs)
-  # Debian has removed -lgpg-error from libgcrypt-config
-  # as it "spreads unnecessary dependencies" which in
-  # turn breaks static builds...
-  if gcrypt.found() and enable_static
-    gcrypt = declare_dependency(dependencies: [
-      gcrypt,
-      cc.find_library('gpg-error', required: true, kwargs: static_kwargs)])
-  endif
-endif
-if (not get_option('nettle').auto() or have_system) and not gcrypt.found()
-  nettle = dependency('nettle', version: '>=3.4',
-                      method: 'pkg-config',
-                      required: get_option('nettle'),
-                      kwargs: static_kwargs)
-  if nettle.found() and not cc.has_header('nettle/xts.h', dependencies: nettle)
-    xts = 'private'
-  endif
 endif
-if gcrypt.found() or nettle.found()
+
+# Explicit nettle/gcrypt request, so ignore gnutls for crypto
+if get_option('nettle').enabled() or get_option('gcrypt').enabled()
   gnutls_crypto = not_found
 endif
 
+if not gnutls_crypto.found()
+  if (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
+    gcrypt = dependency('libgcrypt', version: '>=1.8',
+                        method: 'config-tool',
+                        required: get_option('gcrypt'),
+                        kwargs: static_kwargs)
+    # Debian has removed -lgpg-error from libgcrypt-config
+    # as it "spreads unnecessary dependencies" which in
+    # turn breaks static builds...
+    if gcrypt.found() and enable_static
+      gcrypt = declare_dependency(dependencies: [
+        gcrypt,
+        cc.find_library('gpg-error', required: true, kwargs: static_kwargs)])
+    endif
+  endif
+  if (not get_option('nettle').auto() or have_system) and not gcrypt.found()
+    nettle = dependency('nettle', version: '>=3.4',
+                        method: 'pkg-config',
+                        required: get_option('nettle'),
+                        kwargs: static_kwargs)
+    if nettle.found() and not cc.has_header('nettle/xts.h', dependencies: nettle)
+      xts = 'private'
+    endif
+  endif
+endif
+
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
-- 
2.31.1


