Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75CA6F167A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 13:20:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psM8k-0007ES-Ih; Fri, 28 Apr 2023 07:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psM8i-0007Dz-KT
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psM8h-00019L-5K
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682680786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w22ZoYzuaf2sz2c1ipVwaRyI7mhhdaNxLz0g55lEH3U=;
 b=SITrcC4+F4tGV6108wgewtPAy50w/kTs00JlNBVp4mbiLP3M8LJoYLnzOuAeec9Nxus8Oe
 68agQELaSxVxzAaoD7oboAytS6mVU6bdXFpBo9th6gwFeimpCxi//NL4aIGPXpCFdKwXLU
 T9SePiQAKZ9K6GLCa2VVqWErDtlqCw4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-k5m8b2JBODGr-4yp7nkr1w-1; Fri, 28 Apr 2023 07:19:44 -0400
X-MC-Unique: k5m8b2JBODGr-4yp7nkr1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f3157128b4so37707515e9.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 04:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682680783; x=1685272783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w22ZoYzuaf2sz2c1ipVwaRyI7mhhdaNxLz0g55lEH3U=;
 b=SEdPd7ibKWleCQQ3Hxppz2VUs0MFIEwgkPERZ6mVRVGXIAy83ySZnnUlRecEB+ZRL6
 /E4vIISkPq1KJFLkkZpVsIAiE4+bevcV6Sk4103a2NpR+GBx0N87OdqJFJKmqMgMw6gi
 slQsMsuK3KzDEZXz9fVo1BjACQ7jz8XWfCP2BruMnWy15aTmVVgK5Fc97e/XM2fWAPPn
 5sxT21F3p3suBEYHwcKKTTJxVVfjHjsxuX+Z+Tssqz83z7iyEqWl6u5JqI9FZsjXSeZV
 bbbzLSB/1S2Pljj37aLhdoObIKeXYnvgUOaJHN6ChjatuQOrNHtBIhtpIxSSJryt5izf
 47NQ==
X-Gm-Message-State: AC+VfDwimZT+P0+W0Ybvp1oRWMvCoLf11+8BxZG6NYC7/krzbsdcysfG
 NfNsK0GBHGVPfQ8fr4Iy8N4GTZsSd1HXNJquoFi07s9pE9OcIRkfzcuo4bQbbN7zPKkr8f6HDIJ
 CEJ688/A/hdVNSdsgxrhuWSbISLTf4fzz2HSXTXR1E9qhBgIC/v3ujed69/u73amexnZ2yTDrOy
 A=
X-Received: by 2002:a05:600c:1ca2:b0:3f1:939e:2e3b with SMTP id
 k34-20020a05600c1ca200b003f1939e2e3bmr6731661wms.19.1682680783357; 
 Fri, 28 Apr 2023 04:19:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mRvA0rXas+pUvwNC3HCqBo/Ix5D+QazkVMaS6bVQONFxR+wZIrqTlEzlw1dTsb+Alv1cRAA==
X-Received: by 2002:a05:600c:1ca2:b0:3f1:939e:2e3b with SMTP id
 k34-20020a05600c1ca200b003f1939e2e3bmr6731634wms.19.1682680782872; 
 Fri, 28 Apr 2023 04:19:42 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003ee74c25f12sm27828590wmq.35.2023.04.28.04.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 04:19:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PATCH] test-aio-multithread: simplify test_multi_co_schedule
Date: Fri, 28 Apr 2023 13:19:41 +0200
Message-Id: <20230428111941.149568-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Instead of using qatomic_mb_{read,set} mindlessly, just use a per-coroutine
flag that requires no synchronization.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-aio-multithread.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-aio-multithread.c b/tests/unit/test-aio-multithread.c
index 3c61526a0b46..80c5d4e2e6e3 100644
--- a/tests/unit/test-aio-multithread.c
+++ b/tests/unit/test-aio-multithread.c
@@ -107,8 +107,7 @@ static void test_lifecycle(void)
 /* aio_co_schedule test.  */
 
 static Coroutine *to_schedule[NUM_CONTEXTS];
-
-static bool now_stopping;
+static bool stop[NUM_CONTEXTS];
 
 static int count_retry;
 static int count_here;
@@ -136,6 +135,7 @@ static bool schedule_next(int n)
 
 static void finish_cb(void *opaque)
 {
+    stop[id] = true;
     schedule_next(id);
 }
 
@@ -143,13 +143,19 @@ static coroutine_fn void test_multi_co_schedule_entry(void *opaque)
 {
     g_assert(to_schedule[id] == NULL);
 
-    while (!qatomic_mb_read(&now_stopping)) {
+    /*
+     * The next iteration will set to_schedule[id] again, but once finish_cb
+     * is scheduled there is no guarantee that it will actually be woken up,
+     * so at that point it must not go to sleep.
+     */
+    while (!stop[id]) {
         int n;
 
         n = g_test_rand_int_range(0, NUM_CONTEXTS);
         schedule_next(n);
 
         qatomic_mb_set(&to_schedule[id], qemu_coroutine_self());
+        /* finish_cb can run here.  */
         qemu_coroutine_yield();
         g_assert(to_schedule[id] == NULL);
     }
@@ -161,7 +167,6 @@ static void test_multi_co_schedule(int seconds)
     int i;
 
     count_here = count_other = count_retry = 0;
-    now_stopping = false;
 
     create_aio_contexts();
     for (i = 0; i < NUM_CONTEXTS; i++) {
@@ -171,10 +176,10 @@ static void test_multi_co_schedule(int seconds)
 
     g_usleep(seconds * 1000000);
 
-    qatomic_mb_set(&now_stopping, true);
+    /* Guarantee that each AioContext is woken up from its last wait.  */
     for (i = 0; i < NUM_CONTEXTS; i++) {
         ctx_run(i, finish_cb, NULL);
-        to_schedule[i] = NULL;
+        g_assert(to_schedule[i] == NULL);
     }
 
     join_aio_contexts();
@@ -199,6 +204,7 @@ static uint32_t atomic_counter;
 static uint32_t running;
 static uint32_t counter;
 static CoMutex comutex;
+static bool now_stopping;
 
 static void coroutine_fn test_multi_co_mutex_entry(void *opaque)
 {
-- 
2.40.0


