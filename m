Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C03BC91A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:10:37 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i2F-0001w2-1w
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hs4-0005Vn-VM
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hs0-00016n-U5
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LvDnPWejsFpciWtf8yyyDj1Y5CN644+AMdgJFdlrzKA=;
 b=YZzmiAQ2croj/ywsgZfwTVu6Pb8SuGA3ztYTkPDg0Ksm69teWdEquMVFa7TSC46Kpoj4St
 psRcB7mgcvZvW+up/6e4RdsN2NeL7UBwLBjlJOW+TorWNbUoy3uuFG6N7cfbl3l4+2nlCW
 /rPY6RRxiTUjLNSWsXeSbzC52DZgkmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-5epGJ1cjODqcL-vJFf_f_w-1; Tue, 06 Jul 2021 05:59:58 -0400
X-MC-Unique: 5epGJ1cjODqcL-vJFf_f_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 314F88030D7
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:58 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E2F25D6A1;
 Tue,  6 Jul 2021 09:59:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/18] crypto: introduce build system for gnutls crypto backend
Date: Tue,  6 Jul 2021 10:59:19 +0100
Message-Id: <20210706095924.764117-14-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

This introduces the build logic needed to decide whether we can
use gnutls as a crypto driver backend. The actual implementations
will be introduced in following patches. We only wish to use
gnutls if it has version 3.6.14 or newer, because that is what
finally brings HW accelerated AES-XTS mode for x86_64.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 51b8f4ab75..6031f4f0b1 100644
--- a/meson.build
+++ b/meson.build
@@ -811,11 +811,34 @@ if 'CONFIG_OPENGL' in config_host
 endif
 
 gnutls = not_found
+gnutls_crypto = not_found
 if not get_option('gnutls').auto() or have_system
-  gnutls = dependency('gnutls', version: '>=3.5.18',
-                      method: 'pkg-config',
-                      required: get_option('gnutls'),
-                      kwargs: static_kwargs)
+  # For general TLS support our min gnutls matches
+  # that implied by our platform support matrix
+  #
+  # For the crypto backends, we look for a newer
+  # gnutls:
+  #
+  #   Version 3.6.8  is needed to get XTS
+  #   Version 3.6.13 is needed to get PBKDF
+  #   Version 3.6.14 is needed to get HW accelerated XTS
+  #
+  # If newer enough gnutls isn't available, we can
+  # still use a different crypto backend to satisfy
+  # the platform support requirements
+  gnutls_crypto = dependency('gnutls', version: '>=3.6.14',
+                             method: 'pkg-config',
+                             required: get_option('gnutls'),
+                             kwargs: static_kwargs)
+  if gnutls_crypto.found()
+    gnutls = gnutls_crypto
+  else
+    # Our min version if all we need is TLS
+    gnutls = dependency('gnutls', version: '>=3.5.18',
+			method: 'pkg-config',
+			required: get_option('gnutls'),
+			kwargs: static_kwargs)
+  endif
 endif
 
 # Gcrypt has priority over nettle
@@ -847,6 +870,9 @@ if (not get_option('nettle').auto() or have_system) and not gcrypt.found()
     xts = 'private'
   endif
 endif
+if gcrypt.found() or nettle.found()
+  gnutls_crypto = not_found
+endif
 
 gtk = not_found
 gtkx11 = not_found
@@ -1219,6 +1245,7 @@ config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
 config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_GNUTLS', gnutls.found())
+config_host_data.set('CONFIG_GNUTLS_CRYPTO', gnutls_crypto.found())
 config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
 config_host_data.set('CONFIG_NETTLE', nettle.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
@@ -2719,6 +2746,7 @@ summary(summary_info, bool_yn: true, section: 'Block layer support')
 summary_info = {}
 summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
 summary_info += {'GNUTLS support':    gnutls.found()}
+summary_info += {'GNUTLS crypto':     gnutls_crypto.found()}
 # TODO: add back version
 summary_info += {'libgcrypt':         gcrypt.found()}
 # TODO: add back version
-- 
2.31.1


