Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E162C2B1E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:22:35 +0100 (CET)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kha9K-0004UG-IN
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kha4c-0001sy-6X
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:17:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kha4W-0006fm-87
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606231054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gkDf2Jnme7wJ08h3HHfXmYHiV0q5bnyp/My9N8jLs3E=;
 b=HuN4kkiPoLQTZGMXbc0bkC4WzYpEaySFN5/GS4XfWFdMcke0tWJd5THU8egCQSYUfXE2a0
 PVaQrnjdyrxxakm7IjUleoAxl7x5G128zn8iRnXuA6kT7NC9386KeF1g956uX2aLwUDIzS
 2CPKe+p2D57uvv3oBalVEniX7ugAgYo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-fcSvvaqEMcCZ7v0Kdl30gg-1; Tue, 24 Nov 2020 10:17:33 -0500
X-MC-Unique: fcSvvaqEMcCZ7v0Kdl30gg-1
Received: by mail-qk1-f199.google.com with SMTP id 202so17443550qkl.9
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 07:17:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gkDf2Jnme7wJ08h3HHfXmYHiV0q5bnyp/My9N8jLs3E=;
 b=CUJwHwWEDaVUE8pgg0cLnKUdtUCMI2KJmx3XApqXWH61rV8cTIvbGuW6qDb8ZZYoZQ
 BDxXYG0uEjAiCq4n1+0MCGbuCdbOFz/ELqFx/wyYFsV/hN0jvGAODnvybrmQ41chfxcn
 RVub2UNG0S2L2hYBRiWHifNb30UpQp7hFGRfs29dPrfW3w1w0/hLd9GRUbe2Osm7Wtyj
 H5gIjj8lrumykMxoml7aV+8cPPVvNor858S1QgKR63Wu8xUrcgYxBce4udwmrb01EgIw
 9jA89DfBuKQmuRehR+O9iREl7I2xc0Avqb/PZvvHhia2K9Xs+DF+B/Cd200JkFMC+d7o
 +xsw==
X-Gm-Message-State: AOAM530C2/AA2w3afOEExYg8252iAa8fLQwn2uiUmOLKQzvdHZhhEIob
 RVfcu5i/jlshyOB1MQuKQS2y3dA63YBEa98yw25xleza8jlS3+vSxNWG7pk0hZSQVI1whCghkMI
 BYAgudLjveKQjmX8=
X-Received: by 2002:ad4:44ef:: with SMTP id p15mr5231732qvt.37.1606231052263; 
 Tue, 24 Nov 2020 07:17:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUSr0ZZUFEPNquw/ooVey0JGzHoLPJ+NtutQVBC3Smv7MK8BJJ/SQtRoMqcWaCq5kghEgKfw==
X-Received: by 2002:ad4:44ef:: with SMTP id p15mr5231703qvt.37.1606231051866; 
 Tue, 24 Nov 2020 07:17:31 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id p48sm14129347qtp.67.2020.11.24.07.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 07:17:30 -0800 (PST)
Date: Tue, 24 Nov 2020 10:17:29 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
Message-ID: <20201124151729.GA257984@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
 <20201119182516.GB6538@xz-x1>
 <1e35a550-a6a0-fbe2-ac8d-6844ce23b3fb@virtuozzo.com>
 <20201120150703.GE32525@xz-x1>
 <2797b4b6-b083-750f-385b-f0aa09730251@virtuozzo.com>
 <20201120164316.GC60522@xz-x1>
 <c222b7ca-9368-3adc-00fd-5261216f7df1@virtuozzo.com>
 <20201123213443.GE60522@xz-x1>
 <b38025e0-ca06-b7e7-0745-3fa411019dd1@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b38025e0-ca06-b7e7-0745-3fa411019dd1@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 11:02:09AM +0300, Andrey Gruzdev wrote:
> On 24.11.2020 00:34, Peter Xu wrote:
> > On Fri, Nov 20, 2020 at 07:53:34PM +0300, Andrey Gruzdev wrote:
> > > On 20.11.2020 19:43, Peter Xu wrote:
> > > > On Fri, Nov 20, 2020 at 07:15:07PM +0300, Andrey Gruzdev wrote:
> > > > > Yeah, I think we can re-use the postcopy queue code for faulting pages. I'm
> > > > > worring a little about some additional overhead dealing with urgent request
> > > > > semaphore. Also, the code won't change a lot, something like:
> > > > > 
> > > > > [...]
> > > > >           /* In case of 'write-tracking' migration we first try
> > > > >            * to poll UFFD and sse if we have write page fault event */
> > > > >           poll_fault_page(rs);
> > > > > 
> > > > >           again = true;
> > > > >           found = get_queued_page(rs, &pss);
> > > > > 
> > > > >           if (!found) {
> > > > >               /* priority queue empty, so just search for something dirty */
> > > > >               found = find_dirty_block(rs, &pss, &again);
> > > > >           }
> > > > > [...]
> > > > 
> > > > Could I ask what's the "urgent request semaphore"?  Thanks,
> > > > 
> > > 
> > > These function use it (the correct name is 'rate_limit_sem'):
> > > 
> > > void migration_make_urgent_request(void)
> > > {
> > >      qemu_sem_post(&migrate_get_current()->rate_limit_sem);
> > > }
> > > 
> > > void migration_consume_urgent_request(void)
> > > {
> > >      qemu_sem_wait(&migrate_get_current()->rate_limit_sem);
> > > }
> > > 
> > > They are called from ram_save_queue_pages and unqueue_page, accordingly, to
> > > control migration rate limiter.
> > > 
> > > bool migration_rate_limit(void)
> > > {
> > > [...]
> > >          /*
> > >           * Wait for a delay to do rate limiting OR
> > >           * something urgent to post the semaphore.
> > >           */
> > >          int ms = s->iteration_start_time + BUFFER_DELAY - now;
> > >          trace_migration_rate_limit_pre(ms);
> > >          if (qemu_sem_timedwait(&s->rate_limit_sem, ms) == 0) {
> > >              /*
> > >               * We were woken by one or more urgent things but
> > >               * the timedwait will have consumed one of them.
> > >               * The service routine for the urgent wake will dec
> > >               * the semaphore itself for each item it consumes,
> > >               * so add this one we just eat back.
> > >               */
> > >              qemu_sem_post(&s->rate_limit_sem);
> > >              urgent = true;
> > >          }
> > > [...]
> > > }
> > > 
> > 
> > Hmm... Why its overhead could be a problem?  If it's an overhead that can be
> > avoided, then postcopy might want that too.
> > 
> > The thing is I really feel like the snapshot logic can leverage the whole idea
> > of existing postcopy (like get_queued_page/unqueue_page; it's probably due to
> > the fact that both of them want to "migrate some more urgent pages than the
> > background migration, due to either missing/wrprotected pages"), but I might
> > have something missing.
> > 
> > Thanks,
> > 
> 
> I don't think this overhead itself is a problem since its negligible
> compared to other stuff.. You're undoubtly correct about using postcopy idea
> in case when wr-fault pages arrive from the separate thread or external
> source. Then we really need to decouple that separate thread or external
> requestor from the migration thread.
> 
> In this patch series wr-faults arrive in the same migration loop with normal
> scan, so I don't see direct reason to pass it through the queue, but I might
> have missed something from your proposal.

I see your point.  For me whether using a thread is not extremely important -
actually we can have a standalone thread to handle the vcpu faults too just
like postcopy; it's just run on the src host.  My major point is that we should
avoid introducing the extra pss logic because fundamentally it's doing the same
thing as get_queued_page() right now, unless I'm wrong...

So I think your previous poll_fault_page() call is okay; assuming the same poll
model as you used, I mean something like this:

------8<-------
diff --git a/migration/ram.c b/migration/ram.c
index 7811cde643..718dd276c7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1473,6 +1473,14 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
 
     } while (block && !dirty);
 
+    if (!block) {
+        /*
+         * Set the block too if live snapshot is enabled; that's when we have
+         * vcpus got blocked by the wr-protected pages.
+         */
+        block = poll_fault_page(rs, &offset);
+    }
+
     if (block) {
         /*
          * As soon as we start servicing pages out of order, then we have
------8<-------

So as long as we set the block and offset, pss will be updated just like
postcopy.  That's exactly what we want, am I right?

> 
> Do you mean that if we use postcopy logic, we'll allocate memory and make
> copies of faulting pages and then immediately un-protect them?
> Or we just put faulting page address to the queued item and release
> protection after page content has been saved.

I think current approach would be fine, so we don't copy page and unprotect at
a single place after the page is dumped to the precopy stream.  If you could
measure the latencies then it'll be even better, then we'll know what to expect.

IIRC the "copy page first" idea came from Denis's initial version, in which I
thought as too aggresive since potentially it can eat twice the memory on the
host for the single guest, not to mention when live snapshot is taken for
mutliple guests on the same host.  It's just not something that can be directly
expected when the user wants to take a snapshot.  That's something we can do
upon this work, imho, if we'll have very high latency on resolving the page
faults. But that's still the last thing to try (or at least an "by default off"
option) so we can still think about some other solution before trying to eat
too much host mem.

Thanks,

-- 
Peter Xu


