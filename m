Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E56E1AB9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 05:24:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnA1r-0000cx-57; Thu, 13 Apr 2023 23:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pnA1o-0000ca-Tc
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 23:23:12 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pnA1l-00009Z-T8
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 23:23:12 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8AxJ_AUxzhkazwcAA--.43892S3;
 Fri, 14 Apr 2023 11:23:00 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax270TxzhkYt8jAA--.40385S3; 
 Fri, 14 Apr 2023 11:22:59 +0800 (CST)
Subject: Re: [RFC PATCH v2 38/44] target/loongarch: Implement vbitsel vset
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-39-gaosong@loongson.cn>
 <dc51342e-952c-c014-3b60-4dd751646468@linaro.org>
 <ac4562c5-ea37-d57a-b1dd-02b21af72985@loongson.cn>
 <f785b8f3-d7f3-a481-81c3-3603542a0111@linaro.org>
 <58a22259-8bf0-e3fc-720a-0d8d3872e8d3@loongson.cn>
 <a3c6560e-1d7e-1703-b71f-9fbf55871966@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <5f3746d3-cb99-1300-1c4e-b3d6657c2ff1@loongson.cn>
Date: Fri, 14 Apr 2023 11:22:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a3c6560e-1d7e-1703-b71f-9fbf55871966@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Ax270TxzhkYt8jAA--.40385S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Aw15Aw45JF15Kr1fZF4UCFg_yoWfZrWxpr
 1xtryUCrW8trn5AF47JF1DJry2yrsrt3WDtr12qF10kw1DJr12qFyDXr4jg3ZxJr40yF1U
 GF1DJrnrZr17JwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.083,
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


在 2023/4/13 下午6:06, Richard Henderson 写道:
> On 4/13/23 04:53, gaosong wrote:
>>
>> 在 2023/4/12 下午2:53, Richard Henderson 写道:
>>>
>>>>>> +#define SETANYEQZ(NAME, BIT, E) \
>>>>>> +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t 
>>>>>> vj) \
>>>>>> +{                                                                   
>>>>>> \
>>>>>> +    int i; \
>>>>>> +    bool ret = 
>>>>>> false;                                               \
>>>>>> +    VReg *Vj = &(env->fpr[vj].vreg); \
>>>>>> +                                                                    
>>>>>> \
>>>>>> +    for (i = 0; i < LSX_LEN/BIT; i++) 
>>>>>> {                             \
>>>>>> +        ret |= (Vj->E(i) == 
>>>>>> 0);                                     \
>>>>>> + } \
>>>>>> +    env->cf[cd & 0x7] = 
>>>>>> ret;                                        \
>>>>>> +}
>>>>>> +SETANYEQZ(vsetanyeqz_b, 8, B)
>>>>>> +SETANYEQZ(vsetanyeqz_h, 16, H)
>>>>>> +SETANYEQZ(vsetanyeqz_w, 32, W)
>>>>>> +SETANYEQZ(vsetanyeqz_d, 64, D)
>>>>>
>>>>> These could be inlined, though slightly harder.
>>>>> C.f. target/arm/sve_helper.c, do_match2 (your n == 0).
>>>>>
>>>> Do you mean an inline like trans_vseteqz_v or just an inline helper 
>>>> function?
>>>
>>> I meant inline tcg code generation, instead of a call to a helper.
>>> But even if we keep this in a helper, see do_match2 for avoiding the 
>>> loop over bytes. 
>> Ok,
>> e.g
>> #define SETANYEQZ(NAME, MO)                                  \
>> void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
>> {                                                               \
>>      int i;            \
>>      bool ret = false; \
>>      VReg *Vj = &(env->fpr[vj].vreg); \
>> \
>>      ret = do_match2(0, (uint64_t)Vj->D(0), (uint64_t)Vj->D(1), 
>> MO);              \
>>      env->cf[cd & 0x7] = ret;      \
>> }
>> SETANYEQZ(vsetanyeqz_b, MO_8)
>> SETANYEQZ(vsetanyeqz_h, MO_16)
>> SETANYEQZ(vsetanyeqz_w, MO_32)
>> SETANYEQZ(vsetanyeqz_d, MO_64)
>>
>> and
>> vsetanyeqz.b    $fcc5  $vr11
>>    v11    : {edc0004d576eef5b, ec03ec0fec03ea47}
>> ------------------
>> do_match2
>> bits is 8
>> m1 is ec03ec0fec03ea47
>> m0 is edc0004d576eef5b
>> ones is 1010101
>> sings is 80808080
>> cmp1 is 0
>> cmp0 is edc0004d576eef5b
>> cmp1 is ec03ec0fec03ea47
>> cmp0 is 10000
>> cmp1 is 3000100
>> ret is 0
>>
>> but,  the results is not correct  for vsetanyeqz.b. :-)
>
> Well, 'ones' as printed above is only 4 bytes instead of 8, similarly 
> 'sings'.  That would certainly explain why it did not detect a zero in 
> byte 5 of 'm0'.
>
> Some problem with your conversion of that function?
>
I copied do_match2  from arm.  and my host is x86 machine.

...
uint64_t ones = dup_const(esz, 1);   // esz = MO_8
uint64_t signs = ones << ( bits  -1 );   // bits = 8
...


the dup_const() return  0x101010101010101.

but set  the 'ones' is 0x1010101.


Thread 1 "qemu-loongarch6" hit Breakpoint 1, helper_vsetanyeqz_b 
(env=0x555555a50910, cd=6, vj=3) at ../target/loongarch/lsx_helper.c:2906
2906    SETANYEQZ(vsetanyeqz_b, MO_8, B)
(gdb) s
do_match2 (n=0, m0=14467753019624114359, m1=14467753019624114359, esz=0) 
at ../target/loongarch/lsx_helper.c:2868
2868        uint64_t bits = 8 << esz;
(gdb) s
2869        uint64_t ones = dup_const(esz, 1);
(gdb) s
dup_const (vece=0, c=1) at ../tcg/tcg-op-gvec.c:374
374        switch (vece) {
(gdb) finish
Run till exit from #0  dup_const (vece=0, c=1) at ../tcg/tcg-op-gvec.c:374
do_match2 (n=0, m0=14467753019624114359, m1=14467753019624114359, esz=0) 
at ../target/loongarch/lsx_helper.c:2869
2869        uint64_t ones = dup_const(esz, 1);
Value returned is $16 = 72340172838076673
(gdb) disassemble $pc
Dump of assembler code for function do_match2:
    0x00005555555fffdf <+0>:    push   %rbp
    0x00005555555fffe0 <+1>:    mov    %rsp,%rbp
    0x00005555555fffe3 <+4>:    sub    $0x50,%rsp
    0x00005555555fffe7 <+8>:    mov    %rdi,-0x38(%rbp)
    0x00005555555fffeb <+12>:    mov    %rsi,-0x40(%rbp)
    0x00005555555fffef <+16>:    mov    %rdx,-0x48(%rbp)
    0x00005555555ffff3 <+20>:    mov    %ecx,-0x4c(%rbp)
    0x00005555555ffff6 <+23>:    mov    -0x4c(%rbp),%eax
    0x00005555555ffff9 <+26>:    mov    $0x8,%edx
    0x00005555555ffffe <+31>:    mov    %eax,%ecx
    0x0000555555600000 <+33>:    shl    %cl,%edx
    0x0000555555600002 <+35>:    mov    %edx,%eax
    0x0000555555600004 <+37>:    cltq
    0x0000555555600006 <+39>:    mov    %rax,-0x28(%rbp)
    0x000055555560000a <+43>:    mov    -0x4c(%rbp),%eax
    0x000055555560000d <+46>:    mov    $0x1,%esi
    0x0000555555600012 <+51>:    mov    %eax,%edi
    0x0000555555600014 <+53>:    mov    $0x0,%eax
    0x0000555555600019 <+58>:    callq  0x5555556342c3 <dup_const>
=> 0x000055555560001e <+63>:    cltq
    0x0000555555600020 <+65>:    mov    %rax,-0x20(%rbp)
    0x0000555555600024 <+69>:    mov    -0x28(%rbp),%rax
    0x0000555555600028 <+73>:    sub    $0x1,%eax
    0x000055555560002b <+76>:    mov    -0x20(%rbp),%rdx
    0x000055555560002f <+80>:    mov    %eax,%ecx
    0x0000555555600031 <+82>:    shl    %cl,%rdx
    0x0000555555600034 <+85>:    mov    %rdx,%rax
    0x0000555555600037 <+88>:    mov    %rax,-0x18(%rbp)
    0x000055555560003b <+92>:    lea 0x129df7(%rip),%rdi        # 
0x555555729e39
    0x0000555555600042 <+99>:    callq  0x555555583af0 <puts@plt>
    0x0000555555600047 <+104>:    mov    -0x4c(%rbp),%eax
--Type <RET> for more, q to quit, c to continue without paging--q
Quit
(gdb) p/x $rax
$17 = 0x101010101010101
(gdb) si
0x0000555555600020    2869        uint64_t ones = dup_const(esz, 1);
(gdb) p/x $rax
$18 = 0x1010101
(gdb) disassemble $pc
Dump of assembler code for function do_match2:
    0x00005555555fffdf <+0>:    push   %rbp
    0x00005555555fffe0 <+1>:    mov    %rsp,%rbp
    0x00005555555fffe3 <+4>:    sub    $0x50,%rsp
    0x00005555555fffe7 <+8>:    mov    %rdi,-0x38(%rbp)
    0x00005555555fffeb <+12>:    mov    %rsi,-0x40(%rbp)
    0x00005555555fffef <+16>:    mov    %rdx,-0x48(%rbp)
    0x00005555555ffff3 <+20>:    mov    %ecx,-0x4c(%rbp)
    0x00005555555ffff6 <+23>:    mov    -0x4c(%rbp),%eax
    0x00005555555ffff9 <+26>:    mov    $0x8,%edx
    0x00005555555ffffe <+31>:    mov    %eax,%ecx
    0x0000555555600000 <+33>:    shl    %cl,%edx
    0x0000555555600002 <+35>:    mov    %edx,%eax
    0x0000555555600004 <+37>:    cltq
    0x0000555555600006 <+39>:    mov    %rax,-0x28(%rbp)
    0x000055555560000a <+43>:    mov    -0x4c(%rbp),%eax
    0x000055555560000d <+46>:    mov    $0x1,%esi
    0x0000555555600012 <+51>:    mov    %eax,%edi
    0x0000555555600014 <+53>:    mov    $0x0,%eax
    0x0000555555600019 <+58>:    callq  0x5555556342c3 <dup_const>
    0x000055555560001e <+63>:    cltq
=> 0x0000555555600020 <+65>:    mov    %rax,-0x20(%rbp)
    0x0000555555600024 <+69>:    mov    -0x28(%rbp),%rax
    0x0000555555600028 <+73>:    sub    $0x1,%eax
    0x000055555560002b <+76>:    mov    -0x20(%rbp),%rdx
    0x000055555560002f <+80>:    mov    %eax,%ecx
    0x0000555555600031 <+82>:    shl    %cl,%rdx
    0x0000555555600034 <+85>:    mov    %rdx,%rax
    0x0000555555600037 <+88>:    mov    %rax,-0x18(%rbp)
    0x000055555560003b <+92>:    lea 0x129df7(%rip),%rdi        # 
0x555555729e39
    0x0000555555600042 <+99>:    callq  0x555555583af0 <puts@plt>
    0x0000555555600047 <+104>:    mov    -0x4c(%rbp),%eax
--Type <RET> for more, q to quit, c to continue without paging--q
Quit
(gdb) p/x ones
$19 = 0x7fffffffc850
(gdb) si
2871        uint64_t signs = ones << (bits - 1);
(gdb) p/x $rax
$20 = 0x1010101
(gdb) p/x ones
$21 = 0x1010101

After  exec   insn  'cltq' ,  the  'ones'  is not we want.

Thanks.
Song Gao


