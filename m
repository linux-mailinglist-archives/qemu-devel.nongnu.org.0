Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB56A79A0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 03:45:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXYw2-0007q5-Nh; Wed, 01 Mar 2023 21:44:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYw0-0007ok-Ni; Wed, 01 Mar 2023 21:44:44 -0500
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYvy-0008Sz-PX; Wed, 01 Mar 2023 21:44:44 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VcvGseC_1677725076; 
Received: from 30.221.97.107(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VcvGseC_1677725076) by smtp.aliyun-inc.com;
 Thu, 02 Mar 2023 10:44:37 +0800
Message-ID: <ec0ca786-1389-386f-90c6-62cdebb7b439@linux.alibaba.com>
Date: Thu, 2 Mar 2023 10:44:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 15/18] target/riscv: Allow debugger to access
 {h,s}stateen CSRs
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
References: <20230228104035.1879882-13-bmeng@tinylab.org>
 <20230228104035.1879882-16-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230228104035.1879882-16-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/2/28 21:45, Bin Meng wrote:
> From: Bin Meng <bmeng@tinylab.org>
>
> At present {h,s}stateen CSRs are not reported in the CSR XML
> hence gdb cannot access them.
>
> Fix it by adjusting their predicate() routine logic so that the
> static config check comes before the run-time check, as well as
> adding a debugger check.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
>
> (no changes since v1)
>
>   target/riscv/csr.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 15b23b9b5a..a0e70f5ba0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -337,13 +337,22 @@ static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    RISCVException ret = hmode(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    if (env->debugger) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
>       if (env->priv < PRV_M) {
>           if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEEN)) {
>               return RISCV_EXCP_ILLEGAL_INST;
>           }
>       }
>   
> -    return hmode(env, csrno);
> +    return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException hstateen(CPURISCVState *env, int csrno)
> @@ -366,6 +375,15 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    RISCVException ret = smode(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    if (env->debugger) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
>       if (env->priv < PRV_M) {
>           if (!(env->mstateen[index] & SMSTATEEN_STATEEN)) {
>               return RISCV_EXCP_ILLEGAL_INST;
> @@ -378,7 +396,7 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
>           }
>       }
>   
> -    return smode(env, csrno);
> +    return RISCV_EXCP_NONE;

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   }
>   
>   /* Checks if PointerMasking registers could be accessed */

