Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB486FEDF6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:41:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1rB-0004ii-67; Thu, 11 May 2023 04:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px1r8-0004iK-AV
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:40:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px1r6-0008Ud-Oc
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=deu+u8g8maMRj1sOwH5KDy3/gCTYmvLMaOJCeRJUK9k=; b=xmbJjVeSM3K1aScYbkjdFlRlvP
 5DTVopYgWoR/KsVdfbTUweHq4iGwxrpkp3vbI6CBFnGUcC9yjLD53ZQBVzC7HQ7I4JrosxUkHzoJT
 fGzZwAGrn8FOl5Wj4rgmojWxLE8ZmyG2LhADPkS05YwSZHI8tiN477G2DIYReP2iycmpWXNcXcXac
 Rb7uQKST+5DaHNIElPS+OoKP2+4Af1odNA/0gELbJVZPLvMZxBBcgB9un4X+QE6lQ6zdnPi0282Il
 12ftvQEvMgvt4H8vS+53a8YVzjVumwAVEPBMu3t6uszdFoikwez06aHxYJ2Wk/ZNd0psOCRXIB6WU
 vSIx8F0XhdJI7SMFwTPXnQJFyHEyeWuE51QcELHvQyEQtqovdQKQQPgguSnEopyhRmteE/OSgA+Sq
 CuQCCcsau1d5SjwnU5M0/cugzGQD6l/19+dZp0W/f9lLIOtyh+lM0lYt9+0AndJINuUMBoiyPfRQa
 Yun515uGKpUS4GxeBHilj/4wy0zYGdTrcvnB1sdC9/X4nFcuiIGrwoRsqsGCwKYMwnz1Zqg9Mrica
 wkukoHpk2k+4azXzug3pJw2QBE2ROMSuLZx0upi/Cf3KHH3xL9/ota/5y+QPo53OKN/hZJUroRNp4
 AjaasXdOahrmQFPJQ9Xmqt0/403J6G5aFtwyS3zJA=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px1q2-0008Xw-5D; Thu, 11 May 2023 09:39:54 +0100
Message-ID: <fc35257d-8af0-8aa1-af88-982c7506bfa5@ilande.co.uk>
Date: Thu, 11 May 2023 09:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230405185922.2122668-1-richard.henderson@linaro.org>
 <2d46a274-8234-a635-81ca-c79c2969cb7b@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <2d46a274-8234-a635-81ca-c79c2969cb7b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-8.1] target/sparc: Use tcg_gen_lookup_and_goto_ptr
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/05/2023 11:23, Richard Henderson wrote:

> Ping.
> 
> r~
> 
> On 4/5/23 19:59, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/sparc/translate.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
>> index 137bdc5159..47940fd85e 100644
>> --- a/target/sparc/translate.c
>> +++ b/target/sparc/translate.c
>> @@ -322,7 +322,7 @@ static void gen_goto_tb(DisasContext *s, int tb_num,
>>           /* jump to another page: currently not optimized */
>>           tcg_gen_movi_tl(cpu_pc, pc);
>>           tcg_gen_movi_tl(cpu_npc, npc);
>> -        tcg_gen_exit_tb(NULL, 0);
>> +        tcg_gen_lookup_and_goto_ptr();
>>       }
>>   }
>> @@ -4153,7 +4153,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int 
>> insn)
>>                                   /* End TB to notice changed ASI.  */
>>                                   save_state(dc);
>>                                   gen_op_next_insn();
>> -                                tcg_gen_exit_tb(NULL, 0);
>> +                                tcg_gen_lookup_and_goto_ptr();
>>                                   dc->base.is_jmp = DISAS_NORETURN;
>>                                   break;
>>                               case 0x6: /* V9 wrfprs */
>> @@ -4162,7 +4162,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int 
>> insn)
>>                                   dc->fprs_dirty = 0;
>>                                   save_state(dc);
>>                                   gen_op_next_insn();
>> -                                tcg_gen_exit_tb(NULL, 0);
>> +                                tcg_gen_lookup_and_goto_ptr();
>>                                   dc->base.is_jmp = DISAS_NORETURN;
>>                                   break;
>>                               case 0xf: /* V9 sir, nop if user */
>> @@ -5661,7 +5661,7 @@ static void sparc_tr_tb_stop(DisasContextBase *dcbase, 
>> CPUState *cs)
>>                   tcg_gen_movi_tl(cpu_pc, dc->pc);
>>               }
>>               save_npc(dc);
>> -            tcg_gen_exit_tb(NULL, 0);
>> +            tcg_gen_lookup_and_goto_ptr();
>>           }
>>           break;

Obviously nothing notionally against this patch, however if you could give me a few 
days to run my OpenBIOS SPARC32/SPARC64 boot tests against git master with this patch 
applied to double-check there are no regressions, that would be great.


ATB,

Mark.


