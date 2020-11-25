Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691592C47D7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 19:43:35 +0100 (CET)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khzlO-0007cr-2j
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 13:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khzk5-00075U-VE
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:42:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khzk1-0003VQ-7M
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606329724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fn5Bx42zWzvqFR/DBvXeN2aaVTzhUslRPuGOk0/JwQw=;
 b=ZZtw3k4KAm3R9h3QzUfCR+YFPGtzKfMK3uTiVge8nGdX9Y7SDkLIG7VaHuZ+hrL0T8iu5g
 1BrcxS+/4ulbBudyOsPnOAgSpYGSqvEvJLzyc3Uo34XWQ5BxrPE4iYq36wQs5CCbKjj87V
 aYemZAgF7Kz0GKdfmcvVOdVexFJTpXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-WSI7hUJ1MMSSCw0BrIU4dw-1; Wed, 25 Nov 2020 13:42:02 -0500
X-MC-Unique: WSI7hUJ1MMSSCw0BrIU4dw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6AE411CC7EC;
 Wed, 25 Nov 2020 18:41:59 +0000 (UTC)
Received: from work-vm (ovpn-115-12.ams2.redhat.com [10.36.115.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9EB35C1B4;
 Wed, 25 Nov 2020 18:41:57 +0000 (UTC)
Date: Wed, 25 Nov 2020 18:41:55 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
Message-ID: <20201125184155.GI3222@work-vm>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
 <20201125130825.GE3222@work-vm>
 <2d755397-4053-c883-3832-5d475c88b546@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <2d755397-4053-c883-3832-5d475c88b546@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> On 25.11.2020 16:08, Dr. David Alan Gilbert wrote:
> > * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> > > In this particular implementation the same single migration
> > > thread is responsible for both normal linear dirty page
> > > migration and procesing UFFD page fault events.
> > > 
> > > Processing write faults includes reading UFFD file descriptor,
> > > finding respective RAM block and saving faulting page to
> > > the migration stream. After page has been saved, write protection
> > > can be removed. Since asynchronous version of qemu_put_buffer()
> > > is expected to be used to save pages, we also have to flush
> > > migraion stream prior to un-protecting saved memory range.
> > > 
> > > Write protection is being removed for any previously protected
> > > memory chunk that has hit the migration stream. That's valid
> > > for pages from linear page scan along with write fault pages.
> > > 
> > > Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> > > ---
> > >   migration/ram.c | 124 ++++++++++++++++++++++++++++++++++++++++++++----
> > >   1 file changed, 115 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/migration/ram.c b/migration/ram.c
> > > index 7f273c9996..08a1d7a252 100644
> > > --- a/migration/ram.c
> > > +++ b/migration/ram.c
> > > @@ -314,6 +314,8 @@ struct RAMState {
> > >       ram_addr_t last_page;
> > >       /* last ram version we have seen */
> > >       uint32_t last_version;
> > > +    /* 'write-tracking' migration is enabled */
> > > +    bool ram_wt_enabled;
> > >       /* We are in the first round */
> > >       bool ram_bulk_stage;
> > >       /* The free page optimization is enabled */
> > > @@ -574,8 +576,6 @@ static int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp)
> > >       return 0;
> > >   }
> > > -__attribute__ ((unused))
> > > -static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count);
> > >   __attribute__ ((unused))
> > >   static bool uffd_poll_events(int uffd, int tmo);
> > > @@ -1929,6 +1929,86 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
> > >       return pages;
> > >   }
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
> > > +
> > > +/**
> > > + * get_fault_page: try to get next UFFD write fault page and, if pending fault
> > > + *   is found, put info about RAM block and block page into pss structure
> > > + *
> > > + * Returns true in case of UFFD write fault detected, false otherwise
> > > + *
> > > + * @rs: current RAM state
> > > + * @pss: page-search-status structure
> > > + *
> > > + */
> > > +static bool get_fault_page(RAMState *rs, PageSearchStatus *pss)
> > > +{
> > > +    struct uffd_msg uffd_msg;
> > > +    hwaddr page_address;
> > > +    int res;
> > > +
> > > +    if (!rs->ram_wt_enabled) {
> > > +        return false;
> > > +    }
> > > +
> > > +    res = uffd_read_events(rs->uffdio_fd, &uffd_msg, 1);
> > > +    if (res <= 0) {
> > > +        return false;
> > > +    }
> > > +
> > > +    page_address = uffd_msg.arg.pagefault.address;
> > > +    if (!ram_find_block_by_host_address(rs, pss, page_address)) {
> > > +        /* In case we couldn't find respective block, just unprotect faulting page */
> > > +        uffd_protect_memory(rs->uffdio_fd, page_address, TARGET_PAGE_SIZE, false);
> > > +        error_report("ram_find_block_by_host_address() failed: address=0x%0lx",
> > > +                     page_address);
> > > +        return false;
> > > +    }
> > > +
> > > +    return true;
> > > +}
> > > +
> > >   /**
> > >    * ram_find_and_save_block: finds a dirty page and sends it to f
> > >    *
> > > @@ -1955,25 +2035,50 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
> > >           return pages;
> > >       }
> > > +    if (!rs->last_seen_block) {
> > > +        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
> > > +    }
> > >       pss.block = rs->last_seen_block;
> > >       pss.page = rs->last_page;
> > >       pss.complete_round = false;
> > > -    if (!pss.block) {
> > > -        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
> > > -    }
> > > -
> > >       do {
> > > +        ram_addr_t page;
> > > +        ram_addr_t page_to;
> > > +
> > >           again = true;
> > > -        found = get_queued_page(rs, &pss);
> > > -
> > > +        /* In case of 'write-tracking' migration we first try
> > > +         * to poll UFFD and get write page fault event */
> > > +        found = get_fault_page(rs, &pss);
> > > +        if (!found) {
> > > +            /* No trying to fetch something from the priority queue */
> > > +            found = get_queued_page(rs, &pss);
> > > +        }
> > >           if (!found) {
> > >               /* priority queue empty, so just search for something dirty */
> > >               found = find_dirty_block(rs, &pss, &again);
> > >           }
> > >           if (found) {
> > > +            page = pss.page;
> > >               pages = ram_save_host_page(rs, &pss, last_stage);
> > > +            page_to = pss.page;
> > > +
> > > +            /* Check if page is from UFFD-managed region */
> > > +            if (pss.block->flags & RAM_UF_WRITEPROTECT) {
> > > +                hwaddr page_address = (hwaddr) pss.block->host +
> > > +                        ((hwaddr) page << TARGET_PAGE_BITS);
> > > +                hwaddr run_length = (hwaddr) (page_to - page + 1) << TARGET_PAGE_BITS;
> > > +                int res;
> > > +
> > > +                /* Flush async buffers before un-protect */
> > > +                qemu_fflush(rs->f);
> > > +                /* Un-protect memory range */
> > > +                res = uffd_protect_memory(rs->uffdio_fd, page_address, run_length, false);
> > > +                if (res < 0) {
> > > +                    break;
> > > +                }
> > > +            }
> > 
> > Please separate that out into a separate function.
> > 
> > Dave
> > 
> 
> You mean separate implementation of ram_find_and_save_block()?

No, I mean take that if (...WRITEPROTECT) { ..} block and put it in a
function and call it from there, just to keep ram_find_and_save_block
clean.

Dave

> Andrey
> 
> > >           }
> > >       } while (!pages && again);
> > > @@ -2086,7 +2191,8 @@ static void ram_state_reset(RAMState *rs)
> > >       rs->last_sent_block = NULL;
> > >       rs->last_page = 0;
> > >       rs->last_version = ram_list.version;
> > > -    rs->ram_bulk_stage = true;
> > > +    rs->ram_wt_enabled = migrate_track_writes_ram();
> > > +    rs->ram_bulk_stage = !rs->ram_wt_enabled;
> > >       rs->fpo_enabled = false;
> > >   }
> > > -- 
> > > 2.25.1
> > > 
> 
> 
> -- 
> Andrey Gruzdev, Principal Engineer
> Virtuozzo GmbH  +7-903-247-6397
>                 virtuzzo.com
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


