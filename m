Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56937FF97
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 23:06:57 +0200 (CEST)
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhIXp-0003lc-0p
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 17:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhIVj-0001EJ-IY
 for qemu-devel@nongnu.org; Thu, 13 May 2021 17:04:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhIVh-0003Qp-KU
 for qemu-devel@nongnu.org; Thu, 13 May 2021 17:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620939884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6KvB9LmheqTlBZAKjSu7GeftuNc1lGX54O8TXMlSC0=;
 b=OzfZOTT12YAbOMBo32n3BBrgZss26xsFVNkdAw+BzXwStgB2KFD/d0/1GCxxMl/8a0dDKn
 /LITp1mAPP78KLeaYb9QYv04/bzxugU1jN+hpuLerF8XyBpGrxSr+XKpDzxQbrjfdrBVpG
 CWDFyXEvptwXJbzKG1RgC472vsPT7io=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-ooWcXhIwM4iak4gN1zd7Vw-1; Thu, 13 May 2021 17:04:42 -0400
X-MC-Unique: ooWcXhIwM4iak4gN1zd7Vw-1
Received: by mail-ed1-f69.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so15250909edc.15
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 14:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k6KvB9LmheqTlBZAKjSu7GeftuNc1lGX54O8TXMlSC0=;
 b=oMVH3vGMkGV/HrhRyAK9057loRbAaNyfMjnbsq0RlpYQrTtkGMwN2KyPUc5ywdEEhg
 WjW2cuI+1W6Shik5n6brRKh2UKGLtdlE/1JHzkC36xLl2K1/7wM7ZNJewpc6a4i3FkM+
 7wtcVk96p/VOWDIVYXBo6VXI9Q8FQsjgWd+tXvxCgT+ME5sHxzo4+iaPBAHXM/P/wy/z
 8BMQtUaGxiv8sDvDmjXxNdkFKO92qD8Ud1w2whHpahUXjDRKlhUITs9z8PcyJahkqe7E
 Cfc/lp90kftuvvrmD6iCwgs8Q6WIMqzIREhsWqUtTxTsQg+FiE6OphZMcvvnf8/ZZB0g
 QyVQ==
X-Gm-Message-State: AOAM5307f3toNmNKI2VuC60GuROLflH+p5s6/hRFPx2j9uzARbJDWa2N
 Y5ltwmry0fGEppENK9AnEU6ouagV2B2VW7dlHZYadmFH4lJcY7rte/mBgiFaQvzgLoKP73cBOmp
 PCz/d48ggBC/kOFQ=
X-Received: by 2002:a17:906:980f:: with SMTP id
 lm15mr33675522ejb.337.1620939879764; 
 Thu, 13 May 2021 14:04:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAtl0izukSXw2SM4RcR9xc98mCNzJEZwqVyUzjN6CcLo+V+4E9HdT5HGi21egIR0crckahYQ==
X-Received: by 2002:a17:906:980f:: with SMTP id
 lm15mr33675497ejb.337.1620939879480; 
 Thu, 13 May 2021 14:04:39 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a22sm1895393ejs.84.2021.05.13.14.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 14:04:38 -0700 (PDT)
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
 <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
 <19ff6e67-e548-14df-ac7e-8b0a3bf7a798@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ef518e01-4f08-5fe7-b226-e70ab3102ca4@redhat.com>
Date: Thu, 13 May 2021 23:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <19ff6e67-e548-14df-ac7e-8b0a3bf7a798@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru,
 Stefan Hajnoczi <stefanha@redhat.com>, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 09:15, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>
>> I don't understand.  Why doesn't aio_co_enter go through the ctx != 
>> qemu_get_current_aio_context() branch and just do aio_co_schedule?  
>> That was at least the idea behind aio_co_wake and aio_co_enter.
>>
> 
> Because ctx is exactly qemu_get_current_aio_context(), as we are not in 
> iothread but in nbd connection thread. So, 
> qemu_get_current_aio_context() returns qemu_aio_context.

So the problem is that threads other than the main thread and
the I/O thread should not return qemu_aio_context.  The vCPU thread
may need to return it when running with BQL taken, though.

Something like this (untested):

diff --git a/include/block/aio.h b/include/block/aio.h
index 5f342267d5..10fcae1515 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -691,10 +691,13 @@ void aio_co_enter(AioContext *ctx, struct Coroutine *co);
   * Return the AioContext whose event loop runs in the current thread.
   *
   * If called from an IOThread this will be the IOThread's AioContext.  If
- * called from another thread it will be the main loop AioContext.
+ * called from the main thread or with the "big QEMU lock" taken it
+ * will be the main loop AioContext.
   */
  AioContext *qemu_get_current_aio_context(void);
  
+void qemu_set_current_aio_context(AioContext *ctx);
+
  /**
   * aio_context_setup:
   * @ctx: the aio context
diff --git a/iothread.c b/iothread.c
index 7f086387be..22b967e77c 100644
--- a/iothread.c
+++ b/iothread.c
@@ -39,11 +39,23 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
  #define IOTHREAD_POLL_MAX_NS_DEFAULT 0ULL
  #endif
  
-static __thread IOThread *my_iothread;
+static __thread AioContext *my_aiocontext;
+
+void qemu_set_current_aio_context(AioContext *ctx)
+{
+    assert(!my_aiocontext);
+    my_aiocontext = ctx;
+}
  
  AioContext *qemu_get_current_aio_context(void)
  {
-    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
+    if (my_aiocontext) {
+        return my_aiocontext;
+    }
+    if (qemu_mutex_iothread_locked()) {
+        return qemu_get_aio_context();
+    }
+    return NULL;
  }
  
  static void *iothread_run(void *opaque)
@@ -56,7 +68,7 @@ static void *iothread_run(void *opaque)
       * in this new thread uses glib.
       */
      g_main_context_push_thread_default(iothread->worker_context);
-    my_iothread = iothread;
+    qemu_set_current_aio_context(iothread->ctx);
      iothread->thread_id = qemu_get_thread_id();
      qemu_sem_post(&iothread->init_done_sem);
  
diff --git a/stubs/iothread.c b/stubs/iothread.c
index 8cc9e28c55..25ff398894 100644
--- a/stubs/iothread.c
+++ b/stubs/iothread.c
@@ -6,3 +6,7 @@ AioContext *qemu_get_current_aio_context(void)
  {
      return qemu_get_aio_context();
  }
+
+void qemu_set_current_aio_context(AioContext *ctx)
+{
+}
diff --git a/tests/unit/iothread.c b/tests/unit/iothread.c
index afde12b4ef..cab38b3da8 100644
--- a/tests/unit/iothread.c
+++ b/tests/unit/iothread.c
@@ -30,13 +30,26 @@ struct IOThread {
      bool stopping;
  };
  
-static __thread IOThread *my_iothread;
+static __thread AioContext *my_aiocontext;
+
+void qemu_set_current_aio_context(AioContext *ctx)
+{
+    assert(!my_aiocontext);
+    my_aiocontext = ctx;
+}
  
  AioContext *qemu_get_current_aio_context(void)
  {
-    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
+    if (my_aiocontext) {
+        return my_aiocontext;
+    }
+    if (qemu_mutex_iothread_locked()) {
+        return qemu_get_aio_context();
+    }
+    return NULL;
  }
  
+
  static void iothread_init_gcontext(IOThread *iothread)
  {
      GSource *source;
@@ -54,7 +67,7 @@ static void *iothread_run(void *opaque)
  
      rcu_register_thread();
  
-    my_iothread = iothread;
+    qemu_set_current_aio_context(iothread->ctx);
      qemu_mutex_lock(&iothread->init_done_lock);
      iothread->ctx = aio_context_new(&error_abort);
  
diff --git a/util/main-loop.c b/util/main-loop.c
index d9c55df6f5..4ae5b23e99 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -170,6 +170,7 @@ int qemu_init_main_loop(Error **errp)
      if (!qemu_aio_context) {
          return -EMFILE;
      }
+    qemu_set_current_aio_context(qemu_aio_context);
      qemu_notify_bh = qemu_bh_new(notify_event_cb, NULL);
      gpollfds = g_array_new(FALSE, FALSE, sizeof(GPollFD));
      src = aio_get_g_source(qemu_aio_context);

If it works for you, I can post it as a formal patch.

Paolo


