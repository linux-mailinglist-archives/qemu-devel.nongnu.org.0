Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3514F1183
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 10:59:35 +0200 (CEST)
Received: from localhost ([::1]:43666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbIYf-0000PU-V0
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 04:59:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbIO2-00067O-8x
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:48:34 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:57912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbIO0-0001oT-MR
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:48:33 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 2E0E320779;
 Mon,  4 Apr 2022 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1649062110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osLUOYMJQqFndNiHZGDd1yh1/jj/xqD0lESp79Hmyh8=;
 b=LeBK++awm9UJmrIf1F5wan6iHuxNtU2zx/nVZ5oeEmA3D99LzOqCOCqT1ptiRVmfi4RvQp
 k6/vPppFQU8M9iYJp02FEZQURVxHC0D0EQfXlqeyCHXzCfrSKAlIMK2rdmWu44iPLgl9KI
 RDPeQIQAVD5F2XCd9CLHrE4w1FPAE+4=
Message-ID: <8b31b47f-487c-b035-a71c-43de3115eac8@greensocs.com>
Date: Mon, 4 Apr 2022 10:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] plugins: Assert mmu_idx in range before use in
 qemu_plugin_get_hwaddr
Content-Language: en-US-large
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220401190233.329360-1-richard.henderson@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220401190233.329360-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

On 4/1/22 21:02, Richard Henderson wrote:
> Coverity reports out-of-bound accesses here.  This should be a
> false positive due to how the index is decoded from MemOpIdx.
> 
> Fixes: Coverity CID 1487201
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   plugins/api.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/plugins/api.c b/plugins/api.c
> index 7bf71b189d..2078b16edb 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -289,6 +289,8 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
>       enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
>       hwaddr_info.is_store = (rw & QEMU_PLUGIN_MEM_W) != 0;
>   
> +    assert(mmu_idx < NB_MMU_MODES);
> +
>       if (!tlb_plugin_lookup(cpu, vaddr, mmu_idx,
>                              hwaddr_info.is_store, &hwaddr_info)) {
>           error_report("invalid use of qemu_plugin_get_hwaddr");

