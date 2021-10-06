Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE624239D9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:37:01 +0200 (CEST)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY2Q7-0005Ez-Tx
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY2GN-0005WV-Eo
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY2GL-0001ri-FW
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633508812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdtDTv0RVTm8PBJshVCIJf/g0AgNHn9dAOnLtYNQJiI=;
 b=cBupkdz0YuyR6D87x+ICl+W3rfms/qGQpMrz8tpRrhCcMCUuwu//9oiYo3BrwAgMtVCHIO
 VLtQOetuSJC8hpzos9/Kh0hWOtMH48+JhpPIKRzVRql6gMmsIeQu2mbinK5YaCX4Swug62
 E1x+8MiVYV/bw8V4ZZeoZpEpBIsONYU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-ijzWX-rKNwGAxSkjYmk5Pg-1; Wed, 06 Oct 2021 04:26:51 -0400
X-MC-Unique: ijzWX-rKNwGAxSkjYmk5Pg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so1378926wrv.19
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wdtDTv0RVTm8PBJshVCIJf/g0AgNHn9dAOnLtYNQJiI=;
 b=huZmqcLrDBgX0MHMO2P3fR0ZCuq6dR4+CN00fm0ttzQJgrGRrvloZSNMrJjAMCS9gL
 FmVvPTdHbxuM33UtvDbvJFslbTEA9idmPRDHZV7jNPt1Az8ApoShy3hx+EAPUXqak/pk
 uTjWtxDPr6SKFnhenpdWRV7mU8YEP28vv/e11u7AlL5BSKkbpW+SxHPg8+Sup1cEAliE
 J0xfbdQvtQaXghGeWofIyyl7GS1iQhuqFCVShQSiHlZ0TggCZKFBo9wj9JuyeFyrjKoQ
 lEWS5hb1CRJ15BypEzzxZHAiNCIAlNPy5uGKM8N2ujZPO0wwiUAK37K01D/RGcgCD2KS
 FC9w==
X-Gm-Message-State: AOAM530+/VgJMpsqS79T5GYpL8FeeEjTKjxO6WoeKca4Os2xxrDeBoNf
 Nri+PtX5t/jjOEbD9xBbF4VEdJnOArmIoxMJAL/MYy3s//RlbcGhSaaHv+vkXCArEocjUjSuB6P
 rgRsB7vSbUdflc4M=
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr238199wri.92.1633508810438;
 Wed, 06 Oct 2021 01:26:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKV8taEAMhD7Gcwu0KsrXRwr5koxhxmiWqF/gcJecp/BePY10eRDj+1m6dhRnGtRkaI3CDZg==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr238177wri.92.1633508810188;
 Wed, 06 Oct 2021 01:26:50 -0700 (PDT)
Received: from redhat.com ([2a02:ed0:53a2:ce00:a3d7:784f:9060:9de4])
 by smtp.gmail.com with ESMTPSA id r19sm4113974wmp.43.2021.10.06.01.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:26:49 -0700 (PDT)
Date: Wed, 6 Oct 2021 04:26:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Thorpe <thorpej@me.com>
Subject: Re: Please help me understand VIRTIO_F_IOMMU_PLATFORM
Message-ID: <20211006042222-mutt-send-email-mst@kernel.org>
References: <D2F8C14D-1B82-4BDF-A1AC-AF1BF6D4CDD7@me.com>
 <4443ee9c-c63a-f259-5768-6d0dcbb6b938@ilande.co.uk>
 <4DB2A4EE-5628-4505-A173-6098F4CFCDBD@me.com>
MIME-Version: 1.0
In-Reply-To: <4DB2A4EE-5628-4505-A173-6098F4CFCDBD@me.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 05:35:24AM -0700, Jason Thorpe wrote:
> 
> > On Aug 18, 2021, at 12:58 AM, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> > 
> > On 31/07/2021 16:41, Jason Thorpe wrote:
> > 
> > (added Michael on CC)
> > 
> > Hi Jason,
> > 
> > Thanks for looking at this! I've had previous discussions with Martin trying to figure out why virtio-blk-pci doesn't work with Netbsd/sparc64 so glad that you've been able to find the underlying cause.
> > 
> > My read on VIRTIO_F_IOMMU_PLATFORM is that this is declaring host IOMMU support so the implementation on the guest should not be relevant here.

The name is confusing. The spec renamed it to VIRTIO_F_ACCESS_PLATFORM
now, with this explanation:

  \item[VIRTIO_F_ACCESS_PLATFORM(33)] This feature indicates that
  the device can be used on a platform where device access to data
  in memory is limited and/or translated. E.g. this is the case if the device can be located
  behind an IOMMU that translates bus addresses from the device into physical
  addresses in memory, if the device can be limited to only access
  certain memory addresses or if special commands such as
  a cache flush can be needed to synchronise data in memory with
  the device. Whether accesses are actually limited or translated
  is described by platform-specific means.
  If this feature bit is set to 0, then the device
  has same access to memory addresses supplied to it as the
  driver has.
  In particular, the device will always use physical addresses
  matching addresses used by the driver (typically meaning
  physical addresses used by the CPU)
  and not translated further, and can access any address supplied to it by
  the driver. When clear, this overrides any platform-specific description of
  whether device access is limited or translated in any way, e.g.
  whether an IOMMU may be present.



> That’s basically the conclusion I came to, as well, but I still wasn’t quite sure how the host IOMMU was relevant so I wasn’t quite willing to stick my neck out :-)
> 
> > Testing Linux/sparc64 boot from a virtio-blk-pci device on current git master shows I can boot from a virtio-blk-pci device without any problem, even though the existing code fails the has_iommu check and vdev->dma_as gets set to address_space_memory which is why I haven't spotted this before.
> > 
> > Stepping through the code shows that klass->get_dma_as() is pointing to virtio_pci_get_dma_as() which in turn returns pci_get_address_space(dev) which looks correct to me. I think that the logic to set vdev->dma_as is incorrect here since qemu-system-sparc64 has an emulated IOMMU with its own address space independent of whether the host has an IOMMU.
> 
> Right, this more-or-less the same situation as qemu-system-alpha.  I’m curious why the Linux/sparc64 guest is able to use VirtIO without the patch, though.  I guess that VirtIO client implementation is skipping the normal platform DMA mapping step and is just poking physical addresses in directly?  The NetBSD VirtIO client code behaves like all other NetBSD PCI drivers and does NOT skip the platform DMA mapping step.

How did it work then?
If the driver wants to use DMA addresses normally it has to negotiate VIRTIO_F_ACCESS_PLATFORM.
Without it the assumption is that it uses physical addresses.

> > I modified your patch slightly as below and confirmed that I can still boot Linux/sparc64 here:
> > 
> > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > index 859978d248..ee178b8223 100644
> > --- a/hw/virtio/virtio-bus.c
> > +++ b/hw/virtio/virtio-bus.c
> > @@ -82,9 +82,11 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >         return;
> >     }
> > 
> > -    if (klass->get_dma_as != NULL && has_iommu) {
> > -        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> > +    if (klass->get_dma_as != NULL) {
> >         vdev->dma_as = klass->get_dma_as(qbus->parent);
> > +        if (has_iommu) {
> > +            virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> > +        }
> >     } else {
> >         vdev->dma_as = &address_space_memory;
> >     }
> > 
> > Michael: can you comment further on whether the analysis and patch above are correct?
> > 
> > 
> > ATB,
> > 
> > Mark.
> 
> -- thorpej

Maybe this platform simply has to mandate VIRTIO_F_ACCESS_PLATFORM then.

I would be very reluctant to add to the pile of hacks around legacy
devices.

-- 
MST


