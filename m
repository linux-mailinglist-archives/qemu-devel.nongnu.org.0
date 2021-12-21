Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46A947C9D3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:43:07 +0100 (CET)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzomg-0006aW-Gd
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:43:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mzok1-0005Bq-SW
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:40:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mzojy-00015y-4o
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640130016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z45ADC6MAmZRpdVehC5TSs5ODAXbgycdENMjD5UtRsA=;
 b=YjqDjpNKKE73uVPPBkqPw2ln9KmAJtSaGFkGgoeyDCgBKBmNQ6rdGU3f80JXHQUbWj/CoU
 OeLdA/R0ewt6H5d3B8vUKiwrWY4XJtIPnPAvReCdXS/ZWjYuh9nQB6LTu5qjUnifBwlM4Z
 oEHaEV7aGYPr6B0TgkQvMotm/8ukv8k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-DrtBIq1YMvOJFAo9hWSAgw-1; Tue, 21 Dec 2021 18:40:15 -0500
X-MC-Unique: DrtBIq1YMvOJFAo9hWSAgw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c19-20020a05640227d300b003f81c7154fbso297039ede.7
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z45ADC6MAmZRpdVehC5TSs5ODAXbgycdENMjD5UtRsA=;
 b=Nt1GiYK33yUqMF4Q7VRoyx7/Eo/cjyTzbX4LK2MQTDbCTjSaR9oQXr/zPEcJvIIUSQ
 zuMrLnFIIfwCi8cwcl4q9/T5tecy5AuMBgMW2wDucAWoDlIhdY3YEg2rAbjOXf7yu5cL
 lXIG+IB11Zr/BO7TnAwdKvFPmxi+L6TTljLZiKosGTBwW1ZDcNcLtgjDnDJcpk9/IBzP
 z4zSS+cavgtV7t0V0c/hrGowvQPHjFdgydZ/poobSE2u6rcDkWfy2WehfkwCR7Q23fBG
 XBN+DFdh1+J1FFgSV6ekwnjI8QmgFIKyTykwfjcSElplAwkhHLCmDMPEazQ0/JLD+dF9
 Z+Ag==
X-Gm-Message-State: AOAM530/MxxVqqycWcfo+WKCRDZfC2y87z7DMpcgLoV8jQGLUIOvFH7p
 wKq6mKhU3I0fOMqWlV/pSV8h8KT3LmqSaL6l55ICBgEXGbcZO4u94289j8yCXhJ6ALUK6FUawUM
 satDrNG/yL+PG2rQ=
X-Received: by 2002:a17:907:6d20:: with SMTP id
 sa32mr486593ejc.35.1640130013863; 
 Tue, 21 Dec 2021 15:40:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGUog3jVDUE2yHdgIyggnstCf1zqlJWlZtojRrVbRcntlnliOhTzaQdco5m26v5NfG84ObMA==
X-Received: by 2002:a17:907:6d20:: with SMTP id
 sa32mr486582ejc.35.1640130013622; 
 Tue, 21 Dec 2021 15:40:13 -0800 (PST)
Received: from redhat.com ([2a0e:1c80:7::36])
 by smtp.gmail.com with ESMTPSA id qw20sm83173ejc.185.2021.12.21.15.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 15:40:12 -0800 (PST)
Date: Tue, 21 Dec 2021 18:40:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] pci: Skip power-off reset when pending unplug
Message-ID: <20211221183400-mutt-send-email-mst@kernel.org>
References: <164002480875.2328622.7843917444941101286.stgit@omen>
 <20211220174502-mutt-send-email-mst@kernel.org>
 <20211221093656.0d30644e.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211221093656.0d30644e.alex.williamson@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 09:36:56AM -0700, Alex Williamson wrote:
> On Mon, 20 Dec 2021 18:03:56 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Dec 20, 2021 at 11:26:59AM -0700, Alex Williamson wrote:
> > > The below referenced commit introduced a change where devices under a
> > > root port slot are reset in response to removing power to the slot.
> > > This improves emulation relative to bare metal when the slot is powered
> > > off, but introduces an unnecessary step when devices under that slot
> > > are slated for removal.
> > > 
> > > In the case of an assigned device, there are mandatory delays
> > > associated with many device reset mechanisms which can stall the hot
> > > unplug operation.  Also, in cases where the unplug request is triggered
> > > via a release operation of the host driver, internal device locking in
> > > the host kernel may result in a failure of the device reset mechanism,
> > > which generates unnecessary log warnings.
> > > 
> > > Skip the reset for devices that are slated for unplug.
> > > 
> > > Cc: qemu-stable@nongnu.org
> > > Fixes: d5daff7d3126 ("pcie: implement slot power control for pcie root ports")
> > > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>  
> > 
> > I am not sure this is safe. IIUC pending_deleted_event
> > is normally set after host admin requested device removal,
> > while the reset could be triggered by guest for its own reasons
> > such as suspend or driver reload.
> 
> Right, the case where I mention that we get the warning looks exactly
> like the admin doing a device eject, it calls qdev_unplug().  I'm not
> trying to prevent arbitrary guest resets of the device, in fact there
> are cases where the guest really should be able to reset the device,
> nested assignment in addition to the cases you mention.  Gerd noted
> that this was an unintended side effect of the referenced patch to
> reset device that are imminently being removed.
> 
> > Looking at this some more, I am not sure I understand the
> > issue completely.
> > We have:
> > 
> >     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> >         (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
> >         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> >         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
> >         pcie_cap_slot_do_unplug(dev);
> >     }
> >     pcie_cap_update_power(dev);
> > 
> > so device unplug triggers first, reset follows and by that time
> > there should be no devices under the bus, if there are then
> > it's because guest did not clear the power indicator.
> 
> Note that the unplug only triggers here if the Power Indicator Control
> is OFF, I see writes to SLTCTL in the following order:
> 
>  01f1 - > 02f1 -> 06f1 -> 07f1
> 
> So PIC changes to BLINK, then PCC changes the slot to OFF (this
> triggers the reset), then PIC changes to OFF triggering the unplug.
> 
> The unnecessary reset that occurs here is universal.  Should the unplug
> be occurring when:
> 
>   (val & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_ON
> 
> ?

well blinking generally means "do not remove yet".

> > So I am not sure how to fix the assignment issues as I'm not sure how do
> > they trigger, but here is a wild idea: maybe it should support an API
> > for starting reset asynchronously, then if the following access is
> > trying to reset again that second reset can just be skipped, while any
> > other access will stall.
> 
> As above, there's not a concurrency problem, so I don't see how an
> async API buys us anything.

Well unplug resets the device again, right? Why is that reset not
problematic and this one is?

>  It seems the ordering of the slot power
> induced reset versus device unplug is not as you expected.  Can we fix
> that?  Thanks,
> 
> Alex

Oh I means on the PIC write. That triggers the unplug without triggering
a reset. I was under the impression you are saying the same guest
write triggers both reset and unplug.
Since in this case it's two writes, I don't see how we
can tie ourselves to guest doing things in a specific order.
It can always change the order of things.


> 
> > > ---
> > >  hw/pci/pci.c |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > index e5993c1ef52b..f594da410797 100644
> > > --- a/hw/pci/pci.c
> > > +++ b/hw/pci/pci.c
> > > @@ -2869,7 +2869,7 @@ void pci_set_power(PCIDevice *d, bool state)
> > >      memory_region_set_enabled(&d->bus_master_enable_region,
> > >                                (pci_get_word(d->config + PCI_COMMAND)
> > >                                 & PCI_COMMAND_MASTER) && d->has_power);
> > > -    if (!d->has_power) {
> > > +    if (!d->has_power && !d->qdev.pending_deleted_event) {
> > >          pci_device_reset(d);
> > >      }
> > >  }
> > >   
> > 


