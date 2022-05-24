Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9BD5330A0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 20:47:10 +0200 (CEST)
Received: from localhost ([::1]:57408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntZYi-0002wk-Rn
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 14:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntZUd-0002EX-Tv
 for qemu-devel@nongnu.org; Tue, 24 May 2022 14:42:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntZUW-0002H7-Mw
 for qemu-devel@nongnu.org; Tue, 24 May 2022 14:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653417766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o/8qbk1rtyFk+IoIfBKEtRFIkTrPHpnj9aVCxjKMwAE=;
 b=UbN8SQzzts+dCts4nV+sLb+RZpMXX9ptxRukOMR2WH8xm+6+Hw9YkoIIxCM80koLOmNbEd
 IWN9HodNkufoOZwZoV2IAwpnUM0JK018V+XATlBP5w1UUdtzwK2qX5tRqbZCazL5ZG6Ven
 rGA6CWJItJ0+Q9fWpIyktnbnXBMjbHg=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-iP5-_jxiNae79Ewrd8McqA-1; Tue, 24 May 2022 14:42:45 -0400
X-MC-Unique: iP5-_jxiNae79Ewrd8McqA-1
Received: by mail-il1-f198.google.com with SMTP id
 c1-20020a928e01000000b002d1b20aa761so4001618ild.6
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 11:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o/8qbk1rtyFk+IoIfBKEtRFIkTrPHpnj9aVCxjKMwAE=;
 b=E6Q+KZQLJ+eaXYWkyt7qPtLmUnkxeveCsMjrGOjn+4fDszoF+H36CZpGdBKLVY8IU6
 DPa7+/gxKRjEVigdmKGAnaeKTldV6Dtg6Xku6nFlF2aLh/XRVCw6iCbszSUvMLNGeYCJ
 +jJsRYsJG2w+Iv0MVaY29XBQt1YZ2EHKjkMdCkq3CPEZ+OSvsFoeJwhOcfgvsqLkc4jT
 +SsovUulRfMd7ww87o3x/OARqassfEnDX95a5IbXS4Vv2ggMFfe5P9iKI8nzkR+E/OOc
 vUBV5oFaHiS0Q3tzBagBI9O2X6O6gjwOPjL060dKYijq9XgQkG0yxb6iQdOq42BKJ+Bq
 XzFg==
X-Gm-Message-State: AOAM530DDKyrUCxsZny5gya6HGJuDfDeixNws3XOI+wgpFBFY17NjtX3
 XsuTJB2lHchisDULSKZ9pOxIfCdqeqb6v/9TUA0T5fFufxo2Q0009RO0jZoy9CAP7pFiO9t51Zs
 8i/oJuEX4sXZlWCk=
X-Received: by 2002:a6b:400b:0:b0:64c:77aa:40a6 with SMTP id
 k11-20020a6b400b000000b0064c77aa40a6mr12446097ioa.101.1653417764428; 
 Tue, 24 May 2022 11:42:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf+gVhyruUYwylZgY/twICoNL4MtIcHUPUEf+scGs1e0ml/6wYdbixajS/bS1XoPe8+R1D5g==
X-Received: by 2002:a6b:400b:0:b0:64c:77aa:40a6 with SMTP id
 k11-20020a6b400b000000b0064c77aa40a6mr12446084ioa.101.1653417764111; 
 Tue, 24 May 2022 11:42:44 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a29-20020a027a1d000000b0032e1a07228asm3607129jac.26.2022.05.24.11.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 11:42:43 -0700 (PDT)
Date: Tue, 24 May 2022 14:42:41 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v6 10/13] migration: Respect postcopy request order in
 preemption mode
Message-ID: <Yo0nIYoTDFclTWmx@xz-m1.local>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-11-peterx@redhat.com>
 <YotoTrRaTIaQdVR4@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YotoTrRaTIaQdVR4@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Mon, May 23, 2022 at 11:56:14AM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > With preemption mode on, when we see a postcopy request that was requesting
> > for exactly the page that we have preempted before (so we've partially sent
> > the page already via PRECOPY channel and it got preempted by another
> > postcopy request), currently we drop the request so that after all the
> > other postcopy requests are serviced then we'll go back to precopy stream
> > and start to handle that.
> > 
> > We dropped the request because we can't send it via postcopy channel since
> > the precopy channel already contains partial of the data, and we can only
> > send a huge page via one channel as a whole.  We can't split a huge page
> > into two channels.
> > 
> > That's a very corner case and that works, but there's a change on the order
> > of postcopy requests that we handle since we're postponing this (unlucky)
> > postcopy request to be later than the other queued postcopy requests.  The
> > problem is there's a possibility that when the guest was very busy, the
> > postcopy queue can be always non-empty, it means this dropped request will
> > never be handled until the end of postcopy migration. So, there's a chance
> > that there's one dest QEMU vcpu thread waiting for a page fault for an
> > extremely long time just because it's unluckily accessing the specific page
> > that was preempted before.
> > 
> > The worst case time it needs can be as long as the whole postcopy migration
> > procedure.  It's extremely unlikely to happen, but when it happens it's not
> > good.
> > 
> > The root cause of this problem is because we treat pss->postcopy_requested
> > variable as with two meanings bound together, as the variable shows:
> > 
> >   1. Whether this page request is urgent, and,
> >   2. Which channel we should use for this page request.
> > 
> > With the old code, when we set postcopy_requested it means either both (1)
> > and (2) are true, or both (1) and (2) are false.  We can never have (1)
> > and (2) to have different values.
> > 
> > However it doesn't necessarily need to be like that.  It's very legal that
> > there's one request that has (1) very high urgency, but (2) we'd like to
> > use the precopy channel.  Just like the corner case we were discussing
> > above.
> > 
> > To differenciate the two meanings better, introduce a new field called
> > postcopy_target_channel, showing which channel we should use for this page
> > request, so as to cover the old meaning (2) only.  Then we leave the
> > postcopy_requested variable to stand only for meaning (1), which is the
> > urgency of this page request.
> > 
> > With this change, we can easily boost priority of a preempted precopy page
> > as long as we know that page is also requested as a postcopy page.  So with
> > the new approach in get_queued_page() instead of dropping that request, we
> > send it right away with the precopy channel so we get back the ordering of
> > the page faults just like how they're requested on dest.
> > 
> > Alongside, I touched up find_dirty_block() to only set the postcopy fields
> > in the pss section if we're going through a postcopy migration.  That's a
> > very light optimization and shouldn't affect much.
> > 
> > Reported-by: manish.mishra@nutanix.com
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> So I think this is OK; getting a bit complicated!

Yes it is.  I added some more comment, hopefully it'll help a little bit.

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks!

> >  static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
> >  {
> > -    /* This is not a postcopy requested page */
> > -    pss->postcopy_requested = false;
> > +    if (migration_in_postcopy()) {
> > +        /*
> > +         * This is not a postcopy requested page, mark it "not urgent", and
> > +         * use precopy channel to send it.
> > +         */
> > +        pss->postcopy_requested = false;
> > +        pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
> > +    }
> 
> Do you need the 'if' here?

Hmm good question..  precopy should always have these two fields cleared
anyway so I wanted to avoid setting them every time, but I just noticed
that pss is not initialized at all when used..

static int ram_find_and_save_block(RAMState *rs)
{
    PageSearchStatus pss;
    ...
}

So either we'd reset pss explicitly on these fields, or simpler - let me
drop the if..

Thanks,

-- 
Peter Xu


