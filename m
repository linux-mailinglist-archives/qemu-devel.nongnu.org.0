Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6F69B4DD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 22:40:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT8RU-0006au-Rh; Fri, 17 Feb 2023 16:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8RS-0006aR-HI
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:38:54 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8RQ-00035l-Hy
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676669932; x=1708205932;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3BQA4sS//3VABDV2ayavENiGLTEUUqEzhhRuMUKPJPk=;
 b=UJTNgjC70stF/YhQyjWbZfxGqDU+bWnT0cZUeQtu83WSNjbceznCnAw4
 kbNhgPlBYExP/DTFebjLtP8Os0IzJxfdR1/ihWt2yfWJ/Zoe/cPPxO0yf
 TG3e6gh35b2GrlXbu/QXAiCa9G79Jgj2fIg3sKhWcNQQQ2oZbFdAVSg//
 wVgP2xWzseQy1THtn4tq2mqmYYdCngLrqE1VnZCMVGMcpkhXGlUabbWjo
 idwy/pMJEYBwyaw+lMn1eUNvL+wgcSDlEQeVP40DUPQ9+xOx2I39erBcv
 DzVGNghcKT0424d5mlmNYP09RdJxybhXTtoKMHVXIG4Kz2+1eiDCJWUlp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332103299"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="332103299"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:38:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="703078338"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="703078338"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.213.187.252])
 ([10.213.187.252])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:38:49 -0800
Message-ID: <d71a40d3-9d1e-2e85-c2f3-34e70474f3d4@intel.com>
Date: Fri, 17 Feb 2023 14:38:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v4 4/8] hw/pci-bridge/cxl_root_port: Wire up MSI
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mike Maslenkin <mike.maslenkin@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230217172924.25239-1-Jonathan.Cameron@huawei.com>
 <20230217172924.25239-5-Jonathan.Cameron@huawei.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230217172924.25239-5-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=dave.jiang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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



On 2/17/23 10:29 AM, Jonathan Cameron wrote:
> Done to avoid fixing ACPI route description of traditional PCI interrupts on q35
> and because we should probably move with the times anyway.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   hw/pci-bridge/cxl_root_port.c | 61 +++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
> index 00195257f7..7dfd20aa67 100644
> --- a/hw/pci-bridge/cxl_root_port.c
> +++ b/hw/pci-bridge/cxl_root_port.c
> @@ -22,6 +22,7 @@
>   #include "qemu/range.h"
>   #include "hw/pci/pci_bridge.h"
>   #include "hw/pci/pcie_port.h"
> +#include "hw/pci/msi.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/sysbus.h"
>   #include "qapi/error.h"
> @@ -29,6 +30,10 @@
>   
>   #define CXL_ROOT_PORT_DID 0x7075
>   
> +#define CXL_RP_MSI_OFFSET               0x60
> +#define CXL_RP_MSI_SUPPORTED_FLAGS      PCI_MSI_FLAGS_MASKBIT
> +#define CXL_RP_MSI_NR_VECTOR            2
> +
>   /* Copied from the gen root port which we derive */
>   #define GEN_PCIE_ROOT_PORT_AER_OFFSET 0x100
>   #define GEN_PCIE_ROOT_PORT_ACS_OFFSET \
> @@ -47,6 +52,49 @@ typedef struct CXLRootPort {
>   #define TYPE_CXL_ROOT_PORT "cxl-rp"
>   DECLARE_INSTANCE_CHECKER(CXLRootPort, CXL_ROOT_PORT, TYPE_CXL_ROOT_PORT)
>   
> +/*
> + * If two MSI vector are allocated, Advanced Error Interrupt Message Number
> + * is 1. otherwise 0.
> + * 17.12.5.10 RPERRSTS,  32:27 bit Advanced Error Interrupt Message Number.
> + */
> +static uint8_t cxl_rp_aer_vector(const PCIDevice *d)
> +{
> +    switch (msi_nr_vectors_allocated(d)) {
> +    case 1:
> +        return 0;
> +    case 2:
> +        return 1;
> +    case 4:
> +    case 8:
> +    case 16:
> +    case 32:
> +    default:
> +        break;
> +    }
> +    abort();
> +    return 0;
> +}
> +
> +static int cxl_rp_interrupts_init(PCIDevice *d, Error **errp)
> +{
> +    int rc;
> +
> +    rc = msi_init(d, CXL_RP_MSI_OFFSET, CXL_RP_MSI_NR_VECTOR,
> +                  CXL_RP_MSI_SUPPORTED_FLAGS & PCI_MSI_FLAGS_64BIT,
> +                  CXL_RP_MSI_SUPPORTED_FLAGS & PCI_MSI_FLAGS_MASKBIT,
> +                  errp);
> +    if (rc < 0) {
> +        assert(rc == -ENOTSUP);
> +    }
> +
> +    return rc;
> +}
> +
> +static void cxl_rp_interrupts_uninit(PCIDevice *d)
> +{
> +    msi_uninit(d);
> +}
> +
>   static void latch_registers(CXLRootPort *crp)
>   {
>       uint32_t *reg_state = crp->cxl_cstate.crb.cache_mem_registers;
> @@ -183,6 +231,15 @@ static void cxl_rp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
>       }
>   }
>   
> +static void cxl_rp_aer_vector_update(PCIDevice *d)
> +{
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
> +
> +    if (rpc->aer_vector) {
> +        pcie_aer_root_set_vector(d, rpc->aer_vector(d));
> +    }
> +}
> +
>   static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t val,
>                                   int len)
>   {
> @@ -192,6 +249,7 @@ static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t val,
>   
>       pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
>       pci_bridge_write_config(d, address, val, len);
> +    cxl_rp_aer_vector_update(d);
>       pcie_cap_flr_write_config(d, address, val, len);
>       pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
>       pcie_aer_write_config(d, address, val, len);
> @@ -220,6 +278,9 @@ static void cxl_root_port_class_init(ObjectClass *oc, void *data)
>   
>       rpc->aer_offset = GEN_PCIE_ROOT_PORT_AER_OFFSET;
>       rpc->acs_offset = GEN_PCIE_ROOT_PORT_ACS_OFFSET;
> +    rpc->aer_vector = cxl_rp_aer_vector;
> +    rpc->interrupts_init = cxl_rp_interrupts_init;
> +    rpc->interrupts_uninit = cxl_rp_interrupts_uninit;
>   
>       dc->hotpluggable = false;
>   }

