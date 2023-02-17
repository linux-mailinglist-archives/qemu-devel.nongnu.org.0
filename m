Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE8169B4D1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 22:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT8Iw-0003mC-1g; Fri, 17 Feb 2023 16:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8It-0003lh-Lw
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:30:03 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8Ir-0007G2-2s
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676669401; x=1708205401;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xHswHqKsHvpDssmXoYZ/qU2+aUXdOwTD3nhWJSFdRt0=;
 b=QwMfXHNbFPtbuE+aZTK/TwXfzY0GVirTo1VijL2wIfWsFhyIclQlHhf+
 NJ7t5dtkCXmAeFLZ8Oir3gx8BVv2RNv1r2KkBPr4Qy8i0UOMe2vdmpFpL
 8YeRLUrlDzgdTQqcSeRxSZpMJLyQd451FXmBvytq4MAIZjtK4YyMTr6I+
 KRf4ERb+3tFwsJjJch8cYMQR4182nkGTES1PW146dxznggal3HKsXGeaC
 1UnkwnH3/QqF3zSjhAHmP7+0k8VD3uBkL508nORlVDIyrLASU8N4MFzTV
 G68Uy5XzPIrMKW9CrdNkBQjNiJs/YOGiHQp+kZxF/2zc+G6Sxj0IYwlVQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="396774029"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="396774029"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:29:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="739387068"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="739387068"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.213.187.252])
 ([10.213.187.252])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:29:49 -0800
Message-ID: <d71d5cab-1b12-c047-fc6e-ecf928863557@intel.com>
Date: Fri, 17 Feb 2023 14:29:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v4 3/8] hw/pci-bridge/cxl_root_port: Wire up AER
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
 <20230217172924.25239-4-Jonathan.Cameron@huawei.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230217172924.25239-4-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=dave.jiang@intel.com; helo=mga07.intel.com
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
> We are missing necessary config write handling for AER emulation in
> the CXL root port. Add it based on pcie_root_port.c
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   hw/pci-bridge/cxl_root_port.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
> index 6664783974..00195257f7 100644
> --- a/hw/pci-bridge/cxl_root_port.c
> +++ b/hw/pci-bridge/cxl_root_port.c
> @@ -187,12 +187,15 @@ static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t val,
>                                   int len)
>   {
>       uint16_t slt_ctl, slt_sta;
> +    uint32_t root_cmd =
> +        pci_get_long(d->config + d->exp.aer_cap + PCI_ERR_ROOT_COMMAND);
>   
>       pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
>       pci_bridge_write_config(d, address, val, len);
>       pcie_cap_flr_write_config(d, address, val, len);
>       pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
>       pcie_aer_write_config(d, address, val, len);
> +    pcie_aer_root_write_config(d, address, val, len, root_cmd);
>   
>       cxl_rp_dvsec_write_config(d, address, val, len);
>   }

