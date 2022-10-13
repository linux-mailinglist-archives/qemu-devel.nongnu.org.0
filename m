Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A35FD28F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 03:28:02 +0200 (CEST)
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oin0z-0001JG-W2
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 21:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oimzA-0007Kq-6v
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 21:26:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58482 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oimyu-0003Dq-CO
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 21:26:07 -0400
Received: from [10.90.50.23] (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx32sdaUdjW4wsAA--.22862S3; 
 Thu, 13 Oct 2022 09:25:49 +0800 (CST)
Message-ID: <3378e5b6-bdce-bb7b-d64e-661a909d7075@loongson.cn>
Date: Thu, 13 Oct 2022 09:25:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Qi Hu <huqi@loongson.cn>
Subject: Re: [PATCH 2/2] tcg/loongarch64: Add direct jump support
To: WANG Xuerui <i.qemu@xen0n.name>, WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <cover.1665405913.git.huqi@loongson.cn>
 <cc5770f1a03bf90fa8b990666fb061b1e063b803.1665405913.git.huqi@loongson.cn>
 <d386cad2-02ea-e062-9a9d-86dbbf47b251@xen0n.name>
Content-Language: en-US
In-Reply-To: <d386cad2-02ea-e062-9a9d-86dbbf47b251@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32sdaUdjW4wsAA--.22862S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKFW3WFyxCFWDJw43CrWfZrb_yoW3Cw1Upr
 1kJry5JrW8Jr4kJr47Jr1UJFyUJw15J3WUJF18WF1UJw4UJr1jqr10gr1qgF1UGr48Zr1U
 Zr1qqrnxZF4UAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
 r21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
 xUq_b1DUUUU
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQASCWNGrmAKHAABsm
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 KHOP_HELO_FCRDNS=0.399, NICE_REPLY_A=-0.528, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/10/12 19:34, WANG Xuerui wrote:
> Hi,
>
> Thanks for the improvement! Some room for improvement though...
>
> On 2022/10/12 17:13, Qi Hu wrote:
>> Similar to the ARM64, LoongArch has PC-relative instructions such as
>> PCADDU18I. These instructions can be used to support direct jump for
>> LoongArch. Additionally, if instruction "B offset" can cover the target
>> address, "tb_target_set_jmp_target" will only patch the "B offset".
>
> "if the target is within +/- 28 bits range, a single "B offset" plus a 
> nop will be used instead" might sound better?
Yeah, I will add this at commit message. :)
>
>>
>> Signed-off-by: Qi Hu <huqi@loongson.cn>
>> ---
>>   tcg/loongarch64/tcg-insn-defs.c.inc |  3 ++
>>   tcg/loongarch64/tcg-target.c.inc    | 49 ++++++++++++++++++++++++++---
>>   tcg/loongarch64/tcg-target.h        |  2 +-
>>   3 files changed, 48 insertions(+), 6 deletions(-)
>>
>> diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc 
>> b/tcg/loongarch64/tcg-insn-defs.c.inc
>> index d162571856..f5869c6bb1 100644
>> --- a/tcg/loongarch64/tcg-insn-defs.c.inc
>> +++ b/tcg/loongarch64/tcg-insn-defs.c.inc
>> @@ -112,6 +112,9 @@ typedef enum {
>>       OPC_BLE = 0x64000000,
>>       OPC_BGTU = 0x68000000,
>>       OPC_BLEU = 0x6c000000,
>> +    /* pseudo-instruction */
>> +    NOP = 0x03400000,
>> +
>
> You certainly saw the big fat comment block saying the file was 
> auto-generated and thus shouldn't be touched, didn't you? ;-)
>
> I saw your need for a NOP constant later though, and you can instead 
> add `#define OPC_NOP OPC_ANDI` in tcg-target.c.inc, just below the 
> include of tcg-insn-defs.c.inc.
Oh, I think I can add  "tcg_out_nop" instead of "NOP" here.
>
>>   } LoongArchInsn;
>>     static int32_t __attribute__((unused))
>> diff --git a/tcg/loongarch64/tcg-target.c.inc 
>> b/tcg/loongarch64/tcg-target.c.inc
>> index f5a214a17f..3a7b1df081 100644
>> --- a/tcg/loongarch64/tcg-target.c.inc
>> +++ b/tcg/loongarch64/tcg-target.c.inc
>> @@ -1058,11 +1058,24 @@ static void tcg_out_op(TCGContext *s, 
>> TCGOpcode opc,
>>           break;
>>         case INDEX_op_goto_tb:
>> -        assert(s->tb_jmp_insn_offset == 0);
>> -        /* indirect jump method */
>> -        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
>> -                   (uintptr_t)(s->tb_jmp_target_addr + a0));
>> -        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
>> +        if (s->tb_jmp_insn_offset != NULL) {
>> +            /* TCG_TARGET_HAS_direct_jump */
>> +            /* Ensure that PCADD+JIRL are 8-byte aligned so that an 
>> atomic
>> +               write can be used to patch the target address. */
> There isn't a "PCADD" in LoongArch, and it's possible for the 2 insns 
> to be "B + NOP" as well. So better reword a bit like "Ensure that the 
> 8-byte direct jump fragment is aligned ..." (and add another space 
> after the period at the end of the sentence).
~
>> +            if ((uintptr_t)s->code_ptr & 7) {
>> +                tcg_out32(s, NOP);
>> +            }
>> +            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
>> +            /* actual branch destination will be patched by
>> +               tb_target_set_jmp_target later. */
> Either make it a proper sentence by title-casing "actual" and adding 
> another space after the trailing period, or remove the period.
I will modify these comments.
>> +            tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
>> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
>> +        } else {
>> +            /* !TCG_TARGET_HAS_direct_jump */
>> +            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
>> +                    (uintptr_t)(s->tb_jmp_target_addr + a0));
>> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
>> +        }
> We unconditionally support the direct jump method after the change, so 
> do we need to retain this block any more? Note the aarch64 port 
> currently does the same (declaring unconditional support for direct 
> jumps but keeping both code paths), if we want to remove this code 
> path then you may want to remove the aarch64 one respectively too.
Yes, maybe we can remove these in our patch and submit another patch to 
modify aarch64 port?
>>           set_jmp_reset_offset(s, a0);
>>           break;
>>   @@ -1708,6 +1721,32 @@ static void tcg_target_init(TCGContext *s)
>>       tcg_regset_set_reg(s->reserved_regs, TCG_REG_RESERVED);
>>   }
>>   +void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>> +                              uintptr_t jmp_rw, uintptr_t addr)
>> +{
>
> Move the function to somewhere above, like above the "/* Entrypoints 
> */" section (and maybe introduce another section)? The various parts 
> are more-or-less arranged in a particular order, so it's like going 
> back to implementing concrete things after finishing everything and 
> calling it a day.
~
>
> Also you forgot to remove the now inappropriate comment about this 
> helper in tcg-target.h.
Oh, I will remove the comment.
>
>> +    tcg_insn_unit i1, i2;
>> +
>> +    ptrdiff_t offset = addr - jmp_rx;
>> +
>> +    if (offset == sextreg(offset, 0, 28)) {
>> +        i1 = OPC_B | ((offset >> 18) & 0x3ff) | ((offset << 8) & 
>> 0x3fffc00);
> Use encode_sd10k16_insn instead. No need to juggle the bits yourself 
> and you get nice range assertion for free.
~
>> +        i2 = NOP;
>> +    } else {
>> +        offset >>= 2;
>> +
>> +        ptrdiff_t upper, lower;
> Promote the declaration to the top of the block (before offset 
> shifting), IIRC that's the official coding style.
~
>> +        upper = ((offset + (1 << 15)) >> 16) & 0xfffff;
>> +        lower = (offset & 0xffff);
>> +        /* patch pcaddu18i */
>> +        i1 = OPC_PCADDU18I | upper << 5 | TCG_REG_T0;
>> +        /* patch jirl */
>> +        i2 = OPC_JIRL | lower << 10 | TCG_REG_T0 << 5;
>
> Similarly you could simplify the assembly here, with encode_dsj20_insn 
> and encode_djsk16_insn respectively.
>
> And the code is straight-forward enough to not need the "patch foo" 
> comments.
~
>
>> +    }
>> +    uint64_t pair = (uint64_t)i2 << 32 | i1;
> Maybe add a couple more parentheses to make the precedence easier to 
> follow? (for people who struggle to remember things like this, like me)
~
>> +    qatomic_set((uint64_t *)jmp_rw, pair);
>> +    flush_idcache_range(jmp_rx, jmp_rw, 8);
>> +}
>> +
>>   typedef struct {
>>       DebugFrameHeader h;
>>       uint8_t fde_def_cfa[4];
>> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
>> index 67380b2432..0e552731f5 100644
>> --- a/tcg/loongarch64/tcg-target.h
>> +++ b/tcg/loongarch64/tcg-target.h
>> @@ -123,7 +123,7 @@ typedef enum {
>>   #define TCG_TARGET_HAS_clz_i32          1
>>   #define TCG_TARGET_HAS_ctz_i32          1
>>   #define TCG_TARGET_HAS_ctpop_i32        0
>> -#define TCG_TARGET_HAS_direct_jump      0
>> +#define TCG_TARGET_HAS_direct_jump      1
>>   #define TCG_TARGET_HAS_brcond2          0
>>   #define TCG_TARGET_HAS_setcond2         0
>>   #define TCG_TARGET_HAS_qemu_st8_i32     0

Thanks for your advise. I will make some changes and submit 2nd version.

Qi


