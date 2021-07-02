Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039B3B9DF2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:18:23 +0200 (CEST)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFJV-00005q-KV
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lzFHV-00077f-7F
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:16:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50252 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lzFHS-0003gV-GM
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:16:16 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb0BU2d5gUoAbAA--.32980S3; 
 Fri, 02 Jul 2021 17:16:05 +0800 (CST)
Subject: Re: [PATCH 07/20] target/loongarch: Add fixed point arithmetic
 instruction translation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-8-git-send-email-gaosong@loongson.cn>
 <248d54fc-ebdd-09e9-22c2-e66307b22705@amsat.org>
 <fcc6a9cd-2fa9-d976-3326-bda0efedea5f@loongson.cn>
 <2912e517-dba0-04f8-80e2-edc0a9b1a27d@amsat.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <8f1ef7ff-fa6a-972f-c460-63ee10d4a2cd@loongson.cn>
Date: Fri, 2 Jul 2021 17:16:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2912e517-dba0-04f8-80e2-edc0a9b1a27d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb0BU2d5gUoAbAA--.32980S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW5GF1fCF43Xw15Xw1DZFb_yoW5GFWfpr
 1xCFn5GF4UtFy3Ar9agw15Wrn0yrWxKr1xX3Zaq3y7Cr1Ivrn5AF1kK34a9FWxAw18uFW0
 vr40kry5W3WUt3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
 6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, maobibo@loongson.cn, laurent@vivier.eu,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On 07/02/2021 04:51 PM, Philippe Mathieu-Daudé wrote:
> On 7/2/21 10:15 AM, Song Gao wrote:
>> On 07/02/2021 04:31 AM, Philippe Mathieu-Daudé wrote:
>>> On 6/28/21 2:04 PM, Song Gao wrote:
>>>> This patch implement fixed point arithemtic instruction translation.
>>>>
>>>> This includes:
>>>> - ADD.{W/D}, SUB.{W/D}
>>>> - ADDI.{W/D}, ADDU16ID
>>>> - ALSL.{W[U]/D}
>>>> - LU12I.W, LU32I.D LU52I.D
>>>> - SLT[U], SLT[U]I
>>>> - PCADDI, PCADDU12I, PCADDU18I, PCALAU12I
>>>> - AND, OR, NOR, XOR, ANDN, ORN
>>>> - MUL.{W/D}, MULH.{W[U]/D[U]}
>>>> - MULW.D.W[U]
>>>> - DIV.{W[U]/D[U]}, MOD.{W[U]/D[U]}
>>>> - ANDI, ORI, XORI
>>>>
>>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>>> ---
>>>>  target/loongarch/insns.decode |  89 ++++++++
>>>>  target/loongarch/instmap.h    |  53 +++++
>>>>  target/loongarch/trans.inc.c  | 367 +++++++++++++++++++++++++++++++++
>>>>  target/loongarch/translate.c  | 458 ++++++++++++++++++++++++++++++++++++++++++
>>>>  4 files changed, 967 insertions(+)
>>>>  create mode 100644 target/loongarch/insns.decode
>>>>  create mode 100644 target/loongarch/instmap.h
>>>>  create mode 100644 target/loongarch/trans.inc.c
> 
>>> It seems you are missing what decodetree is for... You should inline
>>> each opcode code from gen_loongarch_muldiv in the opcode handler.
>>>
>>> Don't take MIPS as an example =)
>>>
>> Hi, Philippe,
>>
>> I‘m not sure I understand right.  Here is an example of my modification
>>
>>     static bool trans_xxx(DisasContext *ctx, arg_mul_w *a)
>>     {
>>         gen_loongarch_muldiv(ctx, a->rd, a->rj, a->rk);
>>         return true;
>>     }
>>     ...
>>
>>     static void gen_loongarch_muldiv(DisasContext *ctx, int rd,
>>                                      int rj, int rk)
>>     {
>>         TCGv t0, t1;
>>
>>         if (rd == 0) {
>>             /* Treat as NOP. */
>>             return;
>>         }
>>
>>         t0 = tcg_temp_new();
>>         t1 = tcg_temp_new();
>>
>>         gen_load_gpr(t0, rj);
>>         gen_load_gpr(t1, rk);
>>
>>         switch (ctx->opcode) {
>>         case  xxx_opcode:
>>              /* translate  xxx  */
>>         ...
>>
>>     }
>>
>> Is that right？
> 
> No. With decode"tree" you only have to implement the
> decode"leaves". No need to pass 'uin32_t opcode' and
> use 'switch (ctx->opcode) ...'. Example for LA_OPC_MUL_D:
> 
> static bool trans_mul_d(DisasContext *ctx, int rd, int rj, int rk)
> {
>     TCGv t0, t1;
> 
>     check_loongarch_64(ctx);
> 
>     if (a->rd == 0) {
>         /* Treat as NOP. */
>         return true;
>     }
> 
>     t0 = tcg_temp_new();
>     t1 = tcg_temp_new();
> 
>     gen_load_gpr(t0, a->rj);
>     gen_load_gpr(t1, a->rk);
> 
>     tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
> 
>     tcg_temp_free(t0);
>     tcg_temp_free(t1);
> 
>     return true;
> }
> 

Got it, thanks for kindly help!

Regards
Song Gao


