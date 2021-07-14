Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB63C85ED
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:18:24 +0200 (CEST)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fiR-0000nf-Ln
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fbc-0005ER-Al
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fba-0007pp-HU
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+pd+Yz9mU3XdBnwWyCMV3biIWlp9UfjIKGBhiXFN6o=;
 b=Gd58YhB3vUmMtrpijyb460ZSqXcSKrXIXurNevWg7be8WnvRj5pktNDcbCYqYdQm7O6grB
 eiEx5vbOJ0b7zFvb75Vq2z4roImzebw8P/LP7Xh4vfwDsWJ4GQOWjK3gjv41TN+VQdhIYM
 0tDV6iWtutIAuW5hjYTZbcsg1+3ddI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-Nj3X5rbdOzCAendYo_LgUg-1; Wed, 14 Jul 2021 10:11:14 -0400
X-MC-Unique: Nj3X5rbdOzCAendYo_LgUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7888100C66C;
 Wed, 14 Jul 2021 14:11:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8335F60BD8;
 Wed, 14 Jul 2021 14:10:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/26] crypto: flip priority of backends to prefer gcrypt
Date: Wed, 14 Jul 2021 15:08:44 +0100
Message-Id: <20210714140858.2247409-13-berrange@redhat.com>
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

Originally we preferred to use nettle over gcrypt because
gnutls already links to nettle and thus it minimizes the
dependencies. In retrospect this was the wrong criteria to
optimize for.

Currently shipping versions of gcrypt have cipher impls that
are massively faster than those in nettle and this is way
more important.  The nettle library is also not capable of
enforcing FIPS compliance, since it considers that out of
scope. It merely aims to provide general purpose impls of
algorithms, and usage policy is left upto the layer above,
such as GNUTLS.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meson.build b/meson.build
index 8f899e1e9b..c3a6096820 100644
--- a/meson.build
+++ b/meson.build
@@ -823,22 +823,13 @@ if not get_option('gnutls').auto() or have_system
                       kwargs: static_kwargs)
 endif
 
-# Nettle has priority over gcrypt
+# Gcrypt has priority over nettle
 gcrypt = not_found
 nettle = not_found
 xts = 'none'
 if get_option('nettle').enabled() and get_option('gcrypt').enabled()
   error('Only one of gcrypt & nettle can be enabled')
-elif (not get_option('nettle').auto() or have_system) and not get_option('gcrypt').enabled()
-  nettle = dependency('nettle', version: '>=3.4',
-                      method: 'pkg-config',
-                      required: get_option('nettle'),
-                      kwargs: static_kwargs)
-  if nettle.found() and not cc.has_header('nettle/xts.h', dependencies: nettle)
-    xts = 'private'
-  endif
-endif
-if (not get_option('gcrypt').auto() or have_system) and not nettle.found()
+elif (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
   gcrypt = dependency('libgcrypt', version: '>=1.8',
                          method: 'config-tool',
                          required: get_option('gcrypt'),
@@ -852,6 +843,15 @@ if (not get_option('gcrypt').auto() or have_system) and not nettle.found()
       cc.find_library('gpg-error', required: true, kwargs: static_kwargs)])
   endif
 endif
+if (not get_option('nettle').auto() or have_system) and not gcrypt.found()
+  nettle = dependency('nettle', version: '>=3.4',
+                      method: 'pkg-config',
+                      required: get_option('nettle'),
+                      kwargs: static_kwargs)
+  if nettle.found() and not cc.has_header('nettle/xts.h', dependencies: nettle)
+    xts = 'private'
+  endif
+endif
 
 gtk = not_found
 gtkx11 = not_found
-- 
2.31.1


