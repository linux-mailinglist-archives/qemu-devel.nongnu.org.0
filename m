Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C986E8FB5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:14:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHe-0000wX-Gq; Thu, 20 Apr 2023 06:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHY-0000na-WB
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHG-0007zq-Ur
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYVqMgcP4TZPkv0Q9qK8sk+UGd4f6O2gemeQ26SqbyY=;
 b=gBWDXxJAeHxCn7lodQ8RZaMlMxrsrLNjHMbSxGfunVeXWWgm+aErAVZofg63K03WXtwMSU
 v+w/k/3ItjBfT1eUdR2x4+38A/5jFSPQlkx2mr76+7hEBB9+hnsBT9+LemY9Rn3SXNLGZ6
 yoOh1SeHb9QhPxeAULJn1FGZ6fl/oq8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-6C9E0MY7MCq6F3r0pJhkTQ-1; Thu, 20 Apr 2023 06:12:26 -0400
X-MC-Unique: 6C9E0MY7MCq6F3r0pJhkTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 416A1886462;
 Thu, 20 Apr 2023 10:12:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 403755AB7A;
 Thu, 20 Apr 2023 10:12:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 04/23] test: Fix test-crypto-secret when compiling without
 keyring support
Date: Thu, 20 Apr 2023 12:11:57 +0200
Message-Id: <20230420101216.786304-5-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Juan Quintela <quintela@redhat.com>

Linux keyring support is protected by CONFIG_KEYUTILS.
We also need CONFIG_SECRET_KEYRING.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230414114252.1136-1-quintela@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.31.1


