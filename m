Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963CB2C89A2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:35:21 +0100 (CET)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjm92-0003Km-Cj
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kjm6K-00029l-HQ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:32:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kjm6I-0001gV-Ae
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606753949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hGfkNCYabARpx4Ds/a/yiFhJcmFkdJBJdQ7Qsm7V7Nw=;
 b=FW/juudC0Go0Q5MwXngL+Dpz9UJc9MHzPNSiWqe/YIgwMBP8zMCZs3EhK3vDHybgC6XIvp
 Kbt+WO2WlOUDRQgZ04JenR3nZ4I6/IfW92Q6duNwUVmyi9SCT5hZngqTbZSK2k3BQPtzOQ
 tUi+++fPpU1eGjmEFj7BSjZ92CJbIAw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-L8m6GmPLNSyeNrxumDXf7A-1; Mon, 30 Nov 2020 11:32:25 -0500
X-MC-Unique: L8m6GmPLNSyeNrxumDXf7A-1
Received: by mail-qk1-f197.google.com with SMTP id x196so10065311qkb.12
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 08:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hGfkNCYabARpx4Ds/a/yiFhJcmFkdJBJdQ7Qsm7V7Nw=;
 b=LNIhUjaCpkpv2O7YfZbwSNVUXqujmv10yX36Fz4645YPA4zZjhj78NGG11UcAPWmfe
 Azut6rDvrIeVa121E0sVKA5fdwic+b+E6XNevYiRKBdnfQyAmZzN7eTNGNeCvX9nnuqc
 W+C5gEvJNHlphunxckc9pkisR/wIm+Qro9+GGsKNYBNaumUD4//LeOWgVAuiPG0FzPMf
 +ZS1nexqV1UDu4FN7HI+pYHMupgAncGF0iXAalPizh1fPT7A5VkAUN9xVtiYzFbgDzLb
 xhIqQzJroDTbgzRPYaGyMpA/07Oq3IWH4Ryp/fiiuvOtvmsyGbgHdjTepvbm0IXt/+O9
 j0Vg==
X-Gm-Message-State: AOAM530ppK8KVo5npnIQB6+RokqWZxVijoNMYaPUC44ahN03IeV8n2X3
 fplQ6f37pmLZtDMg2b9A7gIU4AwizRv0Sl20Yw3LOUU8OFzKsfKq2KRda9G3UkCpZUfEQI3es7y
 xkRkdkFvm+kfxTSo=
X-Received: by 2002:a05:620a:2019:: with SMTP id
 c25mr2355549qka.282.1606753944503; 
 Mon, 30 Nov 2020 08:32:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUlGPc3vr4tAQwS7qQJw+wjsYK7DJsyKOIj8VzKbW099hi6uoefwwCbN6t5pViQWIaynJdEA==
X-Received: by 2002:a05:620a:2019:: with SMTP id
 c25mr2355515qka.282.1606753944078; 
 Mon, 30 Nov 2020 08:32:24 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id e131sm16688339qkb.101.2020.11.30.08.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:32:23 -0800 (PST)
Date: Mon, 30 Nov 2020 11:32:21 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 3/6] support UFFD write fault processing in
 ram_save_iterate()
Message-ID: <20201130163221.GB3277@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-4-andrey.gruzdev@virtuozzo.com>
 <20201127214949.GG6573@xz-x1>
 <f0fb8488-7d86-d6f9-947d-9455eb135970@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <f0fb8488-7d86-d6f9-947d-9455eb135970@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Nov 30, 2020 at 12:14:03AM +0300, Andrey Gruzdev wrote:
> > > +#ifdef CONFIG_LINUX
> > > +/**
> > > + * ram_find_block_by_host_address: find RAM block containing host page
> > > + *
> > > + * Returns pointer to RAMBlock if found, NULL otherwise
> > > + *
> > > + * @rs: current RAM state
> > > + * @page_address: host page address
> > > + */
> > > +static RAMBlock *ram_find_block_by_host_address(RAMState *rs, hwaddr page_address)
> > 
> > Reuse qemu_ram_block_from_host() somehow?
> > 
> 
> Seems not very suitable here, since we use rs->last_seen_block to restart
> search..

The search logic is actually still the same, it's just about which block to
start searching (rs->last_seen_block, ram_list.mru_block, or the 1st one).  So
an internal helper to pass in that information would be nice.  Though that'll
require rcu lock taken before hand to keep the ramblock ptr valid.

No worry - we can keep this and work on top too, I think.

[...]

> > > +static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
> > > +{
> > > +    struct uffd_msg uffd_msg;
> > > +    hwaddr page_address;
> > > +    RAMBlock *bs;
> > > +    int res;
> > > +
> > > +    if (!migrate_background_snapshot()) {
> > > +        return NULL;
> > > +    }
> > > +
> > > +    res = uffd_read_events(rs->uffdio_fd, &uffd_msg, 1);
> > > +    if (res <= 0) {
> > > +        return NULL;
> > > +    }
> > > +
> > > +    page_address = uffd_msg.arg.pagefault.address;
> > > +    bs = ram_find_block_by_host_address(rs, page_address);
> > > +    if (!bs) {
> > > +        /* In case we couldn't find respective block, just unprotect faulting page. */
> > > +        uffd_protect_memory(rs->uffdio_fd, page_address, TARGET_PAGE_SIZE, false);
> > > +        error_report("ram_find_block_by_host_address() failed: address=0x%0lx",
> > > +                page_address);
> > 
> > Looks ok to error_report() instead of assert(), but I'll suggest drop the call
> > to uffd_protect_memory() at least.  The only reason to not use assert() is
> > because we try our best to avoid crashing the vm, however I really doubt
> > whether uffd_protect_memory() is the right thing to do even if it happens - we
> > may at last try to unprotect some strange pages that we don't even know where
> > it is...
> > 
> 
> IMHO better to unprotect these strange pages then to leave them protected by
> UFFD.. To avoid getting VM completely in-operational.
> At least we know the page generated wr-fault, maybe due to incorrect
> write-tracking initialization, or RAMBlock somehow has gone. Nevertheless if
> leave the page as is, VM would certainly lock.

Yes makes some senes too.  However it's definitely a severe programming error,
even if the VM is unblocked, it can be in a very weird state...

Maybe we just assert? Then we can see how unlucky we'll be. :)

> 
> Hmm, I wonder about assert(). In QEMU it would do something in release
> builds?

I guess yes, at least for now.  Because osdep.h has this:

/*
 * We have a lot of unaudited code that may fail in strange ways, or
 * even be a security risk during migration, if you disable assertions
 * at compile-time.  You may comment out these safety checks if you
 * absolutely want to disable assertion overhead, but it is not
 * supported upstream so the risk is all yours.  Meanwhile, please
 * submit patches to remove any side-effects inside an assertion, or
 * fixing error handling that should use Error instead of assert.
 */
#ifdef NDEBUG
#error building with NDEBUG is not supported
#endif
#ifdef G_DISABLE_ASSERT
#error building with G_DISABLE_ASSERT is not supported
#endif

[...]

> > > +/**
> > > + * ram_save_host_page_post: ram_save_host_page() post-notifier
> > > + *
> > > + * @rs: current RAM state
> > > + * @pss: page-search-status structure
> > > + * @opaque: opaque context value
> > > + * @res_override: pointer to the return value of ram_save_host_page(),
> > > + *   overwritten in case of an error
> > > + */
> > > +static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
> > > +        void *opaque, int *res_override)
> > > +{
> > > +    /* Check if page is from UFFD-managed region. */
> > > +    if (pss->block->flags & RAM_UF_WRITEPROTECT) {
> > > +#ifdef CONFIG_LINUX
> > > +        ram_addr_t page_from = (ram_addr_t) opaque;
> > > +        hwaddr page_address = (hwaddr) pss->block->host +
> > > +                              ((hwaddr) page_from << TARGET_PAGE_BITS);
> > 
> > I feel like most new uses of hwaddr is not correct...  As I also commented in
> > the other patch.  We should save a lot of castings if switched.
> > 
> 
> Need to check. hwaddr is typedef'ed as uint64_t while ram_addr_t as
> uintptr_t. I any case UFFD interface relies on u64 type.

For example, page_from should be a host address, we can use unsigned long, or
uint64_t, but ram_addr_t is not proper, which is only used in ramblock address
space.

I think it's fine that e.g. we use common types like uint64_t directly.

> 
> > > +        hwaddr run_length = (hwaddr) (pss->page - page_from + 1) << TARGET_PAGE_BITS;
> > > +        int res;
> > > +
> > > +        /* Flush async buffers before un-protect. */
> > > +        qemu_fflush(rs->f);
> > > +        /* Un-protect memory range. */
> > > +        res = uffd_protect_memory(rs->uffdio_fd, page_address, run_length, false);
> > > +        /* We don't want to override existing error from ram_save_host_page(). */
> > > +        if (res < 0 && *res_override >= 0) {
> > > +            *res_override = res;
> > 
> > What is this used for?  If res<0, I thought we should just fail the snapshot.
> > 
> > Meanwhile, res_override points to "pages", and then it'll be rewrite to the
> > errno returned by uffd_protect_memory().  Smells strange.
> > 
> > Can this ever be triggered anyway?
> > 
> 
> Yes, since "pages" is also for error return, if negative. If we have a
> problem with un-protecting, promote the error to the loop in
> ram_find_and_save_block() so it exits early ("pages" guaranteed to be
> non-zero). In outer routines retcode would go to qemu_set_file_error().

Ok I see your point.

> 
> > > +        }
> > > +#else
> > > +        /* Should never happen */
> > > +        qemu_file_set_error(rs->f, -ENOSYS);
> > > +#endif /* CONFIG_LINUX */
> > > +    }
> > > +}
> > > +
> > >   /**
> > >    * ram_find_and_save_block: finds a dirty page and sends it to f
> > >    *
> > > @@ -1779,14 +1908,14 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
> > >           return pages;
> > >       }
> > > +    if (!rs->last_seen_block) {
> > > +        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
> > 
> > Why setup the last seen block to be the first if null?
> > 
> 
> Because ram_find_block_by_host_address() relies on rs->last_seen_block.
> Pss is not passed to that routine.

Ok, but it's odd - because that's not the real "last seen block".

So now I'm rethinking maybe we could still reuse qemu_ram_block_from_host() by
providing a new helper to do the search logic as mentioned above, which could
take a pointer of RAMBlock as the 1st ramblock to search.  Then
ram_find_block_by_host_address() should pass in rs->last_seen_block (which
could be NULL - then we'll start with the 1st ramblock), or ram_list.mru_block
for qemu_ram_block_from_host().  That could be a standalone new patch, then we
don't need this slightly strange change.  What do you think?

> 
> > > +    }
> > > +
> > >       pss.block = rs->last_seen_block;
> > >       pss.page = rs->last_page;
> > >       pss.complete_round = false;
> > > -    if (!pss.block) {
> > > -        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
> > > -    }
> > > -
> > >       do {
> > >           again = true;
> > >           found = get_queued_page(rs, &pss);
> > > @@ -1797,7 +1926,11 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
> > >           }
> > >           if (found) {
> > > +            void *opaque;
> > > +
> > > +            ram_save_host_page_pre(rs, &pss, &opaque);
> > >               pages = ram_save_host_page(rs, &pss, last_stage);
> > > +            ram_save_host_page_post(rs, &pss, opaque, &pages);
> > 
> > So the pre/post idea is kind of an overkill to me...
> > 
> > How about we do the unprotect in ram_save_host_page() in the simple way, like:
> > 
> >    ram_save_host_page()
> >      start_addr = pss->page;
> >      do {
> >        ...
> >        (migrate pages)
> >        ...
> >      } while (...);
> >      if (background_snapshot_enabled()) {
> >        unprotect pages within start_addr to pss->page;
> >      }
> >      ...
> > 
> 
> Personally I prefer not to modify existing code. May be adding to simple
> calls would finally look cleaner?

Let's wait a 3rd opinion from Juan/Dave or others.

Thanks,

-- 
Peter Xu


