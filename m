Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E7B591C01
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 18:27:15 +0200 (CEST)
Received: from localhost ([::1]:34922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtyk-0007QJ-HE
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 12:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oMtvo-0004NT-Gl
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 12:24:13 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:48108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oMtvk-0004eM-2u
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 12:24:10 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 5F5942E0A21;
 Sat, 13 Aug 2022 19:24:00 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b65f::1:18] (unknown
 [2a02:6b8:b081:b65f::1:18])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 t2hlDH0X5v-NwPqL65R; Sat, 13 Aug 2022 19:23:59 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660407839; bh=rbg3hfBf38OSRAgd9ult9aw/iBZxtn64NQwQrXBOQFE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=W+sqPvxWuqOdjbdGanoeeoMUCH2vV1/9UEpU7+Le6WSbV0AtCZaNNuBJfO4ah9mvj
 wjt9kRu5/55JSi7uMuvnwzzSzazV4NqQy6tXJJET+jkP9ijHGYGXafdyVFwMHV7DYJ
 ZGDdghe4dvEK0REigJtLF6B1ImKghMXCsrXaxjzg=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <3cdc0316-b615-107f-65bf-dda340841f73@yandex-team.ru>
Date: Sat, 13 Aug 2022 19:23:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] pci/pci_expander_bridge: migrate state of pxb/pxb-pcie
 devices.
Content-Language: en-US
To: Andrey Ryabinin <arbn@yandex-team.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, quintela@redhat.com
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.com
References: <20220811164901.25042-1-arbn@yandex-team.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220811164901.25042-1-arbn@yandex-team.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[add migration maintainers]

On 8/11/22 19:49, Andrey Ryabinin wrote:
> pxb/pxb-pcie/pxb-cxl devices currently doesn't have vmstate description
> So the state of device is not preserved during migration and
> guest can notice that as change of PCI_COMMAND_* registers state.
> 
> The diff of lspci output before and after migration:
> 
>   00:03.0 Host bridge [0600]: Red Hat, Inc. QEMU PCIe Expander bridge [1b36:000b]
>           Subsystem: Red Hat, Inc QEMU PCIe Expander bridge [1af4:1100]
>   -       Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
>   +       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>           Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 
> Add VMStateDescription to pxb devices so their state is transferred
> during migrations. For saving migration compatibility add
> 'x-config-reg-migration-enabled' property to pxb devices and disable
> it for all released machine types.
> 
> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
> ---
>   hw/core/machine.c                   |  3 +++
>   hw/pci-bridge/pci_expander_bridge.c | 24 ++++++++++++++++++++++++
>   include/hw/pci/pci_bridge.h         |  1 +
>   3 files changed, 28 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302ccec..071853469e2 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -43,6 +43,9 @@
>   GlobalProperty hw_compat_7_0[] = {
>       { "arm-gicv3-common", "force-8-bit-prio", "on" },
>       { "nvme-ns", "eui64-default", "on"},
> +    { "pxb", "x-config-reg-migration-enabled", "off" },
> +    { "pxb-cxl", "x-config-reg-migration-enabled", "off" },
> +    { "pxb-pcie", "x-config-reg-migration-enabled", "off" },


Seems that it's too late for 7.1, rc2 is out and rc3 is coming soon. And that's not a degradation.

Up to maintainers, but I think we'd better start new hw_compat_7_1 for this thing.


>   };
>   const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
>   
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index c9e817aa586..a3680d4d045 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -23,6 +23,7 @@
>   #include "qemu/error-report.h"
>   #include "qemu/module.h"
>   #include "sysemu/numa.h"
> +#include "migration/vmstate.h"
>   #include "hw/boards.h"
>   #include "qom/object.h"
>   
> @@ -404,9 +405,29 @@ static Property pxb_dev_properties[] = {
>       DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
>       DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
>       DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
> +    DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PXBDev,
> +                     migratable, true),

With it, do we create a user-visible property? If so, is it possible to avoid it?

>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> +static bool pxb_vmstate_needed(void *opaque)
> +{
> +    PXBDev *pxb = opaque;
> +
> +    return pxb->migratable;
> +}
> +
> +static const VMStateDescription vmstate_pxb_device = {
> +    .name = "pxb-pci",
> +    .needed = pxb_vmstate_needed,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(parent_obj, PXBDev),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static void pxb_dev_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -422,6 +443,7 @@ static void pxb_dev_class_init(ObjectClass *klass, void *data)
>       device_class_set_props(dc, pxb_dev_properties);
>       dc->hotpluggable = false;
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->vmsd = &vmstate_pxb_device;
>   }
>   
>   static const TypeInfo pxb_dev_info = {
> @@ -460,6 +482,7 @@ static void pxb_pcie_dev_class_init(ObjectClass *klass, void *data)
>       device_class_set_props(dc, pxb_dev_properties);
>       dc->hotpluggable = false;
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->vmsd = &vmstate_pxb_device;
>   }
>   
>   static const TypeInfo pxb_pcie_dev_info = {
> @@ -504,6 +527,7 @@ static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
>       /* Host bridges aren't hotpluggable. FIXME: spec reference */
>       dc->hotpluggable = false;
>       dc->reset = pxb_dev_reset;
> +    dc->vmsd = &vmstate_pxb_device;
>   }
>   
>   static const TypeInfo pxb_cxl_dev_info = {
> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index ba4bafac7c2..404dc02e36e 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -91,6 +91,7 @@ struct PXBDev {
>       uint8_t bus_nr;
>       uint16_t numa_node;
>       bool bypass_iommu;
> +    bool migratable;
>       struct cxl_dev {
>           CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
>       } cxl;


-- 
Best regards,
Vladimir

