Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829FE4D5FE9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:41:56 +0100 (CET)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSciY-00087x-M2
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:41:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nSchK-0007EF-Sj
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:40:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nSchI-00051u-NO
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646995236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WT8mKcfL6Q9D/cMiOQlDs/fjMkyxUH6p/+MU6awdiiQ=;
 b=OZ9ttf2HszgZMIsgBxexjk62bwpWqT3Gw8PM7Ex63Ofu3HPsLABaIxjoyboqlwj3qvRsMS
 jkYqbTrXyj7ixL/xGUqa3t4d6JxTaRsHxwUxw8e6Wn7ANVOwLs5db05koZHxN0fp9SGBEl
 MSBMk1sEN9/Ket6mvoIeJ9PaLvXDAT4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-TtATbYbAMxuje_5PxM1VpQ-1; Fri, 11 Mar 2022 05:40:33 -0500
X-MC-Unique: TtATbYbAMxuje_5PxM1VpQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f189-20020a1c38c6000000b0037d1bee4847so5334357wma.9
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 02:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=WT8mKcfL6Q9D/cMiOQlDs/fjMkyxUH6p/+MU6awdiiQ=;
 b=RimHN2M9v97eAxdfTztIvXpUZxalHOju9Q4LEPrixIvpZTFPqeLF5eikLusHtTO1K/
 ATUfAMxweMwssmwrll+qHYMrsw041fjHGO7gqbJP/GoHu7EnRTnlSVIgIi/nYAlySNLv
 3GfJb6+mP457oGRen1/u4wFizxyMF65i6kMM/RXOVL7spWbIFSO+hae3RJfgd6o/8ylC
 6G2AIcNeUmwnixJxifv+LlG8ozU2rDNYLeIFpnRV0lyqtPGjFfPlz4IGuld38RFlMjQ0
 HAWLT7EfQr5+5qTk1BvI11VQp5OrRDTHFBw+gbZ1YxXo6MYJImw3XMKyP7A5a92QO0/S
 uU9Q==
X-Gm-Message-State: AOAM532f83Lu6P5bzqZyze2fOvyiafsOyOA4QmW5MrrHoSBRbhVj7IgR
 Ptavl3qdsfa0LtLCiddxRRfBfh1x2qk4byyEBLNeLv9EesFjvmzkEBmZzbp3mWjUddQqrERvRgg
 vwCliOJuSLBo57G0=
X-Received: by 2002:a5d:4251:0:b0:203:7346:7f8b with SMTP id
 s17-20020a5d4251000000b0020373467f8bmr6656692wrr.91.1646995231885; 
 Fri, 11 Mar 2022 02:40:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9AvRFeY7ryzZQ/Wy9+1HR4P/0Ser4ZEUYTcGlDSWUqZ2aoW1p2FM6/OlXJ1ARRMrusNo7cw==
X-Received: by 2002:a5d:4251:0:b0:203:7346:7f8b with SMTP id
 s17-20020a5d4251000000b0020373467f8bmr6656666wrr.91.1646995231598; 
 Fri, 11 Mar 2022 02:40:31 -0800 (PST)
Received: from ?IPv6:2a0c:5a80:3506:3400:69b5:c807:1d52:ff67?
 ([2a0c:5a80:3506:3400:69b5:c807:1d52:ff67])
 by smtp.gmail.com with ESMTPSA id
 y10-20020adfee0a000000b001f0639001ffsm9379698wrn.9.2022.03.11.02.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 02:40:31 -0800 (PST)
Message-ID: <93fee44e8b4aa58dcfd8c088a0f03ec2dedd3b03.camel@redhat.com>
Subject: Re: [PATCH v2 4/4] util/event-loop-base: Introduce options to set
 the thread pool size
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Fri, 11 Mar 2022 11:40:30 +0100
In-Reply-To: <YinWxsS+gF9kt1hb@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303151307.558607-1-nsaenzju@redhat.com>
 <YinWxsS+gF9kt1hb@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 2022-03-10 at 10:45 +0000, Stefan Hajnoczi wrote:
> On Thu, Mar 03, 2022 at 04:13:07PM +0100, Nicolas Saenz Julienne wrote:
> > @@ -537,10 +546,19 @@
> >  #                 0 means that the engine will use its default
> >  #                 (default:0, since 6.1)
> >  #
> > +# @thread-pool-min: minimum number of threads readily available in the thread
> > +#                   pool
> > +#                   (default:0, since 6.2)
> > +#
> > +# @thread-pool-max: maximum number of threads the thread pool can contain
> > +#                   (default:64, since 6.2)
> 
> Here and elsewhere:
> s/6.2/7.1/

Yes, forgot to mention it was a placeholder, as I wasn't sure what version to
target.

> > @@ -294,6 +314,36 @@ void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg)
> >      thread_pool_submit_aio(pool, func, arg, NULL, NULL);
> >  }
> >  
> > +void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
> > +{
> > +    qemu_mutex_lock(&pool->lock);
> > +
> > +    pool->min_threads = ctx->thread_pool_min;
> > +    pool->max_threads = ctx->thread_pool_max;
> > +
> > +    /*
> > +     * We either have to:
> > +     *  - Increase the number available of threads until over the min_threads
> > +     *    threshold.
> > +     *  - Decrease the number of available threads until under the max_threads
> > +     *    threshold.
> > +     *  - Do nothing. the current number of threads fall in between the min and
> > +     *    max thresholds. We'll let the pool manage itself.
> > +     */
> > +    for (int i = pool->cur_threads; i < pool->min_threads; i++) {
> > +        spawn_thread(pool);
> > +    }
> > +
> > +    while (pool->cur_threads > pool->max_threads) {
> > +        qemu_sem_post(&pool->sem);
> > +        qemu_mutex_unlock(&pool->lock);
> > +        qemu_cond_wait(&pool->worker_stopped, &pool->lock);
> > +        qemu_mutex_lock(&pool->lock);
> 
> Same question as Patch 1. This looks incorrect because qemu_cond_wait()
> already drops pool->lock if it needs to block.

Yes, I'll fix that.

> Also, why wait? If worker threads are blocked for some reason then our
> thread will block too.

Exiting thread_pool_update_params() before honoring the new constraints is a
source of potential race conditions (having to worry for situations where
cur_threads > max_threads), and on systems where determinism is important it's
crucial to have a clear boundary between 'unsafe' and 'safe' states.

Thanks,

-- 
Nicolás Sáenz


