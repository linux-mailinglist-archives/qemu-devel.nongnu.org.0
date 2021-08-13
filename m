Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B219A3EB27B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 10:19:07 +0200 (CEST)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mESPC-0000hO-8q
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 04:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mESOS-0008T8-T2
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 04:18:20 -0400
Received: from mga06.intel.com ([134.134.136.31]:17601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mESOQ-0004JD-F4
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 04:18:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="276555729"
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="276555729"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 01:18:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="485859871"
Received: from jingqili-mobl.ccr.corp.intel.com (HELO [10.254.208.91])
 ([10.254.208.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 01:18:11 -0700
Subject: Re: [PATCH] softmmu/physmem.c: Remove unneeded NULL check in
 qemu_ram_alloc_from_fd()
To: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210812150624.29139-1-peter.maydell@linaro.org>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
Message-ID: <da611a4f-1349-9d67-6964-c196078a9ec4@intel.com>
Date: Fri, 13 Aug 2021 16:18:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812150624.29139-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=jingqi.liu@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 8/12/2021 11:06 PM, Peter Maydell wrote:
> In the alignment check added to qemu_ram_alloc_from_fd() in commit
> ce317be98db0dfdfa, the condition includes a check that 'mr' is not
> NULL.  This check is unnecessary because we can assume that the
> caller always passes us a valid MemoryRegion, and indeed later in the
> function we assume mr is not NULL when we pass it to file_ram_alloc()
> as new_block->mr.  Remove it.
> 
> Fixes: Coverity 1459867
> Fixes: ce317be98d ("exec: fetch the alignment of Linux devdax pmem character device nodes")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   softmmu/physmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 3c1912a1a07..c47cb6da2e4 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2075,7 +2075,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>       }
>   
>       file_align = get_file_align(fd);
> -    if (file_align > 0 && mr && file_align > mr->align) {
> +    if (file_align > 0 && file_align > mr->align) {
>           error_setg(errp, "backing store align 0x%" PRIx64
>                      " is larger than 'align' option 0x%" PRIx64,
>                      file_align, mr->align);
> 
'mr' is indeed not NULL in the current code.

Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>

Thanks,
Jingqi

