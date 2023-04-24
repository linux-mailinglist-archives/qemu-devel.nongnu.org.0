Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61666E5A34
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 09:15:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pofYU-0005O4-0A; Tue, 18 Apr 2023 03:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pofYR-0005Nq-KW; Tue, 18 Apr 2023 03:15:07 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pofYP-0001Qu-Ok; Tue, 18 Apr 2023 03:15:07 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VgOMjvS_1681802096; 
Received: from 30.221.97.146(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VgOMjvS_1681802096) by smtp.aliyun-inc.com;
 Tue, 18 Apr 2023 15:14:57 +0800
Message-ID: <2f4260f9-bbda-08b1-76e3-1847c8a84faf@linux.alibaba.com>
Date: Tue, 18 Apr 2023 15:14:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/6] target/riscv: Flush TLB only when pmpcfg/pmpaddr
 really changes
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-5-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230413090122.65228-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -121
X-Spam_score: -12.2
X-Spam_bar: ------------
X-Spam_report: (-12.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
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


On 2023/4/13 17:01, Weiwei Li wrote:
> TLB needn't be flushed when pmpcfg/pmpaddr don't changes.

If we flush the tlb in pmp_update_rules, we don't need this patch.

Zhiwei

>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/pmp.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 6d4813806b..aced23c4d5 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -26,7 +26,7 @@
>   #include "trace.h"
>   #include "exec/exec-all.h"
>   
> -static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
> +static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
>                             uint8_t val);
>   static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
>   static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index);
> @@ -83,7 +83,7 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
>    * Accessor to set the cfg reg for a specific PMP/HART
>    * Bounds checks and relevant lock bit.
>    */
> -static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
> +static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>   {
>       if (pmp_index < MAX_RISCV_PMPS) {
>           bool locked = true;
> @@ -119,14 +119,17 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>   
>           if (locked) {
>               qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
> -        } else {
> +        } else if (env->pmp_state.pmp[pmp_index].cfg_reg != val) {
>               env->pmp_state.pmp[pmp_index].cfg_reg = val;
>               pmp_update_rule(env, pmp_index);
> +            return true;
>           }
>       } else {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "ignoring pmpcfg write - out of bounds\n");
>       }
> +
> +    return false;
>   }
>   
>   static void pmp_decode_napot(target_ulong a, target_ulong *sa,
> @@ -477,16 +480,19 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>       int i;
>       uint8_t cfg_val;
>       int pmpcfg_nums = 2 << riscv_cpu_mxl(env);
> +    bool modified = false;
>   
>       trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
>   
>       for (i = 0; i < pmpcfg_nums; i++) {
>           cfg_val = (val >> 8 * i)  & 0xff;
> -        pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
> +        modified |= pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
>       }
>   
>       /* If PMP permission of any addr has been changed, flush TLB pages. */
> -    tlb_flush(env_cpu(env));
> +    if (modified) {
> +        tlb_flush(env_cpu(env));
> +    }
>   }
>   
>   
> @@ -535,9 +541,11 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>           }
>   
>           if (!pmp_is_locked(env, addr_index)) {
> -            env->pmp_state.pmp[addr_index].addr_reg = val;
> -            pmp_update_rule(env, addr_index);
> -            tlb_flush(env_cpu(env));
> +            if (env->pmp_state.pmp[addr_index].addr_reg != val) {
> +                env->pmp_state.pmp[addr_index].addr_reg = val;
> +                pmp_update_rule(env, addr_index);
> +                tlb_flush(env_cpu(env));
> +            }
>           } else {
>               qemu_log_mask(LOG_GUEST_ERROR,
>                             "ignoring pmpaddr write - locked\n");

