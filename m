Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D63C85FE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:21:38 +0200 (CEST)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fla-0000wL-0Y
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fa3-0002co-Fc
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:09:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fZz-0006hc-2A
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L8BSeZLjpWBMuCHAN/znjs+zucu9uxIXQbcDw3HobHU=;
 b=g3XAr+oVub90/5mI4PKlYF7ozDm/GfvqZRps+F0FRwc1OuUWRCcHj8/qvwuwnFQt0ff5r5
 JA9tJSKMg8RZwDsfEgUOy3nONjKqR6X4FJejjvuazT0CkwMvyIa9d4xQvbdDvmqaNC8Pvq
 b6plrRafF7ntT5b1d4vGxdIMLJXH/W4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-LLxZukxeNeaZ56grPDzaiA-1; Wed, 14 Jul 2021 10:09:37 -0400
X-MC-Unique: LLxZukxeNeaZ56grPDzaiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3694FA40C1;
 Wed, 14 Jul 2021 14:09:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C15969CB4;
 Wed, 14 Jul 2021 14:09:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/26] crypto: drop gcrypt thread initialization code
Date: Wed, 14 Jul 2021 15:08:38 +0100
Message-Id: <20210714140858.2247409-7-berrange@redhat.com>
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

This is only required on gcrypt < 1.6.0, and is thus obsolete
since

  commit b33a84632a3759c00320fd80923aa963c11207fc
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri May 14 13:04:08 2021 +0100

    crypto: bump min gcrypt to 1.8.0, dropping RHEL-7 support

Reviewed-by: Eric Blake <eblake@redhat.com>
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


