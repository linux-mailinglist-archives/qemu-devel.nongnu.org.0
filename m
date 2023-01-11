Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A566550C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 08:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFVK2-0003XE-Uc; Wed, 11 Jan 2023 02:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pFVK0-0003WW-Sp
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 02:14:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pFVJy-0000qS-P0
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 02:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673421289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YOctvuQrO4ovoOE3sA7PXW5wkAaqXNjchF8aB1pYDXs=;
 b=UdLlEmPd0PwM11+hw9MSq+3fY0O8PSrJwNYnj4poqCIDzuSe0DNJiSvbjB40zrQ/7H+Bid
 6HOSqzEFUTCErKBBFcZ8HKTZht7angOABxx8Fsg30UxdBtw1H5w+q49El3vQl9X2PSvKY2
 Rn3vZkKxIFE35RAgZ0jNQWIoxL0iyV8=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-8rFeiOhoOOOHjoH9qGHfQg-1; Wed, 11 Jan 2023 02:14:48 -0500
X-MC-Unique: 8rFeiOhoOOOHjoH9qGHfQg-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-15095be6d24so4603211fac.9
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 23:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YOctvuQrO4ovoOE3sA7PXW5wkAaqXNjchF8aB1pYDXs=;
 b=Mlhr1hu6KkssyG7VBirrJ3GKm4dMy8nXKzCWC1sR8Wu8BBCmoCjyQFqZZOzrche/0i
 ez7TAXupV3Xj1Dp8N2bgNypxkgrh6IGAI3EmkcHt1Bnr6p+HAgW+Sc52Cs4xRZtEUKqJ
 sb0eFdy6v/pUSz1FoVN1jTB+GnbO+8UVzswZeTMbksF9UwuUg6AtN2sBez6CYK+46EAM
 X8jIvkSd0Tp9u1Ot8q55xmD2e5rPNrrkne+3i8Syg1NWGhAZ/C9di/BGscAmyJl2mMja
 fYpHv/HWcXWPKWcXl+gcykQcoDw0f+WfeUkQ2qW/AUX9vsHMjLa2GcaGgp1TjQRvKhqS
 8UYA==
X-Gm-Message-State: AFqh2kquiE0Nz9nQifwECqioX8KvsssWgljHD+rlYV/qgRX/pDZmije8
 tJqfONMvNSZSh6kyUdbcA1etBDuSlvPlDBQ+WSxWKmsoZPrM9ZWYBTr2uOZbd6RGBt7+96UWQLe
 0l2NphB5hufki7Xl9TiZm0vA2G+lBb3A=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr3113085oiy.35.1673421287408; 
 Tue, 10 Jan 2023 23:14:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuy9LGwBvWBDMvoR8pNh6KkdoZsQyaJgzt+D03N2wSgWpUJXCLFnDbf7gksE9vnT8ENXZQHL5Qx+HJQHCWNBq8=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr3113077oiy.35.1673421287118; Tue, 10 Jan
 2023 23:14:47 -0800 (PST)
MIME-Version: 1.0
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
 <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
In-Reply-To: <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Jan 2023 15:14:36 +0800
Message-ID: <CACGkMEttPQddPbu7ddLuU-HoED=ELMtyv7BE=nioZ0uOaXF3+Q@mail.gmail.com>
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
To: Eric Auger <eauger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 qemu list <qemu-devel@nongnu.org>, 
 Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Jan 10, 2023 at 5:11 AM Eric Auger <eauger@redhat.com> wrote:
>
> Hi,
>
> On 1/9/23 14:24, Eric Auger wrote:
> > Hi,
> >
> > we have a trouble with virtio-iommu and protected assigned devices
> > downstream to a pcie-to-pci bridge. In that use case we observe the
> > assigned devices are not put to any group. This is true on both x86 and
> > aarch64. This use case works with intel-iommu.
> >
> > *** Guest PCI topology is:
> > lspci -tv
> > -[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM
> > Controller
> >            +-01.0  Device 1234:1111
> >            +-02.0-[01-02]----00.0-[02]----01.0  Broadcom Inc. and
> > subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller
> >            +-02.1-[03]--
> >            +-02.2-[04]----00.0  Red Hat, Inc. Virtio block device
> >            +-0a.0  Red Hat, Inc. Device 1057
> >            +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
> >            +-1f.2  Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 port
> > SATA Controller [AHCI mode]
> >            \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller
> >
> >
> > All the assigned devices are aliased and they get devfn=0x0.
> > see qemu pci_device_iommu_address_space in hw/pci.c
> >
> > Initially I see the following traces
> > pci_device_iommu_address_space name=vfio-pci BDF=0x8 bus=0 devfn=0x8
> > pci_device_iommu_address_space name=vfio-pci BDF=0x8 bus=0 devfn=0x8
> > call iommu_fn with bus=0x55f556dde180 and devfn=0
> > virtio_iommu_init_iommu_mr init virtio-iommu-memory-region-0-0
> >
> > Note the bus is 0 at this time and devfn that is used in the
> > virtio-iommu is 0. So an associated IOMMU MR is created with this bus at
> > devfn=0 slot. This is before bus actual numbering.
> >
> > However later on, I see virtio_iommu_probe() and virtio_iommu_attach()
> > getting called with ep_id=520
> > because in the qemu virtio-iommu device, virtio_iommu_mr(pe_id) fails to
> > find the iommu_mr and returns -ENOENT
> >
> > On guest side I see that
> > acpi_iommu_configure_id/iommu_probe_device() fails
> > (__iommu_probe_device) and also __iommu_attach_device would also fail
> > anyway.
> >
> > I guess those get called before actual bus number recomputation?
> >
> > on aarch64 I eventually see the "good" MR beeing created, ie. featuring
> > the right bus number:
> > qemu-system-aarch64: pci_device_iommu_address_space name=vfio-pci
> > BDF=0x208 bus=2 devfn=0x8
> > qemu-system-aarch64: pci_device_iommu_address_space name=vfio-pci
> > BDF=0x208 bus=2 devfn=0x8 call iommu_fn with bus=0xaaaaef12c450 and devfn=0
> >
> > But this does not happen on x86.
> >
> > Jean, do you have any idea about how to fix that? Do you think we have a
> > trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
> > like virtio probe and attach commands are called too early, before the
> > bus is actually correctly numbered.
>
> So after further investigations looks this is not a problem of bus
> number, which is good at the time of the virtio cmd calls but rather a
> problem related to the devfn (0 was used when creating the IOMMU MR)
> whereas the virtio-iommu cmds looks for the non aliased devfn. With that
> fixed, the probe and attach at least succeeds. The device still does not
> work for me but I will continue my investigations and send a tentative fix.

Haven't thought this deeply, just one thing in my mind and in case
that may help:

intel-iommu doesn't use bus no as the key for hashing address spaces
since it could be configured by the guest:

/*
 * Note that we use pointer to PCIBus as the key, so hashing/shifting
 * based on the pointer value is intended. Note that we deal with
 * collisions through vtd_as_equal().
 */
static guint vtd_as_hash(gconstpointer v)
{
    const struct vtd_as_key *key = v;
    guint value = (guint)(uintptr_t)key->bus;

    return (guint)(value << 8 | key->devfn);
}

Thanks

>
> Thanks
>
> Eric
> >
> > Thanks
> >
> > Eric
> >
> >
> >
> >
> >
> >
> >
>


