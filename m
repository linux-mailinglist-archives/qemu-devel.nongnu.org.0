Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2939512AC3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 06:59:41 +0200 (CEST)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njwFg-0006de-I1
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 00:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1njwE4-0005b6-Tt
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 00:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1njwE1-00052a-LL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 00:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651121876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UiddDF3lhpgPQevaYLCyvoD+l6KoyU6xdWMuG2KcNS0=;
 b=WijjHhDoXbCQaJ7A8zCg9kJIESBcCU3YDwiPOh5xTIp2cF3/khPJOTVYi5BHTSdmKneyA5
 I1JOxAh2j0IZ7taRVZxu8L7oWl/jTkBZvyR3rMOSETRbuHbyE3qv8pHWoPpcy3YdNSGgG1
 5VNqERJ3IG467v+HNFqjJ3QjjSSpxlo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465--TiD8MvePKCD2-_23SAoeA-1; Thu, 28 Apr 2022 00:57:54 -0400
X-MC-Unique: -TiD8MvePKCD2-_23SAoeA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so1455902wri.2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 21:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UiddDF3lhpgPQevaYLCyvoD+l6KoyU6xdWMuG2KcNS0=;
 b=NhQjdCMZH6G0pCkHHnrD+rXmeTUUv8/IeMWD+E6nPmjchs1nrSLsljqWInbobYJXIX
 rbeQFQkl3c3JbmtO6e0GqjRF0BEUUi83AxhuJqbqh/RrXo62z5T/NmIUeUwmz02NRSp9
 5DyODl+3AojImSMh3lNWARXVKH9a9+hfFWCwsoAnNdlkW66gnQvPFZ1PXruI0bwJkt+Z
 qQfzBtQ1DHSX4RinQah/t34SOWDXan99MNoOcQehbd4LYEgKyLOjeDfjoN4HSTJnIcj9
 I6k/C+PItf85n7jw6fwLN9AUcnfMHfcNWPFDEl8iWqSuOb6jsAEToYhoW/gUncB9Gypb
 XHLA==
X-Gm-Message-State: AOAM533KmbqQ+5t7TWToK2ArQ5JyU+6chyLNiTtqc+FAPd0bYl0KuAt5
 rJjMMiryOF58vsED2f2xM/1IiuVkbJITkaGiXXX+Z9SaaJrKoihOm3MZBZXLMfjPkEXLtZDpuYX
 B3iIrO/6ANurePz4=
X-Received: by 2002:a5d:6582:0:b0:20a:d8f6:b1e8 with SMTP id
 q2-20020a5d6582000000b0020ad8f6b1e8mr16409365wru.431.1651121873206; 
 Wed, 27 Apr 2022 21:57:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzGPhVZ8TIiQRqN/MsDXSSRELD/nVSXwtTzeLiGOoY0WTTStl2rTjwCMA+rOJOCJFoLj7oZw==
X-Received: by 2002:a5d:6582:0:b0:20a:d8f6:b1e8 with SMTP id
 q2-20020a5d6582000000b0020ad8f6b1e8mr16409346wru.431.1651121872867; 
 Wed, 27 Apr 2022 21:57:52 -0700 (PDT)
Received: from redhat.com ([2.53.18.16]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c220b00b00393ffde5f5fsm3384896wml.36.2022.04.27.21.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 21:57:52 -0700 (PDT)
Date: Thu, 28 Apr 2022 00:57:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220428005726-mutt-send-email-mst@kernel.org>
References: <20220207112857.607829-1-pasic@linux.ibm.com>
 <0b85cc5f-9dc8-39a4-b5a5-4dbd8cc84343@intel.com>
 <484a755f-f325-1258-3f18-a4c4c29a3198@intel.com>
 <CACGkMEsHyKNEcDkiBSMNWW2Mu--beDrJVKFjq493VnF+sPm6mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEsHyKNEcDkiBSMNWW2Mu--beDrJVKFjq493VnF+sPm6mA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 11:01:10AM +0800, Jason Wang wrote:
> On Wed, Apr 27, 2022 at 8:25 PM Chenyi Qiang <chenyi.qiang@intel.com> wrote:
> >
> >
> >
> > On 4/22/2022 3:11 PM, Chenyi Qiang wrote:
> > >
> > >
> > > On 2/7/2022 7:28 PM, Halil Pasic wrote:
> > >> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > >> unsupported") claims to fail the device hotplug when iommu_platform
> > >> is requested, but not supported by the (vhost) device. On the first
> > >> glance the condition for detecting that situation looks perfect, but
> > >> because a certain peculiarity of virtio_platform it ain't.
> > >>
> > >> In fact the aforementioned commit introduces a regression. It breaks
> > >> virtio-fs support for Secure Execution, and most likely also for AMD SEV
> > >> or any other confidential guest scenario that relies encrypted guest
> > >> memory.  The same also applies to any other vhost device that does not
> > >> support _F_ACCESS_PLATFORM.
> > >>
> > >> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> > >> "device can not access all of the guest RAM" and "iova != gpa, thus
> > >> device needs to translate iova".
> > >>
> > >> Confidential guest technologies currently rely on the device/hypervisor
> > >> offering _F_ACCESS_PLATFORM, so that, after the feature has been
> > >> negotiated, the guest  grants access to the portions of memory the
> > >> device needs to see. So in for confidential guests, generally,
> > >> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> > >> about the addresses used being something else than guest physical
> > >> addresses.
> > >>
> > >> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> > >> turn on VIRTIO_F_IOMMU_PLATFORM") fences _F_ACCESS_PLATFORM from the
> > >> vhost device that does not need it, because on the vhost interface it
> > >> only means "I/O address translation is needed".
> > >>
> > >> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> > >> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> > >> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> > >> by the device, and thus no device capability is needed. In this
> > >> situation claiming that the device does not support iommu_plattform=on
> > >> is counter-productive. So let us stop doing that!
> > >>
> > >> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > >> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> > >> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > >> unsupported")
> > >> Acked-by: Cornelia Huck <cohuck@redhat.com>
> > >> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > >> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > >> Cc: Kevin Wolf <kwolf@redhat.com>
> > >> Cc: qemu-stable@nongnu.org
> > >>
> > >> ---
> > >>
> > >> v4->v5:
> > >> * added back the return; so if somebody were to add code to the end of
> > >>    the function we are still good
> > >> v3->v4:
> > >> * Fixed commit message (thanks Connie)
> > >> * Removed counter-productive initialization (thanks Connie)
> > >> * Added tags
> > >> v2->v3:
> > >> * Caught a bug: I tired to check if vdev has the feature
> > >>     ACCESS_PLATFORM after we have forced it. Moved the check
> > >>     to a better place
> > >> v1->v2:
> > >> * Commit message tweaks. Most notably fixed commit SHA (Michael)
> > >>
> > >> ---
> > >> ---
> > >>   hw/virtio/virtio-bus.c | 12 +++++++-----
> > >>   1 file changed, 7 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > >> index d23db98c56..0f69d1c742 100644
> > >> --- a/hw/virtio/virtio-bus.c
> > >> +++ b/hw/virtio/virtio-bus.c
> > >> @@ -48,6 +48,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev,
> > >> Error **errp)
> > >>       VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
> > >>       VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
> > >>       bool has_iommu = virtio_host_has_feature(vdev,
> > >> VIRTIO_F_IOMMU_PLATFORM);
> > >> +    bool vdev_has_iommu;
> > >>       Error *local_err = NULL;
> > >>       DPRINTF("%s: plug device.\n", qbus->name);
> > >> @@ -69,11 +70,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev,
> > >> Error **errp)
> > >>           return;
> > >>       }
> > >> -    if (has_iommu && !virtio_host_has_feature(vdev,
> > >> VIRTIO_F_IOMMU_PLATFORM)) {
> > >> -        error_setg(errp, "iommu_platform=true is not supported by the
> > >> device");
> > >> -        return;
> > >> -    }
> > >> -
> > >>       if (klass->device_plugged != NULL) {
> > >>           klass->device_plugged(qbus->parent, &local_err);
> > >>       }
> > >> @@ -82,9 +78,15 @@ void virtio_bus_device_plugged(VirtIODevice *vdev,
> > >> Error **errp)
> > >>           return;
> > >>       }
> > >> +    vdev_has_iommu = virtio_host_has_feature(vdev,
> > >> VIRTIO_F_IOMMU_PLATFORM);
> > >>       if (klass->get_dma_as != NULL && has_iommu) {
> > >>           virtio_add_feature(&vdev->host_features,
> > >> VIRTIO_F_IOMMU_PLATFORM);
> > >>           vdev->dma_as = klass->get_dma_as(qbus->parent);
> > >> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> > >
> > > Hi Pasic,
> > >
> > > When testing the virtio-fs in Intel TDX, I met the error report in this
> > > check. Is it appropriate to compare the dma_as against the
> > > address_space_memory to detect whether the IOMMU is enabled or not? Per
> > > the commit ae4003738f(vhost: correctly detect the enabling IOMMU), we
> > > should call virtio_bus_device_iommu_enabled(vdev) instead here, correct?
> > >
> >
> > Sorry for bothering.
> >
> > Can virtio-fs work properly in AMD SEV?
> >
> > IIUC, If get_dma_as() is implemented and in case of PCI,
> > pci_get_address_space() is used and returns the bus master as. This
> > would fail the check here.
> 
> I think the reason is that the viritio-fs is used without vIOMMU but
> ACCESS_PLATFORM.
> 
> That's why we need to use virtio_bus_device_iommu_enabled() to allow
> this setup to work.
> 
> Thanks

Do you retract your ack then?

> >
> > >> +            error_setg(errp,
> > >> +                       "iommu_platform=true is not supported by the
> > >> device");
> > >> +            return;
> > >> +        }
> > >>       } else {
> > >>           vdev->dma_as = &address_space_memory;
> > >>       }
> > >>
> > >> base-commit: 0d564a3e32ba8494014c67cdd2ebf0fb71860dff
> > >
> >


