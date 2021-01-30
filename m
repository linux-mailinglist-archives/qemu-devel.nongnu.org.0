Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B2309492
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 11:54:45 +0100 (CET)
Received: from localhost ([::1]:33334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5nts-0006U1-Ce
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 05:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l5nsh-00061e-Mj
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 05:53:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:35472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l5nsg-0001De-2s
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 05:53:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A939AC45;
 Sat, 30 Jan 2021 10:53:28 +0000 (UTC)
Subject: Re: [PATCH v14 18/22] accel: introduce AccelCPUClass extending
 CPUClass
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-19-cfontana@suse.de>
 <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
 <9a51a203-f6a8-686f-7859-475537b3607a@suse.de> <878s8dujj5.fsf@linaro.org>
 <40ed971e-a4fe-77c5-94b9-28691874ee32@redhat.com>
 <0943e736-6847-4b6a-8433-f28f4692a299@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <aaafff05-f3c6-ef44-2d98-f6fcb74ccf64@suse.de>
Date: Sat, 30 Jan 2021 11:53:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0943e736-6847-4b6a-8433-f28f4692a299@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 1:13 AM, Richard Henderson wrote:
> On 1/28/21 6:29 AM, Philippe Mathieu-Daudé wrote:
>> On 1/28/21 5:08 PM, Alex Bennée wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> On 1/28/21 2:03 PM, Philippe Mathieu-Daudé wrote:
>>>>> On 1/28/21 10:28 AM, Claudio Fontana wrote:
>>> <snip>
>>>>>> +
>>>>>> +#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>>>>>> +#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
>>>>>> +typedef struct AccelCPUClass AccelCPUClass;
>>>>>> +DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>>>>>> +
>>>>>> +typedef struct AccelCPUClass {
>>>>>> +    /*< private >*/
>>>>>> +    ObjectClass parent_class;
>>>>>> +    /*< public >*/
>>>>>> +
>>>>>> +    void (*cpu_class_init)(CPUClass *cc);
>>>>>> +    void (*cpu_instance_init)(CPUState *cpu);
>>>>>> +    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
>>>>>
>>>>> If we want callers to check errp, better have the prototype return
>>>>> a boolean.
>>>>
>>>> Good point, the whole errp thing is worth revisiting in the series,
>>>> there are many cases (which are basically reproduced in the refactoring from existing code),
>>>> where errp is passed but is really unused.
>>>>
>>>> I am constantly internally debating whether to remove the parameter altogether, or to keep it in there.
>>>>
>>>> What would you suggest?
>>>
>>> I think it really depends on if we can expect the realizefn to usefully
>>> return an error message that can be read and understood by the user. I
>>> guess this comes down to how much user config is going to be checked at
>>> the point we realize the CPU?
>>
>> cpu_realize() is were various feature checks are, isn't it?
>>
>>   -cpu mycpu,feat1=on,feat2=off
>>   CPU 'mycpu' can not disable feature 'feat2' because of REASON.
> 
> Yes.  And while changing the return type of realize is probably a good idea, it
> should be a separate patch.
> 
> 
> r~
> 

To summarize:

1) accel->cpu_realizefn extends the current cpu target-specific realize functions with accelerator-specific code,
   which currently does not make use of errp at all (thus, the temptation to remove errp from the interface until it is actually needed by a target).

2) Regarding the target-specific cpu realize functions themselves, registered with the pattern:

   device_class_set_parent_realize(dc, x86_cpu_realizefn, &xcc->parent_realize);
   device_class_set_parent_realize(dc, arm_cpu_realizefn, &acc->parent_realize);

   ... etc ...

   these currently all return void, and the code that realizes devices (f.e. in hw/core/qdev.c)
   calls these callbacks like this:

   static void device_set_realized(...)
   {
   ...
        if (dc->realize) {
            dc->realize(dev, &local_err);
            if (local_err != NULL) {
                goto fail;
            }
        }

   Ie it does not expect a bool return type for realize().

   So making realize return bool means changing all the realize functions for all devices in my view,
   which I don't think should be crammed in here..

Wdty?

Thanks,

Claudio

