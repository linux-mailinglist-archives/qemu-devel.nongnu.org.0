Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F91C5BB47
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 14:11:21 +0200 (CEST)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhv9U-00066C-FD
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 08:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hhv6u-0004Vn-CA
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hhv6r-0004yR-5D
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:08:38 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hhv6n-0004qe-Sa
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:08:33 -0400
Received: by mail-qt1-f194.google.com with SMTP id j19so14283449qtr.12
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 05:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0XOXQp0BnayM/nP5zsvVtZsmoV9XYdtDOehhawVzLEs=;
 b=NFmNBRTk/PKliYV9OkAPciysy3kJIFdtWMmS5mHrq9QBdDTQmYw0ItUjiME7V/TOnR
 841+NbJT+49yv9YibcxTkr3wRqzNCdgMRZ36Y57yZ4BRBKNpivrJryWMT+zXbHxyk/Th
 PTzqHkWzoB0cxk8wMwo2a1A2+dOdXFAJnxFBucvQViNJ0tSOX0SFauD96lUWpKDgst0n
 kOkleMuB71m78DIWenYSU7Ep0KaWE5a3FilaVn8OcYHnKEDnwDyuHMhY9KpDKrETJcre
 vq4oGnjB0RxKoLer6AfgxnZdrB7i3PyPCqo4Db+LminSApYMsMhkYJdnUOdQJXcE1w0j
 se+w==
X-Gm-Message-State: APjAAAXQX2c4sgaECqpoW2A8Ie3ipnB5C1xMV1BbqigBddCoM8fXDQW+
 3D8EnOYz5X9UCj7d4TUF22aFkw==
X-Google-Smtp-Source: APXvYqxYgVlVuusOZWU26tGYGZKfGDKXuRjiBXSfeBOyUvTB9GbeBtbxqglSdydOUqxhUzur+7MICw==
X-Received: by 2002:ac8:42d4:: with SMTP id g20mr20080081qtm.78.1561982910053; 
 Mon, 01 Jul 2019 05:08:30 -0700 (PDT)
Received: from redhat.com ([37.26.146.159])
 by smtp.gmail.com with ESMTPSA id w16sm6060018qtc.41.2019.07.01.05.08.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 05:08:28 -0700 (PDT)
Date: Mon, 1 Jul 2019 08:08:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190701080751-mutt-send-email-mst@kernel.org>
References: <20190621064615.20099-1-mst@redhat.com>
 <20190621064615.20099-4-mst@redhat.com>
 <20190625150730.31d9d699@redhat.com>
 <20190701051959-mutt-send-email-mst@kernel.org>
 <20190701140402.6647a3a4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701140402.6647a3a4@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.194
Subject: Re: [Qemu-devel] [PATCH 3/3] pcie: work around for racy guest init
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 01, 2019 at 02:04:02PM +0200, Igor Mammedov wrote:
> On Mon, 1 Jul 2019 05:20:41 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, Jun 25, 2019 at 03:07:30PM +0200, Igor Mammedov wrote:
> > > On Fri, 21 Jun 2019 02:46:50 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >   
> > > > During boot, linux guests tend to clear all bits in pcie slot status
> > > > register which is used for hotplug.
> > > > If they clear bits that weren't set this is racy and will lose events:
> > > > not a big problem for manual hotplug on bare-metal, but a problem for us.
> > > > 
> > > > For example, the following is broken ATM:
> > > > 
> > > > /x86_64-softmmu/qemu-system-x86_64 -enable-kvm -S -machine q35  \
> > > >     -device pcie-root-port,id=pcie_root_port_0,slot=2,chassis=2,addr=0x2,bus=pcie.0 \
> > > >     -device virtio-balloon-pci,id=balloon,bus=pcie_root_port_0 \
> > > >     -monitor stdio disk.qcow2
> > > > (qemu)device_del balloon
> > > > (qemu)cont
> > > > 
> > > > Balloon isn't deleted as it should.
> > > > 
> > > > As a work-around, detect this attempt to clear slot status and revert
> > > > status to what it was before the write.
> > > > 
> > > > Note: in theory this can be detected as a duplicate button press
> > > > which cancels the previous press. Does not seem to happen in
> > > > practice as guests seem to only have this bug during init.
> > > > 
> > > > Note2: the right thing to do is probably to fix Linux to
> > > > read status before clearing it, and act on the bits that are set.
> > > > 
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  hw/pci/pcie.c | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > > 
> > > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > > index f8490a00de..c605d32dd4 100644
> > > > --- a/hw/pci/pcie.c
> > > > +++ b/hw/pci/pcie.c
> > > > @@ -610,6 +610,25 @@ void pcie_cap_slot_write_config(PCIDevice *dev, uint16_t slt_ctl, uint16_t slt_s
> > > >      uint16_t sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
> > > >  
> > > >      if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
> > > > +        /*
> > > > +         * Guests tend to clears all bits during init.
> > > > +         * If they clear bits that weren't set this is racy and will lose events:
> > > > +         * not a big problem for manual button presses, but a problem for us.
> > > > +         * As a work-around, detect this and revert status to what it was
> > > > +         * before the write.
> > > > +         *
> > > > +         * Note: in theory this can be detected as a duplicate button press
> > > > +         * which cancels the previous press. Does not seem to happen in
> > > > +         * practice as guests seem to only have this bug during init.
> > > > +         */
> > > > +#define PCIE_SLOT_EVENTS (PCI_EXP_SLTSTA_ABP | PCI_EXP_SLTSTA_PFD | \
> > > > +                          PCI_EXP_SLTSTA_MRLSC | PCI_EXP_SLTSTA_PDC | \
> > > > +                          PCI_EXP_SLTSTA_CC)
> > > > +
> > > > +        if (val & ~slt_sta & PCIE_SLOT_EVENTS) {
> > > > +            sltsta = (sltsta & ~PCIE_SLOT_EVENTS) | (slt_sta & PCIE_SLOT_EVENTS);  
> > > I'm reading it as:
> > >   sltsta = LOWER_PART(sltsta) | UPPER_PART(sltsta)
> > > which basically
> > >   sltsta = sltsta
> > > or am I missing something here?  
> > 
> > You are missing the underscore.
> > 
> > slt_sta is the old value.
> > sltsta is the new value.
> 
> I did notice it but still don't see where 
>   exp_cap + PCI_EXP_SLTSTA
> is being modified in call chain between
>   pcie_cap_slot_get(d, &slt_ctl, &slt_sta)
>   ...
>   pcie_cap_slot_write_config():
>       sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA)

It's modified by pci_bridge_write_config which calls pci_default_write_config.


> > 
> > > > +            pci_set_word(exp_cap + PCI_EXP_SLTSTA, sltsta);
> > > > +        }
> > > >          hotplug_event_clear(dev);
> > > >      }
> > > >    
> > 

