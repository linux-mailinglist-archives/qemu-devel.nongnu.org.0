Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D980669B512
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 22:48:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT8Zj-0001Ct-GN; Fri, 17 Feb 2023 16:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8Zd-0001Aq-5F
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:47:21 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8Za-0005co-T3
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676670438; x=1708206438;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NTmRDkTq/3zwC48YMDtAaY4wKqcKEsPOrmar5Gt4CTs=;
 b=VncfjL+lOoy81qouldVLSQ0xhuOjvjs7PDxKhfaIfSlZGdTwGgaP2OyF
 LzS/UACZKpdsgdux4jv4fHuOpYwYHdGbVR3pJAu8ucLJ7Y1+iRFv1ccxx
 8YtlTnEMGUZ81rIhIXIcd1nTV/Y4jw8TNQqZgh2xrurNLfwupgqnINfKf
 kbR0gloP/Q9tvqardIRC5Ja24d+9b6Mw3XVX/vLa81M00XoDSJ5kHMuBn
 qzqAPT9e/yzrh6dS+Pu4jXnyuAomAcyVwr+2IqC2qW+pWLaK7MExr9OO3
 BnvT+AkeIewQT9RO4bEgw5pvebrXOQQWQSey2jIrYxUMZxQzHvr6bDGsO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="320203473"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="320203473"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:47:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="670687658"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="670687658"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.213.187.252])
 ([10.213.187.252])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:47:15 -0800
Message-ID: <06665188-dcf9-441b-8393-a5ff443f6828@intel.com>
Date: Fri, 17 Feb 2023 14:47:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v4 5/8] hw/mem/cxl-type3: Add AER extended capability
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
 <20230217172924.25239-6-Jonathan.Cameron@huawei.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230217172924.25239-6-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=dave.jiang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
> This enables AER error injection to function as expected.
> It is intended as a building block in enabling CXL RAS error injection
> in the following patches.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   hw/mem/cxl_type3.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 217a5e639b..6cdd988d1d 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -250,6 +250,7 @@ static void ct3d_config_write(PCIDevice *pci_dev, uint32_t addr, uint32_t val,
>   
>       pcie_doe_write_config(&ct3d->doe_cdat, addr, val, size);
>       pci_default_write_config(pci_dev, addr, val, size);
> +    pcie_aer_write_config(pci_dev, addr, val, size);
>   }
>   
>   /*
> @@ -452,8 +453,19 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
>       cxl_cstate->cdat.free_cdat_table = ct3_free_cdat_table;
>       cxl_cstate->cdat.private = ct3d;
>       cxl_doe_cdat_init(cxl_cstate, errp);
> +
> +    pcie_cap_deverr_init(pci_dev);
> +    /* Leave a bit of room for expansion */
> +    rc = pcie_aer_init(pci_dev, PCI_ERR_VER, 0x200, PCI_ERR_SIZEOF, NULL);
> +    if (rc) {
> +        goto err_release_cdat;
> +    }
> +
>       return;
>   
> +err_release_cdat:
> +    cxl_doe_cdat_release(cxl_cstate);
> +    g_free(regs->special_ops);
>   err_address_space_free:
>       address_space_destroy(&ct3d->hostmem_as);
>       return;
> @@ -465,6 +477,7 @@ static void ct3_exit(PCIDevice *pci_dev)
>       CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
>       ComponentRegisters *regs = &cxl_cstate->crb;
>   
> +    pcie_aer_exit(pci_dev);
>       cxl_doe_cdat_release(cxl_cstate);
>       g_free(regs->special_ops);
>       address_space_destroy(&ct3d->hostmem_as);

