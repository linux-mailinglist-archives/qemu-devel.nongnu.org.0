Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785B446C14
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 03:40:36 +0100 (CET)
Received: from localhost ([::1]:56092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjBdC-000214-BS
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 22:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjBc9-0001GJ-4j
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 22:39:29 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjBc5-0006vj-9N
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 22:39:28 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HmM3w4P0Dz8v6f;
 Sat,  6 Nov 2021 10:37:48 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 10:39:20 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 10:39:20 +0800
Subject: Re: [PATCH] trace-events,pci: unify trace events format
To: Laurent Vivier <lvivier@redhat.com>, <qemu-devel@nongnu.org>
References: <20211105192541.655831-1-lvivier@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <2321f6b6-1ae8-1ca3-66f2-1916c93976f2@huawei.com>
Date: Sat, 6 Nov 2021 10:39:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211105192541.655831-1-lvivier@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/11/6 3:25, Laurent Vivier wrote:
> Unify format used by trace_pci_update_mappings_del(),
> trace_pci_update_mappings_add(), trace_pci_cfg_write() and
> trace_pci_cfg_read() to print the device name and bus number,
> slot number and function number.
>
> For instance:
>
>    pci_cfg_read virtio-net-pci 00:0 @0x20 -> 0xffffc00c
>    pci_cfg_write virtio-net-pci 00:0 @0x20 <- 0xfea0000c
>    pci_update_mappings_del d=0x555810b92330 01:00.0 4,0xffffc000+0x4000
>    pci_update_mappings_add d=0x555810b92330 01:00.0 4,0xfea00000+0x4000
>
> becomes
>
>    pci_cfg_read virtio-net-pci 01:00.0 @0x20 -> 0xffffc00c
>    pci_cfg_write virtio-net-pci 01:00.0 @0x20 <- 0xfea0000c
>    pci_update_mappings_del virtio-net-pci 01:00.0 4,0xffffc000+0x4000
>    pci_update_mappings_add virtio-net-pci 01:00.0 4,0xfea00000+0x4000
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   hw/pci/pci.c        | 4 ++--
>   hw/pci/pci_host.c   | 6 ++++--
>   hw/pci/trace-events | 8 ++++----
>   3 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 4a84e478cef5..9a76905d38c7 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1387,7 +1387,7 @@ static void pci_update_mappings(PCIDevice *d)
>   
>           /* now do the real mapping */
>           if (r->addr != PCI_BAR_UNMAPPED) {
> -            trace_pci_update_mappings_del(d, pci_dev_bus_num(d),
> +            trace_pci_update_mappings_del(d->name, pci_dev_bus_num(d),
>                                             PCI_SLOT(d->devfn),
>                                             PCI_FUNC(d->devfn),
>                                             i, r->addr, r->size);
> @@ -1395,7 +1395,7 @@ static void pci_update_mappings(PCIDevice *d)
>           }
>           r->addr = new_addr;
>           if (r->addr != PCI_BAR_UNMAPPED) {
> -            trace_pci_update_mappings_add(d, pci_dev_bus_num(d),
> +            trace_pci_update_mappings_add(d->name, pci_dev_bus_num(d),
>                                             PCI_SLOT(d->devfn),
>                                             PCI_FUNC(d->devfn),
>                                             i, r->addr, r->size);
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index cf02f0d6a501..0768893aafcf 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -78,7 +78,8 @@ void pci_host_config_write_common(PCIDevice *pci_dev, uint32_t addr,
>           return;
>       }
>   
> -    trace_pci_cfg_write(pci_dev->name, PCI_SLOT(pci_dev->devfn),
> +    trace_pci_cfg_write(pci_dev->name, pci_dev_bus_num(pci_dev),
> +                        PCI_SLOT(pci_dev->devfn),
>                           PCI_FUNC(pci_dev->devfn), addr, val);
>       pci_dev->config_write(pci_dev, addr, val, MIN(len, limit - addr));
>   }
> @@ -102,7 +103,8 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
>       }
>   
>       ret = pci_dev->config_read(pci_dev, addr, MIN(len, limit - addr));
> -    trace_pci_cfg_read(pci_dev->name, PCI_SLOT(pci_dev->devfn),
> +    trace_pci_cfg_read(pci_dev->name, pci_dev_bus_num(pci_dev),
> +                       PCI_SLOT(pci_dev->devfn),
>                          PCI_FUNC(pci_dev->devfn), addr, ret);
>   
>       return ret;
> diff --git a/hw/pci/trace-events b/hw/pci/trace-events
> index fc777d0b5e6e..7570752c4045 100644
> --- a/hw/pci/trace-events
> +++ b/hw/pci/trace-events
> @@ -1,12 +1,12 @@
>   # See docs/devel/tracing.rst for syntax documentation.
>   
>   # pci.c
> -pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
> -pci_update_mappings_add(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
> +pci_update_mappings_del(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
> +pci_update_mappings_add(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
>   
>   # pci_host.c
> -pci_cfg_read(const char *dev, unsigned devid, unsigned fnid, unsigned offs, unsigned val) "%s %02u:%u @0x%x -> 0x%x"
> -pci_cfg_write(const char *dev, unsigned devid, unsigned fnid, unsigned offs, unsigned val) "%s %02u:%u @0x%x <- 0x%x"
> +pci_cfg_read(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x -> 0x%x"
> +pci_cfg_write(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x <- 0x%x"
>   
>   # msix.c
>   msix_write_config(char *name, bool enabled, bool masked) "dev %s enabled %d masked %d"
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>


