Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157DE3B7B30
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:06:15 +0200 (CEST)
Received: from localhost ([::1]:55072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyOgA-0000F9-5o
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lyOeu-0007sd-Ps
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:04:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43326 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lyOeq-0006a5-Lm
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:04:56 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0Mqw9tgVI4aAA--.30719S3; 
 Wed, 30 Jun 2021 09:04:43 +0800 (CST)
Subject: Re: [PATCH 06/20] target/loongarch: Add main translation routines
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-7-git-send-email-gaosong@loongson.cn>
 <3b3ad9db-ed86-1ef4-5653-1c7106bc5bfd@amsat.org>
 <88f8eaba-f99a-5865-898f-29a9f4b418f2@loongson.cn>
 <871r8krh4m.fsf@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <f7c374dd-51ea-dff9-b397-3c3d4bdc1a44@loongson.cn>
Date: Wed, 30 Jun 2021 09:04:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <871r8krh4m.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0Mqw9tgVI4aAA--.30719S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1xWFyrAF1fCFyUJF4ruFg_yoW8ZF4xpr
 13CF1rKw48Jry7Jr4agw1UXrnxtr48CFW7X3Z7tryrCr9Fqw1xZF18t342kFyxAw17uFyj
 qF1Yy3429F13G3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
 vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI
 62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6c
 x26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
 cVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
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
 richard.henderson@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, maobibo@loongson.cn,
 laurent@vivier.eu, alistair.francis@wdc.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Alex,

On 06/29/2021 08:26 PM, Alex Bennée wrote:
> 
> Song Gao <gaosong@loongson.cn> writes:
> 
>> Hi, Philippe,
>>
>> On 06/29/2021 02:46 AM, Philippe Mathieu-Daudé wrote:
>>> On 6/28/21 2:04 PM, Song Gao wrote:
>>>> This patch add main translation routines and
>>>> basic functions for translation.
>>>>
>>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>>> ---
>>>>  target/loongarch/helper.h    |  10 +
>>>>  target/loongarch/op_helper.c |  28 +++
>>>>  target/loongarch/translate.c | 537 +++++++++++++++++++++++++++++++++++++++++++
>>>>  target/loongarch/translate.h |  58 +++++
>>>>  4 files changed, 633 insertions(+)
>>>>  create mode 100644 target/loongarch/helper.h
>>>>  create mode 100644 target/loongarch/op_helper.c
>>>>  create mode 100644 target/loongarch/translate.c
>>>>  create mode 100644 target/loongarch/translate.h
>>>
>>>> +/* 128 and 256 msa vector instructions are not supported yet */
>>>> +static bool decode_lsx(uint32_t opcode)
>>>> +{
>>>> +    uint32_t value = (opcode & 0xff000000);
>>>> +
>>>> +    if ((opcode & 0xf0000000) == 0x70000000) {
>>>> +        return true;
>>>> +    } else if ((opcode & 0xfff00000) == 0x38400000) {
>>>> +        return true;
>>>> +    } else {
>>>> +        switch (value) {
>>>> +        case 0x09000000:
>>>> +        case 0x0a000000:
>>>> +        case 0x0e000000:
>>>> +        case 0x0f000000:
>>>> +        case 0x2c000000:
>>>> +        case 0x30000000:
>>>> +        case 0x31000000:
>>>> +        case 0x32000000:
>>>> +        case 0x33000000:
>>>> +            return true;
>>>> +        }
>>>> +    }
>>>> +    return false;
>>>> +}
>>>
>>> Why not generate that with the decodetree script?
>>>
>> These instructions are privileged instructions， user mode does not need these instructions.
>> I'll delete these codes.
> 
> Are you intending to include system emulation in due course?
> 
Yes,  After the loongarch kernel is submitted to the mainline, we will add system emulation support.
You can see the lastest loongarch kernel at:

    https://github.com/loongson/linux/tree/loongarch-next

thanks


