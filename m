Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B5E39894D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:19:54 +0200 (CEST)
Received: from localhost ([::1]:41500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPqk-0002hY-0T
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPpW-00014Q-UW
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:18:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPpV-0004fA-1D
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622636316;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsTzgwSfJ12II6PARQ4srbEiUlQ/OEvvSlUQ0SnylPk=;
 b=U4yMX/XLIkzQyKPKhZ/XP7fNvqyhk5bTOCLNMLjLBjD/ZpQwawPLgzgdcjAaYpp3sgNqtv
 tViuNRQ3FbHXl+AAvkk0f6wrj4y135s1+QPeK8jPc7UlcTWPrmbABvnN0oLWqYKWiVckIz
 zjAurN+4EbFr92NzzQPmAVQQMCdxLmQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-O462YYXMMWqOOLQ3S23pUg-1; Wed, 02 Jun 2021 08:18:33 -0400
X-MC-Unique: O462YYXMMWqOOLQ3S23pUg-1
Received: by mail-wm1-f70.google.com with SMTP id
 x20-20020a1c7c140000b029018f49a7efb7so2119510wmc.1
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 05:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:reply-to:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XsTzgwSfJ12II6PARQ4srbEiUlQ/OEvvSlUQ0SnylPk=;
 b=l5C3xrYIOfvls1tPKcFsxoUegn8CypOe3Jki+eF0e6Pnqzu1oBlSbTpbmt73+0o+il
 yTrnSFernitcOJG0uneiZthSYICMAz0meqBhJ0HIdFOeEg0N3ZNjMdG2CPDyJYjtn6Gq
 pMyTB9F/yf0cio0c6K+Pb0mB52KlAWGITl40FHBVA88VLTz3zW0yqOrKEBwIQJF3sLD5
 txcrONLl/EUzsh5zifvvL6SwesvHS96M+eexBJUQq3kAIv97Sxx05sYSPCE7j1aYrWeR
 YsfZeYKDC7v69nNUEW5f3kaWmsztITbi0OGHDd6TkVyyS8hwszO+Pe2l8iZssltwESry
 sH0g==
X-Gm-Message-State: AOAM532Caw448hddO1nnCwDdnZgSDphcZKR5UpDP1u3OQ95m3Lnw2t4z
 T3W56woLLxazC0b3jW4k23ldkZC5U6Zz1Xw1iorSV6QZxTX9Jeu4TPkROagsbdaGRikppOmY8Wg
 oWtAz74MlC37PYtA=
X-Received: by 2002:a7b:c749:: with SMTP id w9mr4920241wmk.3.1622636311869;
 Wed, 02 Jun 2021 05:18:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhkOPEDKxge2r+p9V+yX5RMOClZmpzOiex4GA3twTl0mzLKqtfPkM15/3JcIkda2Ale2YEUw==
X-Received: by 2002:a7b:c749:: with SMTP id w9mr4920219wmk.3.1622636311671;
 Wed, 02 Jun 2021 05:18:31 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id g10sm6484279wrq.12.2021.06.02.05.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:18:31 -0700 (PDT)
From: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 1/8] hw/pci/pci_host: Allow bypass iommu for pci host
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-2-git-send-email-wangxingang5@huawei.com>
Message-ID: <4fed8139-c5f0-8b96-4b98-69374d31c10e@redhat.com>
Date: Wed, 2 Jun 2021 14:18:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621914605-14724-2-git-send-email-wangxingang5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: xieyingtai@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xingang,

On 5/25/21 5:49 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
>
> This add a bypass_iommu property for pci host, which indicates
> whether devices attached to the pci root bus will bypass iommu.
> In pci_device_iommu_address_space(), add a bypass_iommu check
> to avoid getting iommu address space for devices bypass iommu.
>
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> ---
>  hw/pci/pci.c              | 18 +++++++++++++++++-
>  hw/pci/pci_host.c         |  2 ++
>  include/hw/pci/pci.h      |  1 +
>  include/hw/pci/pci_host.h |  1 +
>  4 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 377084f1a8..27d588e268 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -416,6 +416,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
>      return rootbus->qbus.name;
>  }
>  
> +bool pci_bus_bypass_iommu(PCIBus *bus)
> +{
> +    PCIBus *rootbus = bus;
> +    PCIHostState *host_bridge;
> +
> +    if (!pci_bus_is_root(bus)) {
> +        rootbus = pci_device_root_bus(bus->parent_dev);
> +    }
> +
> +    host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
> +
> +    assert(host_bridge->bus == rootbus);
> +
> +    return host_bridge->bypass_iommu;
> +}
> +
>  static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
>                                MemoryRegion *address_space_mem,
>                                MemoryRegion *address_space_io,
> @@ -2718,7 +2734,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>  
>          iommu_bus = parent_bus;
>      }
> -    if (iommu_bus && iommu_bus->iommu_fn) {
> +    if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>          return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
>      }
>      return &address_space_memory;
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index 8ca5fadcbd..2768db53e6 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -222,6 +222,8 @@ const VMStateDescription vmstate_pcihost = {
>  static Property pci_host_properties_common[] = {
>      DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
>                       mig_enabled, true),
> +    DEFINE_PROP_BOOL("pci-host-bypass-iommu", PCIHostState,
> +                     bypass_iommu, false),
"bypass-iommu" may be sufficient.

Besides:

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Thanks

Eric

>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 6be4e0c460..f4d51b672b 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -480,6 +480,7 @@ void pci_for_each_bus(PCIBus *bus,
>  
>  PCIBus *pci_device_root_bus(const PCIDevice *d);
>  const char *pci_root_bus_path(PCIDevice *dev);
> +bool pci_bus_bypass_iommu(PCIBus *bus);
>  PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
>  int pci_qdev_find_device(const char *id, PCIDevice **pdev);
>  void pci_bus_get_w64_range(PCIBus *bus, Range *range);
> diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
> index 52e038c019..c6f4eb4585 100644
> --- a/include/hw/pci/pci_host.h
> +++ b/include/hw/pci/pci_host.h
> @@ -43,6 +43,7 @@ struct PCIHostState {
>      uint32_t config_reg;
>      bool mig_enabled;
>      PCIBus *bus;
> +    bool bypass_iommu;
>  
>      QLIST_ENTRY(PCIHostState) next;
>  };


