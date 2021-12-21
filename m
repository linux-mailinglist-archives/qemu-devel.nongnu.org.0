Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43A047C3FF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:41:35 +0100 (CET)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziCk-0002v9-SR
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:41:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mzi8P-0007Gp-3N
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mzi8L-00061R-Ai
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640104620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZ6cqlOBE8clJbtsPj2uVBDMrLR6l6lp9mnBNYkbj70=;
 b=RXcouSA0JG4QfRXe8zhTjmASLR3OBIfW5mj4bY7OKP56cbQIrkG4AaP3opFxyARUeUjM4Y
 55vvm/+f5ovPSM0LQYt/mSeM8Jx+HMl3hETMdCKjawQ0GnMbfajO6gYCv5iY4myb+7NA8+
 qdM02wxQ/YiDrIYV8wEm8RwNrKD+mhE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-nu1w1u92N4e_MVNnr9MnfA-1; Tue, 21 Dec 2021 11:36:59 -0500
X-MC-Unique: nu1w1u92N4e_MVNnr9MnfA-1
Received: by mail-ot1-f72.google.com with SMTP id
 z33-20020a9d24a4000000b00579320f89ecso4439837ota.12
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZ6cqlOBE8clJbtsPj2uVBDMrLR6l6lp9mnBNYkbj70=;
 b=Impq2NkIPRjH12e1ZLWQsNUPZpBD7thg2K+CW+ofqaTGwd/ALkzMOeKd43PBrXBMPb
 1ror4MWAPsPGZCkeedFs2japuFsxoyZD9lXS4YcFaoHzKVPdp27dl+P5yZ6+uENwCwvh
 Jdna268mND8z8Eg9X9Rintgn5Eh8qiL1iyzr2glgZNLCfaYNp821SCDFr0yIe+J1g+8M
 QFHa4gO1fCoQW8M6/FvqtMsoCnIUF9JdKh9+/i/FWmM/GPRHj1aHoZzguvt6ZLMSxioB
 6SqIz7m0oENZ+gOR5HrFYXWTWGB/AiIH7pNLtgFl9dWU3migC088daT2Gqs3Po2ld9my
 rKtw==
X-Gm-Message-State: AOAM533YN51qBbUMH9VfkRnM96gmDfMZMCyAE96W/0maIXf44qdPs+Oa
 Vj1mLh1uAsPqZjCodH1I8babg9/+zCzlxEI7y16MMRuGY75WfzlgW7T774OGWKiPp5+Z8crjGqi
 cHAPaQdYr8kTkwAA=
X-Received: by 2002:aca:b382:: with SMTP id c124mr3063734oif.169.1640104618582; 
 Tue, 21 Dec 2021 08:36:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvbAsFNzu6uKYwZYTWulbpN2DsYpcDRXWB2ZqYA9PNtY1G6/vzNyZaEON4vSe6dtq1Mk939Q==
X-Received: by 2002:aca:b382:: with SMTP id c124mr3063717oif.169.1640104618336; 
 Tue, 21 Dec 2021 08:36:58 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id x4sm4305405oiv.35.2021.12.21.08.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:36:57 -0800 (PST)
Date: Tue, 21 Dec 2021 09:36:56 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] pci: Skip power-off reset when pending unplug
Message-ID: <20211221093656.0d30644e.alex.williamson@redhat.com>
In-Reply-To: <20211220174502-mutt-send-email-mst@kernel.org>
References: <164002480875.2328622.7843917444941101286.stgit@omen>
 <20211220174502-mutt-send-email-mst@kernel.org>
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

On Mon, 20 Dec 2021 18:03:56 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Dec 20, 2021 at 11:26:59AM -0700, Alex Williamson wrote:
> > The below referenced commit introduced a change where devices under a
> > root port slot are reset in response to removing power to the slot.
> > This improves emulation relative to bare metal when the slot is powered
> > off, but introduces an unnecessary step when devices under that slot
> > are slated for removal.
> > 
> > In the case of an assigned device, there are mandatory delays
> > associated with many device reset mechanisms which can stall the hot
> > unplug operation.  Also, in cases where the unplug request is triggered
> > via a release operation of the host driver, internal device locking in
> > the host kernel may result in a failure of the device reset mechanism,
> > which generates unnecessary log warnings.
> > 
> > Skip the reset for devices that are slated for unplug.
> > 
> > Cc: qemu-stable@nongnu.org
> > Fixes: d5daff7d3126 ("pcie: implement slot power control for pcie root ports")
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>  
> 
> I am not sure this is safe. IIUC pending_deleted_event
> is normally set after host admin requested device removal,
> while the reset could be triggered by guest for its own reasons
> such as suspend or driver reload.

Right, the case where I mention that we get the warning looks exactly
like the admin doing a device eject, it calls qdev_unplug().  I'm not
trying to prevent arbitrary guest resets of the device, in fact there
are cases where the guest really should be able to reset the device,
nested assignment in addition to the cases you mention.  Gerd noted
that this was an unintended side effect of the referenced patch to
reset device that are imminently being removed.

> Looking at this some more, I am not sure I understand the
> issue completely.
> We have:
> 
>     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
>         (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
>         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
>         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
>         pcie_cap_slot_do_unplug(dev);
>     }
>     pcie_cap_update_power(dev);
> 
> so device unplug triggers first, reset follows and by that time
> there should be no devices under the bus, if there are then
> it's because guest did not clear the power indicator.

Note that the unplug only triggers here if the Power Indicator Control
is OFF, I see writes to SLTCTL in the following order:

 01f1 - > 02f1 -> 06f1 -> 07f1

So PIC changes to BLINK, then PCC changes the slot to OFF (this
triggers the reset), then PIC changes to OFF triggering the unplug.

The unnecessary reset that occurs here is universal.  Should the unplug
be occurring when:

  (val & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_ON

?
 
> So I am not sure how to fix the assignment issues as I'm not sure how do
> they trigger, but here is a wild idea: maybe it should support an API
> for starting reset asynchronously, then if the following access is
> trying to reset again that second reset can just be skipped, while any
> other access will stall.

As above, there's not a concurrency problem, so I don't see how an
async API buys us anything.  It seems the ordering of the slot power
induced reset versus device unplug is not as you expected.  Can we fix
that?  Thanks,

Alex

> > ---
> >  hw/pci/pci.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index e5993c1ef52b..f594da410797 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -2869,7 +2869,7 @@ void pci_set_power(PCIDevice *d, bool state)
> >      memory_region_set_enabled(&d->bus_master_enable_region,
> >                                (pci_get_word(d->config + PCI_COMMAND)
> >                                 & PCI_COMMAND_MASTER) && d->has_power);
> > -    if (!d->has_power) {
> > +    if (!d->has_power && !d->qdev.pending_deleted_event) {
> >          pci_device_reset(d);
> >      }
> >  }
> >   
> 


