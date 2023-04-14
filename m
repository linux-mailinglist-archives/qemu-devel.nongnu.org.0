Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB56E22A6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:52:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHrd-0000I0-QB; Fri, 14 Apr 2023 07:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pnHpY-0007hk-Kd
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:43:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pnHpV-0002Yk-Ii
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681472579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Tjvk5sP18ATLj9lGUb7nhT53ou40e+Y3XvgleUKuv20=;
 b=UDYKuJwL1zkrJ9tRXK9TVh89DNLbXn7RToVLR6baTRbfXSpc3C7S62sZiQVoOtjOf5wbB/
 aTQHtgwA6oLk4SXmeHIN52u4O5X6nLsMZazwHrLQIJFA2PzNITQ9A4yv1Eg1cS0MXG0rvI
 HYVz8/Jdakg/WVpePP1o2B2ddxvF9fg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-ufp7A7DGPYOffBDbIqM1Sg-1; Fri, 14 Apr 2023 07:42:57 -0400
X-MC-Unique: ufp7A7DGPYOffBDbIqM1Sg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B14438123B8
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 11:42:57 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93C091415117;
 Fri, 14 Apr 2023 11:42:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v3] test: Fix test-crypto-secret when compiling without
 keyring support
Date: Fri, 14 Apr 2023 13:42:52 +0200
Message-Id: <20230414114252.1136-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Linux keyring support is protected by CONFIG_KEYUTILS.
We also need CONFIG_SECRET_KEYRING.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

- Previous version of this patch changed the meson build rules.
  Daniel told me that the proper fix was to change the #ifdef test.

- Change rule again.  We need both defines.
- Put both defines in #endif (thomas)
---
 tests/unit/test-crypto-secret.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/unit/test-crypto-secret.c b/tests/unit/test-crypto-secret.c
index 34a4aecc12..147b4af828 100644
--- a/tests/unit/test-crypto-secret.c
+++ b/tests/unit/test-crypto-secret.c
@@ -24,7 +24,7 @@
 #include "crypto/secret.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
-#ifdef CONFIG_KEYUTILS
+#if defined(CONFIG_KEYUTILS) && defined(CONFIG_SECRET_KEYRING)
 #include "crypto/secret_keyring.h"
 #include <keyutils.h>
 #endif
@@ -128,7 +128,7 @@ static void test_secret_indirect_emptyfile(void)
     g_free(fname);
 }
 
-#ifdef CONFIG_KEYUTILS
+#if defined(CONFIG_KEYUTILS) && defined(CONFIG_SECRET_KEYRING)
 
 #define DESCRIPTION "qemu_test_secret"
 #define PAYLOAD "Test Payload"
@@ -268,7 +268,7 @@ static void test_secret_keyring_bad_key_access_right(void)
     keyctl_unlink(key, KEY_SPEC_PROCESS_KEYRING);
 }
 
-#endif /* CONFIG_KEYUTILS */
+#endif /* CONFIG_KEYUTILS && CONFIG_SECRET_KEYRING */
 
 static void test_secret_noconv_base64_good(void)
 {
@@ -571,7 +571,7 @@ int main(int argc, char **argv)
     g_test_add_func("/crypto/secret/indirect/emptyfile",
                     test_secret_indirect_emptyfile);
 
-#ifdef CONFIG_KEYUTILS
+#if defined(CONFIG_KEYUTILS) && defined(CONFIG_SECRET_KEYRING)
     g_test_add_func("/crypto/secret/keyring/good",
                     test_secret_keyring_good);
     g_test_add_func("/crypto/secret/keyring/revoked_key",
@@ -582,7 +582,7 @@ int main(int argc, char **argv)
                     test_secret_keyring_bad_serial_key);
     g_test_add_func("/crypto/secret/keyring/bad_key_access_right",
                     test_secret_keyring_bad_key_access_right);
-#endif /* CONFIG_KEYUTILS */
+#endif /* CONFIG_KEYUTILS && CONFIG_SECRET_KEYRING */
 
     g_test_add_func("/crypto/secret/noconv/base64/good",
                     test_secret_noconv_base64_good);
-- 
2.39.2


