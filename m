Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089385129BF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 05:03:18 +0200 (CEST)
Received: from localhost ([::1]:50684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njuR2-0008EN-Om
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 23:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1njuPK-0007RM-0K
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 23:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1njuPG-0006WS-M0
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 23:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651114885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwV1WrUR5RsgHP15HiH0RM1d5ajJWrFR2XH8PqtYKAQ=;
 b=Qzh2cAuctpSqkCs3iaxEVEhNwDud9PwzwRwUYDbXTCWu2Ul3laNLhQVUdnhIO2D9xhFpU4
 Qz5kbr0BPf5SQf3hg1l/b70YljufToO/ub+VWDxSG/EfM7/K2mgkHFs3u5mDHlHLIxAozn
 CysXL0yA14ChYoB+D6B81dp+Yy4ATI4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-YdLVh5BeNKO02Qx67OQAnQ-1; Wed, 27 Apr 2022 23:01:23 -0400
X-MC-Unique: YdLVh5BeNKO02Qx67OQAnQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 c33-20020a05651223a100b00471fc6795dfso1437825lfv.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 20:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lwV1WrUR5RsgHP15HiH0RM1d5ajJWrFR2XH8PqtYKAQ=;
 b=mguH49W5E0Z8uReeNG2Gk471ODWPS2iB7Pycc1rPEq0EmnM0fAsrv2d7BVS8bFSWfo
 s6R/0wFRTLkX19kNBB81SdpxsFEgG+acP3qH1qwzbWBd2b5lb0BRvq080tl8lpF9NndO
 s5qCAOEn16G7oExLthMWDNkwv+vRsfvYSDw/qKviAS2Y1MpeQTZoxczZ4maT89DqHkMU
 jsx1iSQalHZprDaM8iOV/wpU3F6xQfha/WYvlC/lCo/2KNgkaDLiUI/NhtBVEysOYD8c
 WkBR5sfrJ1OLSU77XXIgucCTAhNXFrRkijpVzFbOOL3BA7Js956shnMBYBdUz4t3hR/u
 3Pvw==
X-Gm-Message-State: AOAM533kyUKEzrl/2Q5tL9hPhS5hpY7npu3Tg6kRCgjpmiLlu7eJAY6i
 ohT/hKgtLOnmN+XkIDcB0v3QbZ1uvTzAYck5xBIwWNIIlWu96p1NyTJj66BZuyhsG7F3Vd+4v5Y
 YdUGXIvf3K3koJkAe+9MO6wkOcDouD6c=
X-Received: by 2002:a2e:534a:0:b0:24a:f64f:a1d6 with SMTP id
 t10-20020a2e534a000000b0024af64fa1d6mr20539577ljd.315.1651114882286; 
 Wed, 27 Apr 2022 20:01:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu2DJH3DvjYnE6eftE8A2bDgM/y9O8mEUMu4ToU8H5uO2un9Ph0UckqSw2GI5tinVJhov6ksPmtMZzh79xJLg=
X-Received: by 2002:a2e:534a:0:b0:24a:f64f:a1d6 with SMTP id
 t10-20020a2e534a000000b0024af64fa1d6mr20539556ljd.315.1651114881992; Wed, 27
 Apr 2022 20:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220207112857.607829-1-pasic@linux.ibm.com>
 <0b85cc5f-9dc8-39a4-b5a5-4dbd8cc84343@intel.com>
 <484a755f-f325-1258-3f18-a4c4c29a3198@intel.com>
In-Reply-To: <484a755f-f325-1258-3f18-a4c4c29a3198@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Apr 2022 11:01:10 +0800
Message-ID: <CACGkMEsHyKNEcDkiBSMNWW2Mu--beDrJVKFjq493VnF+sPm6mA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] virtio: fix the condition for iommu_platform not
 supported
To: Chenyi Qiang <chenyi.qiang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 8:25 PM Chenyi Qiang <chenyi.qiang@intel.com> wrote:
>
>
>
> On 4/22/2022 3:11 PM, Chenyi Qiang wrote:
> >
> >
> > On 2/7/2022 7:28 PM, Halil Pasic wrote:
> >> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> >> unsupported") claims to fail the device hotplug when iommu_platform
> >> is requested, but not supported by the (vhost) device. On the first
> >> glance the condition for detecting that situation looks perfect, but
> >> because a certain peculiarity of virtio_platform it ain't.
> >>
> >> In fact the aforementioned commit introduces a regression. It breaks
> >> virtio-fs support for Secure Execution, and most likely also for AMD SEV
> >> or any other confidential guest scenario that relies encrypted guest
> >> memory.  The same also applies to any other vhost device that does not
> >> support _F_ACCESS_PLATFORM.
> >>
> >> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> >> "device can not access all of the guest RAM" and "iova != gpa, thus
> >> device needs to translate iova".
> >>
> >> Confidential guest technologies currently rely on the device/hypervisor
> >> offering _F_ACCESS_PLATFORM, so that, after the feature has been
> >> negotiated, the guest  grants access to the portions of memory the
> >> device needs to see. So in for confidential guests, generally,
> >> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> >> about the addresses used being something else than guest physical
> >> addresses.
> >>
> >> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> >> turn on VIRTIO_F_IOMMU_PLATFORM") fences _F_ACCESS_PLATFORM from the
> >> vhost device that does not need it, because on the vhost interface it
> >> only means "I/O address translation is needed".
> >>
> >> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> >> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> >> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> >> by the device, and thus no device capability is needed. In this
> >> situation claiming that the device does not support iommu_plattform=on
> >> is counter-productive. So let us stop doing that!
> >>
> >> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> >> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> >> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> >> unsupported")
> >> Acked-by: Cornelia Huck <cohuck@redhat.com>
> >> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >> Cc: Kevin Wolf <kwolf@redhat.com>
> >> Cc: qemu-stable@nongnu.org
> >>
> >> ---
> >>
> >> v4->v5:
> >> * added back the return; so if somebody were to add code to the end of
> >>    the function we are still good
> >> v3->v4:
> >> * Fixed commit message (thanks Connie)
> >> * Removed counter-productive initialization (thanks Connie)
> >> * Added tags
> >> v2->v3:
> >> * Caught a bug: I tired to check if vdev has the feature
> >>     ACCESS_PLATFORM after we have forced it. Moved the check
> >>     to a better place
> >> v1->v2:
> >> * Commit message tweaks. Most notably fixed commit SHA (Michael)
> >>
> >> ---
> >> ---
> >>   hw/virtio/virtio-bus.c | 12 +++++++-----
> >>   1 file changed, 7 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> >> index d23db98c56..0f69d1c742 100644
> >> --- a/hw/virtio/virtio-bus.c
> >> +++ b/hw/virtio/virtio-bus.c
> >> @@ -48,6 +48,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev,
> >> Error **errp)
> >>       VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
> >>       VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
> >>       bool has_iommu = virtio_host_has_feature(vdev,
> >> VIRTIO_F_IOMMU_PLATFORM);
> >> +    bool vdev_has_iommu;
> >>       Error *local_err = NULL;
> >>       DPRINTF("%s: plug device.\n", qbus->name);
> >> @@ -69,11 +70,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev,
> >> Error **errp)
> >>           return;
> >>       }
> >> -    if (has_iommu && !virtio_host_has_feature(vdev,
> >> VIRTIO_F_IOMMU_PLATFORM)) {
> >> -        error_setg(errp, "iommu_platform=true is not supported by the
> >> device");
> >> -        return;
> >> -    }
> >> -
> >>       if (klass->device_plugged != NULL) {
> >>           klass->device_plugged(qbus->parent, &local_err);
> >>       }
> >> @@ -82,9 +78,15 @@ void virtio_bus_device_plugged(VirtIODevice *vdev,
> >> Error **errp)
> >>           return;
> >>       }
> >> +    vdev_has_iommu = virtio_host_has_feature(vdev,
> >> VIRTIO_F_IOMMU_PLATFORM);
> >>       if (klass->get_dma_as != NULL && has_iommu) {
> >>           virtio_add_feature(&vdev->host_features,
> >> VIRTIO_F_IOMMU_PLATFORM);
> >>           vdev->dma_as = klass->get_dma_as(qbus->parent);
> >> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> >
> > Hi Pasic,
> >
> > When testing the virtio-fs in Intel TDX, I met the error report in this
> > check. Is it appropriate to compare the dma_as against the
> > address_space_memory to detect whether the IOMMU is enabled or not? Per
> > the commit ae4003738f(vhost: correctly detect the enabling IOMMU), we
> > should call virtio_bus_device_iommu_enabled(vdev) instead here, correct?
> >
>
> Sorry for bothering.
>
> Can virtio-fs work properly in AMD SEV?
>
> IIUC, If get_dma_as() is implemented and in case of PCI,
> pci_get_address_space() is used and returns the bus master as. This
> would fail the check here.

I think the reason is that the viritio-fs is used without vIOMMU but
ACCESS_PLATFORM.

That's why we need to use virtio_bus_device_iommu_enabled() to allow
this setup to work.

Thanks

>
> >> +            error_setg(errp,
> >> +                       "iommu_platform=true is not supported by the
> >> device");
> >> +            return;
> >> +        }
> >>       } else {
> >>           vdev->dma_as = &address_space_memory;
> >>       }
> >>
> >> base-commit: 0d564a3e32ba8494014c67cdd2ebf0fb71860dff
> >
>


