Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941BC4D8AA7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:21:02 +0100 (CET)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToNR-0001nr-L6
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:21:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nToML-0000xW-3k
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nToMH-0005B4-OX
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647278388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTL7s5fSk8D2VcFqZJw4MKeej0oq8DNxEdTX3DHqQkA=;
 b=dDI1XGPtFgIEWUhKaSXG30GbF5SvdSCvK8Yzh67Dgqr5dOeLVKQZq/C/DvEuXkm2biFa8r
 Ly1z256rw/tkkAtjZEoSx55CQ3V4cZSGRkk9W5X3+AWYATQPSS9o7jQXVP81MUg47ZreF7
 SWxIIdqUdkiH0SHvj1bHEqV2HGF/hUM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-ByuCAmETMXSfUGFshI6RTQ-1; Mon, 14 Mar 2022 13:19:46 -0400
X-MC-Unique: ByuCAmETMXSfUGFshI6RTQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f189-20020a1c38c6000000b0037d1bee4847so9899822wma.9
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=PTL7s5fSk8D2VcFqZJw4MKeej0oq8DNxEdTX3DHqQkA=;
 b=tPgnt2vQZ+atj0twGYEdMnkHJM2Zwu29lH3EKS0o6LHptmZvLl0x9Y9DaYp31RwRkP
 r4pR2amskJIpSrsm0+erg4RQZeJ6E4G6thmW5O11XxH+q85sTxljSEyvZ5xdcmzd04XR
 TC7C5rWLo9A7NV4AqDOGJxBDboQouSOneDWeJdaXKMqJxcLnNsw+WSlRLc1phjxOl629
 kbSIa0cPw3+GlQVEDMM7jphnU2bLaaQ3ybo3UG+7v5VzN101oDoFha+DkJteJuR1Aavl
 A99m3uHUygCC2EhRc0I96/9WreieBitm3hWdWf1GAWEj9TPEnt5LDWMrFGPHD4Hky50H
 znWA==
X-Gm-Message-State: AOAM533PULpkwmRrY/y560F8tTXwpOJpacCsWllkPjDczNnpRvqqnYIl
 tqtAz3OG9EZAzMtZ9z39DUzaNKx8vXdumRxL6WlF1/YgYYxNk8o6hMQWpwBjkTgu0DmfZ6QpX3Q
 a8NR0eZjxrx208uU=
X-Received: by 2002:a5d:51cb:0:b0:203:8dff:e9e4 with SMTP id
 n11-20020a5d51cb000000b002038dffe9e4mr15374029wrv.512.1647278385624; 
 Mon, 14 Mar 2022 10:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc7Wztv/TP9s5dLVYkJg1Y5Q18bpOoa8wAud42hFbU8nih1brAJNBse2M389GaNBths4VVWQ==
X-Received: by 2002:a5d:51cb:0:b0:203:8dff:e9e4 with SMTP id
 n11-20020a5d51cb000000b002038dffe9e4mr15374006wrv.512.1647278385310; 
 Mon, 14 Mar 2022 10:19:45 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:3506:3400:69b5:c807:1d52:ff67?
 ([2a0c:5a80:3506:3400:69b5:c807:1d52:ff67])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d40c1000000b001f1dd6ea504sm13480830wrq.59.2022.03.14.10.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 10:19:44 -0700 (PDT)
Message-ID: <7112867f80057a9c6b5415c5520edb5ba2df895a.camel@redhat.com>
Subject: Re: [PATCH v2 4/4] util/event-loop-base: Introduce options to set
 the thread pool size
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 14 Mar 2022 18:19:43 +0100
In-Reply-To: <Yi9EsuqHBDT6z6x+@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303151307.558607-1-nsaenzju@redhat.com>
 <YinWxsS+gF9kt1hb@stefanha-x1.localdomain>
 <93fee44e8b4aa58dcfd8c088a0f03ec2dedd3b03.camel@redhat.com>
 <Yi9EsuqHBDT6z6x+@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-03-14 at 13:35 +0000, Stefan Hajnoczi wrote:
> On Fri, Mar 11, 2022 at 11:40:30AM +0100, Nicolas Saenz Julienne wrote:
> > On Thu, 2022-03-10 at 10:45 +0000, Stefan Hajnoczi wrote:
> > > On Thu, Mar 03, 2022 at 04:13:07PM +0100, Nicolas Saenz Julienne wrote:
> > > > @@ -537,10 +546,19 @@
> > > >  #                 0 means that the engine will use its default
> > > >  #                 (default:0, since 6.1)
> > > >  #
> > > > +# @thread-pool-min: minimum number of threads readily available in the thread
> > > > +#                   pool
> > > > +#                   (default:0, since 6.2)
> > > > +#
> > > > +# @thread-pool-max: maximum number of threads the thread pool can contain
> > > > +#                   (default:64, since 6.2)
> > > 
> > > Here and elsewhere:
> > > s/6.2/7.1/
> > 
> > Yes, forgot to mention it was a placeholder, as I wasn't sure what version to
> > target.
> > 
> > > > @@ -294,6 +314,36 @@ void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg)
> > > >      thread_pool_submit_aio(pool, func, arg, NULL, NULL);
> > > >  }
> > > >  
> > > > +void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
> > > > +{
> > > > +    qemu_mutex_lock(&pool->lock);
> > > > +
> > > > +    pool->min_threads = ctx->thread_pool_min;
> > > > +    pool->max_threads = ctx->thread_pool_max;
> > > > +
> > > > +    /*
> > > > +     * We either have to:
> > > > +     *  - Increase the number available of threads until over the min_threads
> > > > +     *    threshold.
> > > > +     *  - Decrease the number of available threads until under the max_threads
> > > > +     *    threshold.
> > > > +     *  - Do nothing. the current number of threads fall in between the min and
> > > > +     *    max thresholds. We'll let the pool manage itself.
> > > > +     */
> > > > +    for (int i = pool->cur_threads; i < pool->min_threads; i++) {
> > > > +        spawn_thread(pool);
> > > > +    }
> > > > +
> > > > +    while (pool->cur_threads > pool->max_threads) {
> > > > +        qemu_sem_post(&pool->sem);
> > > > +        qemu_mutex_unlock(&pool->lock);
> > > > +        qemu_cond_wait(&pool->worker_stopped, &pool->lock);
> > > > +        qemu_mutex_lock(&pool->lock);
> > > 
> > > Same question as Patch 1. This looks incorrect because qemu_cond_wait()
> > > already drops pool->lock if it needs to block.
> > 
> > Yes, I'll fix that.
> > 
> > > Also, why wait? If worker threads are blocked for some reason then our
> > > thread will block too.
> > 
> > Exiting thread_pool_update_params() before honoring the new constraints is a
> > source of potential race conditions (having to worry for situations where
> > cur_threads > max_threads), and on systems where determinism is important it's
> > crucial to have a clear boundary between 'unsafe' and 'safe' states.
> 
> On the other hand it creates a reliability problem where a random worker
> thread can block all of QEMU. Maybe it's better to let a blocked worker
> thread terminate eventually than to hang QEMU?

OK, fair enough. I'll switch to that behaviour.

Thanks!

-- 
Nicolás Sáenz


