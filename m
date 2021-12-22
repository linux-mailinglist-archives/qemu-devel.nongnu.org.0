Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8D347D77C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:11:15 +0100 (CET)
Received: from localhost ([::1]:42708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0717-00024h-UQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:11:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n06yL-0000Hd-NV
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:08:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n06yF-0006pK-CH
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640200093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMYOpLWmxaRiV6sogMlTI0HSoeZwzzXurzGO3SVKGqw=;
 b=g6VLLt85Oh/Y43H4ABuhV5FEWLrI8FzG3Qw5JOVBQl4N9+QTnMBaT1y5JXM9YBuR/LmJcz
 QFYAtstCdAQsuEf38dycOh287OsOSgrPA+T7YgKQcMMDmbvVx+ZW/JXCXsBYOu4k9AWv/G
 lufxg/ZoDuhZ5sfDt2f8Z7gIiAiFmkw=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-9WfThUNYPcCGLn7CW0fWRQ-1; Wed, 22 Dec 2021 14:08:12 -0500
X-MC-Unique: 9WfThUNYPcCGLn7CW0fWRQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 l6-20020a4abe06000000b002dab9d33f2eso836838oop.0
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 11:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AMYOpLWmxaRiV6sogMlTI0HSoeZwzzXurzGO3SVKGqw=;
 b=oVWCHnbVvCqo14ibtk4OHd88MMLeAPfn+hm4L589IaWoDczTe0ELzUTwbFvAHKVfyu
 tkFpGgnQmr0G8I+k3h6i6te5AAgeHpr8Ue814ECj9lcKpSn36rW//gIRZOHZ51D0qom5
 uakxgKYjqhZz7t4YZa0XodHs5UI6d3g/QiqN9u7mOVjzQuL35i+NL+PbtQu2NaSnidP1
 qPB1u7OnEDnoycW06rIMb3EeCH5skSY/Z/Gcky5Z+LX//rZpXQ54mg/7DqH0iQOFd59G
 hO4avIoyySl1YZKpTcS/9WN9Jryp5yBEd9yeg8WNIa4Y7SnYJAfFfE692Gfg0pWkPKxi
 Ni8A==
X-Gm-Message-State: AOAM530tWF1p8RzSYx49RToBj+c8TBEz4aDbN/LofBP8hPj0pAk+9+Nc
 DbsNL1YYnGNz7sqzUNsNcsv8v1yTMIys63hjwyWUWWpRdxYAns/6y7savWrMyYsmW0h78dqEKPs
 5LrsGknGRPoLu22c=
X-Received: by 2002:a4a:c902:: with SMTP id v2mr2611708ooq.11.1640200091652;
 Wed, 22 Dec 2021 11:08:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUjdR8MWlNFFWK+ofhKd4CZQ0skyb2rJqyGY5gYbem2+IQWvKthUJ22fCk/fuCcGh56IHWnQ==
X-Received: by 2002:a4a:c902:: with SMTP id v2mr2611697ooq.11.1640200091396;
 Wed, 22 Dec 2021 11:08:11 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id n21sm26527oov.33.2021.12.22.11.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 11:08:10 -0800 (PST)
Date: Wed, 22 Dec 2021 12:08:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] pci: Skip power-off reset when pending unplug
Message-ID: <20211222120809.3f28f44b.alex.williamson@redhat.com>
In-Reply-To: <20211221183400-mutt-send-email-mst@kernel.org>
References: <164002480875.2328622.7843917444941101286.stgit@omen>
 <20211220174502-mutt-send-email-mst@kernel.org>
 <20211221093656.0d30644e.alex.williamson@redhat.com>
 <20211221183400-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, 21 Dec 2021 18:40:09 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Dec 21, 2021 at 09:36:56AM -0700, Alex Williamson wrote:
> > On Mon, 20 Dec 2021 18:03:56 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Mon, Dec 20, 2021 at 11:26:59AM -0700, Alex Williamson wrote:  
> > > > The below referenced commit introduced a change where devices under a
> > > > root port slot are reset in response to removing power to the slot.
> > > > This improves emulation relative to bare metal when the slot is powered
> > > > off, but introduces an unnecessary step when devices under that slot
> > > > are slated for removal.
> > > > 
> > > > In the case of an assigned device, there are mandatory delays
> > > > associated with many device reset mechanisms which can stall the hot
> > > > unplug operation.  Also, in cases where the unplug request is triggered
> > > > via a release operation of the host driver, internal device locking in
> > > > the host kernel may result in a failure of the device reset mechanism,
> > > > which generates unnecessary log warnings.
> > > > 
> > > > Skip the reset for devices that are slated for unplug.
> > > > 
> > > > Cc: qemu-stable@nongnu.org
> > > > Fixes: d5daff7d3126 ("pcie: implement slot power control for pcie root ports")
> > > > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>    
> > > 
> > > I am not sure this is safe. IIUC pending_deleted_event
> > > is normally set after host admin requested device removal,
> > > while the reset could be triggered by guest for its own reasons
> > > such as suspend or driver reload.  
> > 
> > Right, the case where I mention that we get the warning looks exactly
> > like the admin doing a device eject, it calls qdev_unplug().  I'm not
> > trying to prevent arbitrary guest resets of the device, in fact there
> > are cases where the guest really should be able to reset the device,
> > nested assignment in addition to the cases you mention.  Gerd noted
> > that this was an unintended side effect of the referenced patch to
> > reset device that are imminently being removed.
> >   
> > > Looking at this some more, I am not sure I understand the
> > > issue completely.
> > > We have:
> > > 
> > >     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> > >         (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
> > >         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> > >         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
> > >         pcie_cap_slot_do_unplug(dev);
> > >     }
> > >     pcie_cap_update_power(dev);
> > > 
> > > so device unplug triggers first, reset follows and by that time
> > > there should be no devices under the bus, if there are then
> > > it's because guest did not clear the power indicator.  
> > 
> > Note that the unplug only triggers here if the Power Indicator Control
> > is OFF, I see writes to SLTCTL in the following order:
> > 
> >  01f1 - > 02f1 -> 06f1 -> 07f1
> > 
> > So PIC changes to BLINK, then PCC changes the slot to OFF (this
> > triggers the reset), then PIC changes to OFF triggering the unplug.
> > 
> > The unnecessary reset that occurs here is universal.  Should the unplug
> > be occurring when:
> > 
> >   (val & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_ON
> > 
> > ?  
> 
> well blinking generally means "do not remove yet".

Blinking indicates that the slot is in a transition phase, which we
could also interpret to mean that power has been removed and this is
the time required for the power to settle.  By that token, it might be
reasonable that a power state induced reset doesn't actually occur
until the slot reaches both the slot power off and power indicator off
state.  In that case we could reorganize things to let the unplug occur
before the power transition.  Of course the original proposal also
essentially supports this interpretation, the slot power off reset does
not occur for devices with a pending unplug and those devices are
removed after the slot transition grace period.

> > > So I am not sure how to fix the assignment issues as I'm not sure how do
> > > they trigger, but here is a wild idea: maybe it should support an API
> > > for starting reset asynchronously, then if the following access is
> > > trying to reset again that second reset can just be skipped, while any
> > > other access will stall.  
> > 
> > As above, there's not a concurrency problem, so I don't see how an
> > async API buys us anything.  
> 
> Well unplug resets the device again, right? Why is that reset not
> problematic and this one is?

It has the same issue, but there's no log message generated that
worries QE into marking this as a regression.  Obviously the ideal
outcome would be that we could reset the device under these conditions,
but to this point we've only managed to introduce "try" semantics to
the functions to prevent deadlock.  As this is a condition induced by
corner case admin device handling, we've so far considered the reset
failure acceptable.  Thanks,

Alex


