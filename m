Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E1A333BC1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:48:34 +0100 (CET)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxKL-0003cr-4D
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJxIL-0002Xz-9c; Wed, 10 Mar 2021 06:46:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:52134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJxIJ-00050l-8W; Wed, 10 Mar 2021 06:46:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B29FAE78;
 Wed, 10 Mar 2021 11:46:25 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] target/arm: Restrict v8M IDAU to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-2-f4bug@amsat.org>
 <51ae2fad-f20e-27f2-2f7b-b7dca331dea3@suse.de>
 <75ce7727-caec-fd63-b2e6-9344e22cfa75@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c1b1838e-4b91-5411-42f6-cea97e1f0e81@suse.de>
Date: Wed, 10 Mar 2021 12:46:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <75ce7727-caec-fd63-b2e6-9344e22cfa75@amsat.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 3:18 PM, Philippe Mathieu-Daudé wrote:
> On 3/9/21 2:41 PM, Claudio Fontana wrote:
>> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>>> IDAU is specific to M-profile. KVM only supports A-profile.
>>> Restrict this interface to TCG, as it is pointless (and
>>> confusing) on a KVM-only build.
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>>
>> This one breaks the KVM tests hard though (most of them).
>>
>> I will try to figure out why.
>>
>> Ciao,
>>
>> Claudio
>>
>>
>>> ---
>>>  target/arm/cpu.c     | 7 -------
>>>  target/arm/cpu_tcg.c | 8 ++++++++
>>>  2 files changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index b8bc89e71fc..a772fd4926f 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -2380,12 +2380,6 @@ static const TypeInfo arm_cpu_type_info = {
>>>      .class_init = arm_cpu_class_init,
>>>  };
>>>  
>>> -static const TypeInfo idau_interface_type_info = {
>>> -    .name = TYPE_IDAU_INTERFACE,
>>> -    .parent = TYPE_INTERFACE,
> 
> Hmm this is an interface...
> 
> Is a CPU/machine trying to resolve it?

Well, this fails horribly at any qemu-system-aarch64 startup for the kvm-only build:

in my view we cannot remove the idau interface until we have removed all the TCG-only boards fronm the build.

When calling qemu_init(), and we get into select_machine(),

the object_class_get_list() tries to initialize all machine types.

When it does that, it tries to initialize the IDAU interface, and fails.

#0  0x0000ffffb9e51828 in raise () at /lib64/libc.so.6
#1  0x0000ffffb9e52e4c in abort () at /lib64/libc.so.6
#2  0x0000aaaae042a484 in type_initialize (ti=0xaaaaf0cb37c0) at ../qom/object.c:333
#3  0x0000aaaae042c06c in object_class_foreach_tramp (key=0xaaaaf0cb3940, value=0xaaaaf0cb37c0, opaque=0xfffff9f2bac8)
    at ../qom/object.c:1069
#4  0x0000ffffbb3d4248 in g_hash_table_foreach () at /usr/lib64/libglib-2.0.so.0
#5  0x0000aaaae042c180 in object_class_foreach (fn=
    0xaaaae042c324 <object_class_get_list_tramp>, implements_type=0xaaaae089cc90 "machine", include_abstract=false, opaque=0xfffff9f2bb10)
    at ../qom/object.c:1091
#6  0x0000aaaae042c3a8 in object_class_get_list (implements_type=0xaaaae089cc90 "machine", include_abstract=false) at ../qom/object.c:1148
#7  0x0000aaaae03863d8 in select_machine () at ../softmmu/vl.c:1607
#8  0x0000aaaae038ad74 in qemu_init (argc=15, argv=0xfffff9f2be08, envp=0xfffff9f2be88) at ../softmmu/vl.c:3489
#9  0x0000aaaadfdcf5a0 in main (argc=15, argv=0xfffff9f2be08, envp=0xfffff9f2be88) at ../softmmu/main.c:49


(gdb) frame 2
#2  0x0000aaaae042a484 in type_initialize (ti=0xaaaaf0cb37c0) at ../qom/object.c:333
333                     abort();
(gdb) p ti[0]
$1 = {name = 0xaaaaf0cb3940 "mps2tz", class_size = 408, instance_size = 202224, instance_align = 0, class_init = 
    0xaaaae0273408 <mps2tz_class_init>, class_base_init = 0x0, class_data = 0x0, instance_init = 0x0, instance_post_init = 0x0, 
  instance_finalize = 0x0, abstract = true, parent = 0xaaaaf0cb3960 "machine", parent_type = 0xaaaaf0cad860, class = 0xaaaaf0d0d830, 
  num_interfaces = 1, interfaces = {{typename = 0xaaaaf0cb3980 "idau-interface"}, {typename = 0x0} <repeats 31 times>}}


In my view we should revert this until all incompatible boards are disabled

In this case, the one failing is MPS2, so the offender is

devices/arm-softmmu.mak:CONFIG_MPS2=y

from the point of view of the kvm-only build.

What I'd suggest is (but I am open to alternatives):

* revert this one
* complete my arm cleanup series, with now all tests passing
* disable the non-KVM boards for KVM-only builds (basically your series)
* apply the accelerator classes specializations to ARM



> 
>>> -    .class_size = sizeof(IDAUInterfaceClass),
>>> -};
>>> -
>>>  static void arm_cpu_register_types(void)
>>>  {
>>>      const size_t cpu_count = ARRAY_SIZE(arm_cpus);
>>> @@ -2399,7 +2393,6 @@ static void arm_cpu_register_types(void)
>>>      if (cpu_count) {
>>>          size_t i;
>>>  
>>> -        type_register_static(&idau_interface_type_info);
>>>          for (i = 0; i < cpu_count; ++i) {
>>>              arm_cpu_register(&arm_cpus[i]);
>>>          }
>>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>>> index c29b434c60d..fb07a336939 100644
>>> --- a/target/arm/cpu_tcg.c
>>> +++ b/target/arm/cpu_tcg.c
>>> @@ -14,6 +14,7 @@
>>>  #include "hw/core/tcg-cpu-ops.h"
>>>  #endif /* CONFIG_TCG */
>>>  #include "internals.h"
>>> +#include "target/arm/idau.h"
>>>  
>>>  /* CPU models. These are not needed for the AArch64 linux-user build. */
>>>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>>> @@ -739,10 +740,17 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
>>>      { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
>>>  };
>>>  
>>> +static const TypeInfo idau_interface_type_info = {
>>> +    .name = TYPE_IDAU_INTERFACE,
>>> +    .parent = TYPE_INTERFACE,
>>> +    .class_size = sizeof(IDAUInterfaceClass),
>>> +};
>>> +
>>>  static void arm_tcg_cpu_register_types(void)
>>>  {
>>>      size_t i;
>>>  
>>> +    type_register_static(&idau_interface_type_info);
>>>      for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
>>>          arm_cpu_register(&arm_tcg_cpus[i]);
>>>      }
>>>
>>
>>


