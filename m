Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E17485BC3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:39:56 +0100 (CET)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Ewl-0001s4-CG
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5EvR-000146-R4
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:38:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5EvO-0001bs-R9
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641422310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q79s+Apd/X4l7c96CchusDLCzayBhpGpJuY1S1arum0=;
 b=DY0SU9riEsCF/kRnKzTO+6P8xktvxDNjIEeB6hCS8ZkyN8q7dSSPkyiqsuosUax2qlz6wH
 cNv4vTCB3UOXbnSqtqZNqmbMZxUYXg9HhYS44a0A7L8tO7uos7J2UBsJkxy0gXf2cJAd+f
 7+aoYLuhE8wC4oufvgmGIA/kl2bTphY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-bA7ZWxtfOg2l3EmgJUWDJg-1; Wed, 05 Jan 2022 17:38:29 -0500
X-MC-Unique: bA7ZWxtfOg2l3EmgJUWDJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j18-20020a05600c1c1200b003335872db8dso58027wms.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 14:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q79s+Apd/X4l7c96CchusDLCzayBhpGpJuY1S1arum0=;
 b=OgtBMr75fTBddJNIkiz3VIQwFSf04vjJD0Qr41Vmjk/zgUEKVU65u/O8rgtgO60MYE
 VOVR+WbzwMNNsF0Nt3qlUxJlvTJqknQl80ygnN8veEVPWsIYq9tUCtf4g9IpwvppY6VP
 2FVCh5Qh9h24HnWZFXraW2Om3d42nfQF7puQmw9Gel1B182BIm6L5KAjxk6G7A/lHOf7
 Ihu559UjKyCmLLFAJPTe/1uelq3a94Dp3gpZyvAnH4jkRWhojy7yqN3J8kkPxRgPKECP
 ddflVC+NROCkaxLvUadI7wBHswQ+IGscQgYjo5bXee+ABLVoV4+AmlTHIlc4a7uamn/v
 biAg==
X-Gm-Message-State: AOAM533QRw6drsV4czk0xfthszTvz5jllS0Ei1xfVB2kb1QA6PH2U0/9
 A87KZhftnptWboBn7UtzZaZkiBsXpHIHcl1juu1jkvqJkRm9mrDsFLXNXrw5MyD8KvNH2oKmx61
 iq2c6WcXYfYh2jqE=
X-Received: by 2002:adf:d843:: with SMTP id k3mr50094882wrl.303.1641422307820; 
 Wed, 05 Jan 2022 14:38:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw11Cu8cnfOY5N/32NJg6PIF86+96vlRLcnYwinSl4g5uc0vOiJdUwK5YqhuaQIX8DrOIc2vg==
X-Received: by 2002:adf:d843:: with SMTP id k3mr50094872wrl.303.1641422307560; 
 Wed, 05 Jan 2022 14:38:27 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id w4sm128608wmi.40.2022.01.05.14.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 14:38:26 -0800 (PST)
Date: Wed, 5 Jan 2022 17:38:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] vfio/pci: Generate more relevant log messages for reset
 failures
Message-ID: <20220105173735-mutt-send-email-mst@kernel.org>
References: <164141259622.4193261.8252690438434562107.stgit@omen>
 <20220105160400-mutt-send-email-mst@kernel.org>
 <20220105151226.42cf6a06.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220105151226.42cf6a06.alex.williamson@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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

On Wed, Jan 05, 2022 at 03:12:26PM -0700, Alex Williamson wrote:
> On Wed, 5 Jan 2022 16:05:45 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Jan 05, 2022 at 12:56:42PM -0700, Alex Williamson wrote:
> > > The VFIO_DEVICE_RESET ioctl might be backed by several different reset
> > > methods, including a device specific reset (ie. custom reset code in
> > > kernel), an ACPI reset (ie. custom reset code in firmware), FLR, PM,
> > > and bus resets.  This listing is also the default priority order used
> > > by the kernel for trying reset methods.  Traditionally we've had some
> > > FUD regarding the PM reset as the extent of a "Soft Reset" is not well
> > > defined in the PCI specification.  Therefore we try to guess what type
> > > of reset a device might use for the VFIO_DEVICE_RESET and insert a bus
> > > reset via the vfio hot reset interface if we think it could be a PM
> > > reset.
> > > 
> > > This results in a couple odd tests for PM reset in our hot reset code,
> > > as we assume if we don't detect has_pm_reset support that we can't
> > > reset the device otherwise.  Starting with kernel v5.15, the kernel
> > > exposes a sysfs attribute for devices that can tell us the priority
> > > order for device resets, so long term (not implemented here) we no
> > > longer need to play this guessing game, and if permissions allow we
> > > could manipulate the order ourselves so that we don't need to inject
> > > our own hot reset.
> > > 
> > > In the shorter term, implemented here, let's not assume we're out of
> > > reset methods if we can't perform a hot reset and the device doesn't
> > > support PM reset.  We can use reset_works as the authority, which
> > > allows us to generate more comprehensible error messages for the case
> > > when it actually doesn't work.
> > > 
> > > The impetus for this change is a result of commit d5daff7d3126 ("pcie:
> > > implement slot power control for pcie root ports"), where powering off
> > > a slot now results in a device reset.  If the slot is powered off as a
> > > result of qdev_unplug() via the device request event, that device
> > > request is potentially the result of an unbind operation in the host.
> > > That unbind operation holds the kernel device lock, which causes the
> > > VFIO_DEVICE_RESET ioctl to fail (or in the case of some kernels, has
> > > cleared the flag indicating support of a device reset function).  We
> > > can then end up with an SR-IOV VF device trying to trigger a hot reset,
> > > which finds that it needs ownership of the PF group to perform such a
> > > reset, resulting in confusing log messages.
> > > 
> > > Ultimately the above commit still introduces a log message that we
> > > didn't have prior on such an unplug, but it's not unjustified to
> > > perform such a reset, though it might be considered unnecessary.
> > > Arguably failure to reset the device should always generate some sort
> > > of meaningful log message.
> > > 
> > > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>  
> > 
> > Looks reasonable. Just an extra idea: do we want to maybe validate the
> > return code from the ioctl? I assume it's something like EBUSY right?
> 
> Ideally it'd be EAGAIN to denote the lock contention,

Or EBUSY?

> but for some
> reason there was a recent time when the kernel would clear the
> pci_dev.reset_fn flag as part of pci_stop_dev() before unbinding the
> driver from the device, in that case we get an ENOTTY.
> 
> Hmm, I'm remembering now that an issue with this approach to log all
> device reset failures is that we're going to get false positives every
> time we reboot a VM where we need a bus reset for multiple devices.  We
> handle multiple devices via a reset handler but we'll still get a
> redundant per device reset and we have no way to associate that per
> device reset to a VM reset where the reset handler multi-device
> mechanism may have been successful :-\  This would be very common with
> desktop GPUs.  I'll plug away at this some more.  Thanks,
> 
> Alex


