Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08933C85F9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:20:43 +0200 (CEST)
Received: from localhost ([::1]:57000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fkg-0006wl-PE
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fbd-0005EU-Ac
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fbb-0007qS-GU
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jvJxLVPOjgZBs7yViAVbmQJP/bO3HTWMU4E8VUz+NA=;
 b=XGChxLxmmGSQGREk9VJyTYf6fZIv6EyWrxNVYcVOmn38By7iiXxBDMKfe/kJKRgnJvf9ss
 k0Y8p2QgBxfHeGyNNWTaOb+ExGm4YM5c2YjH6ErsnGNvApbhf5zajSso+S9hyV+TojrSPH
 FImMpztOxMezFDMEK1F3KR22bfDLf0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-ni-xKy5FNoyFn000Qoxeow-1; Wed, 14 Jul 2021 10:11:17 -0400
X-MC-Unique: ni-xKy5FNoyFn000Qoxeow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B703A80414F;
 Wed, 14 Jul 2021 14:11:16 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFFBF69CB4;
 Wed, 14 Jul 2021 14:11:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/26] crypto: introduce build system for gnutls crypto backend
Date: Wed, 14 Jul 2021 15:08:45 +0100
Message-Id: <20210714140858.2247409-14-berrange@redhat.com>
In-Reply-To: <20210714140858.2247409-1-berrange@redhat.com>
References: <20210714140858.2247409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces the build logic needed to decide whether we can
use gnutls as a crypto driver backend. The actual implementations
will be introduced in following patches. We only wish to use
gnutls if it has version 3.6.14 or newer, because that is what
finally brings HW accelerated AES-XTS mode for x86_64.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/meson.build |  3 +++
 meson.build        | 36 ++++++++++++++++++++++++++++++++----
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/crypto/meson.build b/crypto/meson.build
index fc8de287e1..f3bab7c067 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -38,6 +38,9 @@ crypto_ss.add(when: gnutls, if_true: files('tls-cipher-suites.c'))
 
 util_ss.add(files('aes.c'))
 util_ss.add(files('init.c'))
+if gnutls.found()
+  util_ss.add(gnutls)
+endif
 
 if gcrypt.found()
   util_ss.add(gcrypt, files('random-gcrypt.c'))
diff --git a/meson.build b/meson.build
index c3a6096820..38b89d424b 100644
--- a/meson.build
+++ b/meson.build
@@ -816,11 +816,34 @@ if 'CONFIG_OPENGL' in config_host
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
+                             required: false,
+                             kwargs: static_kwargs)
+  if gnutls_crypto.found()
+    gnutls = gnutls_crypto
+  else
+    # Our min version if all we need is TLS
+    gnutls = dependency('gnutls', version: '>=3.5.18',
+                        method: 'pkg-config',
+                        required: get_option('gnutls'),
+                        kwargs: static_kwargs)
+  endif
 endif
 
 # Gcrypt has priority over nettle
@@ -852,6 +875,9 @@ if (not get_option('nettle').auto() or have_system) and not gcrypt.found()
     xts = 'private'
   endif
 endif
+if gcrypt.found() or nettle.found()
+  gnutls_crypto = not_found
+endif
 
 gtk = not_found
 gtkx11 = not_found
@@ -1236,6 +1262,7 @@ config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
 config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_GNUTLS', gnutls.found())
+config_host_data.set('CONFIG_GNUTLS_CRYPTO', gnutls_crypto.found())
 config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
 config_host_data.set('CONFIG_NETTLE', nettle.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
@@ -2958,6 +2985,7 @@ summary(summary_info, bool_yn: true, section: 'Block layer support')
 summary_info = {}
 summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
 summary_info += {'GNUTLS support':    gnutls.found()}
+summary_info += {'GNUTLS crypto':     gnutls_crypto.found()}
 # TODO: add back version
 summary_info += {'libgcrypt':         gcrypt.found()}
 # TODO: add back version
-- 
2.31.1


