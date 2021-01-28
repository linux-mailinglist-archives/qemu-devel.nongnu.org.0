Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0263076FA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:24:06 +0100 (CET)
Received: from localhost ([::1]:39406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57HJ-0006dW-FM
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l57Fl-000647-U4
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:22:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:58066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l57Fk-0006EN-7n
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:22:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89AF7ACB7;
 Thu, 28 Jan 2021 13:22:26 +0000 (UTC)
Subject: Re: [PATCH v14 18/22] accel: introduce AccelCPUClass extending
 CPUClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-19-cfontana@suse.de>
 <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <9a51a203-f6a8-686f-7859-475537b3607a@suse.de>
Date: Thu, 28 Jan 2021 14:22:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 2:03 PM, Philippe Mathieu-Daudé wrote:
> On 1/28/21 10:28 AM, Claudio Fontana wrote:
>> add a new optional interface to CPUClass,
>> which allows accelerators to extend the CPUClass
>> with additional accelerator-specific initializations.
>>
>> Add the field before tcg_ops, and mark tcg_ops as
>> needing to be last in the struct until we rework this
>> further in a later patch.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  include/hw/core/accel-cpu.h | 35 +++++++++++++++++++++++++++++
>>  include/hw/core/cpu.h       |  1 +
>>  accel/accel-common.c        | 44 +++++++++++++++++++++++++++++++++++++
>>  MAINTAINERS                 |  1 +
>>  4 files changed, 81 insertions(+)
>>  create mode 100644 include/hw/core/accel-cpu.h
>>
>> diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
>> new file mode 100644
>> index 0000000000..246b3e2fcb
>> --- /dev/null
>> +++ b/include/hw/core/accel-cpu.h
>> @@ -0,0 +1,35 @@
>> +/*
>> + * Accelerator interface, specializes CPUClass
>> + *
>> + * Copyright 2020 SUSE LLC
> 
> 2020-2021 ;)

Thanks Philippe,

will check them all! It's a bright new year!

> 
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef ACCEL_CPU_H
>> +#define ACCEL_CPU_H
>> +
>> +/*
>> + * these defines cannot be in cpu.h, because we are using
>> + * CPU_RESOLVING_TYPE here.
>> + * Use this header to define your accelerator-specific
>> + * cpu-specific accelerator interfaces.
>> + */
>> +
>> +#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>> +#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
>> +typedef struct AccelCPUClass AccelCPUClass;
>> +DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>> +
>> +typedef struct AccelCPUClass {
>> +    /*< private >*/
>> +    ObjectClass parent_class;
>> +    /*< public >*/
>> +
>> +    void (*cpu_class_init)(CPUClass *cc);
>> +    void (*cpu_instance_init)(CPUState *cpu);
>> +    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
> 
> If we want callers to check errp, better have the prototype return
> a boolean.

Good point, the whole errp thing is worth revisiting in the series,
there are many cases (which are basically reproduced in the refactoring from existing code),
where errp is passed but is really unused.

I am constantly internally debating whether to remove the parameter altogether, or to keep it in there.

What would you suggest?

> 
>> +} AccelCPUClass;
> 
> 

Thanks for looking at this,

Claudio

