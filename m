Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DF3C5D49
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:29:44 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2w0F-0002nE-Gc
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vcf-0004rh-TP
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:05:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vcZ-0006Wx-Fo
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626095114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNgYwaGsh8Ek+Kwq2EAytYQz/a0GH2k1+bLKORLyXAs=;
 b=BbKmuHeM7vD/rhO5kG3+Yaiau94pIzJcl5Z6uZK+fiOyr/zGey68Epm5AplKJLtIBdqgmd
 WQgEEgWzCcGeE5MPga+LqEQvtfvSgvbbhw1b+i/S36uD6Sp+/gvI6ThL81PmN/n9Ee2LIe
 dEgC7p6EE8PfEz00ZD3W/KTZWyb4Cus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-itvWoim9OtCxf3DcqePI3Q-1; Mon, 12 Jul 2021 09:05:12 -0400
X-MC-Unique: itvWoim9OtCxf3DcqePI3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBE5318414A1;
 Mon, 12 Jul 2021 13:05:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-105.ams2.redhat.com
 [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 322CB5C1D1;
 Mon, 12 Jul 2021 13:05:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/22] crypto: introduce build system for gnutls crypto backend
Date: Mon, 12 Jul 2021 14:02:14 +0100
Message-Id: <20210712130223.1825930-14-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

This introduces the build logic needed to decide whether we can
use gnutls as a crypto driver backend. The actual implementations
will be introduced in following patches. We only wish to use
gnutls if it has version 3.6.14 or newer, because that is what
finally brings HW accelerated AES-XTS mode for x86_64.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index cc08561fbd..29fcbbe81f 100644
--- a/meson.build
+++ b/meson.build
@@ -820,11 +820,34 @@ if 'CONFIG_OPENGL' in config_host
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
+                        method: 'pkg-config',
+                        required: get_option('gnutls'),
+                        kwargs: static_kwargs)
+  endif
 endif
 
 # Gcrypt has priority over nettle
@@ -856,6 +879,9 @@ if (not get_option('nettle').auto() or have_system) and not gcrypt.found()
     xts = 'private'
   endif
 endif
+if gcrypt.found() or nettle.found()
+  gnutls_crypto = not_found
+endif
 
 gtk = not_found
 gtkx11 = not_found
@@ -1240,6 +1266,7 @@ config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
 config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_GNUTLS', gnutls.found())
+config_host_data.set('CONFIG_GNUTLS_CRYPTO', gnutls_crypto.found())
 config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
 config_host_data.set('CONFIG_NETTLE', nettle.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
@@ -2961,6 +2988,7 @@ summary(summary_info, bool_yn: true, section: 'Block layer support')
 summary_info = {}
 summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
 summary_info += {'GNUTLS support':    gnutls.found()}
+summary_info += {'GNUTLS crypto':     gnutls_crypto.found()}
 # TODO: add back version
 summary_info += {'libgcrypt':         gcrypt.found()}
 # TODO: add back version
-- 
2.31.1


