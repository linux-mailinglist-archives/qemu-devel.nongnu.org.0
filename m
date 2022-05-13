Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B07526A68
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 21:32:46 +0200 (CEST)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npb1o-0001ZO-Sz
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 15:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npb0d-0000qQ-Gf
 for qemu-devel@nongnu.org; Fri, 13 May 2022 15:31:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npb0a-0002p9-98
 for qemu-devel@nongnu.org; Fri, 13 May 2022 15:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652470287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jPcjevIuwSiUxabudA/en4SsaiMm799GelDC443JaUw=;
 b=NWkBV8qNdFImcYg+yVBC2eH1wYSyfevJ9wkPN+D0XfameaxezvDngiftvyec8tiZlFbCqX
 BQkPJ/nA1kinOynBdoAmiUqFTQVNgOMM1e5cIQ6tbpYTiSnCcBgQtal+w6PJ5O0/0m39hr
 +FTzsnnQeKy1W4jbQ9mYiQeriTEtzAI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-8c3rENU3M8W_5ySFgliEYw-1; Fri, 13 May 2022 15:31:25 -0400
X-MC-Unique: 8c3rENU3M8W_5ySFgliEYw-1
Received: by mail-io1-f69.google.com with SMTP id
 r17-20020a0566022b9100b00654b99e71dbso5358619iov.3
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 12:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jPcjevIuwSiUxabudA/en4SsaiMm799GelDC443JaUw=;
 b=E5b8WeqT5lW2Crk94JLGR9sNs6QIRsNlBFow+y65B26Rxteiknt83UVusJsRLBN5OT
 gJccXCb4zwzydGqBp7W6O9vgWBKbKzTuXAdnCvbX+kNjltNZgE2y7P/XvLXj/30Wukc0
 SCepsKPb0Aw+ZzXSS3Etxam1bISs0T/gHllQea3sn5B7dbRSKX1PJB4I/uTViJo7Soxi
 qkXVcPJaiKSJqzHVGYwUs47L6ZyJV6xgezMQUtgO7R3WPyieejeE6Y+CTY/PU6OXAvMf
 x27XXnq9GlSuQnIAZBLhJT3oDc1CvLE1OJiU1uFWMy8gvJN4e2JtUJygl6tjB7DjJm8/
 GSjg==
X-Gm-Message-State: AOAM533znPZVtHnrv9ZorxQqs4Uf/PoHtEXa/s+BQ9VjxoezvF6r/2qm
 5LU30OOv/7CYlGI4IPI5nov/ICyv0imNtAbQMCLYoZ8YTmKHw9PQ4VBN8U1b1n8ekLT5hj0vet3
 htTIO6/7N4iJVxi4=
X-Received: by 2002:a05:6638:258b:b0:32d:b5e8:b282 with SMTP id
 s11-20020a056638258b00b0032db5e8b282mr3689548jat.16.1652470285003; 
 Fri, 13 May 2022 12:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0uHDqAOnTYZWv/YjI/cbEEFGU4zDG8Kl/iORltlY7JtD8Cyw07hfErNEjBcsW/82Wt0RudA==
X-Received: by 2002:a05:6638:258b:b0:32d:b5e8:b282 with SMTP id
 s11-20020a056638258b00b0032db5e8b282mr3689532jat.16.1652470284707; 
 Fri, 13 May 2022 12:31:24 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a056638191500b0032b3a7817c5sm890827jal.137.2022.05.13.12.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 12:31:23 -0700 (PDT)
Date: Fri, 13 May 2022 15:31:22 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 10/19] migration: Postcopy preemption enablement
Message-ID: <Yn6yCg9VL4cYe25v@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-11-peterx@redhat.com>
 <b42e7619-7ba7-6933-b4d7-b67b06704d15@nutanix.com>
 <Yn00O5Ag2nPLZEyq@xz-m1.local>
 <734316b2-df50-83e5-7b5d-b2fae8f871a1@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <734316b2-df50-83e5-7b5d-b2fae8f871a1@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 14, 2022 at 12:23:44AM +0530, manish.mishra wrote:
> 
> On 12/05/22 9:52 pm, Peter Xu wrote:
> > Hi, Manish,
> > 
> > On Wed, May 11, 2022 at 09:24:28PM +0530, manish.mishra wrote:
> > > > @@ -1962,9 +2038,17 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
> > > >        RAMBlock  *block;
> > > >        ram_addr_t offset;
> > > > +again:
> > > >        block = unqueue_page(rs, &offset);
> > > > -    if (!block) {
> > > > +    if (block) {
> > > > +        /* See comment above postcopy_preempted_contains() */
> > > > +        if (postcopy_preempted_contains(rs, block, offset)) {
> > > > +            trace_postcopy_preempt_hit(block->idstr, offset);
> > > > +            /* This request is dropped */
> > > > +            goto again;
> > > > +        }
> > > If we continuosly keep on getting new post-copy request. Is it possible this
> > > case can starve post-copy request which is in precopy preemtion?
> > I didn't fully get your thoughts, could you elaborate?
> > 
> > Here we're checking against the case where the postcopy requested page is
> > exactly the one that we have preempted in previous precopy sessions.  If
> > true, we drop this postcopy page and continue with the rest.
> > 
> > When there'll be no postcopy requests pending then we'll continue with the
> > precopy page, which is exactly the request we've dropped.
> > 
> > Why we did this is actually in comment above postcopy_preempted_contains(),
> > and quotting from there:
> > 
> > /*
> >   * This should really happen very rarely, because it means when we were sending
> >   * during background migration for postcopy we're sending exactly the page that
> >   * some vcpu got faulted on on dest node.  When it happens, we probably don't
> >   * need to do much but drop the request, because we know right after we restore
> >   * the precopy stream it'll be serviced.  It'll slightly affect the order of
> >   * postcopy requests to be serviced (e.g. it'll be the same as we move current
> >   * request to the end of the queue) but it shouldn't be a big deal.  The most
> >   * imporant thing is we can _never_ try to send a partial-sent huge page on the
> >   * POSTCOPY channel again, otherwise that huge page will got "split brain" on
> >   * two channels (PRECOPY, POSTCOPY).
> >   */
> > 
> > [...]
> 
> Hi Peter, what i meant here is that as we go to precopy sending only when
> there is
> 
> no post-copy request left so if there is some workload which is continuosly
> generating
> 
> new post-copy fault request, It may take very long before we resume on
> precopy channel.
> 
> So basically precopy channel may have a post-copy request pending for very
> long in
> 
> this case? Earlier as it was FCFS there was a guarantee a post-copy request
> will be
> 
> served after a fixed amount of time.

Ah that's a good point.

In that case maybe what we want to do is to restore this preemption
immediately using postcopy_preempt_restore(), however we may also want to
make sure this huge page won't get preempted by any other postcopy pages.

One thing in my mind to do this is to add one more field to the pss
structure, we could call it pss->urgent.

Previously we have only had pss->postcopy_requested showing that whether
one request comes from postcopy and whether we should send this page via
the postcopy preempt channel.  We also use that as a hint so we will never
preempt a huge page when postcopy_requested is set.  Now we probably want
to separate that out of pss->urgent, so postcopy_requested will be mostly
like before (along with the new pss->urgent set to 1 for all postcopy
pages), except that we may want to also set pss->urgent to 1 for this very
special case even for precopy pages, so that we won't preempt this page as
well.

I'm thinking maybe it's not wise to directly change the patch when I
repost.  My current plan is I'll add one more patch at the end, so I won't
easily give away Dave's R-b meanwhile hopefully that could make reviewers
easy.  We could consider squashing that patch in if we'll commit the whole
thing, or we can even keep them separate as a further optimization.

> 
> > > > @@ -2211,7 +2406,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> > > >            return 0;
> > > >        }
> > > > +    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
> > > I see why there is only one extra channel, multiFD is not supported for
> > > postcopy. Peter, Any particular reason for that.
> > We used one channel not because multifd is not enabled - if you read into
> > the series the channels are separately managed because they're servicing
> > different goals.  It's because I don't really know whether multiple
> > channels would be necessary, because postcopy requests should not be the
> > major channel that pages will be sent, kind of a fast-path.
> > 
> > One of the major goal of this series is to avoid interruptions made to
> > postcopy urgent pages due to sending of precopy pages.  One extra channel
> > already serviced it well, so I just stopped there as the initial version.
> > I actually raised that question myself too in the cover letter in the todo
> > section, I think we can always evaluate the possibility of that in the
> > future without major reworks (but we may need another parameter to specify
> > the num of threads just like multifd).
> 
> >because postcopy requests should not be the major channel that pages will
> be sent, kind of a fast-path.
> 
> Yes, agree Peter, but in worst case scenario it is possible we may have to
> transfer full memory of VM
> 
> by post-copy requests? So in that case we may require higher number of
> threads. But agree there can not be
> 
> be binding with number of mutliFD channels as multiFD uses 256KB buffer size
> but here we may have to 4k
> 
> in small page case so there can be big diff in throughput limits. Also
> smaller the buffer size much higher will
> 
> be cpu usage so it needs to be decided carefully.

Right, and I see your point here.

It's just non-trivial to both gain performance and low latency imho.  But
maybe you have a good point in that it also means with preemption mode on
and with an extremely busy VM we could have put multifd into a vain even if
we'll support both multifd+preempt in the future.

But anyway - let's think more of it and let's solve problems one by one.

The worst case is we'll have low bw for such migration but it still keeps
relatively good responsiveness on dest page faults for now.

Thanks,

-- 
Peter Xu


