Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2064D47E1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:16:02 +0100 (CET)
Received: from localhost ([::1]:58578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIe9-0005Mm-95
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:16:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA9-0007KA-KT; Thu, 10 Mar 2022 07:45:02 -0500
Received: from [2a00:1450:4864:20::32b] (port=46718
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA7-0005JM-MA; Thu, 10 Mar 2022 07:45:01 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so3295093wmp.5; 
 Thu, 10 Mar 2022 04:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwEBVC9gS4h6aKzCcykqoukS49LhIwPfJ5VWQl2biiU=;
 b=OshQE2fkLrrlyRIqFmhlGuIQen6+SoW9kOF3dFsIt0SrwtcP+bKTMuhKjebVQUoWGq
 YKWIXE5oD9iOYHVyJgN3/3yS1R5ZjdTRWbQRh47mGl3GCWmpMlNwL27MsJ83+HnKZaoq
 +cpm/W87hm5NpiWgBX0JdE1CRDIiSRM7VZW1ypb1eGGzzajT6xeTet5QQmSu7ZBc6TYZ
 1Dvyl9JjMMCoaWXxdr7rG10ohmf34felfl+l6aKGmagttTAC1bj9kgAt2clUTxlefq+f
 94x/0NrMlnrnHNmsbi21WggwWXw0Ga5T1l6WgiPKabcnmlO1iMYsy8Biezk9/j9KKMYZ
 qKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LwEBVC9gS4h6aKzCcykqoukS49LhIwPfJ5VWQl2biiU=;
 b=iHzYQwNkHAMnFqi9oUdGtiMlc1kZkt67+9ZKhYnTn1Ni+D9TeH3Z6C8mMNvS1vW25g
 M+eGLTjkZQhcCqOxLXeI8TGZkdVhxhmiqO0DM1ePe28EVP6+Pjb7I7OEq4znMS5iZvuJ
 /lV6+DaCiNFXKMm64nazSVADf9p4fC02SB0NgogC0aDQzwV/G3g0zFmiErHuHSuip/7W
 vbZPydOcC4QqVB5yE7U5IWNfaEVY0c0RJ3+wv4VXzipzwIcjxGIivCsit8d6+koIOyw4
 ChBHeglg0714Fr1ShLT3meNL41rPjNn+y5vxEeH1kdzH6VjV9J7EfnRWyo+fAbN0C3OU
 /HZA==
X-Gm-Message-State: AOAM530JXbkEZHmg1c7o5nencgVhAajG3IVnbQVOjkDNIP0BDiw7KAQL
 h0KBFkXfOC8fooveE/RL0FEB6yEAemA=
X-Google-Smtp-Source: ABdhPJyzhl8I1pnuoZW8+fuTcsgpt1pXXF7Me+S6QtJhH+EEIxHR9b5mEnH00vHraDVAcTKyKm7l9w==
X-Received: by 2002:a05:600c:1c02:b0:389:cf43:da63 with SMTP id
 j2-20020a05600c1c0200b00389cf43da63mr7188652wms.205.1646916298027; 
 Thu, 10 Mar 2022 04:44:58 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/35] /locking/co-rwlock/upgrade
Date: Thu, 10 Mar 2022 13:44:12 +0100
Message-Id: <20220310124413.1102441-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 68 ++++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 13 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index db6718db40..39d0f31492 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -355,7 +355,6 @@ static void test_co_mutex_lockable(void)
     g_assert(QEMU_MAKE_CO_LOCKABLE(null_pointer) == NULL);
 }
 
-#if 0
 static CoRwlock rwlock;
 
 /* Test that readers are properly sent back to the queue when upgrading,
@@ -375,24 +374,66 @@ static CoRwlock rwlock;
  * | unlock       |            |
  */
 
-static void coroutine_fn rwlock_yield_upgrade(void *opaque)
+CO_DECLARE_FRAME(rwlock_yield_upgrade, bool *done);
+static CoroutineAction co__rwlock_yield_upgrade(void *_frame)
 {
-    qemu_co_rwlock_rdlock(&rwlock);
-    qemu_coroutine_yield();
+    struct FRAME__rwlock_yield_upgrade *_f = _frame;
+    CO_ARG(done);
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_rwlock_rdlock(&rwlock);
+case 1:
+_f->_step = 2;
+    return qemu_coroutine_yield();
 
-    qemu_co_rwlock_upgrade(&rwlock);
-    qemu_co_rwlock_unlock(&rwlock);
+case 2:
+_f->_step = 3;
+    return qemu_co_rwlock_upgrade(&rwlock);
+case 3:
+_f->_step = 4;
+    return qemu_co_rwlock_unlock(&rwlock);
 
-    *(bool *)opaque = true;
+case 4:
+    *done = true;
+    break;
+}
+return stack_free(&_f->common);
 }
 
-static void coroutine_fn rwlock_wrlock_yield(void *opaque)
+static CoroutineAction rwlock_yield_upgrade(void *opaque)
 {
-    qemu_co_rwlock_wrlock(&rwlock);
-    qemu_coroutine_yield();
+    bool *done = opaque;
+    return CO_INIT_FRAME(rwlock_yield_upgrade, done);
+}
 
-    qemu_co_rwlock_unlock(&rwlock);
-    *(bool *)opaque = true;
+CO_DECLARE_FRAME(rwlock_wrlock_yield, bool *done);
+static CoroutineAction co__rwlock_wrlock_yield(void *_frame)
+{
+    struct FRAME__rwlock_wrlock_yield *_f = _frame;
+    CO_ARG(done);
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_rwlock_wrlock(&rwlock);
+case 1:
+_f->_step = 2;
+    return qemu_coroutine_yield();
+
+case 2:
+_f->_step = 3;
+    return qemu_co_rwlock_unlock(&rwlock);
+case 3:
+    *done = true;
+    break;
+}
+return stack_free(&_f->common);
+}
+
+static CoroutineAction rwlock_wrlock_yield(void *opaque)
+{
+    bool *done = opaque;
+    return CO_INIT_FRAME(rwlock_wrlock_yield, done);
 }
 
 static void test_co_rwlock_upgrade(void)
@@ -417,6 +458,7 @@ static void test_co_rwlock_upgrade(void)
     g_assert(c2_done);
 }
 
+#if 0
 static void coroutine_fn rwlock_rdlock_yield(void *opaque)
 {
     qemu_co_rwlock_rdlock(&rwlock);
@@ -829,8 +871,8 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/order", test_order);
     g_test_add_func("/locking/co-mutex", test_co_mutex);
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
-#if 0
     g_test_add_func("/locking/co-rwlock/upgrade", test_co_rwlock_upgrade);
+#if 0
     g_test_add_func("/locking/co-rwlock/downgrade", test_co_rwlock_downgrade);
 #endif
     if (g_test_perf()) {
-- 
2.35.1



