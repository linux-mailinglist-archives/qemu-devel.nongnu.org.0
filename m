Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D25252C3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:39:38 +0200 (CEST)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBqj-0001qW-Pu
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npBaF-0003nE-1z
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:22:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npBaB-00035j-Tl
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652372550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zy6KYcN5eO2bzhaxf+FwEKrQp+8Jm9YdiNrdNiTyWqo=;
 b=EYYWBfGyCcjQlnnQ+o1aJQkOdHbdUOIkQyJ8vwlu61/Eqow6TVUKO0pzwNCwmBEwuOkZYK
 egh5KgeQzYqwn+IfkCe75TYSngxSnEa3oS3SC3HuhutZDk7pZOWUmIJSXbCzipGN0HY23I
 TYMAyg4vDCtlaygFycpl+OOAo0fLtGE=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-4gGPtp6YMeOh0qzTLbkYpQ-1; Thu, 12 May 2022 12:22:21 -0400
X-MC-Unique: 4gGPtp6YMeOh0qzTLbkYpQ-1
Received: by mail-il1-f197.google.com with SMTP id
 i24-20020a056e021d1800b002cf0541f514so3548763ila.13
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zy6KYcN5eO2bzhaxf+FwEKrQp+8Jm9YdiNrdNiTyWqo=;
 b=rp8nM2Olfo4P5W0KoB7iUvcwvXVNkaZ7mDkI2jmy6Vu7JVOnngBqssQFaEwMh+93wx
 WVX/RqZtpS9s7X/bM6rNjVaPj2YkMHIk+sZ2H+2h0yBmWlUkYbRem1xt4o4Db7lsq5QR
 MCsiaNuD8cRIWBMG6JixXzK/+X8+dX7P1bgcz8KGFTGEee2nJkWW/VnaRFxsy1QNY82K
 5fJmOKKAnMnMCEgCKuzCMDC8UVZH87aggj+OuYycfqzwmwGodi0A1NQkUc7z6PbYPd+v
 IbR4ljoE3i4zkb6O4qgfIxdLAyI7uyIIJObu4pOzFwO1BYWbqE/0oCzYdcXZIzKS2Xzc
 j6uw==
X-Gm-Message-State: AOAM533//vlDu+bvc2h0Ib9M7NH7YG8V5hkcupU65YKSrCvlyrMAQggr
 PoouffJFByYp7FLHxS4wXxr/AM3eVajJO2lMHWm3kiBKL5YUpb6pORxUvxbqZxdzTLCpCf5Fxib
 Ij/dkoHZEy1SvQBw=
X-Received: by 2002:a05:6638:58f:b0:32b:6055:b7d9 with SMTP id
 a15-20020a056638058f00b0032b6055b7d9mr420963jar.64.1652372540903; 
 Thu, 12 May 2022 09:22:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw+gRg+dFdNw5TVrl0IQEs38YP4hq6Zi4wptF2SVy4ppuvCV8Iy/hWD6iSl9Fy2lFlOHfBJQ==
X-Received: by 2002:a05:6638:58f:b0:32b:6055:b7d9 with SMTP id
 a15-20020a056638058f00b0032b6055b7d9mr420945jar.64.1652372540609; 
 Thu, 12 May 2022 09:22:20 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a6b7513000000b0065a48a57f6dsm57109ioh.40.2022.05.12.09.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:22:20 -0700 (PDT)
Date: Thu, 12 May 2022 12:22:19 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 10/19] migration: Postcopy preemption enablement
Message-ID: <Yn00O5Ag2nPLZEyq@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-11-peterx@redhat.com>
 <b42e7619-7ba7-6933-b4d7-b67b06704d15@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b42e7619-7ba7-6933-b4d7-b67b06704d15@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Manish,

On Wed, May 11, 2022 at 09:24:28PM +0530, manish.mishra wrote:
> > @@ -1962,9 +2038,17 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
> >       RAMBlock  *block;
> >       ram_addr_t offset;
> > +again:
> >       block = unqueue_page(rs, &offset);
> > -    if (!block) {
> > +    if (block) {
> > +        /* See comment above postcopy_preempted_contains() */
> > +        if (postcopy_preempted_contains(rs, block, offset)) {
> > +            trace_postcopy_preempt_hit(block->idstr, offset);
> > +            /* This request is dropped */
> > +            goto again;
> > +        }
> If we continuosly keep on getting new post-copy request. Is it possible this
> case can starve post-copy request which is in precopy preemtion?

I didn't fully get your thoughts, could you elaborate?

Here we're checking against the case where the postcopy requested page is
exactly the one that we have preempted in previous precopy sessions.  If
true, we drop this postcopy page and continue with the rest.

When there'll be no postcopy requests pending then we'll continue with the
precopy page, which is exactly the request we've dropped.

Why we did this is actually in comment above postcopy_preempted_contains(),
and quotting from there:

/*
 * This should really happen very rarely, because it means when we were sending
 * during background migration for postcopy we're sending exactly the page that
 * some vcpu got faulted on on dest node.  When it happens, we probably don't
 * need to do much but drop the request, because we know right after we restore
 * the precopy stream it'll be serviced.  It'll slightly affect the order of
 * postcopy requests to be serviced (e.g. it'll be the same as we move current
 * request to the end of the queue) but it shouldn't be a big deal.  The most
 * imporant thing is we can _never_ try to send a partial-sent huge page on the
 * POSTCOPY channel again, otherwise that huge page will got "split brain" on
 * two channels (PRECOPY, POSTCOPY).
 */

[...]

> > @@ -2211,7 +2406,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> >           return 0;
> >       }
> > +    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
> 
> I see why there is only one extra channel, multiFD is not supported for
> postcopy. Peter, Any particular reason for that.

We used one channel not because multifd is not enabled - if you read into
the series the channels are separately managed because they're servicing
different goals.  It's because I don't really know whether multiple
channels would be necessary, because postcopy requests should not be the
major channel that pages will be sent, kind of a fast-path.

One of the major goal of this series is to avoid interruptions made to
postcopy urgent pages due to sending of precopy pages.  One extra channel
already serviced it well, so I just stopped there as the initial version.
I actually raised that question myself too in the cover letter in the todo
section, I think we can always evaluate the possibility of that in the
future without major reworks (but we may need another parameter to specify
the num of threads just like multifd).

> 
> As it must be very bad without multiFD, we have seen we can not utilise NIC
> higher than 10 Gbps without multiFD. If it
> 
> is something in TODO can we help with that?

Yes, that should be on Juan's todo list (in the cc list as well), and
AFAICT he'll be happy if anyone would like to take items out of the list.
We can further discuss it somewhere.

One thing to mention is that I suspect the thread models will still need to
be separate even if multifd joins the equation.  I mean, IMHO multifd
threads take chunks of pages and send things in bulk, while if you read
into this series postcopy preempt threads send page one by one and asap.
The former cares on throughput and latter cares latency.  When we design
the mix of postcopy+multifd it'll be great we also keep this in mind so
hopefully it'll make postcopy+multifd+preempt easier at last.

Thanks,

-- 
Peter Xu


