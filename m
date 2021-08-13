Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB373EB162
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 09:27:03 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mERao-0003wv-Hq
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 03:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mERYx-0002l1-KK
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 03:25:07 -0400
Received: from mga12.intel.com ([192.55.52.136]:63572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mERYv-0008Gk-C8
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 03:25:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="195104792"
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="195104792"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 00:24:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="485845522"
Received: from jingqili-mobl.ccr.corp.intel.com (HELO [10.254.208.91])
 ([10.254.208.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 00:24:56 -0700
Subject: Re: [PATCH] softmmu/physmem.c: Check return value from realpath()
To: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210812151525.31456-1-peter.maydell@linaro.org>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
Message-ID: <eda990c4-3ae4-63bc-665d-ceb0292ab772@intel.com>
Date: Fri, 13 Aug 2021 15:24:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812151525.31456-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=jingqi.liu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 8/12/2021 11:15 PM, Peter Maydell wrote:
> The realpath() function can return NULL on error, so we need to check
> for it to avoid crashing when we try to strstr() into it.
> This can happen if we run out of memory, or if /sys/ is not mounted,
> among other situations.
> 
> Fixes: Coverity 1459913, 1460474
> Fixes: ce317be98db0 ("exec: fetch the alignment of Linux devdax pmem character device nodes")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   softmmu/physmem.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index c47cb6da2e4..eb0595d57c4 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1451,6 +1451,9 @@ static int64_t get_file_align(int fd)
>           path = g_strdup_printf("/sys/dev/char/%d:%d",
>                       major(st.st_rdev), minor(st.st_rdev));
>           rpath = realpath(path, NULL);
> +        if (!rpath) {
> +            return -errno;
> +        }

Good find!

Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>

Thanks,
Jingqi

