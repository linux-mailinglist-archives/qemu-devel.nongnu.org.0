Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F93D1FC7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:19:22 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6TvN-0003an-MS
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m6TuB-0001iB-09
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:18:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46280 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m6Tu8-00010b-3A
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:18:06 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_0CzKflg8aciAA--.21247S3; 
 Thu, 22 Jul 2021 16:17:57 +0800 (CST)
Subject: Re: [PATCH v2 09/22] target/loongarch: Add fixed point bit
 instruction translation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-10-git-send-email-gaosong@loongson.cn>
 <fa4f505f-067d-29b4-03ca-e65108792257@amsat.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <a7991d0c-faa4-9358-0260-0f5cdaa47946@loongson.cn>
Date: Thu, 22 Jul 2021 16:17:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <fa4f505f-067d-29b4-03ca-e65108792257@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_0CzKflg8aciAA--.21247S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4fCFWDCr1ktrykGFyrCrg_yoWrZw4xpF
 W5Ar45GF48ArZ3J3W3XFW5Xrn3trWrKr4j9F4xJFZay3WDAFnYqryjkw4Ska4xAa1Sgr4j
 93Zrua42kr18WFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.117,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, maobibo@loongson.cn,
 laurent@vivier.eu, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe

On 07/22/2021 01:46 AM, Philippe Mathieu-Daudé wrote:
> On 7/21/21 11:53 AM, Song Gao wrote:
>> This patch implement fixed point bit instruction translation.
>>
>> This includes:
>> - EXT.W.{B/H}
>> - CL{O/Z}.{W/D}, CT{O/Z}.{W/D}
>> - BYTEPICK.{W/D}
>> - REVB.{2H/4H/2W/D}
>> - REVH.{2W/D}
>> - BITREV.{4B/8B}, BITREV.{W/D}
>> - BSTRINS.{W/D}, BSTRPICK.{W/D}
>> - MASKEQZ, MASKNEZ
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  target/loongarch/helper.h     |  10 +
>>  target/loongarch/insns.decode |  45 +++
>>  target/loongarch/op_helper.c  | 119 ++++++++
>>  target/loongarch/trans.inc.c  | 665 ++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 839 insertions(+)
> 
>> diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
>> index b2cbdd7..07c3d52 100644
>> --- a/target/loongarch/op_helper.c
>> +++ b/target/loongarch/op_helper.c
>> @@ -25,3 +25,122 @@ void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
>>  {
>>      do_raise_exception(env, exception, GETPC());
>>  }
>> +
>> +target_ulong helper_cto_w(CPULoongArchState *env, target_ulong rj)
>> +{
>> +    uint32_t v = (uint32_t)rj;
>> +    int temp = 0;
>> +
>> +    while ((v & 0x1) == 1) {
>> +        temp++;
>> +        v = v >> 1;
>> +    }
> 
> Why not use cto32() from "qemu/host-utils.h"
>>> +
>> +    return (target_ulong)temp;
>> +}
>> +
>> +target_ulong helper_ctz_w(CPULoongArchState *env, target_ulong rj)
>> +{
>> +    uint32_t v = (uint32_t)rj;
>> +
>> +    if (v == 0) {
>> +        return 32;
>> +    }
>> +
>> +    int temp = 0;
>> +    while ((v & 0x1) == 0) {
>> +        temp++;
>> +        v = v >> 1;
>> +    }
> 
> ctz32
> 
>> +
>> +    return (target_ulong)temp;
>> +}
>> +
>> +target_ulong helper_cto_d(CPULoongArchState *env, target_ulong rj)
>> +{
>> +    uint64_t v = rj;
>> +    int temp = 0;
>> +
>> +    while ((v & 0x1) == 1) {
>> +        temp++;
>> +        v = v >> 1;
>> +    }
> 
> cto64
> 
>> +
>> +    return (target_ulong)temp;
>> +}
>> +
>> +target_ulong helper_ctz_d(CPULoongArchState *env, target_ulong rj)
>> +{
>> +    uint64_t v = rj;
>> +
>> +    if (v == 0) {
>> +        return 64;
>> +    }
>> +
>> +    int temp = 0;
>> +    while ((v & 0x1) == 0) {
>> +        temp++;
>> +        v = v >> 1;
>> +    }
> 
> and ctz64?
> 

Yes,  I didn't notice the file "qemu/host-utils.h" before,  thanks for kindly help! 

>> +
>> +    return (target_ulong)temp;
>> +}
>> +
>> +target_ulong helper_bitrev_w(CPULoongArchState *env, target_ulong rj)
>> +{
>> +    int32_t v = (int32_t)rj;
>> +    const int SIZE = 32;
>> +    uint8_t bytes[SIZE];
>> +
>> +    int i;
>> +    for (i = 0; i < SIZE; i++) {
>> +        bytes[i] = v & 0x1;
>> +        v = v >> 1;
>> +    }
>> +    /* v == 0 */
>> +    for (i = 0; i < SIZE; i++) {
>> +        v = v | ((uint32_t)bytes[i] << (SIZE - 1 - i));
>> +    }
>> +
>> +    return (target_ulong)(int32_t)v;
>> +}
>> +
>> +target_ulong helper_bitrev_d(CPULoongArchState *env, target_ulong rj)
>> +{
>> +    uint64_t v = rj;
>> +    const int SIZE = 64;
>> +    uint8_t bytes[SIZE];
>> +
>> +    int i;
>> +    for (i = 0; i < SIZE; i++) {
>> +        bytes[i] = v & 0x1;
>> +        v = v >> 1;
>> +    }
>> +    /* v == 0 */
>> +    for (i = 0; i < SIZE; i++) {
>> +        v = v | ((uint64_t)bytes[i] << (SIZE - 1 - i));
>> +    }
>> +
>> +    return (target_ulong)v;
>> +}
>> +
>> +static inline target_ulong bitswap(target_ulong v)
>> +{
>> +    v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
>> +        ((v & (target_ulong)0x5555555555555555ULL) << 1);
>> +    v = ((v >> 2) & (target_ulong)0x3333333333333333ULL) |
>> +        ((v & (target_ulong)0x3333333333333333ULL) << 2);
>> +    v = ((v >> 4) & (target_ulong)0x0F0F0F0F0F0F0F0FULL) |
>> +        ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
>> +    return v;
> 
> Is this revbit64?
> 

No, helper_bitrev_d is revbit64(LoongArch insn is 'bitrev.d rd, rj').

bitswap function for 'bitrev.4b/8b rd, rj' instruction.

    BITREV.4B:
      bstr32[31:24] = BITREV(GR[rj][31:24])
      bstr32[23:16] = BITREV(GR[rj][23:16])
      bstr32[15: 8] = BITREV(GR[rj][15: 8])
      bstr32[ 7: 0] = BITREV(GR[rj][ 7: 0])
      GR[rd] = SignExtend(bstr32, GRLEN)
     
    BITREV.8B:
      GR[rd][63:56] = BITREV(GR[rj][63:56])
      GR[rd][55:48] = BITREV(GR[rj][55:48])
      GR[rd][47:40] = BITREV(GR[rj][47:40])
      GR[rd][39:32] = BITREV(GR[rj][39:32])
      GR[rd][31:24] = BITREV(GR[rj][31:24])
      GR[rd][23:16] = BITREV(GR[rj][23:16])
      GR[rd][15: 8] = BITREV(GR[rj][15: 8])
      GR[rd][ 7: 0] = BITREV(GR[rj][ 7: 0])

We can see a detailed introduction in [1]  2.2.3.6.

[1] : https://github.com/loongson/LoongArch-Documentation/releases/download/LoongArch-Vol1-v3/LoongArch-Vol1-v1.00-EN.pdf

Thanks
Song Gao


