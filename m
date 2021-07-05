Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF873BB48A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 02:46:31 +0200 (CEST)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Cko-0004lj-27
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 20:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m0Cju-00045N-8d
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 20:45:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45602 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m0Cjr-0004bc-8t
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 20:45:34 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxIOIfVuJgMm8cAA--.12616S3; 
 Mon, 05 Jul 2021 08:45:21 +0800 (CST)
Subject: Re: [PATCH 07/20] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-8-git-send-email-gaosong@loongson.cn>
 <248d54fc-ebdd-09e9-22c2-e66307b22705@amsat.org>
 <fcc6a9cd-2fa9-d976-3326-bda0efedea5f@loongson.cn>
 <2912e517-dba0-04f8-80e2-edc0a9b1a27d@amsat.org>
 <6079cde9-f274-40e2-77ac-3a942455d58a@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <d4491acf-5654-3e80-00e5-9f6da61f877a@loongson.cn>
Date: Mon, 5 Jul 2021 08:45:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6079cde9-f274-40e2-77ac-3a942455d58a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxIOIfVuJgMm8cAA--.12616S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFW8Zry8WFW8ZF43Jw17Awb_yoW8Jw1Dpr
 1ktF97WryY9r1kJ34jgr1DWas0yr1UJ3Z8X3s5JayjyF47Zr1SqF4UWryY9r1rAr4fXF4Y
 yr45XwnruF17XaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-devel@nongnu.org,
 laurent@vivier.eu, maobibo@loongson.cn,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 alistair.francis@wdc.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard,

On 07/02/2021 10:46 PM, Richard Henderson wrote:
> On 7/2/21 1:51 AM, Philippe Mathieu-Daudé wrote:
>> static bool trans_mul_d(DisasContext *ctx, int rd, int rj, int rk)
>> {
>>      TCGv t0, t1;
>>
>>      check_loongarch_64(ctx);
>>
>>      if (a->rd == 0) {
>>          /* Treat as NOP. */
>>          return true;
>>      }
>>
>>      t0 = tcg_temp_new();
>>      t1 = tcg_temp_new();
>>
>>      gen_load_gpr(t0, a->rj);
>>      gen_load_gpr(t1, a->rk);
> 
> Another improvement over mips is possible, while we're at it:
> 
> TCGv get_gpr(int regno)
> {
>     if (regno == 0) {
>         return tcg_constant_tl(0);
>     } else {
>         return cpu_gpr[regno];
>     }
> }
> 
>     t0 = get_gpr(a->rj);
>     t1 = get_gpr(a->rk);
> 
>>
>>      tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
>>
>>      tcg_temp_free(t0);
>>      tcg_temp_free(t1);
> 
> and now the frees are not necessary.
> 
> You do have to be careful that you consume the input before you write back to cpu_gpr[a->rd].  Previously you had a copy, but now t0 and t1 reference the live register.  And of course you cannot write to either t0 or t1, because one of them might be the constant 0.


Got it, thanks for kindly help!

Regards
Song Gao


