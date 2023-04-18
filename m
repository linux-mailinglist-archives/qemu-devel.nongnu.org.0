Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F326E6393
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 14:41:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pokdn-0001KB-8j; Tue, 18 Apr 2023 08:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pokdj-0001Ia-0m
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 08:40:55 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pokdg-0006cx-5R
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 08:40:54 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8CxidnMjz5kxHEeAA--.35952S3;
 Tue, 18 Apr 2023 20:40:44 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPL7Ljz5kef0sAA--.54968S3; 
 Tue, 18 Apr 2023 20:40:43 +0800 (CST)
Subject: Re: [PATCH] target/loongarch: Add CSR_CPUID reg in cpu_env
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, f4bug@amsat.org,
 philmd@linaro.org
References: <20230418122045.2808212-1-zhaotianrui@loongson.cn>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <4656ba70-7ad0-a01f-2bd9-e4623ee5355e@loongson.cn>
Date: Tue, 18 Apr 2023 20:40:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230418122045.2808212-1-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8CxPL7Ljz5kef0sAA--.54968S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7AFWfJFW3tw15ZF1xAFWxtFb_yoW8KF4kpr
 42krWvyw45tFZ7A3WfAas8Ww1DXw13Kw4Iva1SkryvvF43Wr1vgFW0vwnI9F9rAa45ArW0
 vF1rAr15JF4xZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.597,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,  Tianrui

在 2023/4/18 下午8:20, Tianrui Zhao 写道:
> Add CSR_CPUID register in cpu_env to save the cpu_index
> value.
Why do we need to do this?

For tcg mode, it is enough to use cpu_index. You need to explain the reason.

Thank.
Song Gao
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   target/loongarch/cpu.c                             | 1 +
>   target/loongarch/cpu.h                             | 1 +
>   target/loongarch/insn_trans/trans_privileged.c.inc | 8 +-------
>   3 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 97e6579f6a..bee5949ed2 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -486,6 +486,7 @@ static void loongarch_cpu_reset_hold(Object *obj)
>   
>       env->CSR_ESTAT = env->CSR_ESTAT & (~MAKE_64BIT_MASK(0, 2));
>       env->CSR_RVACFG = FIELD_DP64(env->CSR_RVACFG, CSR_RVACFG, RBITS, 0);
> +    env->CSR_CPUID = cs->cpu_index;
>       env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
>       env->CSR_LLBCTL = FIELD_DP64(env->CSR_LLBCTL, CSR_LLBCTL, KLO, 0);
>       env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR, 0);
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index e11c875188..1d9a4009b9 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -288,6 +288,7 @@ typedef struct CPUArchState {
>       uint64_t CSR_PWCH;
>       uint64_t CSR_STLBPS;
>       uint64_t CSR_RVACFG;
> +    uint64_t CSR_CPUID;
>       uint64_t CSR_PRCFG1;
>       uint64_t CSR_PRCFG2;
>       uint64_t CSR_PRCFG3;
> diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
> index 5a04352b01..d1d98c6e9e 100644
> --- a/target/loongarch/insn_trans/trans_privileged.c.inc
> +++ b/target/loongarch/insn_trans/trans_privileged.c.inc
> @@ -99,13 +99,7 @@ static const CSRInfo csr_info[] = {
>       CSR_OFF(PWCH),
>       CSR_OFF(STLBPS),
>       CSR_OFF(RVACFG),
> -    [LOONGARCH_CSR_CPUID] = {
> -        .offset = (int)offsetof(CPUState, cpu_index)
> -                  - (int)offsetof(LoongArchCPU, env),
> -        .flags = CSRFL_READONLY,
> -        .readfn = NULL,
> -        .writefn = NULL
> -    },
> +    CSR_OFF_FLAGS(CPUID, CSRFL_READONLY),
>       CSR_OFF_FLAGS(PRCFG1, CSRFL_READONLY),
>       CSR_OFF_FLAGS(PRCFG2, CSRFL_READONLY),
>       CSR_OFF_FLAGS(PRCFG3, CSRFL_READONLY),


