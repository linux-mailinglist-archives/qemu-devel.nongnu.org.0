Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36123A62BD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:03:33 +0200 (CEST)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskNQ-0002oB-Rf
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lskMG-00027B-QL
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:02:20 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:47014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lskME-0004pU-VB
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:02:20 -0400
Received: by mail-ed1-x52e.google.com with SMTP id s15so5001086edt.13
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 04:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cBXA3AmcMdZMsNxG5dJAIsaVnj2EOvTSVy1kpPH/Dzk=;
 b=h0NZfUeQp4twRCHSgdcro4zkJdq7FlqCl511m3B3CmJZ5t07m0muO82cu9akbbAPY+
 Xg7dTNCqz6MVfI+xxbpHy4A+AmXlY+3p5H/ZbNca5lXTSoyQRGDPdPVbjoJ5mFZik3Oc
 1smmZLREEF2pRaBnOnjO+KwY2aKErv8QrP0RrEXHMd4P3Z2Oo3juF3q9tNBaX8CnVesf
 AKmGFg+0x2GNrH54bROqgysR5RDP7kWlCwDOAUIIo+jyAUmA3avFXKfM+TqCQcp8+VA1
 N4fD+f9NwXLuGdOEmKC1Vzpc07gCiMSwrxyVOEv081OoEdExjBHup5qLmh1CjUz9w9FA
 hxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cBXA3AmcMdZMsNxG5dJAIsaVnj2EOvTSVy1kpPH/Dzk=;
 b=hgzJx1ACFk+mX4NBPJoCpe0xAWyS6jdWq0Mj/HTAADAY3NeHpQNH4bayNpwwfXx8eF
 sgE7ye7uoRBJreDS6k4LIbc75UkSRGcvSat0w9uz643JXdtKvsccKzAF6A2mZZ+rQEvD
 fUaT7EdWtECfNvPVpw2iloXe0Z91z7lC7PcvQJwzQ44piN1Utb4IbiFqZBKca+2vBleM
 loTq5JEYDbkE+K2k28l4VEb8ijuJA5b8Etft4x59hCxzyp81gI6Nr2prkvRnqnoCebms
 mjN6eneUhS6RXoxboNxxaXsiNIHOqdfRM/FiS2VCeepqGTDJczxHiMM2okkC6m7mH76q
 la4w==
X-Gm-Message-State: AOAM530jdmjkuOO46l1CB0QwlRMMftBkb7avJon/cd+eFHVgj4ZAw/EI
 JRNstV415uHcYyOuvM2eiXNhHZu7Hf8=
X-Google-Smtp-Source: ABdhPJzmkGOadnMcuyxOvT9vOhIvULEWaHKb+KzNlEvAl6haqqHFqijoL7mwqq48x66nEyMxzxut8w==
X-Received: by 2002:aa7:d817:: with SMTP id v23mr16029537edq.300.1623668536071; 
 Mon, 14 Jun 2021 04:02:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p9sm8559770edh.61.2021.06.14.04.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 04:02:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: cover aio_co_enter from a worker thread without BQL
 taken
Date: Mon, 14 Jun 2021 13:02:14 +0200
Message-Id: <20210614110214.726722-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a testcase for the test fixed by commit 'async: the main AioContext
is only "current" if under the BQL.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-aio.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/unit/test-aio.c b/tests/unit/test-aio.c
index 8a46078463..6feeb9a4a9 100644
--- a/tests/unit/test-aio.c
+++ b/tests/unit/test-aio.c
@@ -877,6 +877,42 @@ static void test_queue_chaining(void)
     g_assert_cmpint(data_b.i, ==, data_b.max);
 }
 
+static void co_check_current_thread(void *opaque)
+{
+    QemuThread *main_thread = opaque;
+    assert(qemu_thread_is_self(main_thread));
+}
+
+static void *test_aio_co_enter(void *co)
+{
+    /*
+     * qemu_get_current_aio_context() should not to be the main thread
+     * AioContext, because this is a worker thread that has not taken
+     * the BQL.  So aio_co_enter will schedule the coroutine in the
+     * main thread AioContext.
+     */
+    aio_co_enter(qemu_get_aio_context(), co);
+    return NULL;
+}
+
+static void test_worker_thread_co_enter(void)
+{
+    QemuThread this_thread, worker_thread;
+    Coroutine *co;
+
+    qemu_thread_get_self(&this_thread);
+    co = qemu_coroutine_create(co_check_current_thread, &this_thread);
+
+    qemu_thread_create(&worker_thread, "test_acquire_thread",
+                       test_aio_co_enter,
+                       co, QEMU_THREAD_JOINABLE);
+
+    /* Test aio_co_enter from a worker thread.  */
+    qemu_thread_join(&worker_thread);
+    g_assert(aio_poll(ctx, true));
+    g_assert(!aio_poll(ctx, false));
+}
+
 /* End of tests.  */
 
 int main(int argc, char **argv)
@@ -903,6 +939,7 @@ int main(int argc, char **argv)
     g_test_add_func("/aio/timer/schedule",          test_timer_schedule);
 
     g_test_add_func("/aio/coroutine/queue-chaining", test_queue_chaining);
+    g_test_add_func("/aio/coroutine/worker-thread-co-enter", test_worker_thread_co_enter);
 
     g_test_add_func("/aio-gsource/flush",                   test_source_flush);
     g_test_add_func("/aio-gsource/bh/schedule",             test_source_bh_schedule);
-- 
2.31.1


