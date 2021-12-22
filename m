Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9AB47D989
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 00:11:41 +0100 (CET)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Alo-0008A2-CF
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 18:11:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n0Akb-0007TD-KK
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 18:10:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n0AkY-00042d-7p
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 18:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640214615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uavUybCxWHskByLKoGkFczGRxfSbQUVo1hyGSBoKYXI=;
 b=VKR8lvhLnf6X5x6eSsfXrd1UDucrH+gR0gmaUUfq4mFOEJ9aWBR29VRvr8GR93yQBGzEL9
 ccEPkMZeVhp8gyl1cH2xILAnUddLrsMajUG8URGz7wYTX5Hx7Q2JnsO/tvN5kSH3vnLg1B
 +HavZ5AdAHqm0dXZXE8ves3d3OZIju8=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-j_AbOSj5OayEswDmGD8wSQ-1; Wed, 22 Dec 2021 18:10:13 -0500
X-MC-Unique: j_AbOSj5OayEswDmGD8wSQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 k8-20020a4a4308000000b002c6b67d6b05so1833865ooj.15
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 15:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uavUybCxWHskByLKoGkFczGRxfSbQUVo1hyGSBoKYXI=;
 b=X0bD8fr0PygBQDSzSsm5Sep/bF3y9Nu/BztBjvHHEXuBXBPXioGHPg8yqCYGXlifDZ
 8ArhYQ/+05L45ecNReNVSvKnebqsOnw5FY9ETow/DNt2Adie25mMPNAxd3sKEUMujbPh
 w8AnhCwaVAdzHd1n9fxHBHUT6JPbbo0+Pizno/kBUeKaGANoM3bfs0Sc/X4tKSabt002
 XKyOA4xdViT/YwsPOihMIZ1tOcFSvRjI9UGEca2+R9YccAU4VR1BuXFpgK3EJFhRe0GO
 hFkBlNFcVtYSBu8qJ5TGrSEt9innvdPMqTXinUKsS3LJjYrtITcUtIKtxTZ/Tl7wyp1T
 eYbw==
X-Gm-Message-State: AOAM530WlO5xbr5IEwWbY10JhriAAK5g8pf4IA/8uXO+13ml1PxyTmfP
 5aHmPipBoGI0M0qYuKn4M3qhQZdwjPfjW3uColhT4UrUlcrjHilIjq1z+66iEX8NO2+dfwkmSUD
 QE2TMBC5uOaz9dr8=
X-Received: by 2002:a05:6830:5a:: with SMTP id
 d26mr3460301otp.316.1640214611621; 
 Wed, 22 Dec 2021 15:10:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7BeMXHDb6Z7HlQgYLXAsvJQREEHc4Wf6ogbVnPZvxufKmxPEdkTTR4cQ0LmlxbJis5DlJEA==
X-Received: by 2002:a05:6830:5a:: with SMTP id
 d26mr3460239otp.316.1640214609860; 
 Wed, 22 Dec 2021 15:10:09 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id b17sm605045ots.66.2021.12.22.15.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 15:10:09 -0800 (PST)
Date: Wed, 22 Dec 2021 16:10:07 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] pci: Skip power-off reset when pending unplug
Message-ID: <20211222161007.27cb7729.alex.williamson@redhat.com>
In-Reply-To: <20211222152815-mutt-send-email-mst@kernel.org>
References: <164002480875.2328622.7843917444941101286.stgit@omen>
 <20211220174502-mutt-send-email-mst@kernel.org>
 <20211221093656.0d30644e.alex.williamson@redhat.com>
 <20211221183400-mutt-send-email-mst@kernel.org>
 <20211222120809.3f28f44b.alex.williamson@redhat.com>
 <20211222152815-mutt-send-email-mst@kernel.org>
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

On Wed, 22 Dec 2021 15:48:24 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Dec 22, 2021 at 12:08:09PM -0700, Alex Williamson wrote:
> > On Tue, 21 Dec 2021 18:40:09 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Tue, Dec 21, 2021 at 09:36:56AM -0700, Alex Williamson wrote:  
> > > > On Mon, 20 Dec 2021 18:03:56 -0500
> > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > >     
> > > > > On Mon, Dec 20, 2021 at 11:26:59AM -0700, Alex Williamson wrote:    
> > > > > > The below referenced commit introduced a change where devices under a
> > > > > > root port slot are reset in response to removing power to the slot.
> > > > > > This improves emulation relative to bare metal when the slot is powered
> > > > > > off, but introduces an unnecessary step when devices under that slot
> > > > > > are slated for removal.
> > > > > > 
> > > > > > In the case of an assigned device, there are mandatory delays
> > > > > > associated with many device reset mechanisms which can stall the hot
> > > > > > unplug operation.  Also, in cases where the unplug request is triggered
> > > > > > via a release operation of the host driver, internal device locking in
> > > > > > the host kernel may result in a failure of the device reset mechanism,
> > > > > > which generates unnecessary log warnings.
> > > > > > 
> > > > > > Skip the reset for devices that are slated for unplug.
> > > > > > 
> > > > > > Cc: qemu-stable@nongnu.org
> > > > > > Fixes: d5daff7d3126 ("pcie: implement slot power control for pcie root ports")
> > > > > > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>      
> > > > > 
> > > > > I am not sure this is safe. IIUC pending_deleted_event
> > > > > is normally set after host admin requested device removal,
> > > > > while the reset could be triggered by guest for its own reasons
> > > > > such as suspend or driver reload.    
> > > > 
> > > > Right, the case where I mention that we get the warning looks exactly
> > > > like the admin doing a device eject, it calls qdev_unplug().  I'm not
> > > > trying to prevent arbitrary guest resets of the device, in fact there
> > > > are cases where the guest really should be able to reset the device,
> > > > nested assignment in addition to the cases you mention.  Gerd noted
> > > > that this was an unintended side effect of the referenced patch to
> > > > reset device that are imminently being removed.
> > > >     
> > > > > Looking at this some more, I am not sure I understand the
> > > > > issue completely.
> > > > > We have:
> > > > > 
> > > > >     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> > > > >         (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
> > > > >         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> > > > >         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
> > > > >         pcie_cap_slot_do_unplug(dev);
> > > > >     }
> > > > >     pcie_cap_update_power(dev);
> > > > > 
> > > > > so device unplug triggers first, reset follows and by that time
> > > > > there should be no devices under the bus, if there are then
> > > > > it's because guest did not clear the power indicator.    
> > > > 
> > > > Note that the unplug only triggers here if the Power Indicator Control
> > > > is OFF, I see writes to SLTCTL in the following order:
> > > > 
> > > >  01f1 - > 02f1 -> 06f1 -> 07f1
> > > > 
> > > > So PIC changes to BLINK, then PCC changes the slot to OFF (this
> > > > triggers the reset), then PIC changes to OFF triggering the unplug.
> > > > 
> > > > The unnecessary reset that occurs here is universal.  Should the unplug
> > > > be occurring when:
> > > > 
> > > >   (val & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_ON
> > > > 
> > > > ?    
> > > 
> > > well blinking generally means "do not remove yet".  
> > 
> > Blinking indicates that the slot is in a transition phase,  
> 
> Well the spec seems to state that blinking indicates it's waiting
> to see user does not change his/her mind by pressing the
> button again.

We're dealing with the Power Indicator, not the Attention Indicator
here.

> > which we
> > could also interpret to mean that power has been removed and this is
> > the time required for the power to settle.  By that token, it might be
> > reasonable that a power state induced reset doesn't actually occur
> > until the slot reaches both the slot power off and power indicator off
> > state.  
> 
> The reset is actually just an attempt to approximate power off.
> So I'm not sure that is right powering device off and then on
> is just a slow but reasonable way for guests to reset a device.

Agree, I don't have a problem with resetting devices in response to the
slot being powered off, just that it's pointless, and in some scenarios
causes us additional grief when it occurs when the device is being
removed anyway.

> >  In that case we could reorganize things to let the unplug occur
> > before the power transition.  
> 
> Hmm you mean unplug on host immediately when it starts blinking?
> But drivers are not notified at this point, are they?

I think this is confusing Attention Indicator and Power Indicator
again.  The write sequence I noted for the slot control register was as
follows:

    01f1 - > 02f1 -> 06f1 -> 07f1

 01f1:
   Attention Indicator: OFF
   Power Indicator: ON
   Power Controller: ON

 02f1:
   Power Indicator: ON -> BLINK

 06f1:
   Power Controller: ON -> OFF

 07f1:
   Power Indicator: BLINK -> OFF

The device reset currently occurs at 06f1, when the Power Controller
removes power to the slot.  The unplug doesn't occur until 07f1 when
the Power Indicator turns off.  On bare metal, the device power would
be in some indeterminate state between those two writes as the power
drains.  We've chosen to reset the device at the beginning of this
phase, where power is first removed (ie. instantaneous power drain),
but on a physical device it happens somewhere in between.  It therefore
seems valid that it could happen at the moment the Power Indicator
turns off such that we could precede the device reset with any
necessary unplug operations.

> >  Of course the original proposal also
> > essentially supports this interpretation, the slot power off reset does
> > not occur for devices with a pending unplug and those devices are
> > removed after the slot transition grace period.  
> 
> Meaning the patch you posted? It relies on guest doing a specific
> thing though, and guest and host states are not synchronized.

The proposed patch just means we won't reset the device in response to
slot power if an unplug is pending.  So sure, if it's true that a guest
playing with the Power Controller without using the Power Indicator to
reflect the slot state could skip a device reset, but is that valid
guest behavior?

> I think it might work to defer reset if it's blinking until it actually
> stops blinking. To me it seems a bit less risky but but again, in theory
> some guest driver could use the power cycle reset while hotplug plays
> with PIC waiting for the cancel button press.

That's essentially my previous suggestion above.  The Power Indicator
blinking tells us the slot power is in transition, the option to press
the attention button to abort has passed.  I understand the abort
window to be governed by the Attention Indicator blinking.

> E.g. I suspect your patch can be broken just by guest loading/unloading
> driver in a loop while host also triggers plug/unplug.

It's not clear to me why that might fail.  Can you elaborate?  All it
does is skip the reset when an unplug is pending, but the actual unplug
finalizes the device and any subsequent plug necessarily uses a new
device, so I don't see what goes wrong.

> > > > > So I am not sure how to fix the assignment issues as I'm not sure how do
> > > > > they trigger, but here is a wild idea: maybe it should support an API
> > > > > for starting reset asynchronously, then if the following access is
> > > > > trying to reset again that second reset can just be skipped, while any
> > > > > other access will stall.    
> > > > 
> > > > As above, there's not a concurrency problem, so I don't see how an
> > > > async API buys us anything.    
> > > 
> > > Well unplug resets the device again, right? Why is that reset not
> > > problematic and this one is?  
> > 
> > It has the same issue, but there's no log message generated that
> > worries QE into marking this as a regression.  
> 
> Well is the device already stopped from working at this point?
> Prevented from getting and responding to guest accesses?
> By something else?
> Because this is what happens when it's powered off, isn't it?

The reset failure doesn't prevent the device from being unplugged, QEMU
releases it and it gets disabled by the kernel driver.  Thanks,

Alex

PS - I'm about to sign off for the year, so apologies that this
conversation will need to wait until next year for further follow-up on
my end.  Happy holidays!


