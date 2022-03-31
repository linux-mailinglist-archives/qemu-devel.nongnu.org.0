Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF734ED136
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 03:12:19 +0200 (CEST)
Received: from localhost ([::1]:52736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZjMI-00058O-72
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 21:12:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nZjJR-0003qC-5Z
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:09:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36120 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nZjJP-0006QL-4T
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:09:20 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKsw6_0RiEI8TAA--.21955S3; 
 Thu, 31 Mar 2022 09:09:14 +0800 (CST)
Subject: Re: [RFC PATCH v7 09/29] target/loongarch: Add TLB instruction support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-10-yangxiaojuan@loongson.cn>
 <e9cc6dd0-25a1-2031-aa95-3fa621dd8d8c@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <6e964e20-272a-cde3-162c-d8b736d85d60@loongson.cn>
Date: Thu, 31 Mar 2022 09:09:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e9cc6dd0-25a1-2031-aa95-3fa621dd8d8c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxKsw6_0RiEI8TAA--.21955S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW5Jw1xtr43Cr4fGr4fAFb_yoW8Ww43pF
 1kJrWUWFW8Xwn5X3WDGr18JFy5Ar10va4DGw1rZFs8tr47Zr4q9r1rWrn0gF15ur48Xr1Y
 yF4UZa9rZ3W7GFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
 DU0xZFpf9x0JUdEfOUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/3/29 上午4:12, Richard Henderson wrote:
> On 3/28/22 06:57, Xiaojuan Yang wrote:
>> +static void output_empty(DisasContext *ctx, arg_empty *a,
>> +                         const char *mnemonic)
>> +{
>> +}
>
> No, you must still do
>
>     output(ctx, mnemonic, "");
>
>> +static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
>> +{
>> +    if (check_plv(ctx)) {
>> +        return false;
>> +    }
>> +    gen_helper_tlbwr(cpu_env);
>> +
>> +    if (ctx->mem_idx != MMU_DA_IDX) {
>> +        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
>> +        ctx->base.is_jmp = DISAS_EXIT;
>> +    }
>
> You may want to create a helper function for this condition.
>
in translate.c, like this:
static void gen_disas_exit(DisasContext *ctx)
{
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
     ctx->base.is_jmp = DISAS_EXIT;
}
>> +static bool trans_tlbclr(DisasContext *ctx, arg_tlbclr *a)
>> +{
>> +    if (check_plv(ctx)) {
>> +        return false;
>> +    }
>> +    gen_helper_tlbclr(cpu_env);
>> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
>> +    ctx->base.is_jmp = DISAS_EXIT;
>
> Missing it here...
>
gen_disas_exit()
>> +static bool trans_tlbflush(DisasContext *ctx, arg_tlbflush *a)
>> +{
>> +    if (check_plv(ctx)) {
>> +        return false;
>> +    }
>> +    gen_helper_tlbflush(cpu_env);
>> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
>> +    ctx->base.is_jmp = DISAS_EXIT;
>> +    return true;
>> +}
>
> ... and here.
>
The same.

Thanks.
Xiaojuan
>
> r~


