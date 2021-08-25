Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2DD3F7DE9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 23:52:50 +0200 (CEST)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ0oq-0000AZ-2r
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 17:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJ0n2-0007v7-Ge
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 17:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJ0mz-0002a5-Jh
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 17:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629928227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEnZO3f/ILMiV7y10bnm7oPiPzptw7lJFCByVoNebcg=;
 b=h7NeGVmnCt3Ry6oPq3JlRUvxsK2KvPrshJ94B1Z8fAnFqILnraRuFHWZEfWUOQE1QpGsEw
 2Yas/scXhAfZkJib8dCHDW4lXsYXzB/YjTVDJ/xUELAhEqgmFNiye+zoQuCKIRy4TLTx0J
 iCoIrKq7abQtOC83ce86q4GsIIKkoYA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-OeGNcq1bOVidvHRId5KtZA-1; Wed, 25 Aug 2021 17:50:26 -0400
X-MC-Unique: OeGNcq1bOVidvHRId5KtZA-1
Received: by mail-qv1-f71.google.com with SMTP id
 b1-20020ad45181000000b00374cb3949ecso973373qvp.7
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 14:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mEnZO3f/ILMiV7y10bnm7oPiPzptw7lJFCByVoNebcg=;
 b=KrD1kO5mCvqxoOOSkpWjZwa4Hgg8bSg4KiDltLWc1zBGzlXsHxy5HQxVgvCkFyseMS
 WFCaDTpOPbb2ayfrjfTq+GeG86dRtPMKKf+SJwrVAxvVk+kgEiJp0+A/Ho2z3jooa0p0
 27iEPg0M7AVtHTn6ARKNwJ/n8dWNSLp9NwEkRQEhHal1g4dBRRmj8ydmCsNQLfVMZniK
 Exlx8L1QTdcxagXFo0IKvYA4SHQeA4UBBf+uVxAlYJIc9FSmt3ulsCL44tp7Y27iygLs
 ZARxhbgHqSSC/2Wt5OKYHceeNuWrUcMweP11ujO9HUd12YNWX+WNkp0gSeHPegq9YELZ
 +yxQ==
X-Gm-Message-State: AOAM532wnf0MGmKD4URRYviWUo+sRX2Cmxtc92WgLq7PIpD3PLsppXJE
 aU0TMSk51qKnX/a19F/kWsyhMPvZVBgT9j4LipuwOlTUSqkbTBZDOcUSU1rLLLVDKpKozxwn8fP
 hQK/V04P7Ze9XmF8=
X-Received: by 2002:a0c:c310:: with SMTP id f16mr745118qvi.43.1629928225658;
 Wed, 25 Aug 2021 14:50:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTsQnM+o/4TqUNqEGN18R3LSIKSDKXFIPv5O5LJX+05LWw3Juf1S8W7Y/mOLCDVFQFYeQdyg==
X-Received: by 2002:a0c:c310:: with SMTP id f16mr745094qvi.43.1629928225390;
 Wed, 25 Aug 2021 14:50:25 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id v23sm626180qto.55.2021.08.25.14.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 14:50:24 -0700 (PDT)
Date: Wed, 25 Aug 2021 17:50:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YSa7H3wGUHgccCrU@t490s>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net>
 <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net>
 <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h7fdg12w.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 02:28:55PM +0200, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Peter Xu <peterx@redhat.com> writes:
> >
> >> On Mon, Aug 23, 2021 at 05:56:23PM -0400, Eduardo Habkost wrote:
> >>> I don't have any other example, but I assume address assignment
> >>> based on ordering is a common pattern in device code.
> >>> 
> >>> I would take a very close and careful look at the devices with
> >>> non-default vmsd priority.  If you can prove that the 13 device
> >>> types with non-default priority are all order-insensitive, a
> >>> custom sort function as you describe might be safe.
> >>
> >> Besides virtio-mem-pci, there'll also similar devfn issue with all
> >> MIG_PRI_PCI_BUS, as they'll be allocated just like other pci devices.  Say,
> >> below two cmdlines will generate different pci topology too:
> >>
> >>   $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
> >>                        -device pcie-root-port,chassis=1 \
> >>                        -device virtio-net-pci
> >>
> >> And:
> >>
> >>   $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
> >>                        -device virtio-net-pci
> >>                        -device pcie-root-port,chassis=1 \
> >>
> >> This cannot be solved by keeping priority==0 ordering.
> >>
> >> After a second thought, I think I was initially wrong on seeing migration
> >> priority and device realization the same problem.
> >>
> >> For example, for live migration we have a requirement on PCI_BUS being migrated
> >> earlier than MIG_PRI_IOMMU because there's bus number information required
> >> because IOMMU relies on the bus number to find address spaces.  However that's
> >> definitely not a requirement for device realizations, say, realizing vIOMMU
> >> after pci buses are fine (bus assigned during bios).
> >>
> >> I've probably messed up with the ideas (though they really look alike!).  Sorry
> >> about that.
> >>
> >> Since the only ordering constraint so far is IOMMU vs all the rest of devices,
> >> I'll introduce a new priority mechanism and only make sure vIOMMUs are realized
> >> earlier.  That'll also avoid other implications on pci devfn allocations.
> >>
> >> Will rework a new version tomorrow.  Thanks a lot for all the comments,
> >
> > Is it really a good idea to magically reorder device realization just to
> > make a non-working command line work?  Why can't we just fail the
> > non-working command line in a way that tells users how to get a working
> > one?  We have way too much ordering magic already...
> >
> > If we decide we want more magic, then I'd argue for *dependencies*
> > instead of priorities.  Dependencies are specific and local: $this needs
> > to go after $that because $reasons.  Priorities are unspecific and
> > global.
> 
> Having thought about this a bit more...
> 
> Constraints on realize order are nothing new.  For instance, when a
> device plugs into a bus, it needs to be realized after the device
> providing the bus.
> 
> We ensure this by having the device refer to the bus, e.g. bus=pci.0.
> The reference may be implicit, but it's there.  It must resolve for
> device creation to succeed, and if it resolves, the device providing the
> bus will be realized in time.
> 
> I believe what's getting us into trouble with IOMMU is not having such a
> reference.  Or in other words, keeping the dependence between the IOMMU
> and the devices relying on it *implicit*, and thus hidden from the
> existing realize-ordering machinery.
> 
> Instead of inventing another such machinery, let's try to use the one we
> already have.

Hmm... I just found that we don't have such machinery, do we?

This does not really work:

$ ./qemu-system-x86_64 -M q35 -device virtio-net-pci,bus=pcie.1 \
                       -device pcie-root-port,id=pcie.1,bus=pcie.0
qemu-system-x86_64: -device virtio-net-pci,bus=pcie.1: Bus 'pcie.1' not found

While this will:

$ ./qemu-system-x86_64 -M q35 -device pcie-root-port,id=pcie.1,bus=pcie.0 \
                       -device virtio-net-pci,bus=pcie.1

Thanks,

-- 
Peter Xu


