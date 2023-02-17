Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEF169B52E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 23:01:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT8lZ-0004aX-Cu; Fri, 17 Feb 2023 16:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8lT-0004a4-HS
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:59:35 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pT8lR-0000TC-Nl
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676671173; x=1708207173;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9rFXKQKYXkDjn2mTILG5+hmWGqUGN2tqB//SQOvTZtQ=;
 b=n7aleiwAT42nCTEAjL2AClDBnrP2Y6mmUKJTLyAigtZTj70o+AgkYvlN
 HSnd0fDm4EtJpcD05Py9O9uM8QCX7Bk7CBPdYeJv4104qPkqxfJoG5jTK
 Hd/claAyXWwpQzb9KsFr+gPLrGtwibvkZRNV9ns8O6EHia0b0EcV/yxVT
 8XNddPq40a9/Ls1cP2PSKMxK+HxBL0Pi6yon51qA70mQ41MTSyvd3F9ky
 ZqrCxhKPjaG5H5r/8XO8PYWEqZIcjDkdc4yIiNtZCl4qpLS2oXYjU4+6J
 DHLJqjVGHXMTbPoBJq9cOK0gNBdgrBV8SWPxKFUAtMN7Tapr6L2Pfjwh2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="311727212"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="311727212"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:59:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="648208386"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="648208386"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.213.187.252])
 ([10.213.187.252])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 13:59:30 -0800
Message-ID: <67625ea3-7e5a-d9c1-82db-57227827b96f@intel.com>
Date: Fri, 17 Feb 2023 14:59:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v4 6/8] hw/cxl: Fix endian issues in CXL RAS capability
 defaults / masks
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
 <20230217172924.25239-7-Jonathan.Cameron@huawei.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230217172924.25239-7-Jonathan.Cameron@huawei.com>
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
> As these are about to be modified, fix the endian handle for
> this set of registers rather than making it worse.
> 
> Note that CXL is currently only supported in QEMU on
> x86 (arm64 patches out of tree) so we aren't going to yet hit
> an problems with big endian. However it is good to avoid making
> things worse for that support in the future.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   hw/cxl/cxl-component-utils.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> index 3edd303a33..737b4764b9 100644
> --- a/hw/cxl/cxl-component-utils.c
> +++ b/hw/cxl/cxl-component-utils.c
> @@ -141,17 +141,17 @@ static void ras_init_common(uint32_t *reg_state, uint32_t *write_msk)
>        * Error status is RW1C but given bits are not yet set, it can
>        * be handled as RO.
>        */
> -    reg_state[R_CXL_RAS_UNC_ERR_STATUS] = 0;
> +    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_STATUS, 0);
>       /* Bits 12-13 and 17-31 reserved in CXL 2.0 */
> -    reg_state[R_CXL_RAS_UNC_ERR_MASK] = 0x1cfff;
> -    write_msk[R_CXL_RAS_UNC_ERR_MASK] = 0x1cfff;
> -    reg_state[R_CXL_RAS_UNC_ERR_SEVERITY] = 0x1cfff;
> -    write_msk[R_CXL_RAS_UNC_ERR_SEVERITY] = 0x1cfff;
> -    reg_state[R_CXL_RAS_COR_ERR_STATUS] = 0;
> -    reg_state[R_CXL_RAS_COR_ERR_MASK] = 0x7f;
> -    write_msk[R_CXL_RAS_COR_ERR_MASK] = 0x7f;
> +    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_MASK, 0x1cfff);
> +    stl_le_p(write_msk + R_CXL_RAS_UNC_ERR_MASK, 0x1cfff);
> +    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_SEVERITY, 0x1cfff);
> +    stl_le_p(write_msk + R_CXL_RAS_UNC_ERR_SEVERITY, 0x1cfff);
> +    stl_le_p(reg_state + R_CXL_RAS_COR_ERR_STATUS, 0);
> +    stl_le_p(reg_state + R_CXL_RAS_COR_ERR_MASK, 0x7f);
> +    stl_le_p(write_msk + R_CXL_RAS_COR_ERR_MASK, 0x7f);
>       /* CXL switches and devices must set */
> -    reg_state[R_CXL_RAS_ERR_CAP_CTRL] = 0x00;
> +    stl_le_p(reg_state + R_CXL_RAS_ERR_CAP_CTRL, 0x00);
>   }
>   
>   static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk,

