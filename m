Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53A158436C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:43:34 +0200 (CEST)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5fh-00027a-Hg
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oH5cT-0006YK-FD
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:40:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oH5cQ-000893-7k
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659022808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qf6wiHcFrUzAOvXFvyBuBJWlqt/0N3W+xTpQ5Pv6VWE=;
 b=ApGd+m/5zI2BsnUgTfIz5gzKeriPiLRkt0+N0NC5wPSXYkGNpATRU+1w6gdwZfvb7CKozg
 Z8UVjlqS3OI5HWKtNlpAvvOZy/vSv9CVOzDeZ6KPONFf/IKNaZ0xSbVkWesgCdA7r6qqCJ
 UfETkRjzAnx/skimDrLB0eMRldCDSb4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-FBWjZ6-iNKC5N0y1w709Eg-1; Thu, 28 Jul 2022 11:40:06 -0400
X-MC-Unique: FBWjZ6-iNKC5N0y1w709Eg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h65-20020a1c2144000000b003a30cae106cso2636490wmh.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 08:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qf6wiHcFrUzAOvXFvyBuBJWlqt/0N3W+xTpQ5Pv6VWE=;
 b=oQQNJ+bSVyrCmRt8XH9u5QQ6ZAa26ySxWNyjxamGBQ24FATkZDtPcxYG7VfnEB9lUR
 BKbTuThy3jFRA17KAB5SLVLAFFCaC89ML4+8ocfyccheGZvpA/CP4Ts5XoVpjIc6Nuq2
 ydJZlXLjvbajI6w/ixn6jGB0Ex9cUgpe3CIvgN7+7stIW0TD/4yeLaNRpqlrljIDEpOY
 0sFRGxWbo7OZEa/nHv9XMY7WCQQ2yrlhZth1qPh2LBiOOahxSxgS3BVVZ6fAXQjX5lbu
 V80NdHnz8PlnJ7hOoWjQwME2aml6tfcmlk7It38YMmwx/MScgeYmyjH7LE9ZGJJcqH0w
 qC4w==
X-Gm-Message-State: AJIora87WFhbzPOlgsRqrCzPFS7OLflRKYDja1QPG6u5dhXctqayIz+f
 8qYRGFFx/ntR25nF1UhoX7CpVQB/OiqjWJW9/VBHIefMTvWP5HPmDdgF5pJdktM4ddNteFLprCY
 MgW53dAx24wYG1Fw=
X-Received: by 2002:a05:6000:1c7:b0:21e:68b9:c047 with SMTP id
 t7-20020a05600001c700b0021e68b9c047mr18806448wrx.597.1659022805441; 
 Thu, 28 Jul 2022 08:40:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZj9BPcpWKM0Lj9mXs5XQdVkBC+kRZCYTmjZL6USCV69x3f6yPQwDsjwjf1r9SsSF+RzvP/g==
X-Received: by 2002:a05:6000:1c7:b0:21e:68b9:c047 with SMTP id
 t7-20020a05600001c700b0021e68b9c047mr18806434wrx.597.1659022805166; 
 Thu, 28 Jul 2022 08:40:05 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-178.retail.telecomitalia.it.
 [79.46.200.178]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b003a31c4f6f74sm6885572wmq.32.2022.07.28.08.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 08:40:04 -0700 (PDT)
Date: Thu, 28 Jul 2022 17:40:02 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, den@virtuozzo.com
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Message-ID: <CAGxU2F5N1XmAP7ce4=L-_mKphSiucaFMS-D1SbDaN=hQixPCDg@mail.gmail.com>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <20220726094740-mutt-send-email-mst@kernel.org>
 <94e5b188-8489-9f75-a481-015667bc0ba4@virtuozzo.com>
 <20220727130644.wspwadl5645gfdpr@sgarzare-redhat>
 <de1bfd8f-c627-b936-ef5e-d71953236d96@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de1bfd8f-c627-b936-ef5e-d71953236d96@virtuozzo.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 28, 2022 at 7:28 AM Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com> wrote:
> On 7/27/22 16:06, Stefano Garzarella wrote:
> > On Tue, Jul 26, 2022 at 04:15:48PM +0200, Denis V. Lunev wrote:
> >> On 26.07.2022 15:51, Michael S. Tsirkin wrote:
> >>> On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
> >>>> Although QEMU virtio-blk is quite fast, there is still some room for
> >>>> improvements. Disk latency can be reduced if we handle virito-blk
> >>>> requests
> >>>> in host kernel so we avoid a lot of syscalls and context switches.
> >>>>
> >>>> The biggest disadvantage of this vhost-blk flavor is raw format.
> >>>> Luckily Kirill Thai proposed device mapper driver for QCOW2 format
> >>>> to attach
> >>>> files as block devices:
> >>>> https://www.spinics.net/lists/kernel/msg4292965.html
> >>> That one seems stalled. Do you plan to work on that too?
> >> We have too. The difference in numbers, as you seen below is quite too
> >> much. We have waited for this patch to be sent to keep pushing.
> >>
> >> It should be noted that may be talk on OSS this year could also push a
> >> bit.
> >
> > Cool, the results are similar of what I saw when I compared vhost-blk
> > and io_uring passthrough with NVMe (Slide 7 here: [1]).
> >
> > About QEMU block layer support, we recently started to work on libblkio
> > [2]. Stefan also sent an RFC [3] to implement the QEMU BlockDriver.
> > Currently it supports virtio-blk devices using vhost-vdpa and vhost-user.
> > We could add support for vhost (kernel) as well, though, we were
> > thinking of leveraging vDPA to implement in-kernel software device as well.
> >
> > That way we could reuse a lot of the code to support both hardware and
> > software accelerators.
> >
> > In the talk [1] I describe the idea a little bit, and a few months ago I
> > did a PoC (unsubmitted RFC) to see if it was feasible and the numbers
> > were in line with vhost-blk.
> >
> > Do you think we could join forces and just have an in-kernel vdpa-blk
> > software device?
>
> This seems worth trying. Why double the efforts to do the same. Yet I
> would like to play a bit with your vdpa-blk PoC beforehand.

Great :-)

> Can you send it to me with some instructions how to run it?

Yep, sure!

The PoC is available here: 
https://gitlab.com/sgarzarella/linux/-/tree/vdpa-sw-blk-poc

The tree was based on Linux v5.16, but I had some issues to rebuild with 
new gcc, so I rebased on v5.16.20 (not tested), configs needed:
CONFIG_VDPA_SW_BLOCK=m + CONFIG_VHOST_VDPA=m + dependencies.

It contains:
  - patches required for QEMU generic vhost-vdpa support
  - patches to support blk_mq_ops->poll() (to use io_uring iopoll) in
    the guest virtio-blk driver (I used the same kernel on guest and
    host)
  - some improvements for vringh (not completed, it could be a
    bottleneck)
  - vdpa-sw and vdpa-sw-blk patches (and hacks)

It is based on the vDPA simulator framework already merged upstream. The 
idea is to generalize the simulator to share the code between both 
software devices and simulators. The code needs a lot of work, I was 
focusing just on a working virtio-blk device emulation, but more focus 
on the generic part should be done.
In the code there are a couple of defines to control polling.

About the vdpa-blk device, you need iproute2's vdpa tool available 
upstream:
  https://wiki.linuxfoundation.org/networking/iproute2

Once the device is instantiated (see instructions later), the backend 
(raw file or device) can be set through a device attribute (not robust, 
but it was a PoC): /sys/bus/vdpa/devices/$dev_name/backend_fd

I wrote a simple python script available here: 
https://github.com/stefano-garzarella/vm-build/blob/main/vm-tools/vdpa_set_backend_fd.py

For QEMU, we are working on libblkio to support both slow path (when 
QEMU block layer is needed) and fast path (vqs passed directly to the 
device). For now libblkio supports only slow path, so to test the fast 
path you can use Longpeng's patches (not yet merged upstream) with 
generic vhost-vdpa support: 
https://lore.kernel.org/qemu-devel/20220514041107.1980-1-longpeng2@huawei.com/

Steps:
  # load vDPA block in-kernel sw device module
  modprobe vdpa_sw_blk

  # load nvme module with poll_queues set if you want to use iopoll
  modprobe nvme poll_queues=15

  # instantiate a new vdpa-blk device
  vdpa dev add mgmtdev vdpasw_blk name blk0

  # set backend (/dev/nvme0n1)
  vdpa_set_backend_fd.py -b /dev/nvme0n1 blk0

  # load vhost vDPA bus ...
  modprobe vhost_vdpa

  # ... and vhost-vdpa device will appear
  ls -l /dev/vhost-vdpa-0
  crw-------. 1 root root 510, 0 Jul 28 17:06 /dev/vhost-vdpa-0

  # start QEMU patched with generic vhost-vdpa
  qemu-system-x86_64 ... \
  -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0

I haven't tested it recently, so I'm not sure it all works, but in the 
next few days I'll try. For anything else, feel free to reach me here or 
on IRC (sgarzare on #qemu).

Thanks,
Stefano


