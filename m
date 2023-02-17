Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928EF69B46C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 22:12:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT805-0001tP-11; Fri, 17 Feb 2023 16:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT802-0001sy-Lw
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:10:34 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT800-0003WU-NE
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676668232; x=1708204232;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bsglX7iidTKm/vXA8BsTgb35ImhNfc2kF1gMW9B7eSw=;
 b=n4vjnfuBNjV/Jujx/2N0q6T6NiGG+P1LSZwlGjt8iTKPwwTVIga0D8b6
 q4OBQmLEkLO3sDjRFFeRiGvwo+LkqsUaba/lFQil/lp99G84SV1+PJwV9
 JFmWQ4xzXbaCLpaht7QHmyzrBrrC33G5R0YdlGz4WFv0UIkixGfmGzHrg
 cZixMnBysmpMvllhjULu8lwFZxezg+LvxkU3Ubsthkrxl6NQZLTrNmRjt
 b8E5SFyWLOT+y8fS6TD0One/uHKgA8aFDkJ/oYwFgIvc0k85SiAsyXehQ
 huVlYQo7KVq1AVP97ExW4TiGaBBunBoe1hLfQBq6whUOyq+QaKmoxzsdg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332097844"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="332097844"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:10:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="759519627"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="759519627"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.213.187.252])
 ([10.213.187.252])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:10:07 -0800
Message-ID: <bcc07785-3787-6485-92d1-6a347609d4bb@intel.com>
Date: Fri, 17 Feb 2023 14:10:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/8] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
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
 <20230217172924.25239-2-Jonathan.Cameron@huawei.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230217172924.25239-2-Jonathan.Cameron@huawei.com>
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
> This register in AER should be both writeable and should
> have a default value with a couple of the errors masked
> including the Uncorrectable Internal Error used by CXL for
> it's error reporting.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   hw/pci/pcie_aer.c          | 4 ++++
>   include/hw/pci/pcie_regs.h | 3 +++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 9a19be44ae..909e027d99 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -112,6 +112,10 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
>   
>       pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
>                    PCI_ERR_UNC_SUPPORTED);
> +    pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> +                 PCI_ERR_UNC_MASK_DEFAULT);
> +    pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> +                 PCI_ERR_UNC_SUPPORTED);
>   
>       pci_set_long(dev->config + offset + PCI_ERR_UNCOR_SEVER,
>                    PCI_ERR_UNC_SEVERITY_DEFAULT);
> diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
> index 963dc2e170..6ec4785448 100644
> --- a/include/hw/pci/pcie_regs.h
> +++ b/include/hw/pci/pcie_regs.h
> @@ -155,6 +155,9 @@ typedef enum PCIExpLinkWidth {
>                                            PCI_ERR_UNC_ATOP_EBLOCKED |    \
>                                            PCI_ERR_UNC_TLP_PRF_BLOCKED)
>   
> +#define PCI_ERR_UNC_MASK_DEFAULT        (PCI_ERR_UNC_INTN | \
> +                                         PCI_ERR_UNC_TLP_PRF_BLOCKED)
> +
>   #define PCI_ERR_UNC_SEVERITY_DEFAULT    (PCI_ERR_UNC_DLP |              \
>                                            PCI_ERR_UNC_SDN |              \
>                                            PCI_ERR_UNC_FCP |              \

