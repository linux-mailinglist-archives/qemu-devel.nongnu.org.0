Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D104D6C82DB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfkrI-0002nq-VS; Fri, 24 Mar 2023 13:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pfkrG-0002ly-6h
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:05:42 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pfkrB-0008Sf-QC
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679677537; x=1711213537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8AFG7JhvkdVT4uFApogk+R72HBRNldkiNduLZ86tu3w=;
 b=KRJzhe19qrAs+rH7YlSjb9ETr8bGSLpPTohHsqaAzf5A+nMfqZgJ0iqV
 bZA0Zy1b7yzQRFP82pkga+vqFxBl/ef6JRnHnHXe4QrPymNKNdh8lR1vo
 MOBksyg12pk9x80A4B/HhTsDGtUCPSC3SMjY6Nd+APhIQHKh9EdGrcaNP
 FTUjOeT/q463vret48qc8luzaGKnUdsp22sYlxTS151xqfaOyi9+WQljx
 fjpaI2OIGXmyLoDNIaUhFw6DmFI67mf1KIyeTRwLvjDFQ5lEZL6bl2WQe
 Zqpdvsqpaf/MiVasqKvU82EJq5GYtryqYEKFc2w6jLYB9qRRac8EVMhTh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323709696"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="323709696"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 10:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="793518667"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="793518667"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.212.52.172])
 ([10.212.52.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 10:05:21 -0700
Message-ID: <33825419-59bf-f6f8-6444-de24a90c2fa6@intel.com>
Date: Fri, 24 Mar 2023 10:05:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH 2/2] hw/cxl: Fix incorrect reset of commit and
 associated clearing of committed.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
Cc: linuxarm@huawei.com, Fan Ni <fan.ni@samsung.com>, linux-cxl@vger.kernel.org
References: <20230322102731.4219-1-Jonathan.Cameron@huawei.com>
 <20230322103300.4278-1-Jonathan.Cameron@huawei.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230322103300.4278-1-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dave.jiang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 3/22/23 3:33 AM, Jonathan Cameron wrote:
> The hardware clearing the commit bit is not spec compliant.
> Clearing of committed bit when commit is cleared is not specifically
> stated in the CXL spec, but is the expected (and simplest) permitted
> behaviour so use that for QEMU emulation.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   hw/cxl/cxl-component-utils.c |  6 +++++-
>   hw/mem/cxl_type3.c           | 21 ++++++++++++++++++++-
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> index a3e6cf75cf..378f1082ce 100644
> --- a/hw/cxl/cxl-component-utils.c
> +++ b/hw/cxl/cxl-component-utils.c
> @@ -38,19 +38,23 @@ static void dumb_hdm_handler(CXLComponentState *cxl_cstate, hwaddr offset,
>       ComponentRegisters *cregs = &cxl_cstate->crb;
>       uint32_t *cache_mem = cregs->cache_mem_registers;
>       bool should_commit = false;
> +    bool should_uncommit = false;
>   
>       switch (offset) {
>       case A_CXL_HDM_DECODER0_CTRL:
>           should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
> +        should_uncommit = !should_commit;
>           break;
>       default:
>           break;
>       }
>   
>       if (should_commit) {
> -        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
>           value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, ERR, 0);
>           value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> +    } else if (should_uncommit) {
> +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, ERR, 0);
> +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMITTED, 0);
>       }
>       stl_le_p((uint8_t *)cache_mem + offset, value);
>   }
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 846089ccda..9598d584ac 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -320,13 +320,28 @@ static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
>   
>       ctrl = ldl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL);
>       /* TODO: Sanity checks that the decoder is possible */
> -    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
>       ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, ERR, 0);
>       ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
>   
>       stl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL, ctrl);
>   }
>   
> +static void hdm_decoder_uncommit(CXLType3Dev *ct3d, int which)
> +{
> +    ComponentRegisters *cregs = &ct3d->cxl_cstate.crb;
> +    uint32_t *cache_mem = cregs->cache_mem_registers;
> +    uint32_t ctrl;
> +
> +    assert(which == 0);
> +
> +    ctrl = ldl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL);
> +
> +    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, ERR, 0);
> +    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED, 0);
> +
> +    stl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL, ctrl);
> +}
> +
>   static int ct3d_qmp_uncor_err_to_cxl(CxlUncorErrorType qmp_err)
>   {
>       switch (qmp_err) {
> @@ -395,6 +410,7 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
>       CXLType3Dev *ct3d = container_of(cxl_cstate, CXLType3Dev, cxl_cstate);
>       uint32_t *cache_mem = cregs->cache_mem_registers;
>       bool should_commit = false;
> +    bool should_uncommit = false;
>       int which_hdm = -1;
>   
>       assert(size == 4);
> @@ -403,6 +419,7 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
>       switch (offset) {
>       case A_CXL_HDM_DECODER0_CTRL:
>           should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
> +        should_uncommit = !should_commit;
>           which_hdm = 0;
>           break;
>       case A_CXL_RAS_UNC_ERR_STATUS:
> @@ -489,6 +506,8 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
>       stl_le_p((uint8_t *)cache_mem + offset, value);
>       if (should_commit) {
>           hdm_decoder_commit(ct3d, which_hdm);
> +    } else if (should_uncommit) {
> +        hdm_decoder_uncommit(ct3d, which_hdm);
>       }
>   }
>   

