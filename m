Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F9485B78
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:15:34 +0100 (CET)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EZB-0003Dc-Ht
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:15:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n5EWN-0008S5-6S
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:12:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n5EWE-0003sq-Qv
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641420749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nc1eVSjg4JO0qXwK1CBsoMg4DszHu+ivyYQQ9aXbIPg=;
 b=OxAMjx5Iu5QIeE2yPlwo9cmf+KrKT4xsfwMxFl4RXStNIsPPdamaA3ymTIcW9zuZDg6wnc
 HTc6+V97Aqz3IjOAGh6ijKhM+1ELjlqpCrkr9/ASICTYUycoKLGlRiOQNpWCUMk1k2qyo1
 iVsJLQqFb95YwZueNNEqtacP6B6tLjQ=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-pWFCDhOZNLC0Z94R3qe1BQ-1; Wed, 05 Jan 2022 17:12:28 -0500
X-MC-Unique: pWFCDhOZNLC0Z94R3qe1BQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 68-20020a4a0347000000b002c2ac2c476dso95325ooi.21
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 14:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nc1eVSjg4JO0qXwK1CBsoMg4DszHu+ivyYQQ9aXbIPg=;
 b=7uofv6XCA/YUDF+CTXlvBVGKIa4z7oGPyOHJ76PyGzDbmmue9L/OYdWz6/i6HDF5OA
 22IIRXXW1Z3/h38I96mASHlKYjCSh769s8mlFLrEUXpH+nbYa/Axm3zMbITmWaKKJXM0
 KDh12UJ8WBb/x65aWvq/1Zy1vgJTHSd/hWdMP8ktKPZHYS49ENX+7QHeHuIE+YMt4sny
 WBKGDp3h581GfzpYUb6aUvWzuuQwKx4uBbSEGSm2IJKIH2e3aovexlzu63Br7/WAYD60
 aMkoLA/CG19JugvfqQJfHzXBfgp3eMwaPzL9MOmRirdZ/HMG472R24LV2In0Iikar2fj
 C+hg==
X-Gm-Message-State: AOAM5338k2giblQ0g5Ty/fwumaeJ1XtqsdiyXby82h9h5ldRUG/8ka6h
 GICHpkSLs2jL3rMqV3p5GysOltVI4WcC42T80P/+K+e4sWT1MK6UjZ5wT3Rr2UbWqxqruJFhVxQ
 t4C7swPvyjcHpQ/k=
X-Received: by 2002:aca:34c4:: with SMTP id b187mr4209978oia.108.1641420747629; 
 Wed, 05 Jan 2022 14:12:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws3T34h7Me9CNVEbX0Rlgdk2m79bNBo0cpcmEgiVV5wlbLELylOu3BXmV9x0LXlMhnXrwIiA==
X-Received: by 2002:aca:34c4:: with SMTP id b187mr4209966oia.108.1641420747385; 
 Wed, 05 Jan 2022 14:12:27 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id 97sm30708otc.10.2022.01.05.14.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 14:12:27 -0800 (PST)
Date: Wed, 5 Jan 2022 15:12:26 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vfio/pci: Generate more relevant log messages for reset
 failures
Message-ID: <20220105151226.42cf6a06.alex.williamson@redhat.com>
In-Reply-To: <20220105160400-mutt-send-email-mst@kernel.org>
References: <164141259622.4193261.8252690438434562107.stgit@omen>
 <20220105160400-mutt-send-email-mst@kernel.org>
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

On Wed, 5 Jan 2022 16:05:45 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Jan 05, 2022 at 12:56:42PM -0700, Alex Williamson wrote:
> > The VFIO_DEVICE_RESET ioctl might be backed by several different reset
> > methods, including a device specific reset (ie. custom reset code in
> > kernel), an ACPI reset (ie. custom reset code in firmware), FLR, PM,
> > and bus resets.  This listing is also the default priority order used
> > by the kernel for trying reset methods.  Traditionally we've had some
> > FUD regarding the PM reset as the extent of a "Soft Reset" is not well
> > defined in the PCI specification.  Therefore we try to guess what type
> > of reset a device might use for the VFIO_DEVICE_RESET and insert a bus
> > reset via the vfio hot reset interface if we think it could be a PM
> > reset.
> > 
> > This results in a couple odd tests for PM reset in our hot reset code,
> > as we assume if we don't detect has_pm_reset support that we can't
> > reset the device otherwise.  Starting with kernel v5.15, the kernel
> > exposes a sysfs attribute for devices that can tell us the priority
> > order for device resets, so long term (not implemented here) we no
> > longer need to play this guessing game, and if permissions allow we
> > could manipulate the order ourselves so that we don't need to inject
> > our own hot reset.
> > 
> > In the shorter term, implemented here, let's not assume we're out of
> > reset methods if we can't perform a hot reset and the device doesn't
> > support PM reset.  We can use reset_works as the authority, which
> > allows us to generate more comprehensible error messages for the case
> > when it actually doesn't work.
> > 
> > The impetus for this change is a result of commit d5daff7d3126 ("pcie:
> > implement slot power control for pcie root ports"), where powering off
> > a slot now results in a device reset.  If the slot is powered off as a
> > result of qdev_unplug() via the device request event, that device
> > request is potentially the result of an unbind operation in the host.
> > That unbind operation holds the kernel device lock, which causes the
> > VFIO_DEVICE_RESET ioctl to fail (or in the case of some kernels, has
> > cleared the flag indicating support of a device reset function).  We
> > can then end up with an SR-IOV VF device trying to trigger a hot reset,
> > which finds that it needs ownership of the PF group to perform such a
> > reset, resulting in confusing log messages.
> > 
> > Ultimately the above commit still introduces a log message that we
> > didn't have prior on such an unplug, but it's not unjustified to
> > perform such a reset, though it might be considered unnecessary.
> > Arguably failure to reset the device should always generate some sort
> > of meaningful log message.
> > 
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>  
> 
> Looks reasonable. Just an extra idea: do we want to maybe validate the
> return code from the ioctl? I assume it's something like EBUSY right?

Ideally it'd be EAGAIN to denote the lock contention, but for some
reason there was a recent time when the kernel would clear the
pci_dev.reset_fn flag as part of pci_stop_dev() before unbinding the
driver from the device, in that case we get an ENOTTY.

Hmm, I'm remembering now that an issue with this approach to log all
device reset failures is that we're going to get false positives every
time we reboot a VM where we need a bus reset for multiple devices.  We
handle multiple devices via a reset handler but we'll still get a
redundant per device reset and we have no way to associate that per
device reset to a VM reset where the reset handler multi-device
mechanism may have been successful :-\  This would be very common with
desktop GPUs.  I'll plug away at this some more.  Thanks,

Alex


