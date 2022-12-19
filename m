Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE68651509
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:39:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7NpO-0004SK-TI; Mon, 19 Dec 2022 16:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7NpN-0004S9-8N
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:37:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7NpK-0004T1-Ry
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671485857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sdDHqDRS9SmfDnZoz6MoHoTHy9WCTHAs8frHvevFrjE=;
 b=VV80B6BT7ivHFqR/wZMVuRrpqBHsRoNVqRO7WEeNcXgGiJ2V/4PvzIRK5/UHMddXOzjbQN
 NwdasKaNYSNBVaBzZh5PE6+NuYvpGR9pviwqloMJp94xqRTWf9wNh+MJjIY4wqbONRSRAP
 JdpvlZ+++3tdRCXNeEbhfJ0uOSk0AhQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-SxiCY7SbOmqHH1aIvgYc_w-1; Mon, 19 Dec 2022 16:37:36 -0500
X-MC-Unique: SxiCY7SbOmqHH1aIvgYc_w-1
Received: by mail-qv1-f69.google.com with SMTP id
 o13-20020a056214108d00b004c6fb4f16dcso6145406qvr.6
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdDHqDRS9SmfDnZoz6MoHoTHy9WCTHAs8frHvevFrjE=;
 b=e5KEvl7AaU+KOZDxIL0nq+0z89LwOP66+mMHIFB20D7MAcBE2xfmXfep7d1TyyVoOB
 cW6bRAd74t7ato1Z22gkaex6k+qGZpXcdXKo79rlSbVgo9lwp9tIINNX2L3pcI9HrWeE
 erSnifH1d94nYEnIcbta/or+gnIzwlNueOxcKJ+aAZSsdfDXDYys7iwWCRw4wwxGQ/8W
 f6MinNWTji/4mC06B3svA498uAR755SAuZY+LvNhnKh9XVy5m0m6qf2XDwHr5B/zDTWv
 2qwf/c3Lej5yiFgL0yAWfPpQgx999EMW/R+l54GhfsnGfq05jyWegSgjWLE+PM38Yxb7
 xr9A==
X-Gm-Message-State: ANoB5pleu6SUwbsAd9ub28FyB/IQETQCepFqNOMvHBC+kZlPXH60sHkV
 2BwgWgUB5NwiKC803QZWnQBNBq/8hOum6yDD51sxTMOVzwtgM7Lo+bBznqzbDyMX/wSAojbNWR7
 2nO+WQp4ybb3sSOU=
X-Received: by 2002:ac8:764b:0:b0:3a6:a89d:9ee with SMTP id
 i11-20020ac8764b000000b003a6a89d09eemr66160689qtr.33.1671485855785; 
 Mon, 19 Dec 2022 13:37:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7FAIP9bz7zcBB/RVtfwtgbOA8ddeKq/PJJgTAdz3UWJ2qTLBnWJ8HlyO7+20z63DNJQoL+FQ==
X-Received: by 2002:ac8:764b:0:b0:3a6:a89d:9ee with SMTP id
 i11-20020ac8764b000000b003a6a89d09eemr66160659qtr.33.1671485855526; 
 Mon, 19 Dec 2022 13:37:35 -0800 (PST)
Received: from redhat.com ([45.144.113.29]) by smtp.gmail.com with ESMTPSA id
 c8-20020ac81108000000b003996aa171b9sm6462454qtj.97.2022.12.19.13.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 13:37:34 -0800 (PST)
Date: Mon, 19 Dec 2022 16:37:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 sgarzare@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 arei.gonglei@huawei.com, yechuan@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v11 5/5] docs: Add generic vhost-vdpa device documentation
Message-ID: <20221219163711-mutt-send-email-mst@kernel.org>
References: <20221215134944.2809-1-longpeng2@huawei.com>
 <20221215134944.2809-6-longpeng2@huawei.com>
 <CACGkMEt65Nr_M6aTU1NwS3t=S6CaMROt7C+Hb0HqszzO7gJKMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEt65Nr_M6aTU1NwS3t=S6CaMROt7C+Hb0HqszzO7gJKMw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 16, 2022 at 11:33:49AM +0800, Jason Wang wrote:
> On Thu, Dec 15, 2022 at 9:50 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
> >
> > From: Longpeng <longpeng2@huawei.com>
> >
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > ---
> >  .../devices/vhost-vdpa-generic-device.rst     | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
> >
> > diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst b/docs/system/devices/vhost-vdpa-generic-device.rst
> > new file mode 100644
> > index 0000000000..24c825ef1a
> > --- /dev/null
> > +++ b/docs/system/devices/vhost-vdpa-generic-device.rst
> > @@ -0,0 +1,68 @@
> > +
> > +=========================
> > +vhost-vDPA generic device
> > +=========================
> > +
> > +This document explains the usage of the vhost-vDPA generic device.
> > +
> > +
> > +Description
> > +-----------
> > +
> > +vDPA(virtio data path acceleration) device is a device that uses a datapath
> > +which complies with the virtio specifications with vendor specific control
> > +path.
> > +
> > +QEMU provides two types of vhost-vDPA devices to enable the vDPA device, one
> > +is type sensitive which means QEMU needs to know the actual device type
> > +(e.g. net, blk, scsi) and another is called "vhost-vDPA generic device" which
> > +is type insensitive.
> > +
> > +The vhost-vDPA generic device builds on the vhost-vdpa subsystem and virtio
> > +subsystem. It is quite small, but it can support any type of virtio device.
> > +
> > +
> > +Requirements
> > +------------
> > +Linux 5.18+
> > +iproute2/vdpa 5.12.0+
> > +
> > +
> > +Examples
> > +--------
> > +
> > +1. Prepare the vhost-vDPA backends, here is an example using vdpa_sim_blk
> > +   device:
> > +
> > +::
> > +  host# modprobe vhost_vdpa
> > +  host# modprobe vdpa_sim_blk
> 
> Nit: it's probably better to add driver binding steps here.
> 
> > +  host# vdpa dev add mgmtdev vdpasim_blk name blk0
> > +  (...you can see the vhost-vDPA device under /dev directory now...)
> 
> And then the vhost char dev name could be fetch via
> 
> ls /sys/bus/vdpa/device/blk0/vhost-vdpa*
> 
> With the above changes.
> 
> Acked-by: Jason Wang <jasowang@redhat.com>
> 
> Thanks


Sounds minor enough, I'll queue, pls fix with a patch on top.

> > +  host# ls -l /dev/vhost-vdpa-*
> > +  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
> > +
> > +Note:
> > +It needs some vendor-specific steps to provision the vDPA device if you're
> > +using real HW devices, such as loading the vendor-specific vDPA driver and
> > +binding the device to the driver.
> > +
> > +
> > +2. Start the virtual machine:
> > +
> > +Start QEMU with virtio-mmio bus:
> > +
> > +::
> > +  host# qemu-system                                                  \
> > +      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
> > +      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
> > +      ...
> > +
> > +
> > +Start QEMU with virtio-pci bus:
> > +
> > +::
> > +  host# qemu-system                                                  \
> > +      -M pc -m 512 -smp 2                                            \
> > +      -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0       \
> > +      ...
> > --
> > 2.23.0
> >


