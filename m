Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411323BC902
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:05:00 +0200 (CEST)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hwp-0005UY-8a
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hs3-0005Oq-0l
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrz-00015c-VW
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNi2lQMvxiBV7Kbn27mdlbZE7xjhass3p6Iogk+7VKk=;
 b=TRwxzWSOuUWKdIlx26xJK0+fffpff+ZwKKL0lXDv2lTR+PjPuuUfZOsatJkqUcj6i/2jFx
 8WEG600Mxj9NbkrBk16es70Lm02TFRyKiAQbt/6KL3dwDZ4fcOTyAykv/fYFea3pmUCody
 M9y6Mh0h0wrQib6ZCqhNpIdmyceqC9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-AZxfxJqYPUe6sNVTimLjPQ-1; Tue, 06 Jul 2021 05:59:57 -0400
X-MC-Unique: AZxfxJqYPUe6sNVTimLjPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0270D19057A1
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:57 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ECAA5D6A1;
 Tue,  6 Jul 2021 09:59:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/18] crypto: flip priority of backends to prefer gcrypt
Date: Tue,  6 Jul 2021 10:59:18 +0100
Message-Id: <20210706095924.764117-13-berrange@redhat.com>
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

Originally we preferred to use nettle, over gcrypt because
gnutls already links to nettle and thus it minimizes the
dependencies. In retrospect this was the wrong criteria to
optimize for.

Currently shipping versions of gcrypt have cipher impls that
are massively faster than those in nettle and this is way
more important.  The nettle library is also not capable of
enforcing FIPS compliance, since it considers that out of
scope. It merely aims to provide general purpose impls of
algorithms, and usage policy is left upto the layer above,
such as GNUTTLS.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meson.build b/meson.build
index 07b4e7f950..51b8f4ab75 100644
--- a/meson.build
+++ b/meson.build
@@ -818,22 +818,13 @@ if not get_option('gnutls').auto() or have_system
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
@@ -847,6 +838,15 @@ if (not get_option('gcrypt').auto() or have_system) and not nettle.found()
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


