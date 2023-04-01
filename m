Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3326D2FCF
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 13:05:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piZ1L-00022b-GJ; Sat, 01 Apr 2023 07:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piZ1J-00022T-1V
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 07:03:41 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>) id 1piZ1F-0007fj-QZ
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 07:03:40 -0400
Received: from [192.168.0.119] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAA3Pkp_Dyhkig68GQ--.14816S2;
 Sat, 01 Apr 2023 19:03:29 +0800 (CST)
Message-ID: <55366094-d6bd-c692-bcbb-310f1e239ac8@iscas.ac.cn>
Date: Sat, 1 Apr 2023 19:03:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, alex.bennee@linaro.org
Subject: Re: [PATCH 3/3] accel/tcg: Fix jump cache set in cpu_exec_loop
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
 <20230401045106.3885562-4-richard.henderson@linaro.org>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230401045106.3885562-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAA3Pkp_Dyhkig68GQ--.14816S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cryxuw4kZr1rAFyDWry3Arb_yoW8tr1rpr
 48Ja15KrWIqry7Ca9Ig3srW3WrZ3ZYkF43JwnYkw4fZw1Sg34rA3W0kayfXFZFkrWIvr1I
 vrsI9F95Aa4UJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUU
 UUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


On 2023/4/1 12:51, Richard Henderson wrote:
> Assign pc and use store_release to assign tb.
>
> Fixes: 2dd5b7a1b91 ("accel/tcg: Move jmp-cache `CF_PCREL` checks to caller")
> Reported-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cpu-exec.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index c815f2dbfd..8370c92c05 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -257,7 +257,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
>   
>       if (cflags & CF_PCREL) {
>           /* Use acquire to ensure current load of pc from jc. */
> -        tb =  qatomic_load_acquire(&jc->array[hash].tb);
> +        tb = qatomic_load_acquire(&jc->array[hash].tb);
>   
>           if (likely(tb &&
>                      jc->array[hash].pc == pc &&
> @@ -272,7 +272,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
>               return NULL;
>           }
>           jc->array[hash].pc = pc;
> -        /* Use store_release on tb to ensure pc is written first. */
> +        /* Ensure pc is written first. */
>           qatomic_store_release(&jc->array[hash].tb, tb);
>       } else {
>           /* Use rcu_read to ensure current load of pc from *tb. */
> @@ -971,18 +971,27 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
>   
>               tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>               if (tb == NULL) {
> +                CPUJumpCache *jc;
>                   uint32_t h;
>   
>                   mmap_lock();
>                   tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
>                   mmap_unlock();
> +
Blank line.
>                   /*
>                    * We add the TB in the virtual pc hash table
>                    * for the fast lookup
>                    */
>                   h = tb_jmp_cache_hash_func(pc);
> -                /* Use the pc value already stored in tb->pc. */
> -                qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
> +                jc = cpu->tb_jmp_cache;
> +                if (cflags & CF_PCREL) {
> +                    jc->array[h].pc = pc;
> +                    /* Ensure pc is written first. */
> +                    qatomic_store_release(&jc->array[h].tb, tb);

Whether we should add a qatomic_load_require() before this?

Regards,

Weiwei Li

> +                } else {
> +                    /* Use the pc value already stored in tb->pc. */
> +                    qatomic_set(&jc->array[h].tb, tb);
> +                }
>               }
>   
>   #ifndef CONFIG_USER_ONLY


