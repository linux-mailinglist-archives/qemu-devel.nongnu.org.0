Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4DF3F814D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 05:51:38 +0200 (CEST)
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ6QI-0003s1-O6
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 23:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJ6PS-0003CF-1Z
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 23:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJ6PQ-0006ni-6P
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 23:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629949831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bzCJ/hbhw2CaaorYCDVAUbfgJvc6a3+iGBeCgk94nBc=;
 b=eRbks7ltKaxlBRWzGkSv4xVeRYFpiw+bjGY2m+m15zYBjo71CHKHa2zSGElqxgYrK/1cjo
 euzuLJvoAkx2jv/Ay737J8QbPCVCojBYaldBMkfH8f/1XTh7b8CfkUAh6eSzXNIgGHYBBW
 AUAWNgAeVRzMQQWtyWxkAGcyUTfSchs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-AlqBS5UAMs-io1ogA3_cjQ-1; Wed, 25 Aug 2021 23:50:30 -0400
X-MC-Unique: AlqBS5UAMs-io1ogA3_cjQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 t18-20020a05620a0b1200b003f8729fdd04so1279543qkg.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 20:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bzCJ/hbhw2CaaorYCDVAUbfgJvc6a3+iGBeCgk94nBc=;
 b=TbP0WJzG8XPipPcXU+Erm0NeE0dZ144om7Lpl1Bn8nUwTkkRWiLoE5a2taTMeowFSQ
 1Ya4RQtuEE9/zYuUvrgbpN2NpQOOF943mUiruxz1OvjDn8H07fdUg/Y9F5/dRFLxNiKy
 HQUCnqz/r3hY2KxET9Gk/BqRUZ8cSsjY4Ve8396btMDn6DFCHgEWw7ZtYIQ94vYk0EGT
 ICrEkPAODhNz17xn5jUxub4IDYCEvj/d0QfCVtvSkSmHEEZjoLJ2Dp0f70Nre8Fjzyaa
 WF8cfFwF2XJp94YcbBDXdDZbjs8EdNfXQQHvgC1R2QmrdmDuAX00aw7ZZ63C1VaM9SUZ
 jTzA==
X-Gm-Message-State: AOAM533/c8hMAQ7NKQZlSLlvLE87kkGO7Zt5OQe7JtOYE7LB7ZFY/8vG
 aosfd3cPVgrO4O8cv+idKXn2P7ZtggBWbKzzWgJtKaF8f+Je+Lghz5yp8cfUpBFGeSQxbrjEqKF
 rqXJrmKwX3t0x74c=
X-Received: by 2002:ad4:5f0d:: with SMTP id fo13mr1693628qvb.31.1629949829881; 
 Wed, 25 Aug 2021 20:50:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc6pSS5oBKg6Vvo3is5aVGW3twY/CrHrOpL8kBPuBq62swrRlqed1JYVg2pFsQueDmhamW9A==
X-Received: by 2002:ad4:5f0d:: with SMTP id fo13mr1693611qvb.31.1629949829544; 
 Wed, 25 Aug 2021 20:50:29 -0700 (PDT)
Received: from xz-m1.local ([2607:fea8:56a3:500:a070:6ad3:df25:1633])
 by smtp.gmail.com with ESMTPSA id v23sm1111505qto.55.2021.08.25.20.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 20:50:28 -0700 (PDT)
Date: Wed, 25 Aug 2021 23:50:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YScPg0cYYGxxTz+b@xz-m1.local>
References: <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net>
 <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net>
 <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
MIME-Version: 1.0
In-Reply-To: <YSa7H3wGUHgccCrU@t490s>
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

On Wed, Aug 25, 2021 at 05:50:23PM -0400, Peter Xu wrote:
> On Wed, Aug 25, 2021 at 02:28:55PM +0200, Markus Armbruster wrote:
> > Markus Armbruster <armbru@redhat.com> writes:
> > 
> > > Peter Xu <peterx@redhat.com> writes:
> > >
> > >> On Mon, Aug 23, 2021 at 05:56:23PM -0400, Eduardo Habkost wrote:
> > >>> I don't have any other example, but I assume address assignment
> > >>> based on ordering is a common pattern in device code.
> > >>> 
> > >>> I would take a very close and careful look at the devices with
> > >>> non-default vmsd priority.  If you can prove that the 13 device
> > >>> types with non-default priority are all order-insensitive, a
> > >>> custom sort function as you describe might be safe.
> > >>
> > >> Besides virtio-mem-pci, there'll also similar devfn issue with all
> > >> MIG_PRI_PCI_BUS, as they'll be allocated just like other pci devices.  Say,
> > >> below two cmdlines will generate different pci topology too:
> > >>
> > >>   $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
> > >>                        -device pcie-root-port,chassis=1 \
> > >>                        -device virtio-net-pci
> > >>
> > >> And:
> > >>
> > >>   $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
> > >>                        -device virtio-net-pci
> > >>                        -device pcie-root-port,chassis=1 \
> > >>
> > >> This cannot be solved by keeping priority==0 ordering.
> > >>
> > >> After a second thought, I think I was initially wrong on seeing migration
> > >> priority and device realization the same problem.
> > >>
> > >> For example, for live migration we have a requirement on PCI_BUS being migrated
> > >> earlier than MIG_PRI_IOMMU because there's bus number information required
> > >> because IOMMU relies on the bus number to find address spaces.  However that's
> > >> definitely not a requirement for device realizations, say, realizing vIOMMU
> > >> after pci buses are fine (bus assigned during bios).
> > >>
> > >> I've probably messed up with the ideas (though they really look alike!).  Sorry
> > >> about that.
> > >>
> > >> Since the only ordering constraint so far is IOMMU vs all the rest of devices,
> > >> I'll introduce a new priority mechanism and only make sure vIOMMUs are realized
> > >> earlier.  That'll also avoid other implications on pci devfn allocations.
> > >>
> > >> Will rework a new version tomorrow.  Thanks a lot for all the comments,
> > >
> > > Is it really a good idea to magically reorder device realization just to
> > > make a non-working command line work?  Why can't we just fail the
> > > non-working command line in a way that tells users how to get a working
> > > one?  We have way too much ordering magic already...
> > >
> > > If we decide we want more magic, then I'd argue for *dependencies*
> > > instead of priorities.  Dependencies are specific and local: $this needs
> > > to go after $that because $reasons.  Priorities are unspecific and
> > > global.
> > 
> > Having thought about this a bit more...
> > 
> > Constraints on realize order are nothing new.  For instance, when a
> > device plugs into a bus, it needs to be realized after the device
> > providing the bus.
> > 
> > We ensure this by having the device refer to the bus, e.g. bus=pci.0.
> > The reference may be implicit, but it's there.  It must resolve for
> > device creation to succeed, and if it resolves, the device providing the
> > bus will be realized in time.
> > 
> > I believe what's getting us into trouble with IOMMU is not having such a
> > reference.  Or in other words, keeping the dependence between the IOMMU
> > and the devices relying on it *implicit*, and thus hidden from the
> > existing realize-ordering machinery.

[1]

> > 
> > Instead of inventing another such machinery, let's try to use the one we
> > already have.
> 
> Hmm... I just found that we don't have such machinery, do we?
> 
> This does not really work:
> 
> $ ./qemu-system-x86_64 -M q35 -device virtio-net-pci,bus=pcie.1 \
>                        -device pcie-root-port,id=pcie.1,bus=pcie.0
> qemu-system-x86_64: -device virtio-net-pci,bus=pcie.1: Bus 'pcie.1' not found
> 
> While this will:
> 
> $ ./qemu-system-x86_64 -M q35 -device pcie-root-port,id=pcie.1,bus=pcie.0 \
>                        -device virtio-net-pci,bus=pcie.1

I think I fully agree at [1], the iommu is special in that it's not only
implicit, but also does not have a default value.  Pci buses have default
values (the root pci bus; e.g. pcie.0 on q35), so it's actually easier.

When parsing the "-device" entry for a pci device, we'll 100% sure what's the
pci bus for the device, either specified or it's just the default.  We don't
look at the rest of "-device"s to be sure of it.  We just try to look up the
pci bus, if it's there we continue, otherwise we abort.

But IOMMU is different, the device can run without a vIOMMU (in which case
there's no dependency), but when vIOMMU is specified there's the dependency.

That's why I am not sure whether the old machinery and "early failure" solution
would work trivially for IOMMUs.

We can add an "-iommu" parameter, then we simply parse it before "-device".
However I forgot why Marcel (IIRC) made it a "-device" parameter, also "-iommu"
is not ideal in that the IOMMU unit is indeed implemented as a device for the
archs I'm aware of, so it's kind of some extra glue that seems to just work
around the ordering problem we have right now.  Meanwhile that solution won't
help the ordering issue of pci bus/device.

That's why I still think the idea of having a global priority for device
realization (or describe the dependency of devices) makes sense.  We can
actually fix both IOMMU and pci bus so we can allow pci bus to be put latter
than the pci device that belongs to the bus alongside of fixing the IOMMU.

IMHO a list of global priority (maybe a realize_priority field in the class of
devices) is just a simpler version of device dependencies.  Say, at least we
don't need to worry about cycle-dependency issues.  So far the ordering
requirement is still simple, so globally define them should fix most of the
issues already and in a straightforward way, also less LOCs.  If it goes
complicated one day, we can always switch the global priority list into device
dependency easily, because that's not guest ABI.

Any further thoughts will be greatly welcomed.

Thanks,

-- 
Peter Xu


