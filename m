Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9063497AE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:16:09 +0100 (CET)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTaZ-0004Kz-TO
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lPTOU-0003fg-Iq
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:03:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lPTOQ-0004o5-6S
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616691810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yd24CN/cEsMQNc/Y0vFp8HoTg/GNygss3BU1636GTgw=;
 b=EKUCtRojCBDq3H8uOhEK7ER8eFBp7nkQxutvkHtkTbSdnMXt2AhedMU1x1rizD7Tz38snN
 5aWRpKEHWowN/HteQ8nxEE+eOwm5PjMivUAk6IU4DIb4mK77UGdekmAoqIgc+YNhXBObZw
 30UEvxNfHRzQkI/fpqakiuffUX0ESOk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-EcFmEPWhPSir86TJiDBxLQ-1; Thu, 25 Mar 2021 13:03:20 -0400
X-MC-Unique: EcFmEPWhPSir86TJiDBxLQ-1
Received: by mail-wm1-f70.google.com with SMTP id a63so52030wmd.8
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yd24CN/cEsMQNc/Y0vFp8HoTg/GNygss3BU1636GTgw=;
 b=HZ62C51v9gqh14T0LxmumFwAmASWQJryxNDsO7SaUP/dpDrxUrpKPv+vCoX3pL6JZC
 Nkr2yW/wnlSOU6wLk4iptMz2w7Fb8rVxAvxuibdnw1ldGStRkpN69PH0mHDEHRFW4bak
 GSym4qsWzyUUmq1XYxWBO12k7kXqrIwJTXndQVuNuleCPNLhelJkieaEKQqA+y10d+j4
 L8fP8OsIUVHlCIh02GLBe7LgsWKvdmVWQ2E1Q4JkEcs6vxRiGR6YAWAZW89zmwFDHqLe
 fhBkww0UZBCFgd5KTlJwyYJi6FIZu3YfnTL8bvVUTqbsIb8iyKmeegldGHG7W/reSWnH
 udzQ==
X-Gm-Message-State: AOAM530oBcC/IuKCxB9WtMOSkdMQD/cM2eBv3TRAe0YimvvIJQDGjpTQ
 8mc1bZTDjdo2efHPNM9MemjpLr9h0oNuJYFNAFNaZ2aBYe/5NzPZa4JKhdLFipVlzuIWOB4fKwp
 LecPtYcBmthzjQRk=
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr8966833wmd.83.1616691798024; 
 Thu, 25 Mar 2021 10:03:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFOqBswtzJ2YMVO7GFPX4Jh4UhxmKZj1M314z91teI6tYTlW4eiKNMiRvociLv2elKggkPSQ==
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr8966784wmd.83.1616691797600; 
 Thu, 25 Mar 2021 10:03:17 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id m11sm8702227wri.44.2021.03.25.10.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 10:03:17 -0700 (PDT)
Date: Thu, 25 Mar 2021 13:03:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
Message-ID: <20210325130304-mutt-send-email-mst@kernel.org>
References: <20210325163315.27724-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210325163315.27724-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Arnd Bergmann <arnd@arndb.de>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 25, 2021 at 04:33:15PM +0000, Peter Maydell wrote:
> Currently the gpex PCI controller implements no special behaviour for
> guest accesses to areas of the PIO and MMIO where it has not mapped
> any PCI devices, which means that for Arm you end up with a CPU
> exception due to a data abort.
> 
> Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> like this return -1 for reads and ignore writes.  In the interests of
> not being surprising, make host CPU accesses to these windows behave
> as -1/discard where there's no mapped PCI device.
> 
> The old behaviour generally didn't cause any problems, because
> almost always the guest OS will map the PCI devices and then only
> access where it has mapped them. One corner case where you will see
> this kind of access is if Linux attempts to probe legacy ISA
> devices via a PIO window access. So far the only case where we've
> seen this has been via the syzkaller fuzzer.
> 
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> v1->v2 changes: put in the hw_compat machinery.
> 
> Still not sure if I want to put this in 6.0 or not.
> 
>  include/hw/pci-host/gpex.h |  4 +++
>  hw/core/machine.c          |  1 +
>  hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
>  3 files changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index d48a020a952..fcf8b638200 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -49,8 +49,12 @@ struct GPEXHost {
>  
>      MemoryRegion io_ioport;
>      MemoryRegion io_mmio;
> +    MemoryRegion io_ioport_window;
> +    MemoryRegion io_mmio_window;
>      qemu_irq irq[GPEX_NUM_IRQS];
>      int irq_num[GPEX_NUM_IRQS];
> +
> +    bool allow_unmapped_accesses;
>  };
>  
>  struct GPEXConfig {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 257a664ea2e..9750fad7435 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -41,6 +41,7 @@ GlobalProperty hw_compat_5_2[] = {
>      { "PIIX4_PM", "smm-compat", "on"},
>      { "virtio-blk-device", "report-discard-granularity", "off" },
>      { "virtio-net-pci", "vectors", "3"},
> +    { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>  };
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>  
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 2bdbe7b4561..a6752fac5e8 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -83,12 +83,51 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
>      int i;
>  
>      pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
> +    sysbus_init_mmio(sbd, &pex->mmio);
> +
> +    /*
> +     * Note that the MemoryRegions io_mmio and io_ioport that we pass
> +     * to pci_register_root_bus() are not the same as the
> +     * MemoryRegions io_mmio_window and io_ioport_window that we
> +     * expose as SysBus MRs. The difference is in the behaviour of
> +     * accesses to addresses where no PCI device has been mapped.
> +     *
> +     * io_mmio and io_ioport are the underlying PCI view of the PCI
> +     * address space, and when a PCI device does a bus master access
> +     * to a bad address this is reported back to it as a transaction
> +     * failure.
> +     *
> +     * io_mmio_window and io_ioport_window implement "unmapped
> +     * addresses read as -1 and ignore writes"; this is traditional
> +     * x86 PC behaviour, which is not mandated by the PCI spec proper
> +     * but expected by much PCI-using guest software, including Linux.
> +     *
> +     * In the interests of not being unnecessarily surprising, we
> +     * implement it in the gpex PCI host controller, by providing the
> +     * _window MRs, which are containers with io ops that implement
> +     * the 'background' behaviour and which hold the real PCI MRs as
> +     * subregions.
> +     */
>      memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
>      memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
>  
> -    sysbus_init_mmio(sbd, &pex->mmio);
> -    sysbus_init_mmio(sbd, &s->io_mmio);
> -    sysbus_init_mmio(sbd, &s->io_ioport);
> +    if (s->allow_unmapped_accesses) {
> +        memory_region_init_io(&s->io_mmio_window, OBJECT(s),
> +                              &unassigned_io_ops, OBJECT(s),
> +                              "gpex_mmio_window", UINT64_MAX);
> +        memory_region_init_io(&s->io_ioport_window, OBJECT(s),
> +                              &unassigned_io_ops, OBJECT(s),
> +                              "gpex_ioport_window", 64 * 1024);
> +
> +        memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
> +        memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
> +        sysbus_init_mmio(sbd, &s->io_mmio_window);
> +        sysbus_init_mmio(sbd, &s->io_ioport_window);
> +    } else {
> +        sysbus_init_mmio(sbd, &s->io_mmio);
> +        sysbus_init_mmio(sbd, &s->io_ioport);
> +    }
> +
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
>          sysbus_init_irq(sbd, &s->irq[i]);
>          s->irq_num[i] = -1;
> @@ -108,6 +147,16 @@ static const char *gpex_host_root_bus_path(PCIHostState *host_bridge,
>      return "0000:00";
>  }
>  
> +static Property gpex_host_properties[] = {
> +    /*
> +     * Permit CPU accesses to unmapped areas of the PIO and MMIO windows
> +     * (discarding writes and returning -1 for reads) rather than aborting.
> +     */
> +    DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
> +                     allow_unmapped_accesses, true),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void gpex_host_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -117,6 +166,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
>      dc->realize = gpex_host_realize;
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->fw_name = "pci";
> +    device_class_set_props(dc, gpex_host_properties);
>  }
>  
>  static void gpex_host_initfn(Object *obj)
> -- 
> 2.20.1


