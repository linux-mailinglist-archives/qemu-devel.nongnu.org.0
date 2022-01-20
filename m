Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B749440A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 01:14:53 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAL6K-0006cq-CG
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 19:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nAL3y-0005Sb-Rk
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:12:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nAL3v-0004ba-Vt
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642637543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+NSsA18aGf/nzYHl6Pv5yHpk2qnhvaNZVtAthfoRpw=;
 b=f3iwSfqB+c3HMhNTjhvRYWk1eOJ5pLqeob1HTJAEsnznO1hri0e6OK+tBua3a3hySDJoHc
 UJGNW4uBpeJCLOG6/7fWEZaBebDVIfTuypy2q4F3UVigSefUa5Ky0gJ4pSaSzmhGT7/Yt4
 uC4PEeYEIbytjTP2vNK7STZCzPn54Ug=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-V-CILU9XPzCe3fCN_W6_4Q-1; Wed, 19 Jan 2022 19:12:22 -0500
X-MC-Unique: V-CILU9XPzCe3fCN_W6_4Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso2784159wmb.6
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 16:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D+NSsA18aGf/nzYHl6Pv5yHpk2qnhvaNZVtAthfoRpw=;
 b=jhYcsffer5bmCcSykCNDXN/XmPEjU2/hJLCHDf0ZaP/uCoonI8r0K+GRkwUR3SKwWk
 271gf4L6HIhOKGskE5OmXgP7GNqyXGpDNivqpNwqFm/p18ewTdZaiS+lF0PZ6g4w0S6J
 pbjUgAAfWVE2e+K+DebjPFEvuma9dY9XjugnfcfBv5x4mnjRqKZDoH9OmYWU3qKSaHl2
 TUtJPVBci4+7hYZS0cS1HfQ4sOE1GN7dob9Y0Z0J5Swm5CAVAwzXLr6uUQPWbT9jMLof
 mVwLUO5C+Uf+I82TFsjYbyFprpttInqr32cM7ESntcN/I/RgKzqFLIFVs5cmnqk6DUpL
 xpLA==
X-Gm-Message-State: AOAM531uGhFve4g3sNO8q7MUBLces0nGV1fxQz2s/07zjiOBHBCo4WDx
 gThWpHaydbsqZ2iaN/gLjvMH+SYKJFIFt8xCTaEI4QlqLbyIpuULucoe0DnZ54uti4ZMBAYzE5k
 yVGt74p+rAzKe5EA=
X-Received: by 2002:a7b:c142:: with SMTP id z2mr5873043wmi.167.1642637539058; 
 Wed, 19 Jan 2022 16:12:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8gMA0rChQSZ82tH2i5yB12hO9tSG82XwRoYSvLpRi/+xCIhHUkWjbapCCL9/SH0wrVwxY6w==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr5873017wmi.167.1642637538772; 
 Wed, 19 Jan 2022 16:12:18 -0800 (PST)
Received: from redhat.com ([2.55.158.216])
 by smtp.gmail.com with ESMTPSA id e15sm1535299wrg.91.2022.01.19.16.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 16:12:18 -0800 (PST)
Date: Wed, 19 Jan 2022 19:12:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220119190742-mutt-send-email-mst@kernel.org>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, quintela@redhat.com, armbru@redhat.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, dgilbert@redhat.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wrote:
> Allow PCI buses to be part of isolated CPU address spaces. This has a
> niche usage.
> 
> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
> the same machine/server. This would cause address space collision as
> well as be a security vulnerability. Having separate address spaces for
> each PCI bus would solve this problem.

Fascinating, but I am not sure I understand. any examples?

I also wonder whether this special type could be modelled like a special
kind of iommu internally.

> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/pci/pci.h     |  2 ++
>  include/hw/pci/pci_bus.h | 17 +++++++++++++++++
>  hw/pci/pci.c             | 17 +++++++++++++++++
>  hw/pci/pci_bridge.c      |  5 +++++
>  4 files changed, 41 insertions(+)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 023abc0f79..9bb4472abc 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -387,6 +387,8 @@ void pci_device_save(PCIDevice *s, QEMUFile *f);
>  int pci_device_load(PCIDevice *s, QEMUFile *f);
>  MemoryRegion *pci_address_space(PCIDevice *dev);
>  MemoryRegion *pci_address_space_io(PCIDevice *dev);
> +AddressSpace *pci_isol_as_mem(PCIDevice *dev);
> +AddressSpace *pci_isol_as_io(PCIDevice *dev);
>  
>  /*
>   * Should not normally be used by devices. For use by sPAPR target
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 347440d42c..d78258e79e 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -39,9 +39,26 @@ struct PCIBus {
>      void *irq_opaque;
>      PCIDevice *devices[PCI_SLOT_MAX * PCI_FUNC_MAX];
>      PCIDevice *parent_dev;
> +
>      MemoryRegion *address_space_mem;
>      MemoryRegion *address_space_io;
>  
> +    /**
> +     * Isolated address spaces - these allow the PCI bus to be part
> +     * of an isolated address space as opposed to the global
> +     * address_space_memory & address_space_io.

Are you sure address_space_memory & address_space_io are
always global? even in the case of an iommu?

> This allows the
> +     * bus to be attached to CPUs from different machines. The
> +     * following is not used used commonly.
> +     *
> +     * TYPE_REMOTE_MACHINE allows emulating devices from multiple
> +     * VM clients,

what are VM clients?

> as such it needs the PCI buses in the same machine
> +     * to be part of different CPU address spaces. The following is
> +     * useful in that scenario.
> +     *
> +     */
> +    AddressSpace *isol_as_mem;
> +    AddressSpace *isol_as_io;
> +
>      QLIST_HEAD(, PCIBus) child; /* this will be replaced by qdev later */
>      QLIST_ENTRY(PCIBus) sibling;/* this will be replaced by qdev later */
>  
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 5d30f9ca60..d5f1c6c421 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -442,6 +442,8 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
>      bus->slot_reserved_mask = 0x0;
>      bus->address_space_mem = address_space_mem;
>      bus->address_space_io = address_space_io;
> +    bus->isol_as_mem = NULL;
> +    bus->isol_as_io = NULL;
>      bus->flags |= PCI_BUS_IS_ROOT;
>  
>      /* host bridge */
> @@ -2676,6 +2678,16 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev)
>      return pci_get_bus(dev)->address_space_io;
>  }
>  
> +AddressSpace *pci_isol_as_mem(PCIDevice *dev)
> +{
> +    return pci_get_bus(dev)->isol_as_mem;
> +}
> +
> +AddressSpace *pci_isol_as_io(PCIDevice *dev)
> +{
> +    return pci_get_bus(dev)->isol_as_io;
> +}
> +
>  static void pci_device_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *k = DEVICE_CLASS(klass);
> @@ -2699,6 +2711,7 @@ static void pci_device_class_base_init(ObjectClass *klass, void *data)
>  
>  AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>  {
> +    AddressSpace *iommu_as = NULL;
>      PCIBus *bus = pci_get_bus(dev);
>      PCIBus *iommu_bus = bus;
>      uint8_t devfn = dev->devfn;
> @@ -2745,6 +2758,10 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>      if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>          return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
>      }
> +    iommu_as = pci_isol_as_mem(dev);
> +    if (iommu_as) {
> +        return iommu_as;
> +    }
>      return &address_space_memory;
>  }
>  
> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index da34c8ebcd..98366768d2 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -383,6 +383,11 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
>      sec_bus->address_space_io = &br->address_space_io;
>      memory_region_init(&br->address_space_io, OBJECT(br), "pci_bridge_io",
>                         4 * GiB);
> +
> +    /* This PCI bridge puts the sec_bus in its parent's address space */
> +    sec_bus->isol_as_mem = pci_isol_as_mem(dev);
> +    sec_bus->isol_as_io = pci_isol_as_io(dev);
> +
>      br->windows = pci_bridge_region_init(br);
>      QLIST_INIT(&sec_bus->child);
>      QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
> -- 
> 2.20.1


