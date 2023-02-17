Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A1069B52C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 23:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT8mQ-0005C0-II; Fri, 17 Feb 2023 17:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8mF-0005AK-VP
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 17:00:24 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8mE-0000ib-17
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 17:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676671222; x=1708207222;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tIYZ6a+3sbvHSRoqLIcYH/edSnZLE6ChkR5avYfvaGo=;
 b=OncOZABUYZbvvSjKau5hZ2Yq8AEbrXdJSSe4QgGnnEhOPMBsXQ33TZZ7
 nhQ5aaqB0nptCp8WRSax5TeS3HcfqRoc1A31kP1GMR8uFu28GdxS7RqNi
 ctghLdO6wPS/lGEVLieAZisf8d9qpfXFokOsQXlXT+SxfJRXH0Y4S7FrY
 O/QWMJNYIDgwb8+g9i5vmeKARWAgm/GyqJGdA6x5JxntXfT2Kh7jyYWp2
 rusc892+J8+aQVSrB1lCFECZu0OW0Q+1xCvTdtu9TCGAH5tRGjDiKE+Y3
 p22f3/9lNNMwBr/KlCe3vLHyQy25GF4gQLo4HEsBshvrLHEnuU3mwGXRP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="311727438"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="311727438"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 14:00:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="648208855"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="648208855"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.213.187.252])
 ([10.213.187.252])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 14:00:18 -0800
Message-ID: <ff7b2293-5a86-297e-6483-53e1970b6029@intel.com>
Date: Fri, 17 Feb 2023 15:00:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v4 7/8] hw/pci/aer: Make PCIE AER error injection facility
 available for other emulation to use.
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
 <20230217172924.25239-8-Jonathan.Cameron@huawei.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230217172924.25239-8-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=dave.jiang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
> This infrastructure will be reused for CXL RAS error injection
> in patches that follow.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   hw/pci/pci-internal.h     | 1 -
>   include/hw/pci/pcie_aer.h | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci-internal.h b/hw/pci/pci-internal.h
> index 2ea356bdf5..a7d6d8a732 100644
> --- a/hw/pci/pci-internal.h
> +++ b/hw/pci/pci-internal.h
> @@ -20,6 +20,5 @@ void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent);
>   
>   int pcie_aer_parse_error_string(const char *error_name,
>                                   uint32_t *status, bool *correctable);
> -int pcie_aer_inject_error(PCIDevice *dev, const PCIEAERErr *err);
>   
>   #endif
> diff --git a/include/hw/pci/pcie_aer.h b/include/hw/pci/pcie_aer.h
> index 65e71d98fe..1234fdc4e2 100644
> --- a/include/hw/pci/pcie_aer.h
> +++ b/include/hw/pci/pcie_aer.h
> @@ -100,4 +100,5 @@ void pcie_aer_root_write_config(PCIDevice *dev,
>                                   uint32_t addr, uint32_t val, int len,
>                                   uint32_t root_cmd_prev);
>   
> +int pcie_aer_inject_error(PCIDevice *dev, const PCIEAERErr *err);
>   #endif /* QEMU_PCIE_AER_H */

