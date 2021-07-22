Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E53D1F3A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:45:04 +0200 (CEST)
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6TOA-0002Vh-Lv
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m6TN5-0001pd-Mb
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:43:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38178 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m6TN0-0002wh-TF
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:43:55 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0GuIflgPKUiAA--.43337S3; 
 Thu, 22 Jul 2021 15:43:43 +0800 (CST)
Subject: Re: [PATCH v2 07/22] target/loongarch: Add fixed point arithmetic
 instruction translation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
 <b004b8e6-c0c1-d13d-fae0-81c1ee22a95b@amsat.org>
 <380b9896-8f6b-e695-a8ca-447c86f06a89@amsat.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <45f01ff9-0fa8-e3de-9a42-be9be9686b97@loongson.cn>
Date: Thu, 22 Jul 2021 15:41:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <380b9896-8f6b-e695-a8ca-447c86f06a89@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0GuIflgPKUiAA--.43337S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1kJF13GF4xXFyfGw1kuFg_yoW8uw17pr
 17CFn5Ka1UtrZxA3WSga98Wr1Yv3yxGr4xXa4Sq3s3CrnIvr1xAF1kK3sFgFW8Za13uFy0
 vr10krW5WF15XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
 JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
 07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8V
 W5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
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

Hi, Philippe,

On 07/22/2021 01:49 AM, Philippe Mathieu-Daudé wrote:
> On 7/21/21 7:38 PM, Philippe Mathieu-Daudé wrote:
>> On 7/21/21 11:53 AM, Song Gao wrote:
>>> This patch implement fixed point arithemtic instruction translation.
> 
> Typo arithmetic.
> 
>>>
>>> This includes:
>>> - ADD.{W/D}, SUB.{W/D}
>>> - ADDI.{W/D}, ADDU16ID
>>> - ALSL.{W[U]/D}
>>> - LU12I.W, LU32I.D LU52I.D
>>> - SLT[U], SLT[U]I
>>> - PCADDI, PCADDU12I, PCADDU18I, PCALAU12I
>>> - AND, OR, NOR, XOR, ANDN, ORN
>>> - MUL.{W/D}, MULH.{W[U]/D[U]}
>>> - MULW.D.W[U]
>>> - DIV.{W[U]/D[U]}, MOD.{W[U]/D[U]}
>>> - ANDI, ORI, XORI
>>>
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>  target/loongarch/insns.decode |   89 ++++
>>>  target/loongarch/trans.inc.c  | 1090 +++++++++++++++++++++++++++++++++++++++++
>>>  target/loongarch/translate.c  |   12 +
>>>  target/loongarch/translate.h  |    1 +
>>>  4 files changed, 1192 insertions(+)
>>>  create mode 100644 target/loongarch/insns.decode
>>>  create mode 100644 target/loongarch/trans.inc.c
>>
>> Please don't include all .inc.c in one big translate.c...
>>
>>> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
>>> index 531f7e1..b60bdc2 100644
>>> --- a/target/loongarch/translate.c
>>> +++ b/target/loongarch/translate.c
>>> @@ -57,6 +57,15 @@ void gen_load_gpr(TCGv t, int reg)
>>>      }
>>>  }
>>>  
>>> +TCGv get_gpr(int regno)
>>> +{
>>> +    if (regno == 0) {
>>> +        return tcg_constant_tl(0);
>>> +    } else {
>>> +        return cpu_gpr[regno];
>>> +    }
>>> +}
>>> +
>>>  static inline void gen_save_pc(target_ulong pc)
>>
>> ... expose this one ...
>>
>>>  {
>>>      tcg_gen_movi_tl(cpu_PC, pc);
>>> @@ -287,6 +296,9 @@ static bool loongarch_tr_breakpoint_check(DisasContextBase *dcbase,
>>>      return true;
>>>  }
>>>  
>>> +#include "decode-insns.c.inc"
>>
>> ... and move this include to "trans.c".
> 
> Since you have the luck to add a new architecture, you could
> start cleanly from scratch and add group of instructions, so
> this patch would add "trans_arithmetic.c", etc.. in the series.
> 

Got it,  The file trans.inc.c seems too big ...

Thansk,
Song Gao   



