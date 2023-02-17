Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDD869B47F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 22:17:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT85U-0004Vg-Jo; Fri, 17 Feb 2023 16:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT85S-0004VE-NE
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:16:11 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT85O-0004O7-Ok
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676668567; x=1708204567;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n57sCYK4PeaLUElSFWfLDuvU6jKLhr9A0sJ1rA2TP4Y=;
 b=jqzy7UAZgC0TmxbIFbc0AAGUwsK8BhOL/qXyWkflRbfgUwM7zBAVKpQ5
 OXgYbxxMAaxCwTjqV4/UkWe2cfGG4rw4+7UcrTl2UL4ydtEL+9zs/0UR4
 R1CM7NPMkUYFff41qHMGFOwPFmi7eyX+Q7JzFAYEoJoJweAyu7eJOKTWX
 s+Up2hgMwVAaDkQXENaxInwqsf3gPxLBAl0ObcoVaGBah2wpI2nu8Wy/A
 nR7R47QK1pRBlDFxLBAGanN2/Y9NmWHX2XJknGZjfIKspQrn7cAR7Q/pn
 deUPrKnrBc68g+SnPd+lZS7Rz2xuN6A+C2ZbwC0lgk2ombAFBpgqD+G1U w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="312457997"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="312457997"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:16:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="779914774"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="779914774"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.213.187.252])
 ([10.213.187.252])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:16:03 -0800
Message-ID: <d3e07dbe-500f-303c-b348-4ca18934ed5c@intel.com>
Date: Fri, 17 Feb 2023 14:16:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/8] hw/pci/aer: Add missing routing for AER errors
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
 <20230217172924.25239-3-Jonathan.Cameron@huawei.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230217172924.25239-3-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=dave.jiang@intel.com;
 helo=mga17.intel.com
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
> PCIe r6.0 Figure 6-3 "Pseudo Logic Diagram for Selected Error Message Control
> and Status Bits" includes a right hand branch under "All PCI Express devices"
> that allows for messages to be generated or sent onwards without SERR#
> being set as long as the appropriate per error class bit in the PCIe
> Device Control Register is set.
> 
> Implement that branch thus enabling routing of ERR_COR, ERR_NONFATAL
> and ERR_FATAL under OSes that set these bits appropriately (e.g. Linux)
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   hw/pci/pcie_aer.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 909e027d99..103667c368 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -192,8 +192,16 @@ static void pcie_aer_update_uncor_status(PCIDevice *dev)
>   static bool
>   pcie_aer_msg_alldev(PCIDevice *dev, const PCIEAERMsg *msg)
>   {
> +    uint16_t devctl = pci_get_word(dev->config + dev->exp.exp_cap +
> +                                   PCI_EXP_DEVCTL);
>       if (!(pcie_aer_msg_is_uncor(msg) &&
> -          (pci_get_word(dev->config + PCI_COMMAND) & PCI_COMMAND_SERR))) {
> +          (pci_get_word(dev->config + PCI_COMMAND) & PCI_COMMAND_SERR)) &&
> +        !((msg->severity == PCI_ERR_ROOT_CMD_NONFATAL_EN) &&
> +          (devctl & PCI_EXP_DEVCTL_NFERE)) &&
> +        !((msg->severity == PCI_ERR_ROOT_CMD_COR_EN) &&
> +          (devctl & PCI_EXP_DEVCTL_CERE)) &&
> +        !((msg->severity == PCI_ERR_ROOT_CMD_FATAL_EN) &&
> +          (devctl & PCI_EXP_DEVCTL_FERE))) {
>           return false;
>       }
>   

