Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5904A65AA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:30:31 +0100 (CET)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEznJ-0003hd-Sx
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:30:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nEwOI-0005Md-Ic
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nEwOA-0003AR-Hh
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643734334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/25eaLKN0ECgaWF5IFol8bM521AvRbZVedG2l/MxXW4=;
 b=iatFrRwhpSqDb4G0wXS3MyLpqfu36WYseDpDJ0zMGG7/dCB/JjsatnqcPn5nH/JvKwSX4v
 nofE1Gt4aOcQb2bPPqn0hU29clAXfJV6LGYHbwVgk2xOOVMjxFrohi0aYuCymm+yFj+oD6
 8bh1BpADticF24zRt1dLMZkpnylj68c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-uk1u3uG5Nme73o8e_wpz8w-1; Tue, 01 Feb 2022 11:52:12 -0500
X-MC-Unique: uk1u3uG5Nme73o8e_wpz8w-1
Received: by mail-wr1-f70.google.com with SMTP id
 i25-20020adfaad9000000b001e01f5804abso3560100wrc.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/25eaLKN0ECgaWF5IFol8bM521AvRbZVedG2l/MxXW4=;
 b=Ba9UPvOeXzMwQRB4kPkGGEDPIQV9XIjYqgaPlYiQeohUq/xphROTvaIipi5/ztwmm7
 E51Iz0Xb6Gs6tC0/fAXYmg3JR2yYvfaZ3N7qYFFebKmpyZsKdx+CKHRZsu4XovYwPiom
 csCJTUmdhNnzNutKwSnW0TZQr3kRRLfyMD+Nv2biVi/h22z9Mhnopmc0CZmUy0Q1Cdz0
 YgLij0Q4cm7p2LQuaHYLbgZybkwnfIlQ8vdupI5T2HERkWnOL7fvQqj9y7US88evZAVn
 S/h5BYydkCsXS1zICAvtRUzm3itYjs+1ggNkhv2hHnnAtFOabXkap4T8yOoTqv+hOFSk
 9+3g==
X-Gm-Message-State: AOAM5312NeconfnSas3YGpd9ecWsVoka/9B36iIGEWQjPnpO8PUlIaog
 0GzpzBMl9iRLVQ4rN3vD0yZyfYi+eNdT39uVEA+4vcJiCHkKUmRy5ioTm8IkvC7pHAAwiMcngKz
 iejUkIoOL2k1AtX4=
X-Received: by 2002:a05:600c:27d2:: with SMTP id
 l18mr2526189wmb.176.1643734331606; 
 Tue, 01 Feb 2022 08:52:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVyG1BrChNWmTi554gnsq/1DckppDN8VsteYVfxlUUAf9e5RjvAk5oO0xtqvnMncQA2Zga1w==
X-Received: by 2002:a05:600c:27d2:: with SMTP id
 l18mr2526164wmb.176.1643734331276; 
 Tue, 01 Feb 2022 08:52:11 -0800 (PST)
Received: from redhat.com ([2.55.147.35])
 by smtp.gmail.com with ESMTPSA id f2sm15807461wri.49.2022.02.01.08.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 08:52:10 -0800 (PST)
Date: Tue, 1 Feb 2022 11:52:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220201115136-mutt-send-email-mst@kernel.org>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <87h79iy1nn.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87h79iy1nn.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 05:47:24PM +0100, Cornelia Huck wrote:
> On Tue, Feb 01 2022, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > unsupported") claims to fail the device hotplug when iommu_platform
> > is requested, but not supported by the (vhost) device. On the first
> > glance the condition for detecting that situation looks perfect, but
> > because a certain peculiarity of virtio_platform it ain't.
> >
> > In fact the aforementioned commit introduces a regression. It breaks
> > virtio-fs support for Secure Execution, and most likely also for AMD SEV
> > or any other confidential guest scenario that relies encrypted guest
> > memory.  The same also applies to any other vhost device that does not
> > support _F_ACCESS_PLATFORM.
> >
> > The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> > "device can not access all of the guest RAM" and "iova != gpa, thus
> > device needs to translate iova".
> >
> > Confidential guest technologies currently rely on the device/hypervisor
> > offering _F_ACCESS_PLATFORM, so that, after the feature has been
> > negotiated, the guest  grants access to the portions of memory the
> > device needs to see. So in for confidential guests, generally,
> > _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> > about the addresses used being something else than guest physical
> > addresses.
> >
> > This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> > turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> 
> s/for, which //
> 
> > form the vhost device that does not need it, because on the vhost
> 
> s/form/from/
> 
> > interface it only means "I/O address translation is needed".
> >
> > This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> > VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> > situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> > by the device, and thus no device capability is needed. In this
> > situation claiming that the device does not support iommu_plattform=on
> > is counter-productive. So let us stop doing that!
> >
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> > Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > unsupported")
> > Cc: Kevin Wolf <kwolf@redhat.com>
> > Cc: qemu-stable@nongnu.org
> >
> > ---
> >
> > v2->v3:
> > * Caught a bug: I tired to check if vdev has the feature
> >    ACCESS_PLATFORM after we have forced it. Moved the check
> >    to a better place
> > v1->v2:
> > * Commit message tweaks. Most notably fixed commit SHA (Michael)
> >
> > ---
> > ---
> >  hw/virtio/virtio-bus.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > index d23db98c56..34f5a0a664 100644
> > --- a/hw/virtio/virtio-bus.c
> > +++ b/hw/virtio/virtio-bus.c
> > @@ -48,6 +48,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >      VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
> >      VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
> >      bool has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > +    bool vdev_has_iommu = false;
> 
> Isn't vdev_has_iommu set unconditionally before you try to use it?

I'd like to know too.

> >      Error *local_err = NULL;
> >  
> >      DPRINTF("%s: plug device.\n", qbus->name);
> > @@ -69,11 +70,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >          return;
> >      }
> >  
> > -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > -        error_setg(errp, "iommu_platform=true is not supported by the device");
> > -        return;
> > -    }
> > -
> >      if (klass->device_plugged != NULL) {
> >          klass->device_plugged(qbus->parent, &local_err);
> >      }
> > @@ -82,9 +78,14 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >          return;
> >      }
> >  
> > +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >      if (klass->get_dma_as != NULL && has_iommu) {
> >          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >          vdev->dma_as = klass->get_dma_as(qbus->parent);
> > +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> > +            error_setg(errp,
> > +                       "iommu_platform=true is not supported by the device");
> > +        }
> >      } else {
> 
> I agree that a short comment would be nice here, but this is preexisting
> code anyway...
> 
> >          vdev->dma_as = &address_space_memory;
> >      }
> >
> > base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32
> 
> ...so (with or without fixing the nits):
> 
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> 
> (i.e. looks sane, but I didn't follow all the paths)


