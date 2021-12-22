Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF4347D860
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:50:35 +0100 (CET)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n08ZG-0004SY-Fx
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:50:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n08XN-000329-Vk
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n08XJ-0005g0-In
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640206112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dwqU7GF/6X7FhFzNoRew4rS6/4oK10Si5HJa8eVFVtU=;
 b=a8VBobV5/Z40a3+Gt5igMNt/s7gHuBqwijHLEi8RNVEVwEcMBah7Z8hI+SmTxadwxdc74U
 MwkThAU0fnkW7HRC5u/Rw4ggSDnb/r2FHLrZgKuRjGigdfqWnJKhLOV6pxEQWpGAQBGsRG
 X3vLaA5DEdA+KZduVDfr43W9f39ztWs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-LfT46VcvOiioTHlC-Qb2qQ-1; Wed, 22 Dec 2021 15:48:31 -0500
X-MC-Unique: LfT46VcvOiioTHlC-Qb2qQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 a203-20020a1c7fd4000000b0034574187420so3557814wmd.5
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 12:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dwqU7GF/6X7FhFzNoRew4rS6/4oK10Si5HJa8eVFVtU=;
 b=lg/U3oBA8rs13pl2JeOL4/w+iKQ5zaTjxIls5+Rd9BdhxR6KjY73X87d7T4RFrRhfF
 X1/uSB+zHoEOZqgrWEPG8vddUdD1k6Gyepds8VdsUpkT2soA5w/PJghI4Ms6rVeI7phI
 BSS0B4c2RvJKkoE/0qCWPJQ4gRXGVKiYZnj3NhXSfmJ2bLvtJK4AdAWmqOUEh8ChzPIU
 lfV0pPtN83/hfdf4wa3AqZd2teFbyGKue8b5DcuHnhpd0F3L/4n2YnYqxkAaoWB2S4x4
 3DKNhWsa6tUeWjIIjPM4FvfdkprgP4tlr0E6kzG/gAjSIM4k2+AZJ6Ks7zRgvI26Dmi5
 0H0g==
X-Gm-Message-State: AOAM532qgPHSPAcNL9RmP+rXVn5Gn7XwrBeISktt3Z2RJjjThGxuhq2X
 5YnIiT4bx9JfGGdYEKQsOteTayYzro10g9anouN0qkRZ4XDxnD3KOoiBgy0FhcwXRtns/idJExp
 k0Q9STgdacMoqtqI=
X-Received: by 2002:a5d:53cf:: with SMTP id a15mr3053165wrw.395.1640206109196; 
 Wed, 22 Dec 2021 12:48:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYzGR2UDyWklEx/JkHG2o4u/Pjpb0GZlpd7F6j6qoBJGimpv7fDo+la6XFLPBYl7CZwvnGVg==
X-Received: by 2002:a5d:53cf:: with SMTP id a15mr3053154wrw.395.1640206108894; 
 Wed, 22 Dec 2021 12:48:28 -0800 (PST)
Received: from redhat.com ([2.55.1.37])
 by smtp.gmail.com with ESMTPSA id h14sm2870982wrz.31.2021.12.22.12.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 12:48:28 -0800 (PST)
Date: Wed, 22 Dec 2021 15:48:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] pci: Skip power-off reset when pending unplug
Message-ID: <20211222152815-mutt-send-email-mst@kernel.org>
References: <164002480875.2328622.7843917444941101286.stgit@omen>
 <20211220174502-mutt-send-email-mst@kernel.org>
 <20211221093656.0d30644e.alex.williamson@redhat.com>
 <20211221183400-mutt-send-email-mst@kernel.org>
 <20211222120809.3f28f44b.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211222120809.3f28f44b.alex.williamson@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Dec 22, 2021 at 12:08:09PM -0700, Alex Williamson wrote:
> On Tue, 21 Dec 2021 18:40:09 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, Dec 21, 2021 at 09:36:56AM -0700, Alex Williamson wrote:
> > > On Mon, 20 Dec 2021 18:03:56 -0500
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >   
> > > > On Mon, Dec 20, 2021 at 11:26:59AM -0700, Alex Williamson wrote:  
> > > > > The below referenced commit introduced a change where devices under a
> > > > > root port slot are reset in response to removing power to the slot.
> > > > > This improves emulation relative to bare metal when the slot is powered
> > > > > off, but introduces an unnecessary step when devices under that slot
> > > > > are slated for removal.
> > > > > 
> > > > > In the case of an assigned device, there are mandatory delays
> > > > > associated with many device reset mechanisms which can stall the hot
> > > > > unplug operation.  Also, in cases where the unplug request is triggered
> > > > > via a release operation of the host driver, internal device locking in
> > > > > the host kernel may result in a failure of the device reset mechanism,
> > > > > which generates unnecessary log warnings.
> > > > > 
> > > > > Skip the reset for devices that are slated for unplug.
> > > > > 
> > > > > Cc: qemu-stable@nongnu.org
> > > > > Fixes: d5daff7d3126 ("pcie: implement slot power control for pcie root ports")
> > > > > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>    
> > > > 
> > > > I am not sure this is safe. IIUC pending_deleted_event
> > > > is normally set after host admin requested device removal,
> > > > while the reset could be triggered by guest for its own reasons
> > > > such as suspend or driver reload.  
> > > 
> > > Right, the case where I mention that we get the warning looks exactly
> > > like the admin doing a device eject, it calls qdev_unplug().  I'm not
> > > trying to prevent arbitrary guest resets of the device, in fact there
> > > are cases where the guest really should be able to reset the device,
> > > nested assignment in addition to the cases you mention.  Gerd noted
> > > that this was an unintended side effect of the referenced patch to
> > > reset device that are imminently being removed.
> > >   
> > > > Looking at this some more, I am not sure I understand the
> > > > issue completely.
> > > > We have:
> > > > 
> > > >     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> > > >         (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
> > > >         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> > > >         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
> > > >         pcie_cap_slot_do_unplug(dev);
> > > >     }
> > > >     pcie_cap_update_power(dev);
> > > > 
> > > > so device unplug triggers first, reset follows and by that time
> > > > there should be no devices under the bus, if there are then
> > > > it's because guest did not clear the power indicator.  
> > > 
> > > Note that the unplug only triggers here if the Power Indicator Control
> > > is OFF, I see writes to SLTCTL in the following order:
> > > 
> > >  01f1 - > 02f1 -> 06f1 -> 07f1
> > > 
> > > So PIC changes to BLINK, then PCC changes the slot to OFF (this
> > > triggers the reset), then PIC changes to OFF triggering the unplug.
> > > 
> > > The unnecessary reset that occurs here is universal.  Should the unplug
> > > be occurring when:
> > > 
> > >   (val & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_ON
> > > 
> > > ?  
> > 
> > well blinking generally means "do not remove yet".
> 
> Blinking indicates that the slot is in a transition phase,

Well the spec seems to state that blinking indicates it's waiting
to see user does not change his/her mind by pressing the
button again.

> which we
> could also interpret to mean that power has been removed and this is
> the time required for the power to settle.  By that token, it might be
> reasonable that a power state induced reset doesn't actually occur
> until the slot reaches both the slot power off and power indicator off
> state.

The reset is actually just an attempt to approximate power off.
So I'm not sure that is right powering device off and then on
is just a slow but reasonable way for guests to reset a device.



>  In that case we could reorganize things to let the unplug occur
> before the power transition.

Hmm you mean unplug on host immediately when it starts blinking?
But drivers are not notified at this point, are they?

>  Of course the original proposal also
> essentially supports this interpretation, the slot power off reset does
> not occur for devices with a pending unplug and those devices are
> removed after the slot transition grace period.

Meaning the patch you posted? It relies on guest doing a specific
thing though, and guest and host states are not synchronized.


I think it might work to defer reset if it's blinking until it actually
stops blinking. To me it seems a bit less risky but but again, in theory
some guest driver could use the power cycle reset while hotplug plays
with PIC waiting for the cancel button press.
E.g. I suspect your patch can be broken just by guest loading/unloading
driver in a loop while host also triggers plug/unplug.


> > > > So I am not sure how to fix the assignment issues as I'm not sure how do
> > > > they trigger, but here is a wild idea: maybe it should support an API
> > > > for starting reset asynchronously, then if the following access is
> > > > trying to reset again that second reset can just be skipped, while any
> > > > other access will stall.  
> > > 
> > > As above, there's not a concurrency problem, so I don't see how an
> > > async API buys us anything.  
> > 
> > Well unplug resets the device again, right? Why is that reset not
> > problematic and this one is?
> 
> It has the same issue, but there's no log message generated that
> worries QE into marking this as a regression.

Well is the device already stopped from working at this point?
Prevented from getting and responding to guest accesses?
By something else?
Because this is what happens when it's powered off, isn't it?

>  Obviously the ideal
> outcome would be that we could reset the device under these conditions,
> but to this point we've only managed to introduce "try" semantics to
> the functions to prevent deadlock.  As this is a condition induced by
> corner case admin device handling, we've so far considered the reset
> failure acceptable.  Thanks,
> 
> Alex


