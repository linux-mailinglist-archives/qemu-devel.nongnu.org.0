Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0215868A9B7
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 13:01:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOHDE-0000hk-3r; Sat, 04 Feb 2023 07:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1pOHDB-0000hX-5G
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 07:00:05 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1pOHD7-0007oj-GP
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 07:00:04 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P89yK4GkczJs82;
 Sat,  4 Feb 2023 19:58:01 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 4 Feb 2023 19:59:39 +0800
Subject: Re: [PATCH] tcg/aarch64: Fix patching of LDR in
 tb_target_set_jmp_target
To: Richard Henderson <richard.henderson@linaro.org>
References: <20230203171858.3279252-1-richard.henderson@linaro.org>
CC: <qemu-devel@nongnu.org>
Message-ID: <95c264dc-360b-adf9-d507-9528cdda01b8@huawei.com>
Date: Sat, 4 Feb 2023 19:59:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20230203171858.3279252-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=yuzenghui@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/2/4 1:18, Richard Henderson wrote:
> 'offset' should be bits [23:5] of LDR instruction, rather than [4:0].
> 
> Fixes: d59d83a1c388 ("tcg/aarch64: Reorg goto_tb implementation")
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index fde3b30ad1..a091326f84 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1914,7 +1914,7 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
>          ptrdiff_t i_offset = i_addr - jmp_rx;
>  
>          /* Note that we asserted this in range in tcg_out_goto_tb. */
> -        insn = deposit32(I3305_LDR | TCG_REG_TMP, 0, 5, i_offset >> 2);
> +        insn = deposit32(I3305_LDR | TCG_REG_TMP, 5, 19, i_offset >> 2);
>      }
>      qatomic_set((uint32_t *)jmp_rw, insn);
>      flush_idcache_range(jmp_rx, jmp_rw, 4);

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks!

