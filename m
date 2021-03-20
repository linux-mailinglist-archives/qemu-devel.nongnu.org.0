Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDEB342FB8
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 22:52:12 +0100 (CET)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNjVy-0002g7-TU
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 17:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lNjUJ-0002Fx-2j
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 17:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lNjUG-0002rN-0Y
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 17:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616277021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QIgwr7e4dIu0WtWhkcyhqOj3EUqXzpziZ8pAU7TUSj0=;
 b=DMSO0ychmqpIWDjXMNnpMa0reSinBjEFtkf/TEEjYijM2DrZK02fP7TQX3L7g4jcOl4KUN
 QUvjGHhcgYmuWeZRJsI4cr81ROfYQ9KUpu+eOUCo3J+YjR/1ve7nOv34O1bYvdiT1hUBkw
 /PYBMJgJjjqqApm3I6QfRJLPr4jGH5Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-HKQ3RUQoOoyArccXX8YSuA-1; Sat, 20 Mar 2021 17:50:18 -0400
X-MC-Unique: HKQ3RUQoOoyArccXX8YSuA-1
Received: by mail-wm1-f72.google.com with SMTP id s192so13771376wme.6
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 14:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QIgwr7e4dIu0WtWhkcyhqOj3EUqXzpziZ8pAU7TUSj0=;
 b=tf4uCnmRsID7QDakoJkOGLYrcc+R4Sfkbs3WCyZbQCo22dFmtldO4p1r4ncof3ho26
 6aX0pZTjTdFifKyvCBAt/RRLOVlRTXMkQKcx0vpXQG21Rvw7lrmLpt0GiHq5zo+e+XtJ
 cZuLp178oyP8C5c1kD5e4TfQC8fmMlL4KqATx19ZCRaFLxe4YKfxP5kpuphN2JZ+YE2h
 3+BzkApkQHwqvS+d3Zbq6J66GKRvUO5MW0FkJ5Ub1YFgh/oo2gennJGGA3a+qrBkszyw
 FF737WD6C+V2K6Miag9F9YCun91uwSFr1hUkh0j+DLzNItOin/J5TPcgcsEcV+PfH8K2
 0rBw==
X-Gm-Message-State: AOAM533NdyCVq0keCvlsZe34JoY9uLdAlbX65EOcdk9o6akP6kVlap8a
 Sn1QOO9vc0CRn0xxCv2X8I6rgaOxjKs3RKa0Yg4eAWOTRBvpheiqxE7MK5gTi2Mjviyi+RhV/ub
 FW6fC1VAVkgJ7HTc=
X-Received: by 2002:a5d:42d2:: with SMTP id t18mr10951303wrr.258.1616277017110; 
 Sat, 20 Mar 2021 14:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRb/Q/Np4tgTIZbTmPe2FybY4ObV8JSs7+VnvnFtWMWaBgjL07Fd2scWJ3ZeiFXxsTJFFcfw==
X-Received: by 2002:a5d:42d2:: with SMTP id t18mr10951293wrr.258.1616277016913; 
 Sat, 20 Mar 2021 14:50:16 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id u20sm16012884wru.6.2021.03.20.14.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 14:50:16 -0700 (PDT)
Date: Sat, 20 Mar 2021 17:50:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: QEMU PCI subsystem: what code is responsible for making accesses
 to non-mapped addresses read as -1?
Message-ID: <20210320170342-mutt-send-email-mst@kernel.org>
References: <CAFEAcA_M4zK1aLdO2QdOUgNROTLdHUwLHnCKoUT1BpTcF-cTMw@mail.gmail.com>
 <20210320144325-mutt-send-email-mst@kernel.org>
 <CAFEAcA-TWsG8wbc8jtEHvnKU5RFJrif77miWDb76y937tmMyGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-TWsG8wbc8jtEHvnKU5RFJrif77miWDb76y937tmMyGw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 20, 2021 at 08:40:13PM +0000, Peter Maydell wrote:
> On Sat, 20 Mar 2021 at 18:59, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Mar 19, 2021 at 12:35:31PM +0000, Peter Maydell wrote:
> > > I'm looking at a bug reported against the QEMU arm virt board's pci-gpex
> > > PCI controller: https://bugs.launchpad.net/qemu/+bug/1918917
> > > where an attempt to write to an address within the PCI IO window
> > > where the guest hasn't mapped a BAR causes a CPU exception rather than
> > > (what I believe is) the PCI-required behaviour of writes-ignored, reads
> > > return -1.
> > >
> > > What in the QEMU PCI code is responsible for giving the PCI-spec
> > > behaviour for accesses to the PCI IO and memory windows where there
> > > is no BAR? I was expecting the generic PCI code to map a background
> > > memory region over the whole window to do this, but it looks like it
> > > doesn't...
> 
> > As far as I know, at the PCI level what happens is Master Abort
> > on PCI/PCI-X and Unsupported Request on Express.
> > PCI spec says:
> >         The host bus bridge, in PC compatible systems, must return all 1's on a read transaction and
> >         discard data on a write transaction when terminated with Master-Abort.
> >
> > We thus implement this per host e.g. on pc compatible systems by
> > calling pc_pci_as_mapping_init.
> 
> Isn't pc_pci_as_mapping_init() "put the PCI space into the system
> address space", rather than "define the default behaviour for
> accesses in PCI space" ? IIRC x86 has -1/discard for everywhere,
> though, so maybe you get that without having to do anything special.

Hmm ... I guess it's too late in the night here, and I am confused ..
will try to recall tomorrow.

> Q: if PCI device A does a bus-mastering DMA read to a PCI address
> where no other device has been mapped, does the spec require
> it to (a) get back a "transaction failed" response or (b) get
> back read-data of -1 ? It sounds like the answer based on what
> you write above is (a), device A gets a Master Abort.
> (Put another way, is the -1/discard behaviour general to PCI
> transactions or is it strictly something that happens at the host
> bridge where the host bridge turns host CPU transactions into PCI
> transactions ?)

IIUC it's the host that is doing the conversion.

> If this is host-bridge specific then I guess our current
> implementation of "leave it up to the host bridge code" makes
> sense, but it also seems like a recipe for all our host bridges
> forgetting this corner case, in the absence of support from
> the common code for making it easy/the default...

Right at some level ... I'm not against just doing this in the pci core.

> Anyway, I think that for hw/pci-host/gpex.c we would need
> to change the current
>     memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
>     [...]
>     sysbus_init_mmio(sbd, &s->io_mmio);
>     [...]
>     pci->bus = pci_register_root_bus(dev, "pcie.0", gpex_set_irq,
>                                      pci_swizzle_map_irq_fn, s, &s->io_mmio,
>                                      &s->io_ioport, 0, 4, TYPE_PCIE_BUS);
> 
> to also create a container MR with a background set of io read/write
> functions to give the -1/discard behaviour, map s->io_mmio into
> that container, and return the container as the sysbus MMIO region.
> (and same again for the IO window).
> 
> thanks
> -- PMM

Hmm. But see
commit 0fbf50b6ec126600dca115adb1563c657cc27695
Author: Marcel Apfelbaum <marcel.a@redhat.com>
Date:   Sun Nov 10 11:49:57 2013 +0200

    Revert "hw/pci: partially handle pci master abort"
    
    This reverts commit a53ae8e934cd54686875b5bcfc2f434244ee55d6.
    
    The patch being reverted introduced a low-priority memory region
    covering all 64 bit pci address space.  This exposed the following bugs
    elsewhere in the code:
     1. Some memory regions have INT64_MAX size, where the
        intent was all 64 bit address space.
        This results in a sub-page region, should be UINT64_MAX.
     2. page table rendering in exec.c ignores physical address bits
        above TARGET_PHYS_ADDR_SPACE_BITS.
        Access outside this range (e.g. from device DMA, or gdb stub)
        ends up with a wrong region.  Registering a region outside this
        range leads to page table corruption.
     3. Some regions overlap PCI hole and have same priority.
        This only works as long as no device uses the overlapping address.
    
    It doesn't look like we can resolve all issues in time for 1.7.
    Let's fix the bugs first and apply afterwards for 1.8.
    
    Signed-off-by: Marcel Apfelbaum <marcel.a@redhat.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

I wonder whether we fixed all of these by now ...  I think we basically
fixed 3 and some greps could not find any more instances of 1.  Not sure
about 2 though. Should we just limit the region to
TARGET_PHYS_ADDR_SPACE_BITS?

-- 
MST


