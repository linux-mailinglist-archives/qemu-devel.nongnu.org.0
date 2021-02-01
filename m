Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D69630A295
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 08:22:51 +0100 (CET)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6TXt-0006ks-SX
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 02:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l6TWZ-0005u2-AO
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:21:29 -0500
Received: from mail.ispras.ru ([83.149.199.84]:34356)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l6TWU-00067m-GX
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:21:27 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 94E5C407626D;
 Mon,  1 Feb 2021 07:21:14 +0000 (UTC)
Subject: Re: [PATCH] util/log: flush TB cache when log level changes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
 <87y2glry84.fsf@linaro.org> <56ff4770-3e01-ef72-e054-fdc93533a3b3@ispras.ru>
 <87y2ghmfb0.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <08a7b260-b787-9528-d96a-3b6d8879248b@ispras.ru>
Date: Mon, 1 Feb 2021 10:21:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87y2ghmfb0.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.079,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.01.2021 14:09, Alex Bennée wrote:
> 
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
> 
>> On 22.01.2021 14:42, Alex Bennée wrote:
>>>
>>> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
>>>
>>>> Sometimes we need to collect the translation logs starting
>>>> from some point of the execution. Some TB listings may
>>>> be missed in this case, when blocks were translated before.
>>>> This patch clears TB cache to allow re-translation of such
>>>> code blocks.
>>>>
>>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>>> ---
>>>>    accel/tcg/translate-all.c |    8 ++++++++
>>>>    include/sysemu/tcg.h      |    1 +
>>>>    stubs/meson.build         |    1 +
>>>>    stubs/tcg.c               |   12 ++++++++++++
>>>>    util/log.c                |    3 +++
>>>>    5 files changed, 25 insertions(+)
>>>>    create mode 100644 stubs/tcg.c
>>>>
>>>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>>>> index e9de6ff9dd..3acb227c57 100644
>>>> --- a/accel/tcg/translate-all.c
>>>> +++ b/accel/tcg/translate-all.c
>>>> @@ -1461,6 +1461,14 @@ void tb_flush(CPUState *cpu)
>>>>        }
>>>>    }
>>>>    
>>>> +void tb_flush_all(void)
>>>> +{
>>>> +    CPUState *cpu;
>>>> +    CPU_FOREACH(cpu) {
>>>> +        tb_flush(cpu);
>>>> +    }
>>>> +}
>>>> +
>>>
>>> This isn't needed - tb_flush flushes all translations although it does
>>> need to be executed in a CPU context to do so.
>>>
>>>>    /*
>>>>     * Formerly ifdef DEBUG_TB_CHECK. These debug functions are user-mode-only,
>>>>     * so in order to prevent bit rot we compile them unconditionally in user-mode,
>>>> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
>>>> index 00349fb18a..7415f11022 100644
>>>> --- a/include/sysemu/tcg.h
>>>> +++ b/include/sysemu/tcg.h
>>>> @@ -9,6 +9,7 @@
>>>>    #define SYSEMU_TCG_H
>>>>    
>>>>    void tcg_exec_init(unsigned long tb_size, int splitwx);
>>>> +void tb_flush_all(void);
>>>>    
>>>>    #ifdef CONFIG_TCG
>>>>    extern bool tcg_allowed;
>>>> diff --git a/stubs/meson.build b/stubs/meson.build
>>>> index 80b1d81a31..95e70f8542 100644
>>>> --- a/stubs/meson.build
>>>> +++ b/stubs/meson.build
>>>> @@ -38,6 +38,7 @@ stub_ss.add(files('set-fd-handler.c'))
>>>>    stub_ss.add(files('sysbus.c'))
>>>>    stub_ss.add(files('target-get-monitor-def.c'))
>>>>    stub_ss.add(files('target-monitor-defs.c'))
>>>> +stub_ss.add(files('tcg.c'))
>>>>    stub_ss.add(files('tpm.c'))
>>>>    stub_ss.add(files('trace-control.c'))
>>>>    stub_ss.add(files('uuid.c'))
>>>> diff --git a/stubs/tcg.c b/stubs/tcg.c
>>>> new file mode 100644
>>>> index 0000000000..775a748c77
>>>> --- /dev/null
>>>> +++ b/stubs/tcg.c
>>>> @@ -0,0 +1,12 @@
>>>> +/*
>>>> + * TCG stubs
>>>> + *
>>>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>>> + * See the COPYING file in the top-level directory.
>>>> + */
>>>> +
>>>> +#include "sysemu/tcg.h"
>>>> +
>>>> +void tb_flush_all(void)
>>>> +{
>>>> +}
>>>> diff --git a/util/log.c b/util/log.c
>>>> index 2ee1500bee..2ff342a91b 100644
>>>> --- a/util/log.c
>>>> +++ b/util/log.c
>>>> @@ -26,6 +26,7 @@
>>>>    #include "trace/control.h"
>>>>    #include "qemu/thread.h"
>>>>    #include "qemu/lockable.h"
>>>> +#include "sysemu/tcg.h"
>>>>    
>>>>    static char *logfilename;
>>>>    static QemuMutex qemu_logfile_mutex;
>>>> @@ -84,6 +85,8 @@ void qemu_set_log(int log_flags)
>>>>    #ifdef CONFIG_TRACE_LOG
>>>>        qemu_loglevel |= LOG_TRACE;
>>>>    #endif
>>>> +    tb_flush_all();
>>>> +
>>>
>>> I would call tb_flush(current_cpu) or first_cpu here. But two things:
>>>
>>>    - I'm not sure you have a CPU at all times qemu_set_log is called
>>>    - It seems overly aggressive to throw away all translations every time
>>>      the log level is changed. I would define a mask in log.h and have
>>>      something like:
>>
>> Do you propose removing the parameter from tb_flush or omitting the loop
>> from tb_flush_all?
> 
> No tb_flush should keep the CPU interface. In normal usage from the
> emulation we always have a CPU to call. However for qemu_set_log you
> will need to find a CPU to call or bail out if you can't. Maybe

It the following true? We can't get rid of CPU in tb_flush, because 
do_tb_flush must be executed in vCPU thread.
Can one CPU break others execution in case of SMP? Can we move flush to 
BH somehow?

> something like:
> 
>    CPUStatus *cpu = current_cpu || first_cpu;
>    if (cpu) {
>        tb_flush(cpu);
>    }
> 

Then we'll have to expose all this CPU stuff to utils and add stubs for 
them.

> my only worry is if qemu_set_log is called from outside a CPU context
> (current_cpu will always be NULL) while first_cpu is in a exclusive
> region. We could extend cpu_in_exclusive_context to be:
> 
>    cpu == current_cpu && cpu->in_exclusive_context
> 
> but that seems a little icky to me. Paolo, any thoughts?
> 
>>
>>>     if (log_flags & LOG_TRANSLATION) {
>>>         tb_flush();
>>>     }
>>>
>>>>        /*
>>>>         * In all cases we only log if qemu_loglevel is set.
>>>>         * Also:
>>>
>>>
> 
> 


