Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BB03BC909
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:07:34 +0200 (CEST)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hzJ-0002o1-4D
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hsC-0005kf-GX
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hs9-0001EL-Qm
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ii/cHtMCj3F/wdc0o50HdBkCIFbibgOZ2b/ka2plqBk=;
 b=gnfKCvM7hbGAtl4o3mJlxMYyiYI/LYGgyA9f/ApgNL/A6+5MmYG0jjbQF3E4VfTI8aSZFj
 TctTZpU+7kLClz0Ukpr07s2pIn7z+ZaMLlhKjUwBJu3oP8goIEiVx2R//C6qrNgj+FUaV0
 VgYWD1OaDHfw72Hx69VHv4PZcGNsVE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-l3QCwoOhO7GR0AcOoxhs1A-1; Tue, 06 Jul 2021 06:00:07 -0400
X-MC-Unique: l3QCwoOhO7GR0AcOoxhs1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D19CB362FC
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 10:00:06 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D88035D6A1;
 Tue,  6 Jul 2021 10:00:05 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/18] crypto: prefer gnutls as the crypto backend if new
 enough
Date: Tue,  6 Jul 2021 10:59:24 +0100
Message-Id: <20210706095924.764117-19-berrange@redhat.com>
In-Reply-To: <20210706095924.764117-1-berrange@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we have gnutls >= 3.6.13, then it has enough functionality
and performance that we can use it as the preferred crypto
backend.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 59 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/meson.build b/meson.build
index 6031f4f0b1..0bec6f7e40 100644
--- a/meson.build
+++ b/meson.build
@@ -841,39 +841,50 @@ if not get_option('gnutls').auto() or have_system
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
 if not get_option('gtk').auto() or (have_system and not cocoa.found())
-- 
2.31.1


