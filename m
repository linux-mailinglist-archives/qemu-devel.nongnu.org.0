Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD86530F1E9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:19:37 +0100 (CET)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cfg-00007h-Vd
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7cej-0007pe-W1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:18:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:42972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7cef-00025B-41
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:18:37 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16112B009;
 Thu,  4 Feb 2021 11:18:31 +0000 (UTC)
Subject: Re: [PATCH v15 04/23] cpu: Move synchronize_from_tb() to tcg_ops
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-5-cfontana@suse.de> <87r1lxsblj.fsf@linaro.org>
 <acdec213-e1d1-4ad8-6636-9bd9eb6dddd7@suse.de>
Message-ID: <3a64b90c-90f5-864d-c432-0412ba429aa1@suse.de>
Date: Thu, 4 Feb 2021 12:18:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <acdec213-e1d1-4ad8-6636-9bd9eb6dddd7@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 1:31 PM, Claudio Fontana wrote:
> On 2/3/21 11:11 AM, Alex Bennée wrote:
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>
>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>>
>>> [claudio: wrapped target code in CONFIG_TCG]
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  include/hw/core/cpu.h     | 20 +++++++++++---------
>>>  accel/tcg/cpu-exec.c      |  4 ++--
>>>  target/arm/cpu.c          |  4 +++-
>>>  target/avr/cpu.c          |  2 +-
>>>  target/hppa/cpu.c         |  2 +-
>>>  target/i386/tcg/tcg-cpu.c |  2 +-
>>>  target/microblaze/cpu.c   |  2 +-
>>>  target/mips/cpu.c         |  4 +++-
>>>  target/riscv/cpu.c        |  2 +-
>>>  target/rx/cpu.c           |  2 +-
>>>  target/sh4/cpu.c          |  2 +-
>>>  target/sparc/cpu.c        |  2 +-
>>>  target/tricore/cpu.c      |  2 +-
>>>  13 files changed, 28 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index d0b17dcc4c..b9803885e5 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -86,6 +86,17 @@ typedef struct TcgCpuOperations {
>>>       * Called when the first CPU is realized.
>>>       */
>>>      void (*initialize)(void);
>>> +    /**
>>> +     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
>>> +     *
>>> +     * This is called when we abandon execution of a TB before
>>> +     * starting it, and must set all parts of the CPU state which
>>> +     * the previous TB in the chain may not have updated. This
>>> +     * will need to do more. If this hook is not implemented then
>>> +     * the default is to call @set_pc(tb->pc).
>>> +     */
>>> +    void (*synchronize_from_tb)(CPUState *cpu,
>>> +                                const struct TranslationBlock *tb);
>>
>> Did you miss my comment last time or just not think it flowed better?
>>
>>   ...TB in the chain may not have updated. By default when no hook is
>>   defined a call is made to @set_pc(tb->pc). If more state needs to be
>>   restored the front-end must provide a hook function and restore all the
>>   state there.
>>
>> Either way:
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>
> 
> Hi Alex, sorry for missing this change, can add it for the next respin,
> 
> and thanks for looking at this,
> 
> Ciao,
> 
> Claudio

    /**                                                                                                                                     
     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock                                                                 
     *                                                                                                                                      
     * This is called when we abandon execution of a TB before starting it,                                                                 
     * and must set all parts of the CPU state which the previous TB in the                                                                 
     * chain may not have updated.                                                                                                          
     * By default, when this is NULL, a call is made to @set_pc(tb->pc).                                                                    
     *                                                                                                                                      
     * If more state needs to be restored, the target must implement a                                                                      
     * function to restore all the state, and register it here.                                                                             
     */


I changed the wording a bit, because to me it is easier to think about "target" than about "front-end", but maybe I am missing something.
I am also not in love with the term hook, we are trying to end up with a proper interface, as we complete this series,
a nice struct that the target can provide with all the functions necessary to implement the TCG operations.

Let me know if this requires additional revision,

Ciao,

CLaudio


