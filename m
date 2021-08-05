Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61AB3E151B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:53:27 +0200 (CEST)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcsJ-0002BO-1E
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBcr9-0001S6-GY
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:52:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBcr6-000362-G8
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628167930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+k5IJx+/uVAhIYzVgX3w5gKSdvV/EFx7p/2WCISahg0=;
 b=V2CLHgNlvyvBIF6lN3amXVpabNa89pG2l4F5GANo3erFluQLK6TSP5t0NdNhamZVi7Wtzs
 tHMfIPSiS1Jx53OwwZg4jrk8YW0Kn1gLMOKNu4L/DTfUY4bGN9t72yy7k6zY6adkwzj+2A
 MleSwODXU5CK0ocC4oPmpQbERpKGbc0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-wfpxKaTCOaeJAGpxVXGbNg-1; Thu, 05 Aug 2021 08:52:10 -0400
X-MC-Unique: wfpxKaTCOaeJAGpxVXGbNg-1
Received: by mail-qv1-f72.google.com with SMTP id
 y10-20020a0cd98a0000b029032ca50bbea1so3798545qvj.12
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 05:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+k5IJx+/uVAhIYzVgX3w5gKSdvV/EFx7p/2WCISahg0=;
 b=H4UDshYqeoJEMRRx4G5999pBSpA7nceLRbAp3NU/k2vFngYUUBsKjvQ/zsYC3srHDc
 fE6WtGPhJgC3TkB0rMJ24eXV3caEqpve1Zqk7ZRmXR6i6jF+Y4fydEoSO9bOQ3MQmCHr
 APuqoZ2yBbQVB+IlbmoKZVfIi4+syJu1Aadbzq6cwB1J3fk5/3EoulI8zisAkSMrrbW8
 srgnDPMx5b0+q5T+d8tftjq0EFxkhoEAsJrt3gU6VW93J3j+O0MiDRbLw/ZbAXBBl+sO
 THyoqpfElp7bCgzI8hQBcIKC7ICJ60pKt7+3YoNYZB1TDAkk2KGbh7gli4SQIxnkdoSG
 ZGwA==
X-Gm-Message-State: AOAM531TTMYB4S/tSYzB8BQDZx6HhxaEy+d5YWSJbgClPgXX51vTw+x0
 ZGu40WHZssxR/sojSRNALSU/MVrmW0UXh9GiO/sdMfFzdFhIKy9xBZqnXyEwut/RLaulOe2VVrp
 TIS90z2hWrrwvWrE=
X-Received: by 2002:a05:622a:d5:: with SMTP id
 p21mr4200983qtw.75.1628167929582; 
 Thu, 05 Aug 2021 05:52:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwHO+qI/lrexhHXdZiRzGp65+TfjVqBZ4WgwxOYlDtx/rNwm+pik5vAzAMsrhSt071H+ch8Q==
X-Received: by 2002:a05:622a:d5:: with SMTP id
 p21mr4200966qtw.75.1628167929297; 
 Thu, 05 Aug 2021 05:52:09 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id m17sm1674230qtq.82.2021.08.05.05.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 05:52:08 -0700 (PDT)
Date: Thu, 5 Aug 2021 08:52:01 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 6/7] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
Message-ID: <YQve8TRsSPMSvKdN@t490s>
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-7-david@redhat.com> <YQsrIQ4gvP6M+/rS@t490s>
 <14437dd7-88b2-94df-a70f-e5c38ca861e1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <14437dd7-88b2-94df-a70f-e5c38ca861e1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 10:10:38AM +0200, David Hildenbrand wrote:
> On 05.08.21 02:04, Peter Xu wrote:
> > On Fri, Jul 30, 2021 at 10:52:48AM +0200, David Hildenbrand wrote:
> > > Currently, when someone (i.e., the VM) accesses discarded parts inside a
> > > RAMBlock with a RamDiscardManager managing the corresponding mapped memory
> > > region, postcopy will request migration of the corresponding page from the
> > > source. The source, however, will never answer, because it refuses to
> > > migrate such pages with undefined content ("logically unplugged"): the
> > > pages are never dirty, and get_queued_page() will consequently skip
> > > processing these postcopy requests.
> > > 
> > > Especially reading discarded ("logically unplugged") ranges is supposed to
> > > work in some setups (for example with current virtio-mem), although it
> > > barely ever happens: still, not placing a page would currently stall the
> > > VM, as it cannot make forward progress.
> > > 
> > > Let's check the state via the RamDiscardManager (the state e.g.,
> > > of virtio-mem is migrated during precopy) and avoid sending a request
> > > that will never get answered. Place a fresh zero page instead to keep
> > > the VM working. This is the same behavior that would happen
> > > automatically without userfaultfd being active, when accessing virtual
> > > memory regions without populated pages -- "populate on demand".
> > > 
> > > For now, there are valid cases (as documented in the virtio-mem spec) where
> > > a VM might read discarded memory; in the future, we will disallow that.
> > > Then, we might want to handle that case differently, e.g., warning the
> > > user that the VM seems to be mis-behaving.
> > > 
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >   migration/postcopy-ram.c | 31 +++++++++++++++++++++++++++----
> > >   migration/ram.c          | 21 +++++++++++++++++++++
> > >   migration/ram.h          |  1 +
> > >   3 files changed, 49 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> > > index 2e9697bdd2..38cdfc09c3 100644
> > > --- a/migration/postcopy-ram.c
> > > +++ b/migration/postcopy-ram.c
> > > @@ -671,6 +671,29 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
> > >       return ret;
> > >   }
> > > +static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
> > > +                                 ram_addr_t start, uint64_t haddr)
> > > +{
> > > +    void *aligned = (void *)(uintptr_t)(haddr & -qemu_ram_pagesize(rb));
> > > +
> > > +    /*
> > > +     * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
> > > +     * access, place a zeropage, which will also set the relevant bits in the
> > > +     * recv_bitmap accordingly, so we won't try placing a zeropage twice.
> > > +     *
> > > +     * Checking a single bit is sufficient to handle pagesize > TPS as either
> > > +     * all relevant bits are set or not.
> > > +     */
> > > +    assert(QEMU_IS_ALIGNED(start, qemu_ram_pagesize(rb)));
> > 
> > Is this check for ramblock_page_is_discarded()?  If so, shall we move this into
> > it, e.g. after memory_region_has_ram_discard_manager() returned true?
> > 
> 
> It has to hold true also when calling migrate_send_rp_req_pages().
> 
> Both callers -- postcopy_request_shared_page() and
> postcopy_ram_fault_thread() properly align the offset down (but not the host
> address). This check is just to make sure we don't mess up in the future.

OK.

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


