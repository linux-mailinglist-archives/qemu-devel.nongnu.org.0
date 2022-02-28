Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B563B4C78BC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:22:52 +0100 (CET)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlbf-0001MR-OW
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nOlZa-0000PU-Fb
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:20:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nOlZX-000188-3U
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646076038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bv1Trq1koVKAzkSiGpqaZp1bd5IpqVJzV+8TWau5q2Q=;
 b=jAWtZ2UcaDrqVIz5Q8YPfzt4apmGup1RgwbkbihDEXw1fp+Oh4LJWj6dYV9Jhr0+eoPk7/
 7V9W12+EQGC+2NLex/BnjWLCRw5Ht83EIMMtpAfCbh94zD8h8idnX1en4+6JBiZTuk09VF
 6+P9mpLfCnXJTBCLUZ8SLFPlR6ktN8o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-xqHCN5VQOrm9zmKjN8BGmQ-1; Mon, 28 Feb 2022 14:20:36 -0500
X-MC-Unique: xqHCN5VQOrm9zmKjN8BGmQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m34-20020a05600c3b2200b0038115c73361so929268wms.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 11:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=bv1Trq1koVKAzkSiGpqaZp1bd5IpqVJzV+8TWau5q2Q=;
 b=yp22VAp7m2H3vcmple3stUHBPpyo8NfrUzqVC40IRhFtMAWaVOtlE1cPYCeWtyPgQ5
 Res3DhitZml006GfwmBpBuTWYHlcZ2r2NW5Q7lQ8uyIgWS7ac7s4WO9CSLgA7QtJWIHR
 V1pYHfp/M4+0m3XqOSUcibfLnaZ5fkvHeOCkyhPuo51+NJ6H6jdjU9IJN8VYwg+PzKPw
 bL2lY4sRFI6CX9im3rxi4K+2cTJfw/aSoo6SLETi2IHlJFbk6VmhotNh1V1UAG7gIHKs
 r984EAd5w0B+JZrL04bi/iaXCPOl+CiEyC0P5cygpoq1MWuffvuCHV1b4OR6/+jIWOul
 wyCw==
X-Gm-Message-State: AOAM532vUqv5peNF0DGuonQirFyi+Kt5Gn27PYK8e9yNwrZoeHTA+x9S
 lxEmKdrdAbIM2WZ26IW5AGuWExCB+1yaFGuGuAPk5BEAc274PouiCCg6/qTBTilft6/rOqtcN4s
 Ygk8NZNR4nFp036Q=
X-Received: by 2002:a05:6000:1b8a:b0:1e4:b3a3:4c1f with SMTP id
 r10-20020a0560001b8a00b001e4b3a34c1fmr17188786wru.202.1646076035402; 
 Mon, 28 Feb 2022 11:20:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/oFxyUAGXJ5MB3LtPnVCLIIBpvUeR0j4G37rwjphvb/IZG7Pzp8Hf4F1ZurKkOKZ82oKBgg==
X-Received: by 2002:a05:6000:1b8a:b0:1e4:b3a3:4c1f with SMTP id
 r10-20020a0560001b8a00b001e4b3a34c1fmr17188764wru.202.1646076035099; 
 Mon, 28 Feb 2022 11:20:35 -0800 (PST)
Received: from ?IPv6:2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8?
 ([2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a1c7402000000b0038159076d30sm269448wmc.22.2022.02.28.11.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 11:20:34 -0800 (PST)
Message-ID: <bf4b58738cd5dc2273dca781867bb5e135d57596.camel@redhat.com>
Subject: Re: [PATCH 3/3] util/event-loop: Introduce options to set the
 thread pool size
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 28 Feb 2022 20:20:33 +0100
In-Reply-To: <YhdgtPe2FRnPp2J7@stefanha-x1.localdomain>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
 <20220221170843.849084-4-nsaenzju@redhat.com>
 <YhdgtPe2FRnPp2J7@stefanha-x1.localdomain>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, 2022-02-24 at 10:40 +0000, Stefan Hajnoczi wrote:
> On Mon, Feb 21, 2022 at 06:08:45PM +0100, Nicolas Saenz Julienne wrote:
> > The thread pool regulates itself: when idle, it kills threads until
> > empty, when in demand, it creates new threads until full. This behaviour
> > doesn't play well with latency sensitive workloads where the price of
> > creating a new thread is too high. For example, when paired with qemu's
> > '-mlock', or using safety features like SafeStack, creating a new thread
> > has been measured take multiple milliseconds.
> > 
> > In order to mitigate this let's introduce a new 'EventLoopBackend'
> > property to set the thread pool size. The threads will be created during
> > the pool's initialization, remain available during its lifetime
> > regardless of demand, and destroyed upon freeing it. A properly
> > characterized workload will then be able to configure the pool to avoid
> > any latency spike.
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> > ---
> >  include/block/aio.h | 11 +++++++++++
> >  qapi/qom.json       |  4 +++-
> >  util/async.c        |  3 +++
> >  util/event-loop.c   | 15 ++++++++++++++-
> >  util/event-loop.h   |  4 ++++
> >  util/main-loop.c    | 13 +++++++++++++
> >  util/thread-pool.c  | 41 +++++++++++++++++++++++++++++++++++++----
> >  7 files changed, 85 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/block/aio.h b/include/block/aio.h
> > index 5634173b12..331483d1d1 100644
> > --- a/include/block/aio.h
> > +++ b/include/block/aio.h
> > @@ -192,6 +192,8 @@ struct AioContext {
> >      QSLIST_HEAD(, Coroutine) scheduled_coroutines;
> >      QEMUBH *co_schedule_bh;
> >  
> > +    int pool_min;
> > +    int pool_max;
> 
> Are these fields protected by ThreadPool->lock? Please document. This is
> a clue that maybe these fields belong in ThreadPool.

Yes they are. I'll document it properly.

> Regarding the field names: the AioContext thread pool field is called
> thread_pool and the user-visible parameters are thread-pool-min/max. I
> suggest calling the fields thread_pool_min/max too so it's clear which
> pool we're talking about and there is a correspondence to user-visible
> parameters.

Noted.

> > @@ -350,3 +358,28 @@ void thread_pool_free(ThreadPool *pool)
> >      qemu_mutex_destroy(&pool->lock);
> >      g_free(pool);
> >  }
> > +
> > +void aio_context_set_thread_pool_params(AioContext *ctx, uint64_t min,
> > +                                        uint64_t max, Error **errp)
> > +{
> > +    ThreadPool *pool = ctx->thread_pool;
> > +
> > +    if (min > max || !max) {
> 
> ctx->pool_min/max are int while the min/max arguments are uint64_t.
> Please add an INT_MAX check to detect overflow.

Noted.

> > +        error_setg(errp, "bad thread-pool-min/thread-pool-max values");
> > +        return;
> > +    }
> > +
> > +    if (pool) {
> > +        qemu_mutex_lock(&pool->lock);
> > +    }
> 
> This code belongs in util/thread-pool.c. I guess the reason for keeping
> the fields in AioContext instead of ThreadPool is because the ThreadPool
> is created on demand and we'd have nowhere to store the parameter value.

Indeed.

> I suggest we bite the bullet and keep an extra copy of the variables in
> AioContext with a clean ThreadPool interface (thread_pool_set_params())
> instead of letting AioContext and ThreadPool access each other's
> internals.

OK!

> > +
> > +    ctx->pool_min = min;
> > +    ctx->pool_max = max;
> > +
> > +    if (pool) {
> > +        for (int i = pool->cur_threads; i < ctx->pool_min; i++) {
> > +            spawn_thread(pool);
> > +        }
> 
> What about the reverse: when min is lowered and there are a bunch of
> idle worker threads we could wake them up so they terminate until
> ->pool_min is reached again?

Makes sense, I'll look into it.

-- 
Nicolás Sáenz


