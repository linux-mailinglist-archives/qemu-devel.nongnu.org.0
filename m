Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B456F54C7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:32:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8qa-0002KN-Vy; Wed, 03 May 2023 05:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pu8qZ-0002K5-1N
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:32:27 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pu8qX-0007YS-75
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:32:26 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QBBTd42y6z6J6nJ;
 Wed,  3 May 2023 17:28:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 3 May
 2023 10:32:23 +0100
Date: Wed, 3 May 2023 10:32:22 +0100
To: Leonardo Bras <leobras@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
CC: Eduardo Habkost <eduardo@habkost.net>, Philippe =?ISO-8859-1?Q?Mathieu?=
 =?ISO-8859-1?Q?-Daud=E9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu
 <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 <qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
Message-ID: <20230503103222.00003a89@Huawei.com>
In-Reply-To: <20230503002701.854329-1-leobras@redhat.com>
References: <20230503002701.854329-1-leobras@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue,  2 May 2023 21:27:02 -0300
Leonardo Bras <leobras@redhat.com> wrote:

> Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
> set for machine types < 8.0 will cause migration to fail if the target
> QEMU version is < 8.0.0 :
> 
> qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
> qemu-system-x86_64: Failed to load PCIDevice:config
> qemu-system-x86_64: Failed to load e1000e:parent_obj
> qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'
> qemu-system-x86_64: load of migration failed: Invalid argument
> 
> The above test migrated a 7.2 machine type from QEMU master to QEMU 7.2.0,
> with this cmdline:
> 
> ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> 
> In order to fix this, property x-pcie-err-unc-mask was introduced to
> control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
> default, but is disabled if machine type <= 7.2.
> 
> Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register")
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Thanks Leo, you are a star.

LGTM

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  include/hw/pci/pci.h |  2 ++
>  hw/core/machine.c    |  1 +
>  hw/pci/pci.c         |  2 ++
>  hw/pci/pcie_aer.c    | 11 +++++++----
>  4 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 935b4b91b4..e6d0574a29 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -207,6 +207,8 @@ enum {
>      QEMU_PCIE_EXTCAP_INIT = (1 << QEMU_PCIE_EXTCAP_INIT_BITNR),
>  #define QEMU_PCIE_CXL_BITNR 10
>      QEMU_PCIE_CAP_CXL = (1 << QEMU_PCIE_CXL_BITNR),
> +#define QEMU_PCIE_ERR_UNC_MASK_BITNR 11
> +    QEMU_PCIE_ERR_UNC_MASK = (1 << QEMU_PCIE_ERR_UNC_MASK_BITNR),
>  };
>  
>  typedef struct PCIINTxRoute {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 47a34841a5..07f763eb2e 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -48,6 +48,7 @@ GlobalProperty hw_compat_7_2[] = {
>      { "e1000e", "migrate-timadj", "off" },
>      { "virtio-mem", "x-early-migration", "false" },
>      { "migration", "x-preempt-pre-7-2", "true" },
> +    { TYPE_PCI_DEVICE, "x-pcie-err-unc-mask", "off" },
>  };
>  const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
>  
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 8a87ccc8b0..5153ad63d6 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -79,6 +79,8 @@ static Property pci_props[] = {
>      DEFINE_PROP_STRING("failover_pair_id", PCIDevice,
>                         failover_pair_id),
>      DEFINE_PROP_UINT32("acpi-index",  PCIDevice, acpi_index, 0),
> +    DEFINE_PROP_BIT("x-pcie-err-unc-mask", PCIDevice, cap_present,
> +                    QEMU_PCIE_ERR_UNC_MASK_BITNR, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 103667c368..374d593ead 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -112,10 +112,13 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
>  
>      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
>                   PCI_ERR_UNC_SUPPORTED);
> -    pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> -                 PCI_ERR_UNC_MASK_DEFAULT);
> -    pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> -                 PCI_ERR_UNC_SUPPORTED);
> +
> +    if (dev->cap_present & QEMU_PCIE_ERR_UNC_MASK) {
> +        pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> +                     PCI_ERR_UNC_MASK_DEFAULT);
> +        pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> +                     PCI_ERR_UNC_SUPPORTED);
> +    }
>  
>      pci_set_long(dev->config + offset + PCI_ERR_UNCOR_SEVER,
>                   PCI_ERR_UNC_SEVERITY_DEFAULT);


