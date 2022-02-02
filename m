Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322ED4A77FE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 19:34:23 +0100 (CET)
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFKSQ-0006X6-3r
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 13:34:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nFJBd-0003h7-Jq
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:12:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nFJBL-0008Q7-6O
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643821953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpvIOvmLYmgBhzHPIZvPPNn3cQ1hvmffT2zlB6Tu4Co=;
 b=LM11QtajgHPLNV/Ree8UbZdoXH5EKNYmPRzKCeOhqSjlqRxeJsTo/jZGAqLIBt/0Swv08s
 ty0YSiFXBEmX7cP1/s3ovDFizzl7xXZD/qE1aBd4oQEs8+teY06akyh387ZW20j5t3/7L4
 +e9cVT0/RylnkP/QcUVgenArbfQ2ae4=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-I_maRL6mNxSgwANYb4mC6w-1; Wed, 02 Feb 2022 12:12:32 -0500
X-MC-Unique: I_maRL6mNxSgwANYb4mC6w-1
Received: by mail-oi1-f197.google.com with SMTP id
 bg40-20020a05680817a800b002d0a77a0a16so2383089oib.6
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 09:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kpvIOvmLYmgBhzHPIZvPPNn3cQ1hvmffT2zlB6Tu4Co=;
 b=kjATtjBUj3h91qTB5GdhXrnoazqbYXaZ7CNdGYEV8WCaSZCdWTE6LaMiIJBKgA1XbZ
 dq7h5kON9CXeOojDgt5ouZqgJNaCvknjVT+3Z28NuMGybH0c/R4ie4k+MzfDwXBXOLQt
 83hLwsfV742z1W9Xzn2mcVufa7MKsXESu4oQi7L6yIRbyhjMOFOfuNjXEq0iinEUzxBT
 MwGxX38VAsxbbopk9S2QDLWfNRqbsXlr1GTyao9wi+F5B98Y80DMXbjvXUUT8Yw20++j
 1tM8hsxqI/+o+++yyRQCeDKaz7aETQm+YhC58zc2+cAaUaQF74jA4JliB6EvMOtadNrM
 HysQ==
X-Gm-Message-State: AOAM530YctgCGTAJ2dAsDIZ7Co+SNuKL7XB5rdHKF0YX7dB+JN5AUY89
 fC3BQYG/AyQsEbOMar2rqUrJhQl4w2EdjaVin7Qe//J64C8KHwE6OdhEJr4PK85S5zW+/9qj3wK
 oW9kIL8Vfzcpc/3k=
X-Received: by 2002:a4a:a5c5:: with SMTP id k5mr15428669oom.66.1643821950794; 
 Wed, 02 Feb 2022 09:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6wMEKImd9IIj8k526XlQHxl4HARLXlcou1Kc/OacVeb66IpVVtzH+QT2u4zgVKLVVDgxuzw==
X-Received: by 2002:a4a:a5c5:: with SMTP id k5mr15428637oom.66.1643821950565; 
 Wed, 02 Feb 2022 09:12:30 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id p82sm10655207oib.25.2022.02.02.09.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 09:12:30 -0800 (PST)
Date: Wed, 2 Feb 2022 10:12:28 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220202101228.54b7e46c.alex.williamson@redhat.com>
In-Reply-To: <CAFEAcA-f6ZBgAtKr-nUFTR8nfMGVWF=uExoRaMajN7t6wU7f7g@mail.gmail.com>
References: <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <CAFEAcA-f6ZBgAtKr-nUFTR8nfMGVWF=uExoRaMajN7t6wU7f7g@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 John Johnson <john.g.johnson@oracle.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 09:30:42 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 1 Feb 2022 at 23:51, Alex Williamson <alex.williamson@redhat.com> wrote:
> >
> > On Tue, 1 Feb 2022 21:24:08 +0000
> > Jag Raman <jag.raman@oracle.com> wrote:  
> > > The PCIBus data structure already has address_space_mem and
> > > address_space_io to contain the BAR regions of devices attached
> > > to it. I understand that these two PCIBus members form the
> > > PCI address space.  
> >
> > These are the CPU address spaces.  When there's no IOMMU, the PCI bus is
> > identity mapped to the CPU address space.  When there is an IOMMU, the
> > device address space is determined by the granularity of the IOMMU and
> > may be entirely separate from address_space_mem.  
> 
> Note that those fields in PCIBus are just whatever MemoryRegions
> the pci controller model passed in to the call to pci_root_bus_init()
> or equivalent. They may or may not be specifically the CPU's view
> of anything. (For instance on the versatilepb board, the PCI controller
> is visible to the CPU via several MMIO "windows" at known addresses,
> which let the CPU access into the PCI address space at a programmable
> offset. We model that by creating a couple of container MRs which
> we pass to pci_root_bus_init() to be the PCI memory and IO spaces,
> and then using alias MRs to provide the view into those at the
> guest-programmed offset. The CPU sees those windows, and doesn't
> have direct access to the whole PCIBus::address_space_mem.)
> I guess you could say they're the PCI controller's view of the PCI
> address space ?

Sure, that's fair.

> We have a tendency to be a bit sloppy with use of AddressSpaces
> within QEMU where it happens that the view of the world that a
> DMA-capable device matches that of the CPU, but conceptually
> they can definitely be different, especially in the non-x86 world.
> (Linux also confuses matters here by preferring to program a 1:1
> mapping even if the hardware is more flexible and can do other things.
> The model of the h/w in QEMU should support the other cases too, not
> just 1:1.)

Right, this is why I prefer to look at the device address space as
simply an IOVA.  The IOVA might be a direct physical address or
coincidental identity mapped physical address via an IOMMU, but none of
that should be the concern of the device.
 
> > I/O port space is always the identity mapped CPU address space unless
> > sparse translations are used to create multiple I/O port spaces (not
> > implemented).  I/O port space is only accessed by the CPU, there are no
> > device initiated I/O port transactions, so the address space relative
> > to the device is irrelevant.  
> 
> Does the PCI spec actually forbid any master except the CPU from
> issuing I/O port transactions, or is it just that in practice nobody
> makes a PCI device that does weird stuff like that ?

As realized in reply to MST, more the latter.  Not used, no point to
enabling, no means to enable depending on the physical IOMMU
implementation.  Thanks,

Alex


