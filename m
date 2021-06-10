Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2B3A2CE9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:25:26 +0200 (CEST)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKgX-0007BW-D0
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lrKfb-0006Wp-4t
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:24:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37010
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lrKfZ-0006Fo-3N
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:24:26 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lrKfI-0002Rg-VF; Thu, 10 Jun 2021 14:24:13 +0100
To: Peter Maydell <peter.maydell@linaro.org>,
 Programmingkid <programmingkidx@gmail.com>
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
Date: Thu, 10 Jun 2021 14:24:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: tb_flush() calls causing long Windows XP boot times
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/2021 14:14, Peter Maydell wrote:

> On Thu, 10 Jun 2021 at 14:02, Programmingkid <programmingkidx@gmail.com> wrote:
>>
>> Hi Richard,
>>
>> There is a function called breakpoint_invalidate() in cpu.c that calls a function called tb_flush(). I have determined that this call is being made over 200,000 times when Windows XP boots. Disabling this function makes Windows XP boot way faster than before. The time went down from around 3 minutes to 20 seconds when I applied the patch below.
>>
>> After I applied the patch I ran several tests in my VM's to see if anything broke. I could not find any problems. Here is the list my VM's I tested:
>>
>> Mac OS 10.8 in qemu-system-x86_64
>> Windows 7 in qemu-system-x86_64
>> Windows XP in qemu-system-i386
>> Mac OS 10.4 in qemu-system-ppc
>>
>> I would be happy if the patch below was accepted but I would like to know your thoughts.
> 
>>   cpu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/cpu.c b/cpu.c
>> index bfbe5a66f9..297c2e4281 100644
>> --- a/cpu.c
>> +++ b/cpu.c
>> @@ -253,7 +253,7 @@ static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
>>        * Flush the whole TB cache to force re-translation of such TBs.
>>        * This is heavyweight, but we're debugging anyway.
>>        */
>> -    tb_flush(cpu);
>> +    /* tb_flush(cpu); */
>>   }
>>   #endif
> 
> The patch is clearly wrong -- this function is called when a CPU breakpoint
> is added or removed, and we *must* drop generated code which either
> (a) includes code to take the breakpoint exception and now should not
> or (b) doesn't include code to take the breakpoint exception and now should.
> Otherwise we will incorrectly take/not take a breakpoint exception when
> that stale code is executed.
> 
> As the comment notes, the assumption is that we won't be adding and
> removing breakpoints except when we're debugging and therefore
> performance is not critical. Windows XP is clearly doing something
> we weren't expecting, so we should ideally have a look at whether
> we can be a bit more efficient about not throwing the whole TB
> cache away.

FWIW this was reported a while back on Launchpad as 
https://bugs.launchpad.net/qemu/+bug/1883593 where the performance regression was 
traced back to:

commit b55f54bc965607c45b5010a107a792ba333ba654
Author: Max Filippov <jcmvbkbc@gmail.com>
Date:   Wed Nov 27 14:06:01 2019 -0800

     exec: flush CPU TB cache in breakpoint_invalidate

     When a breakpoint is inserted at location for which there's currently no
     virtual to physical translation no action is taken on CPU TB cache. If a
     TB for that virtual address already exists but is not visible ATM the
     breakpoint won't be hit next time an instruction at that address will be
     executed.

     Flush entire CPU TB cache in breakpoint_invalidate to force
     re-translation of all TBs for the breakpoint address.

     This change fixes the following scenario:
     - linux user application is running
     - a breakpoint is inserted from QEMU gdbstub for a user address that is
       not currently present in the target CPU TLB
     - an instruction at that address is executed, but the external debugger
       doesn't get control.

     Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
     Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
     Message-Id: <20191127220602.10827-2-jcmvbkbc@gmail.com>
     Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Perhaps Windows XP is constantly executing some kind of breakpoint instruction or 
updating some CPU debug registers during boot?


ATB,

Mark.

