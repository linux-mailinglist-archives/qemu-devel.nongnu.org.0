Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE363BC8F2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:02:17 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0huC-0007tS-4M
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrs-00051L-Ho
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hro-00010b-Ay
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gbiTlbhjSTJfbtE9pbEf+hu5+P+HUNmS7/LE/0/sR4=;
 b=NPbhjUZLXKZHfHxEkpgh94pCxiAIhza7zZrQEfzDYRFxmK724VIy1MEB62I8ReaKL5yFgQ
 xvV6Vf4qR8oOg0lygqyV9MOEScYQpFVpRqo5B/ecAi4FAYFaAWzwIZPIFVzQMkz5yVe8z/
 keTKj1vGofXQdDDPd9/KgD6Gjf0jgjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-XW8WXS8oPR2kaJqwf80frg-1; Tue, 06 Jul 2021 05:59:44 -0400
X-MC-Unique: XW8WXS8oPR2kaJqwf80frg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26C96100C660
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:44 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3536B5D6A1;
 Tue,  6 Jul 2021 09:59:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/18] crypto: drop gcrypt thread initialization code
Date: Tue,  6 Jul 2021 10:59:12 +0100
Message-Id: <20210706095924.764117-7-berrange@redhat.com>
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

This is only required on gcrypt < 1.6.0, and is thus obsolete
since

  commit b33a84632a3759c00320fd80923aa963c11207fc
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri May 14 13:04:08 2021 +0100

    crypto: bump min gcrypt to 1.8.0, dropping RHEL-7 support

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/init.c | 62 ---------------------------------------------------
 1 file changed, 62 deletions(-)

diff --git a/crypto/init.c b/crypto/init.c
index ea233b9192..fb7f1bff10 100644
--- a/crypto/init.c
+++ b/crypto/init.c
@@ -35,21 +35,6 @@
 #include "crypto/random.h"
 
 /* #define DEBUG_GNUTLS */
-
-/*
- * We need to init gcrypt threading if
- *
- *   - gcrypt < 1.6.0
- *
- */
-
-#if (defined(CONFIG_GCRYPT) &&                  \
-     (GCRYPT_VERSION_NUMBER < 0x010600))
-#define QCRYPTO_INIT_GCRYPT_THREADS
-#else
-#undef QCRYPTO_INIT_GCRYPT_THREADS
-#endif
-
 #ifdef DEBUG_GNUTLS
 static void qcrypto_gnutls_log(int level, const char *str)
 {
@@ -57,55 +42,8 @@ static void qcrypto_gnutls_log(int level, const char *str)
 }
 #endif
 
-#ifdef QCRYPTO_INIT_GCRYPT_THREADS
-static int qcrypto_gcrypt_mutex_init(void **priv)
-{                                                                             \
-    QemuMutex *lock = NULL;
-    lock = g_new0(QemuMutex, 1);
-    qemu_mutex_init(lock);
-    *priv = lock;
-    return 0;
-}
-
-static int qcrypto_gcrypt_mutex_destroy(void **priv)
-{
-    QemuMutex *lock = *priv;
-    qemu_mutex_destroy(lock);
-    g_free(lock);
-    return 0;
-}
-
-static int qcrypto_gcrypt_mutex_lock(void **priv)
-{
-    QemuMutex *lock = *priv;
-    qemu_mutex_lock(lock);
-    return 0;
-}
-
-static int qcrypto_gcrypt_mutex_unlock(void **priv)
-{
-    QemuMutex *lock = *priv;
-    qemu_mutex_unlock(lock);
-    return 0;
-}
-
-static struct gcry_thread_cbs qcrypto_gcrypt_thread_impl = {
-    (GCRY_THREAD_OPTION_PTHREAD | (GCRY_THREAD_OPTION_VERSION << 8)),
-    NULL,
-    qcrypto_gcrypt_mutex_init,
-    qcrypto_gcrypt_mutex_destroy,
-    qcrypto_gcrypt_mutex_lock,
-    qcrypto_gcrypt_mutex_unlock,
-    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
-};
-#endif /* QCRYPTO_INIT_GCRYPT */
-
 int qcrypto_init(Error **errp)
 {
-#ifdef QCRYPTO_INIT_GCRYPT_THREADS
-    gcry_control(GCRYCTL_SET_THREAD_CBS, &qcrypto_gcrypt_thread_impl);
-#endif /* QCRYPTO_INIT_GCRYPT_THREADS */
-
 #ifdef CONFIG_GNUTLS
     int ret;
     ret = gnutls_global_init();
-- 
2.31.1


