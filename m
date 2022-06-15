Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392354C532
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:54:29 +0200 (CEST)
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1PjI-0003bG-7x
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o1Pf0-0008Si-D6
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:50:04 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59472 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o1Pex-0004xV-Gu
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:50:01 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx701Cq6li7IRDAA--.6040S3;
 Wed, 15 Jun 2022 17:49:54 +0800 (CST)
Subject: Re: [PATCH v16 7/9] target/loongarch: Adjust functions and structure
 to support user-mode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
 <20220614090536.1103616-8-gaosong@loongson.cn>
 <a9539054-044f-7cfb-8de4-a5b821679b6f@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <c55d9b7a-910e-1052-d330-45d72cb5f02d@loongson.cn>
Date: Wed, 15 Jun 2022 17:49:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a9539054-044f-7cfb-8de4-a5b821679b6f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dx701Cq6li7IRDAA--.6040S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1rZFy8AF1UJr4Uury3Arb_yoW8Gw13pF
 n7G393Jryfta1kXwn7Ja1jqry8Jws8J3WDGwn5Xas8tF4Sqr1jgr4kXw4q9rW7Jw4vqay7
 AFW2qry3Za1DurJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
 JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl
 42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyU
 JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUF9a9DUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/6/15 上午12:43, Richard Henderson wrote:
> On 6/14/22 02:05, Song Gao wrote:
>> @@ -172,17 +173,20 @@ static void loongarch_cpu_do_interrupt(CPUState 
>> *cs)
>>           update_badinstr = 0;
>>           break;
>>       case EXCCODE_ADEM:
>> +    case EXCCODE_BCE:
>>       case EXCCODE_SYS:
>>       case EXCCODE_BRK:
>> +    case EXCCODE_INE:
>> +    case EXCCODE_IPE:
>> +    case EXCCODE_FPE:
>> +        env->badvaddr = env->pc;
>> +        QEMU_FALLTHROUGH;
>
> This is incorrect still.
>
> (1) env->badaddr (in this patch renamed badvaddr) is actually unused 
> prior to this patch and should go away.  It seems to have been copied 
> from RISC-V?  The correct LoongArch variable is env->CSR_BADV (see 
> raise_mmu_exception in tlb_helper.c).
>
I also think we should remove env->badaddr,
> (2) EXCCODE_ADEM is on the wrong side of this FALLTHROUGH.  This is 
> the exception raised by TLB faults, and should retain the BADV address 
> of the fault, not the faulting instruction.
>
> Also, this patch is trying to do too many things at once.  Please 
> split it into smaller logical changes.  Any bug fixes for the system 
> code, for instance raising EXCCODE_BCE instead of EXCCODE_ADEM for 
> helper_asrtle_d should be completely separated.
>
Thanks you for you advice,  I will correct them on next version.

Thanks.
Song Gao


