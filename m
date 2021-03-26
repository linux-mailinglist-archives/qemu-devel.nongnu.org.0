Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C158434A835
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:37:19 +0100 (CET)
Received: from localhost ([::1]:40352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmeM-0006QI-TF
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPmcl-0005Mu-5h
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:35:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:52226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPmci-0005Oo-WD
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:35:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5434FAB8A;
 Fri, 26 Mar 2021 13:35:35 +0000 (UTC)
Subject: Re: [RFC v11 45/55] target/arm: cpu-sve: new module
From: Claudio Fontana <cfontana@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-38-cfontana@suse.de>
 <724c86f8-2275-833b-d4e1-4729c0ca2e80@linaro.org>
 <143fde2e-6c88-8fef-10ff-523c574e0db4@suse.de>
Message-ID: <8378d23f-a838-4d1c-ac59-9101e0dfbbd3@suse.de>
Date: Fri, 26 Mar 2021 14:35:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <143fde2e-6c88-8fef-10ff-523c574e0db4@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 7:48 PM, Claudio Fontana wrote:
> On 3/25/21 7:40 PM, Richard Henderson wrote:
>> On 3/23/21 9:46 AM, Claudio Fontana wrote:
>>> extract the SVE-related cpu object properties and functions,
>>> and move them to a separate module.
>>>
>>> Disentangle SVE from pauth that is a separate, TCG-only feature.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>   target/arm/cpu-sve.h     |  40 +++++
>>>   target/arm/cpu.h         |  22 +--
>>>   target/arm/cpu-sve.c     | 360 +++++++++++++++++++++++++++++++++++++++
>>>   target/arm/cpu.c         |   5 +-
>>>   target/arm/cpu64.c       | 333 +-----------------------------------
>>>   target/arm/kvm/kvm-cpu.c |   2 +-
>>>   target/arm/meson.build   |   1 +
>>>   7 files changed, 417 insertions(+), 346 deletions(-)
>>>   create mode 100644 target/arm/cpu-sve.h
>>>   create mode 100644 target/arm/cpu-sve.c
>>>
>>> diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
>>> new file mode 100644
>>> index 0000000000..b1be575265
>>> --- /dev/null
>>> +++ b/target/arm/cpu-sve.h
>>> @@ -0,0 +1,40 @@
>>> +/*
>>> + * QEMU AArch64 CPU SVE Extensions for TARGET_AARCH64
>>> + *
>>> + * Copyright (c) 2013 Linaro Ltd
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * as published by the Free Software Foundation; either version 2
>>> + * of the License, or (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * along with this program; if not, see
>>> + * <http://www.gnu.org/licenses/gpl-2.0.html>
>>> + */
>>> +
>>> +#ifndef CPU_SVE_H
>>> +#define CPU_SVE_H
>>> +
>>> +/* note: SVE is an AARCH64-only option, only include this for TARGET_AARCH64 */
>>> +
>>> +/* called by arm_cpu_finalize_features in realizefn */
>>> +void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
>>> +
>>> +/* add the CPU SVE properties */
>>> +void cpu_sve_add_props(Object *obj);
>>> +
>>> +/* add the CPU SVE properties specific to the "MAX" CPU */
>>> +void cpu_sve_add_props_max(Object *obj);
>>> +
>>> +/* In AArch32 mode, predicate registers do not exist at all.  */
>>> +typedef struct ARMPredicateReg {
>>> +    uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
>>> +} ARMPredicateReg;
>>
>> I don't agree with moving this out of cpu.h, next to the rest of the vector 
>> definitions.
>>
>> I agree that we should be using more files, but if we're going to have an 
>> cpu-sve.c, why did some of the sve functions go into cpu-common.c?


actually, now that the option of making those SVE functions in cpu-common.c TARGET_AARCH64-specific is open,
we could attempt to import them in cpu-sve.

I'll give it a try, lets see the result.


> 
> maybe cpu-sve-props.c would be a better name, it really contains only cpu sve properties code.
> 
>>
>> I don't agree with moving functions and renaming them simultaneously.  I'm not 
>> even sure why you're renaming them, or why you've suddenly chosen "cpu_sve_*" 
>> as the prefix to use.
>>
>>
>> r~
>>
> 
> I think the idea was trying to create a cpu_sve module handling everything related to sve,
> and consistently using the name of the module as the prefix.
> 
> It might be too early to attempt that anyway; as you noted, there is other SVE-related functionality all over the place,
> so better to revisit this.
> 
> I'd suggest renaming this to cpu_sve_props, and moving everything not props related out of it.
> 
> Thanks,
> 
> Claudio
> 
> 
> 
> 


