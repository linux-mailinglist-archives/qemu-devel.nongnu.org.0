Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370623500A7
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 14:50:50 +0200 (CEST)
Received: from localhost ([::1]:52374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRaJ6-0008MH-OU
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 08:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lRaHe-0007sr-PE
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:49:18 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37392)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lRaHc-00059o-BV
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:49:18 -0400
Received: from [10.12.39.188] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id 756A240A1DC7;
 Wed, 31 Mar 2021 12:49:03 +0000 (UTC)
Subject: Re: [PATCH] target/openrisc: fix icount handling for timer
 instructions
To: Stafford Horne <shorne@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <161700376169.1135890.8707223959310729949.stgit@pasha-ThinkPad-X280>
 <20210330220532.GC1171117@lianli.shorne-pla.net>
 <532799f9-e9ed-1e7a-713e-0ff436721f82@ispras.ru>
 <20210331123342.GG1171117@lianli.shorne-pla.net>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <78f2452a-5a26-472d-2bf1-1a2a338eb8d3@ispras.ru>
Date: Wed, 31 Mar 2021 15:48:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210331123342.GG1171117@lianli.shorne-pla.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, proljc@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC'ed Paolo.


On 31.03.2021 15:33, Stafford Horne wrote:
> On Wed, Mar 31, 2021 at 10:27:21AM +0300, Pavel Dovgalyuk wrote:
>> On 31.03.2021 01:05, Stafford Horne wrote:
>>> Hi Pavel,
>>>
>>> Thanks for the patch.
>>>
>>> On Mon, Mar 29, 2021 at 10:42:41AM +0300, Pavel Dovgalyuk wrote:
>>>> This patch adds icount handling to mfspr/mtspr instructions
>>>> that may deal with hardware timers.
>>>>
>>>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>>>> ---
>>>>    target/openrisc/translate.c |   15 +++++++++++++++
>>>>    1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
>>>> index c6dce879f1..a9c81f8bd5 100644
>>>> --- a/target/openrisc/translate.c
>>>> +++ b/target/openrisc/translate.c
>>>> @@ -884,6 +884,18 @@ static bool trans_l_mfspr(DisasContext *dc, arg_l_mfspr *a)
>>>>            gen_illegal_exception(dc);
>>>>        } else {
>>>>            TCGv spr = tcg_temp_new();
>>>> +
>>>> +        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
>>>> +            gen_io_start();
>>>> +            if (dc->delayed_branch) {
>>>> +                tcg_gen_mov_tl(cpu_pc, jmp_pc);
>>>> +                tcg_gen_discard_tl(jmp_pc);
>>>> +            } else {
>>>> +                tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
>>>> +            }
>>>> +            dc->base.is_jmp = DISAS_EXIT;
>>>> +        }
>>>
>>> I don't know alot about how the icount works.  But I read this document to help
>>> understand this patch.
>>>
>>> https://qemu.readthedocs.io/en/latest/devel/tcg-icount.html
>>>
>>> Could you explain why we need to exit the tb on mfspr?  This may just be reading
>>> a timer value, but I am not sure why we need it?
>>
>> Because virtual clock in icount mode is correct only at the end of the
>> block.
>> Allowing virtual clock reads in other places will make execution
>> non-deterministic, because icount is updated to the value, which it gets
>> after the block ends.
> 
> OK, got it.
> 
>>>
>>>>            tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
>>>>            gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
>>>>            tcg_temp_free(spr);
>>>> @@ -898,6 +910,9 @@ static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
>>>>        } else {
>>>>            TCGv spr;
>>>> +        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
>>>> +            gen_io_start();
>>>> +        }
>>>
>>> Here and above, why do we need to call gen_io_start()?  This seems to need to be
>>> called before io operations.
>>
>> gen_io_start allows reading icount for the instruction.
>> It is needed to prevent invalid reads in the middle of the block.
>>
>>>
>>> This may all be OK, but could you help explain the theory of operation?  Also,
>>> have you tested this?
>>
>> I have record/replay tests for openrisc, but I can't submit them without
>> this patch, because they will fail.
> 
> OK.
> 
> Acked-by: Stafford Horne <shorne@gmail.com>
> 
> I am not currently maintaining an openrisc queue, but I could start one.  Do you
> have another way to submit this upstream?

Paolo, can you queue this one?

Pavel Dovgalyuk

