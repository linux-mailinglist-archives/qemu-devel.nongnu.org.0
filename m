Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49602BAD1E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:10:59 +0100 (CET)
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg83u-00057z-V2
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kg80G-0002t2-IZ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:07:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kg80E-0004ny-GA
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605884829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MpVwDgsC1HnD9kV3ryof+sqmK9DKBosK8ujjPm1Tjls=;
 b=DHCVSR7ep9Y3M1B3/5HLCTBcTvl5+/dsner50RTLRwcHn8+/QbzNZnMHD/huNjyU9kxPSB
 zf9lWR7tqejttt6Z4zxZTs4dGxAg6pxXbHdYM51J71NlHOWWnT8adWGwELhNcxhD74BX+O
 d+mwIsyNEYSdyVNL5hi+B/7DxPfLgo0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-HWE-YH4gOhKFan4nze8JNw-1; Fri, 20 Nov 2020 10:07:07 -0500
X-MC-Unique: HWE-YH4gOhKFan4nze8JNw-1
Received: by mail-qk1-f200.google.com with SMTP id r124so660619qkd.8
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MpVwDgsC1HnD9kV3ryof+sqmK9DKBosK8ujjPm1Tjls=;
 b=MHUtACrz4kq/1Ugm+U69HFHtQI+ga2Q+7Vop1g2QD26tmAgu32gJOsjFHq2qn4YSAm
 2hb9KyropNtcfTB335N3S4EpR+WJanB72SNywVfFNpylTmGIvDGI0aNm/NQOpuJDGNMM
 YxZpbtegLwB3JhIfIVWnZtlTi8ajRo0kf4bawdcScRrZtNydfEg63UQ+8VdJrJ1D8nCy
 xFNJyMb+dkkoblQB62LyWijJxwo2MolYotAWSQ4yRyE4mniRnnW2J8Q+n4Mt1/5cT+0r
 Pn9EA81mP/KVKGTp9bAUbD2mV9LFM4WwGurWHF9rnuNAbykSooChIKemrzm0T+fLddI2
 pdXQ==
X-Gm-Message-State: AOAM533p8nhZ1iPLSOrmeHosNLxWJ8jtnyIUeD73N0/7hpC5MUHVYDC+
 wjUAthVvrZNKB+tZBhXwxwb/8baAQ5ZV79gKhMDDUQfSX1o1AoYegRvMEtv2/rdNdkafP8xacCT
 LtMTKkOhf4sR58Ig=
X-Received: by 2002:a37:7e82:: with SMTP id
 z124mr16467920qkc.107.1605884826848; 
 Fri, 20 Nov 2020 07:07:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylMYtciqnlHZ5L3dJcR094eFGlh7NaoWr0yhqWry4z2f7q9kxMn4uzY24wxYBOsxUGxr3FgQ==
X-Received: by 2002:a37:7e82:: with SMTP id
 z124mr16467877qkc.107.1605884826501; 
 Fri, 20 Nov 2020 07:07:06 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id w45sm2199064qtw.96.2020.11.20.07.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:07:05 -0800 (PST)
Date: Fri, 20 Nov 2020 10:07:03 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
Message-ID: <20201120150703.GE32525@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
 <20201119182516.GB6538@xz-x1>
 <1e35a550-a6a0-fbe2-ac8d-6844ce23b3fb@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <1e35a550-a6a0-fbe2-ac8d-6844ce23b3fb@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Nov 20, 2020 at 01:44:53PM +0300, Andrey Gruzdev wrote:
> On 19.11.2020 21:25, Peter Xu wrote:
> > On Thu, Nov 19, 2020 at 03:59:36PM +0300, Andrey Gruzdev via wrote:
> > 
> > [...]
> > 
> > > +/**
> > > + * ram_find_block_by_host_address: find RAM block containing host page
> > > + *
> > > + * Returns true if RAM block is found and pss->block/page are
> > > + * pointing to the given host page, false in case of an error
> > > + *
> > > + * @rs: current RAM state
> > > + * @pss: page-search-status structure
> > > + */
> > > +static bool ram_find_block_by_host_address(RAMState *rs, PageSearchStatus *pss,
> > > +        hwaddr page_address)
> > > +{
> > > +    bool found = false;
> > > +
> > > +    pss->block = rs->last_seen_block;
> > > +    do {
> > > +        if (page_address >= (hwaddr) pss->block->host &&
> > > +            (page_address + TARGET_PAGE_SIZE) <=
> > > +                    ((hwaddr) pss->block->host + pss->block->used_length)) {
> > > +            pss->page = (unsigned long)
> > > +                    ((page_address - (hwaddr) pss->block->host) >> TARGET_PAGE_BITS);
> > > +            found = true;
> > > +            break;
> > > +        }
> > > +
> > > +        pss->block = QLIST_NEXT_RCU(pss->block, next);
> > > +        if (!pss->block) {
> > > +            /* Hit the end of the list */
> > > +            pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
> > > +        }
> > > +    } while (pss->block != rs->last_seen_block);
> > > +
> > > +    rs->last_seen_block = pss->block;
> > > +    /*
> > > +     * Since we are in the same loop with ram_find_and_save_block(),
> > > +     * need to reset pss->complete_round after switching to
> > > +     * other block/page in pss.
> > > +     */
> > > +    pss->complete_round = false;
> > > +
> > > +    return found;
> > > +}
> > 
> > I forgot whether Denis and I have discussed this, but I'll try anyways... do
> > you think we can avoid touching PageSearchStatus at all?
> > 
> > PageSearchStatus is used to track a single migration iteration for precopy, so
> > that we scan from the 1st ramblock until the last one.  Then we finish one
> > iteration.
> > 
> 
> Yes, my first idea also was to separate normal iteration from write-fault
> page source completely and leave pss for normal scan.. But, the other idea
> is to keep some locality in respect to last write fault. I mean it seems to
> be more optimal to re-start normal scan on the page that is next to faulting
> one. In this case we can save and un-protect
> the neighborhood faster and prevent many write faults.

Yeah locality sounds reasonable, and you just reminded me the fact that
postcopy has that already I think. :) Just see get_queued_page():

    if (block) {
        /*
         * As soon as we start servicing pages out of order, then we have
         * to kill the bulk stage, since the bulk stage assumes
         * in (migration_bitmap_find_and_reset_dirty) that every page is
         * dirty, that's no longer true.
         */
        rs->ram_bulk_stage = false;

        /*
         * We want the background search to continue from the queued page
         * since the guest is likely to want other pages near to the page
         * it just requested.
         */
        pss->block = block;
        pss->page = offset >> TARGET_PAGE_BITS;

        /*
         * This unqueued page would break the "one round" check, even is
         * really rare.
         */
        pss->complete_round = false;
    }

So as long as we queue the pages onto the src_page_requests queue, it'll take
care of write locality already, iiuc.

> 
> > Snapshot is really something, imho, that can easily leverage this structure
> > without touching it - basically we want to do two things:
> > 
> >    - Do the 1st iteration of precopy (when ram_bulk_stage==true), and do that
> >      only.  We never need the 2nd, 3rd, ... iterations because we're snapshoting.
> > 
> >    - Leverage the postcopy queue mechanism so that when some page got written,
> >      queue that page.  We should have this queue higher priority than the
> >      precopy scanning mentioned above.
> > 
> > As long as we follow above rules, then after the above 1st round precopy, we're
> > simply done...  If that works, the whole logic of precopy and PageSearchStatus
> > does not need to be touched, iiuc.
> > 
> > [...]
> > 
> 
> It's quite good alternative and I thought about using postcopy page queue,
> but this implementation won't consider the locality of writes..
> 
> What do you think?

So now I think "Do the 1st iteration of precopy only" idea won't work, but
still please consider whether it's natural to just reuse postcopy's queue
mechanism.  IOW, to see whether we can avoid major of the pss logic changes in
this patch.

Thanks,

-- 
Peter Xu


