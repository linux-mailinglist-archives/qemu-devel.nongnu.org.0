Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D7C689124
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 08:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNqjA-0001Cv-HW; Fri, 03 Feb 2023 02:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pNqj3-0001Cg-M5
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:43:15 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pNqj1-0002zz-EQ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:43:13 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxqOkBu9xjGUcNAA--.22617S3;
 Fri, 03 Feb 2023 15:42:57 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxWL3+utxj8XQoAA--.13185S3; 
 Fri, 03 Feb 2023 15:42:56 +0800 (CST)
Subject: Re: [PATCH 1/1] target/loongarch: LL.{W/D} need writes val to dest
 register after sign extension
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: maobibo@loongson.cn, qiaochong@loongson.cn, yangxiaojuan@loongson.cn
References: <20230202031655.953888-1-gaosong@loongson.cn>
 <03562708-93fd-7338-e842-8ac3bf32b518@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <48330915-d99f-9fef-295a-dd0f827be8b2@loongson.cn>
Date: Fri, 3 Feb 2023 15:42:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <03562708-93fd-7338-e842-8ac3bf32b518@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8CxWL3+utxj8XQoAA--.13185S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZF45CF45tFy8AF1DWFyrCrg_yoW8WF18pr
 1vkF18KrWYq34kAw4xGws0gryUXw48Kw17JFnIyas8G3yDJrn0qF40qr9IgFyUAw4rWryY
 vFW5ZryDuFW5X37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/2/2 下午1:51, Richard Henderson 写道:
> On 2/1/23 17:16, Song Gao wrote:
>> The Manual 2.2.7.2:
>>      'The LL.{W/D} instruction retrieves a word/double-word data from
>>      the specified address of the memory and writes it to the general
>>      register rd after sign extension.'
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/insn_trans/trans_atomic.c.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> The sign-extension is provided by
>
> TRANS(ll_w, gen_ll, MO_TESL)
>                     ^^^^^^^
> this.
>
> So what's the issue?
>
Sorry for the late reply.
It's our other code problem,  you can ignore this patch :-)

Thanks
Song Gao
> r~
>
>>
>> diff --git a/target/loongarch/insn_trans/trans_atomic.c.inc 
>> b/target/loongarch/insn_trans/trans_atomic.c.inc
>> index 6763c1c301..24fea558d6 100644
>> --- a/target/loongarch/insn_trans/trans_atomic.c.inc
>> +++ b/target/loongarch/insn_trans/trans_atomic.c.inc
>> @@ -12,8 +12,8 @@ static bool gen_ll(DisasContext *ctx, arg_rr_i *a, 
>> MemOp mop)
>>       tcg_gen_addi_tl(t0, src1, a->imm);
>>       tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, mop);
>>       tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
>> +    gen_set_gpr(a->rd, dest, EXT_SIGN);
>>       tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
>> -    gen_set_gpr(a->rd, dest, EXT_NONE);
>>       tcg_temp_free(t0);
>>         return true;


