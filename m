Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E549143FFA8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 17:35:00 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgTuG-0006Va-2H
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 11:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mgTr0-000314-9o
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:31:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mgTqx-0008Dm-8p
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635521494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9XMuabuabju8FkJx/IEmJRxv15uxl8YjsxBXMl+1nA=;
 b=Jv5nCX481YG9+/DJMk207JbEHb3q1KJn9E5x+FbJ34Z6Ex6dWjNZFN8EMNhYB3u93I5bmI
 gG+a+rJYQcJs+hNfMXiy/AbOUG/aAuABbnRW6R3+N4kqrJDUduMrVt8eSKuN6DSROMmE79
 ub1r5Ej29t8OCHxmSTlxx2HhkyY/cVk=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-PCETrrAkOd6Gjpk_OHsvaQ-1; Fri, 29 Oct 2021 11:31:30 -0400
X-MC-Unique: PCETrrAkOd6Gjpk_OHsvaQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 k1-20020a4a8501000000b0029ac7b9dc82so4521267ooh.17
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 08:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U9XMuabuabju8FkJx/IEmJRxv15uxl8YjsxBXMl+1nA=;
 b=i3o1XljqEAir9sfPEF6mGvFSi/lehtrnbKiQz+gEx7tDm6vwT3pdc/kDwq4fGszOei
 BTwtn0ea9V1w3GeqKEl1KAhqU3XPce+aLjjITF1L4UZtIVTcygiSfBjpEGfJWAN4Eo1D
 MG49LFuJNe5gxjB6f28yL+WGKKYktokfCR/v2XwPtYslaaGRuAB8Rlou0Fn8fvD9fthx
 An8Odoz2pk2U637DuqBOdanZ2o+KbNrJUZ5jgVz3kh7kGGoInjq0mhfOI5dxj/0H6JaQ
 5dJTFcYPnBSKnA9M+eWODfpC8ib6vRnFLwHJGjd2HgXwGpQELi7fIo+//Ucw4Bp0m+h1
 PaNA==
X-Gm-Message-State: AOAM530SzLiyUSMMLVilsZF+W2IB5ch6MdKKnjLMzOkzvVCuxK9eZSqh
 TLZkt0YRC7uuc4Yzke0E0H6oNDP7Z/jKof1+mHit3VFcCGS5Kgf/0nq/t71AKBXX31I9XVdLoeS
 fc9keubu6WFBJFR8=
X-Received: by 2002:a9d:37e3:: with SMTP id x90mr2582325otb.11.1635521489843; 
 Fri, 29 Oct 2021 08:31:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD9wgqJPOUkjRULYyCFWEUtqRUUcfgyzv2DA7ntrt/doqaqVvMW4JLoDn6EQbWffwyBsxt0Q==
X-Received: by 2002:a9d:37e3:: with SMTP id x90mr2582285otb.11.1635521489518; 
 Fri, 29 Oct 2021 08:31:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id p5sm252639otf.38.2021.10.29.08.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 08:31:29 -0700 (PDT)
Date: Fri, 29 Oct 2021 09:31:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 5/5] pc/q35: Add pre-plug hook for x86-iommu
Message-ID: <20211029093127.55591ad4.alex.williamson@redhat.com>
In-Reply-To: <YXtiE9iInfHcTLwm@xz-m1.local>
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-6-peterx@redhat.com>
 <20211028085242.770a9dde.alex.williamson@redhat.com>
 <YXrDgeembpIiJ0BE@xz-m1.local>
 <20211028101135.72672e80.alex.williamson@redhat.com>
 <YXtiE9iInfHcTLwm@xz-m1.local>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Oct 2021 10:53:07 +0800
Peter Xu <peterx@redhat.com> wrote:

> On Thu, Oct 28, 2021 at 10:11:35AM -0600, Alex Williamson wrote:
> > Better.  Like the class layering proposal, a downside is that the
> > driver needs to be aware that it's imposing this requirement to be able
> > to mark it in the class init function rather than some automatic means,
> > like an "as_object_consumed" flag set automatically on the device
> > structure via accessors like pci_device_iommu_address_space().  Thanks,  
> 
> Do you mean something like this?
> 
> ---8<---
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 258290f4eb..969f4c85fd 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2729,6 +2729,10 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>      PCIBus *iommu_bus = bus;
>      uint8_t devfn = dev->devfn;
> 
> +    if (!dev->address_space_consumed) {
> +        dev->address_space_consumed = true;
> +    }

Could just set it unconditionally.

> +
>      while (iommu_bus && !iommu_bus->iommu_fn && iommu_bus->parent_dev) {
>          PCIBus *parent_bus = pci_get_bus(iommu_bus->parent_dev);
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 6813f128e0..704c9bdc6e 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -268,6 +268,13 @@ typedef struct PCIReqIDCache PCIReqIDCache;
>  struct PCIDevice {
>      DeviceState qdev;
>      bool partially_hotplugged;
> +    /*
> +     * This will be set after the 1st time the device implementation fetches
> +     * its dma address space from pci_device_iommu_address_space().  It's used
> +     * as a sanity check for platform devices like vIOMMU to detect incorrect
> +     * ordering of device realization.
> +     */
> +    bool address_space_consumed;
> 
>      /* PCI config space */
>      uint8_t *config;
> ---8<---
> 
> Then sanity check in pre-plug of vIOMMU.
> 
> The flag will be a bit more "misterious" than the previous approach, imho, as
> the name of it will be even further from the problem it's going to solve.
> However it looks at least clean on the changeset and it looks working too.

That seems like a function of how well we name and comment the
variable, right?  We are making an assumption here that if the address
space for a device is provided then that address space is no longer
interchangeable, some decision has already been made based on the
provided address space.  If we look at the callers of
pci_device_iommu_address_space(), we have:

pci_init_bus_master() - It holds true here that the purpose of
accessing the address space is to make the memory of that address space
accessible to the device, the address space cannot be transparently
swapped for another.

vfio_realize() - The case we're concerned about, potentially the
earliest use case.

virtio_pci_iommu_enabled() - AIUI, this is where virtio devices decide
how DMA flows, the address space of the device cannot be changed after
this.

kvm_arch_fixup_msi_route() - ARM KVM decides MSI routing here, the
address space is fixed after this.

Actually, maybe there's a more simple approach, could we further assume
that if the address space for *any* device relative to an IOMMU is
evaluated, then we've passed the point where an IOMMU could be added?
IOW, maybe we don't need a per device flag and a global flag would be
enough.  A function like pci_iommu_as_evaluated() could report the
state of that flag.  For convenience to the user though, tracking per
device to be able to report which devices are mis-ordered could still
be useful though.  Thanks,

Alex


