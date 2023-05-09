Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CD6FC247
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:05:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHX-0005Ez-4D; Tue, 09 May 2023 05:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHV-0005Eq-QG
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHQ-0004uB-Ca
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kl80vY+VUw7NnwTzuUpG42syLJf//UlV3zS0xxo1J/8=;
 b=Mrpu557CQJWO63VLuSMFUv49NM+td0zroXe5RR8L12wJRT1tcTLMYEbrYfAEPIj46ZeyAY
 l9rbjrxPZ4LfTemO6NIb2krjacXbJ4wqa5AZFFyqzMTZrzUcUjT3T3RAFIs7tdR/gLiMht
 aC1HXLjl6PxE7O/9eC0avBQaCnx6kXI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-DGiR_VcKPtuanirqRJafwg-1; Tue, 09 May 2023 05:05:05 -0400
X-MC-Unique: DGiR_VcKPtuanirqRJafwg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50bc57d7967so6441811a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623104; x=1686215104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kl80vY+VUw7NnwTzuUpG42syLJf//UlV3zS0xxo1J/8=;
 b=aU6sOnypjykcDzhREkvqAKrfyH9cJgVcntlcH4xzwWoWiaatF7Y71Z0CwgnnND2a7Z
 o5UIperB5Ox2lHJdwT2f49NJzHOg0iNlaqpd03pwyXXGs4aaD0is3PVWPxsDcCmQ/lha
 6+WncBBubocf8a+9+eWgN9vCkoDYIjfCPCR67f7gx5xCQrJJq2hbWMh18WbDKYwSVEus
 vgjdPJglsZYHDBF6wFzuXro8V/+no6L0nZL7SztgMwrlL18cvDZ1RoE+ULLQh2YDUQAg
 yK0Nu8wp7+zyhx7lZm7G2DkBOEJTmc2YOApuLnD2Ct+ViovVzI0mc4zk2PQMdGCXBxqr
 xPVg==
X-Gm-Message-State: AC+VfDxRfqzJzs9E2iOr1Bq0MGK/TKqDsq/NTFE3RK9jUxgVlgb7QIQ6
 7scrHML99sBspaq2a0+G6vC8b66E+un7IoqmTVSNPyvICAmf9ukCKdSepxJh9P7m5aX5PWuc88j
 m5TnN9Ni7QpvlS4tG5jnLKXVr3dhPkyeCCPjN9x+px/0u2q5JR/XRwcT0Y08zHKPF784H/5pMEG
 E=
X-Received: by 2002:aa7:d609:0:b0:50d:8894:8c11 with SMTP id
 c9-20020aa7d609000000b0050d88948c11mr7819558edr.11.1683623104107; 
 Tue, 09 May 2023 02:05:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yCN15aHIjtCpPyhBlnILQ+LQu8SBAt8LWMbB/5iyVWvO/3D1EJ14cuc5kA9Ja4aaxxxAN0Q==
X-Received: by 2002:aa7:d609:0:b0:50d:8894:8c11 with SMTP id
 c9-20020aa7d609000000b0050d88948c11mr7819546edr.11.1683623103719; 
 Tue, 09 May 2023 02:05:03 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05640203c500b0050d82f96860sm533070edw.59.2023.05.09.02.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 03/16] test-aio-multithread: simplify test_multi_co_schedule
Date: Tue,  9 May 2023 11:04:40 +0200
Message-Id: <20230509090453.37884-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Instead of using qatomic_mb_{read,set} mindlessly, just use a per-coroutine
flag that requires no synchronization.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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
2.40.1


