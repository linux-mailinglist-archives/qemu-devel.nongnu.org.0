Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E452121E1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:13:12 +0200 (CEST)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqx9T-0003lV-Nl
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx67-0006XD-Qr
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44394
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx64-0000zG-Bl
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlxeB32C41oY/6x4THLquL8lc0tiCsay6MBQ8yHR1TI=;
 b=C6n/Nbk9qNy1aXZmEtagf7ops8GZk5sv2qrAmskcnRfMpl5hESlCk3yEuk20HtMbYNhPaU
 h8JL5EsZNrqAlFYrISd4dA4I4Ci7UWlq9kLM/WJF8pjW/Fs1yfCHn1o+stXsa8c+oVMRnb
 NVj7npmGe7mnHMyTwfdU8Fyufmi0jMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-qhWaZk8UP_2NxC70ys5WVg-1; Thu, 02 Jul 2020 07:09:35 -0400
X-MC-Unique: qhWaZk8UP_2NxC70ys5WVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1932E800C64
 for <qemu-devel@nongnu.org>; Thu,  2 Jul 2020 11:09:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B780679229;
 Thu,  2 Jul 2020 11:09:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AAF741138473; Thu,  2 Jul 2020 13:09:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/28] tests: Use error_free_or_abort() where appropriate
Date: Thu,  2 Jul 2020 13:09:10 +0200
Message-Id: <20200702110931.2953148-8-armbru@redhat.com>
In-Reply-To: <20200702110931.2953148-1-armbru@redhat.com>
References: <20200702110931.2953148-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace

    g_assert(err != NULL);
    error_free(err);
    err = NULL;

and variations thereof by

    error_free_or_abort(&err);

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200630090351.1247703-6-armbru@redhat.com>
---
 tests/check-block-qdict.c   | 24 ++++++------------------
 tests/check-qom-proplist.c  |  7 ++-----
 tests/test-base64.c         |  3 +--
 tests/test-bdrv-graph-mod.c |  4 +---
 tests/test-block-iothread.c |  3 +--
 tests/test-crypto-cipher.c  |  8 ++------
 tests/test-io-task.c        |  4 +---
 7 files changed, 14 insertions(+), 39 deletions(-)

diff --git a/tests/check-block-qdict.c b/tests/check-block-qdict.c
index 73d3e9f574..5a25825093 100644
--- a/tests/check-block-qdict.c
+++ b/tests/check-block-qdict.c
@@ -610,9 +610,7 @@ static void qdict_rename_keys_test(void)
     copy = qdict_clone_shallow(dict);
     qdict_rename_keys(copy, renames, &local_err);
 
-    g_assert(local_err != NULL);
-    error_free(local_err);
-    local_err = NULL;
+    error_free_or_abort(&local_err);
 
     g_assert_cmpstr(qdict_get_str(copy, "abc"), ==, "foo");
     g_assert_cmpstr(qdict_get_str(copy, "abcdef"), ==, "bar");
@@ -649,9 +647,7 @@ static void qdict_crumple_test_bad_inputs(void)
     qdict_put_str(src, "rule.0.policy", "allow");
 
     g_assert(qdict_crumple(src, &error) == NULL);
-    g_assert(error != NULL);
-    error_free(error);
-    error = NULL;
+    error_free_or_abort(&error);
     qobject_unref(src);
 
     src = qdict_new();
@@ -660,9 +656,7 @@ static void qdict_crumple_test_bad_inputs(void)
     qdict_put_str(src, "rule.a", "allow");
 
     g_assert(qdict_crumple(src, &error) == NULL);
-    g_assert(error != NULL);
-    error_free(error);
-    error = NULL;
+    error_free_or_abort(&error);
     qobject_unref(src);
 
     src = qdict_new();
@@ -673,9 +667,7 @@ static void qdict_crumple_test_bad_inputs(void)
     qdict_put_str(src, "rule.b", "allow");
 
     g_assert(qdict_crumple(src, &error) == NULL);
-    g_assert(error != NULL);
-    error_free(error);
-    error = NULL;
+    error_free_or_abort(&error);
     qobject_unref(src);
 
     src = qdict_new();
@@ -684,9 +676,7 @@ static void qdict_crumple_test_bad_inputs(void)
     qdict_put_str(src, "rule.3", "allow");
 
     g_assert(qdict_crumple(src, &error) == NULL);
-    g_assert(error != NULL);
-    error_free(error);
-    error = NULL;
+    error_free_or_abort(&error);
     qobject_unref(src);
 
     src = qdict_new();
@@ -695,9 +685,7 @@ static void qdict_crumple_test_bad_inputs(void)
     qdict_put_str(src, "rule.+1", "allow");
 
     g_assert(qdict_crumple(src, &error) == NULL);
-    g_assert(error != NULL);
-    error_free(error);
-    error = NULL;
+    error_free_or_abort(&error);
     qobject_unref(src);
 }
 
diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index 8c71734e1a..e1e0a96661 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -491,17 +491,14 @@ static void test_dummy_getenum(void)
                                    "av",
                                    "BadAnimal",
                                    &err);
-    g_assert(err != NULL);
-    error_free(err);
-    err = NULL;
+    error_free_or_abort(&err);
 
     /* A non-enum property name */
     val = object_property_get_enum(OBJECT(dobj),
                                    "iv",
                                    "DummyAnimal",
                                    &err);
-    g_assert(err != NULL);
-    error_free(err);
+    error_free_or_abort(&err);
 
     object_unparent(OBJECT(dobj));
 }
diff --git a/tests/test-base64.c b/tests/test-base64.c
index ec122ceba5..a7f722c459 100644
--- a/tests/test-base64.c
+++ b/tests/test-base64.c
@@ -54,10 +54,9 @@ static void test_base64_bad(const char *input,
                                      &len,
                                      &err);
 
-    g_assert(err != NULL);
+    error_free_or_abort(&err);
     g_assert(actual == NULL);
     g_assert_cmpint(len, ==, 0);
-    error_free(err);
 }
 
 
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index f93f3168b0..8cff13830e 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -115,9 +115,7 @@ static void test_update_perm_tree(void)
                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, &error_abort);
 
     bdrv_append(filter, bs, &local_err);
-
-    g_assert_nonnull(local_err);
-    error_free(local_err);
+    error_free_or_abort(&local_err);
 
     blk_unref(root);
 }
diff --git a/tests/test-block-iothread.c b/tests/test-block-iothread.c
index a953794be2..3f866a35c6 100644
--- a/tests/test-block-iothread.c
+++ b/tests/test-block-iothread.c
@@ -650,8 +650,7 @@ static void test_propagate_mirror(void)
     blk_insert_bs(blk, src, &error_abort);
 
     bdrv_try_set_aio_context(target, ctx, &local_err);
-    g_assert(local_err);
-    error_free(local_err);
+    error_free_or_abort(&local_err);
 
     g_assert(blk_get_aio_context(blk) == main_ctx);
     g_assert(bdrv_get_aio_context(src) == main_ctx);
diff --git a/tests/test-crypto-cipher.c b/tests/test-crypto-cipher.c
index 07fa2fa616..bebba1a4f4 100644
--- a/tests/test-crypto-cipher.c
+++ b/tests/test-crypto-cipher.c
@@ -761,10 +761,7 @@ static void test_cipher_short_plaintext(void)
                                  sizeof(plaintext1),
                                  &err);
     g_assert(ret == -1);
-    g_assert(err != NULL);
-
-    error_free(err);
-    err = NULL;
+    error_free_or_abort(&err);
 
     /* Should report an error as plaintext is larger than
      * block size, but not a multiple of block size
@@ -775,9 +772,8 @@ static void test_cipher_short_plaintext(void)
                                  sizeof(plaintext2),
                                  &err);
     g_assert(ret == -1);
-    g_assert(err != NULL);
+    error_free_or_abort(&err);
 
-    error_free(err);
     qcrypto_cipher_free(cipher);
 }
 
diff --git a/tests/test-io-task.c b/tests/test-io-task.c
index c8a3813d49..85e7a98da5 100644
--- a/tests/test-io-task.c
+++ b/tests/test-io-task.c
@@ -240,9 +240,7 @@ static void test_task_thread_failure(void)
     object_unref(obj);
 
     g_assert(data.source == obj);
-    g_assert(data.err != NULL);
-
-    error_free(data.err);
+    error_free_or_abort(&data.err);
 
     self = g_thread_self();
 
-- 
2.26.2


