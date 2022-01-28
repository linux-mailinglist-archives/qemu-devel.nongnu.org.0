Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1552249F955
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 13:25:19 +0100 (CET)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDQJZ-0005Rn-Q1
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 07:25:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nDPne-0005JH-67
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:52:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nDPna-0003fs-4H
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w3UIWxZKYaAiom5/G0Lf9mDViqGTootNDmyibErEoK8=;
 b=ej/d0yFmJhBTHnTCRhAB2tMNPtiN6HaIpiwjPBVzOE+waip0cADwouhJrmV9rzxj4pNdx4
 UVs7kmafO8RT7eFznE8YUHY7olwbdmeE6a/cdR1FMvuy4P4e3qSpNPzly/cERzljDTtU+7
 m6LaAhnF8PRWjxF232+eSzrfN3Ay7mU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-2VQMVjPCPiuWMRusqote1g-1; Fri, 28 Jan 2022 06:52:10 -0500
X-MC-Unique: 2VQMVjPCPiuWMRusqote1g-1
Received: by mail-wr1-f71.google.com with SMTP id
 z1-20020adfbbc1000000b001df54394cebso1329602wrg.20
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 03:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w3UIWxZKYaAiom5/G0Lf9mDViqGTootNDmyibErEoK8=;
 b=sFk1n59Nd+XrzCSx4cwCJwfwu0CxvKOOgGTWgT0nYLI06TR/oMCk7oLlIMxopYIv79
 1ZE0VirHR8ALvuvAwZiRqRqZcbwH2GCIoH8iTMoxNYu8P8Ova0HA0eggFJ/iKQCHwdj4
 FEJ22y0nXKo3r3hJXlLg/57ByRvH5eim5G+rD/Wxq+FmocVdFAWijSNbcmMCNZiIBPm/
 eOEoq7oGR5Li76Hi3mF/mtKR+tK+cjPoSev3g0SWdSnOGqNcEKH4lscyqYyQkNAC2PXW
 aBWugiSF0HtYvwMrBKKoftVBEQqz+Ktc3kxMgi5hLuTfIa5VcYhxB4diDUf9mUtbx55R
 PkgA==
X-Gm-Message-State: AOAM533LfHloBJRvoD+v5JXDPN1iPkWxhJzEEguoBQ1ZSUh6cEv3jzcq
 OuPyYYzckIJMa7jLlbJX5iyBlv6iUxuWTRKjXm/Bw8Od25Mm1VmObxn/PkvVaF+SkTgFguqa7HO
 zYGgq9ncQUCVd/aI=
X-Received: by 2002:a1c:f719:: with SMTP id v25mr7377416wmh.76.1643370729460; 
 Fri, 28 Jan 2022 03:52:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxvyCo1Cgm8ZoThoFwIt6L13GWoSaHHJSPnekDGjmtSlJwMogT6kvvK1YCptB7YXcxPjF3Vg==
X-Received: by 2002:a1c:f719:: with SMTP id v25mr7377381wmh.76.1643370729066; 
 Fri, 28 Jan 2022 03:52:09 -0800 (PST)
Received: from redhat.com ([2.55.144.199])
 by smtp.gmail.com with ESMTPSA id o8sm1662961wmc.46.2022.01.28.03.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 03:52:08 -0800 (PST)
Date: Fri, 28 Jan 2022 06:52:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220128064621-mutt-send-email-mst@kernel.org>
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
 <20220125112112.44957075.pasic@linux.ibm.com>
 <20220127142800.11d8f1be.pasic@linux.ibm.com>
 <be34f50a-9664-7411-1e9b-2bac4735311d@gmail.com>
 <20220128032911.440323f1.pasic@linux.ibm.com>
 <cbac9c93-0d4a-1914-3c9d-203b1472056c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cbac9c93-0d4a-1914-3c9d-203b1472056c@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 08:02:39AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 1/27/22 23:29, Halil Pasic wrote:
> > On Thu, 27 Jan 2022 18:34:23 -0300
> > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> > 
> > > On 1/27/22 10:28, Halil Pasic wrote:
> > > > ping^2
> > > > 
> > > > Also adding Brijesh and Daniel, as I believe you guys should be
> > > > interested in this, and I'm yet to receive review.
> > > > 
> > > > @Brijesh, Daniel: Can you confirm that AMD (SEV) and Power are affected
> > > > too, and that the fix works for your platforms as well?
> > > 
> > > I failed to find a host that has Power secure execution support. I'll keep looking.
> > > 
> > > 
> > > Meanwhile I have to mention that this patch re-introduced the problem that Kevin's
> > > commit fixed.
> 
> [...]
> 
> > > 
> > > I made a little experiment with upstream and reverting Kevin's patch and the result is
> > > the same, meaning that this is the original bug [1] Kevin fixed back then. Note that [1]
> > > was reported on x86, meaning that this particular issue seems to be arch agnostic.
> > 
> > We don't have this problem on s390, so it ain't entirely arch agnostic.
> 
> It is arch agnostic in a way that it relies on iommu_platform support being true to this
> specific device (vhost-user-fs-pci) instead of some particularity of the machine.

But it is specific to VMs with an IOMMU or other ways to restrict access
such as cgs, right?
Without a vIOMMU or cgs in the VM the ACCESS_PLATFORM flag is a nop for
the guest, it doesn't affect anything except slowing things down
somewhat, right?

> > 
> > > 
> > > 
> > > My point here is that your patch fixes the situation for s390x, and Brijesh already chimed
> > > in claiming that it fixed for AMD SEV, but it reintroduced a bug. I believe you should
> > > include this test case with vhost-user in your testing to figure out a way to fix what
> > > is needed without adding this particular regression.
> > 
> > Can you help me with this? IMHO the big problem is that iommu_platform
> > is used for two distinct things. I've described that in the commit
> > message.
> > 
> > We may be able to differentiate between the two using ->dma_as, but for
> > that it needs to be set up correctly: whenever you require translation
> > it should be something different than address_space_memory. The question
> > is why do you require translation but don't have your ->dma_as set up
> > properly? It can be a guest thing, i.e. guest just assumes it has to do
> > bus addresses, while it actually does not have to, or we indeed do have
> > an IOMMU which polices the devices access to the guest memory, but for
> > some strange reason we failed to set up ->dma_as to reflect that.
> 
> 
> I have 2 suggestions. First is to separate how we interpret iommu_platform. I find it
> hard to do this properly without creating a new flag/command line option.

We do want to switch to call it access_platform at some point anyway.
When we do, we can make it only mean the guest flag.


> 
> My second suggestion is, well .... I think it's proved that s390x-PV and AMD SEV are
> being impacted (and probably Power secure guests as well), so why not check for
> confidential guest support to skip that check entirely? Something like this patch:
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index d23db98c56..4305fdd1b7 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -29,6 +29,7 @@
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio.h"
>  #include "exec/address-spaces.h"
> +#include "hw/boards.h"
>  /* #define DEBUG_VIRTIO_BUS */
> @@ -42,6 +43,7 @@ do { printf("virtio_bus: " fmt , ## __VA_ARGS__); } while (0)
>  /* A VirtIODevice is being plugged */
>  void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>  {
> +    MachineState *machine = MACHINE(qdev_get_machine());
>      DeviceState *qdev = DEVICE(vdev);
>      BusState *qbus = BUS(qdev_get_parent_bus(qdev));
>      VirtioBusState *bus = VIRTIO_BUS(qbus);
> @@ -69,7 +71,18 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> +    /*
> +     * Confidential guest technologies such as AMD SEV and s390x-PV relies
> +     * on device/hypervisor offering _F_ACCESS_PLATFORM so the guest grants
> +     * access to the portions of memory the device needs to see. For these
> +     * guests, _F_ACCESS_PLATFORM is about the restricted access to memory,
> +     * but not about infering whether iommu_platform is supported in the
> +     * device.
> +     *
> +     * Skip this check for these guests by checking machine->cgs.
> +     */
> +    if (!machine->cgs && has_iommu &&
> +        !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>          error_setg(errp, "iommu_platform=true is not supported by the device");
>          return;
>      }
> -- 
> 2.34.1

In fact I proposed setting _F_ACCESS_PLATFORM automatically in the past,



> 
> This will not break anything for non-secure guests and, granted that machine->cgs is already
> set at this point, this will fix the problem for s390x-PV and AMD SEV. And we won't have to
> dive deep into a virtio-bus feature negotiation saga because of something that can be easily
> handled for machine->cgs guests only.
> 
> If this patch works for you and Brijesh I believe this is a good option.
> 
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
> > 
> > @Michael: what is your opinion?
> > 
> > > 
> > > 
> > > In fact, I have a feeling that this is not the first time this kind of situation is discussed
> > > around here. This reminds me of [2] and a discussion about the order virtiofs features
> > > are negotiated versus when/how QEMU inits the devices.
> > > 
> > > 
> > > 
> > > [1] https://bugzilla.redhat.com/show_bug.cgi?id=1935019
> > > [2] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05644.html
> > > 
> > > 
> > > Thanks,
> > > 
> > > 
> > > Daniel
> > > 
> > > 
> > > > 
> > > > Regards,
> > > > Halil
> > > > 
> > > > On Tue, 25 Jan 2022 11:21:12 +0100
> > > > Halil Pasic <pasic@linux.ibm.com> wrote:
> > > > > ping
> > > > > 
> > > > > On Mon, 17 Jan 2022 13:02:38 +0100
> > > > > Halil Pasic <pasic@linux.ibm.com> wrote:
> > > > > > The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > > > > > unsupported") claims to fail the device hotplug when iommu_platform
> > > > > > is requested, but not supported by the (vhost) device. On the first
> > > > > > glance the condition for detecting that situation looks perfect, but
> > > > > > because a certain peculiarity of virtio_platform it ain't.
> > > > > > 
> > > > > > In fact the aforementioned commit introduces a regression. It breaks
> > > > > > virtio-fs support for Secure Execution, and most likely also for AMD SEV
> > > > > > or any other confidential guest scenario that relies encrypted guest
> > > > > > memory.  The same also applies to any other vhost device that does not
> > > > > > support _F_ACCESS_PLATFORM.
> > > > > > 
> > > > > > The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> > > > > > "device can not access all of the guest RAM" and "iova != gpa, thus
> > > > > > device needs to translate iova".
> > > > > > 
> > > > > > Confidential guest technologies currently rely on the device/hypervisor
> > > > > > offering _F_ACCESS_PLATFORM, so that, after the feature has been
> > > > > > negotiated, the guest  grants access to the portions of memory the
> > > > > > device needs to see. So in for confidential guests, generally,
> > > > > > _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> > > > > > about the addresses used being something else than guest physical
> > > > > > addresses.
> > > > > > 
> > > > > > This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> > > > > > turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> > > > > > form the vhost device that does not need it, because on the vhost
> > > > > > interface it only means "I/O address translation is needed".
> > > > > > 
> > > > > > This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> > > > > > VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> > > > > > situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> > > > > > by the device, and thus no device capability is needed. In this
> > > > > > situation claiming that the device does not support iommu_plattform=on
> > > > > > is counter-productive. So let us stop doing that!
> > > > > > 
> > > > > > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > > > > > Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> > > > > > Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > > > > > unsupported")
> > > > > > Cc: Kevin Wolf <kwolf@redhat.com>
> > > > > > Cc: qemu-stable@nongnu.org
> > > > > > 
> > > > > > ---
> > > > > > 
> > > > > > v1->v2:
> > > > > > * Commit message tweaks. Most notably fixed commit SHA (Michael)
> > > > > > 
> > > > > > ---
> > > > > >    hw/virtio/virtio-bus.c | 11 ++++++-----
> > > > > >    1 file changed, 6 insertions(+), 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > > > > > index d23db98c56..c1578f3de2 100644
> > > > > > --- a/hw/virtio/virtio-bus.c
> > > > > > +++ b/hw/virtio/virtio-bus.c
> > > > > > @@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> > > > > >            return;
> > > > > >        }
> > > > > > -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > > > > > -        error_setg(errp, "iommu_platform=true is not supported by the device");
> > > > > > -        return;
> > > > > > -    }
> > > > > > -
> > > > > >        if (klass->device_plugged != NULL) {
> > > > > >            klass->device_plugged(qbus->parent, &local_err);
> > > > > >        }
> > > > > > @@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> > > > > >        } else {
> > > > > >            vdev->dma_as = &address_space_memory;
> > > > > >        }
> > > > > > +
> > > > > > +    if (has_iommu && vdev->dma_as != &address_space_memory
> > > > > > +                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > > > > > +        error_setg(errp, "iommu_platform=true is not supported by the device");
> > > > > > +        return;
> > > > > > +    }
> > > > > >    }
> > > > > >    /* Reset the virtio_bus */
> > > > > > 
> > > > > > base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32
> > > > 
> > > 
> > 


