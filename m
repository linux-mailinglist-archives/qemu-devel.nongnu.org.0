Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7A330DD60
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:57:53 +0100 (CET)
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JbM-0006MD-Vd
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7JaB-0005tr-7h
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:56:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7Ja0-0006pA-Uy
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:56:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CCCFAC6E;
 Wed,  3 Feb 2021 14:56:26 +0000 (UTC)
Subject: Re: [PATCH v15 18/23] accel: introduce AccelCPUClass extending
 CPUClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-19-cfontana@suse.de>
 <efc3d892-027d-a480-363d-7aae6a8f8543@redhat.com>
 <1adffa3e-ec17-9c67-7355-0ec5a107c065@suse.de>
 <aaa5f60d-e4c3-282c-3e12-98f8bb87ee76@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <24776aab-56eb-2062-a6d5-db31ff9226a1@suse.de>
Date: Wed, 3 Feb 2021 15:56:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <aaa5f60d-e4c3-282c-3e12-98f8bb87ee76@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 3:51 PM, Philippe Mathieu-Daudé wrote:
> On 2/3/21 3:49 PM, Claudio Fontana wrote:
>> On 2/3/21 3:27 PM, Philippe Mathieu-Daudé wrote:
>>> On 2/1/21 11:08 AM, Claudio Fontana wrote:
>>>> add a new optional interface to CPUClass, which allows accelerators
>>>> to extend the CPUClass with additional accelerator-specific
>>>> initializations.
>>>>
>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>> ---
>>>>  include/hw/core/accel-cpu.h | 35 +++++++++++++++++++++++++++++
>>>>  include/hw/core/cpu.h       |  1 +
>>>>  accel/accel-common.c        | 44 +++++++++++++++++++++++++++++++++++++
>>>>  MAINTAINERS                 |  1 +
>>>>  4 files changed, 81 insertions(+)
>>>>  create mode 100644 include/hw/core/accel-cpu.h
>>>>
>>>> diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
>>>> new file mode 100644
>>>> index 0000000000..c7c137dc9a
>>>> --- /dev/null
>>>> +++ b/include/hw/core/accel-cpu.h
>>>> @@ -0,0 +1,35 @@
>>>> +/*
>>>> + * Accelerator interface, specializes CPUClass
>>>> + *
>>>> + * Copyright 2021 SUSE LLC
>>>> + *
>>>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>>> + * See the COPYING file in the top-level directory.
>>>> + */
>>>> +
>>>> +#ifndef ACCEL_CPU_H
>>>> +#define ACCEL_CPU_H
>>>> +
>>>> +/*
>>>> + * these defines cannot be in cpu.h, because we are using
>>>> + * CPU_RESOLVING_TYPE here.
>>>> + * Use this header to define your accelerator-specific
>>>> + * cpu-specific accelerator interfaces.
>>>> + */
>>>> +


This is the comment to read :-)


>>>> +#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>>>> +#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
>>>> +typedef struct AccelCPUClass AccelCPUClass;
>>>> +DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>>>> +
>>>> +typedef struct AccelCPUClass {
>>>> +    /*< private >*/
>>>> +    ObjectClass parent_class;
>>>> +    /*< public >*/
>>>> +
>>>> +    void (*cpu_class_init)(CPUClass *cc);
>>>> +    void (*cpu_instance_init)(CPUState *cpu);
>>>> +    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
>>>> +} AccelCPUClass;
>>>
>>> This header only makes sense if you forward-declare CPUClass
>>> in "qemu/typedefs.h", so accelerators don't have to include
>>> "hw/core/cpu.h".
>>>
>>
>> Can you clarify what you mean? I don't see how it follows that this header only makes sense if I forward-declare CPUClass.
>>
>> This is necessary for the accel-specific target-specific code that needs to extend cpu classes with Accel CPU interfaces,
>> in this series f.e.:
>>
>> target/i386/kvm/kvm-cpu.c
>> target/i386/hvf/hvf-cpu.c
>> target/i386/tcg/tcg-cpu.c
> 
> Why not keep theses declarations in "hw/core/cpu.h", rather than
> adding a new header? What is the point of the new header?
> 

It is not possible (see comment above).

The header needs to be target-specific, and only can be included by target code, or disaster is ensured.
The part that is in hw/core/cpu.h is the part that can be safely included by both common and target-specific code.

The accel-cpu.h is target-specific.

This is one of the fallouts of our split of code between common, target-specific modules.

It gains us quite a bit in compilation time,
but with the drawback that thinking about these things is quite convoluted sometimes.

Ciao,

CLaudio





