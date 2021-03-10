Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CF8333F8E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:47:14 +0100 (CET)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzBB-0005bM-Gv
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJz9r-0004YT-Nh; Wed, 10 Mar 2021 08:45:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:36094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJz9o-0008JI-3q; Wed, 10 Mar 2021 08:45:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9BCB7AE84;
 Wed, 10 Mar 2021 13:45:39 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] target/arm: Restrict v8M IDAU to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-2-f4bug@amsat.org>
 <51ae2fad-f20e-27f2-2f7b-b7dca331dea3@suse.de>
 <75ce7727-caec-fd63-b2e6-9344e22cfa75@amsat.org>
 <c1b1838e-4b91-5411-42f6-cea97e1f0e81@suse.de>
 <68796aa5-1c75-8a74-fc98-7d929df9478d@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c7a46e45-1682-ad76-a9eb-a155729e8d8f@suse.de>
Date: Wed, 10 Mar 2021 14:45:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <68796aa5-1c75-8a74-fc98-7d929df9478d@amsat.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 2:42 PM, Philippe Mathieu-Daudé wrote:
> On 3/10/21 12:46 PM, Claudio Fontana wrote:
>> On 3/9/21 3:18 PM, Philippe Mathieu-Daudé wrote:
>>> On 3/9/21 2:41 PM, Claudio Fontana wrote:
>>>> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>>>>> IDAU is specific to M-profile. KVM only supports A-profile.
>>>>> Restrict this interface to TCG, as it is pointless (and
>>>>> confusing) on a KVM-only build.
>>>>>
>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>
>>>>
>>>> This one breaks the KVM tests hard though (most of them).
>>>>
>>>> I will try to figure out why.
>>>>
>>>> Ciao,
>>>>
>>>> Claudio
>>>>
>>>>
>>>>> ---
>>>>>  target/arm/cpu.c     | 7 -------
>>>>>  target/arm/cpu_tcg.c | 8 ++++++++
>>>>>  2 files changed, 8 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>>>> index b8bc89e71fc..a772fd4926f 100644
>>>>> --- a/target/arm/cpu.c
>>>>> +++ b/target/arm/cpu.c
>>>>> @@ -2380,12 +2380,6 @@ static const TypeInfo arm_cpu_type_info = {
>>>>>      .class_init = arm_cpu_class_init,
>>>>>  };
>>>>>  
>>>>> -static const TypeInfo idau_interface_type_info = {
>>>>> -    .name = TYPE_IDAU_INTERFACE,
>>>>> -    .parent = TYPE_INTERFACE,
>>>
>>> Hmm this is an interface...
>>>
>>> Is a CPU/machine trying to resolve it?
>>
>> Well, this fails horribly at any qemu-system-aarch64 startup for the kvm-only build:
>>
>> in my view we cannot remove the idau interface until we have removed all the TCG-only boards fronm the build.
> 
> Yes, this is a similar bug to the one fixed by commit 8d0bceba24c
> ("hw/nvram: Always register FW_CFG_DATA_GENERATOR_INTERFACE").
> 
>>
>> When calling qemu_init(), and we get into select_machine(),
>>
>> the object_class_get_list() tries to initialize all machine types.
>>
>> When it does that, it tries to initialize the IDAU interface, and fails.
>>
>> #0  0x0000ffffb9e51828 in raise () at /lib64/libc.so.6
>> #1  0x0000ffffb9e52e4c in abort () at /lib64/libc.so.6
>> #2  0x0000aaaae042a484 in type_initialize (ti=0xaaaaf0cb37c0) at ../qom/object.c:333
>> #3  0x0000aaaae042c06c in object_class_foreach_tramp (key=0xaaaaf0cb3940, value=0xaaaaf0cb37c0, opaque=0xfffff9f2bac8)
>>     at ../qom/object.c:1069
>> #4  0x0000ffffbb3d4248 in g_hash_table_foreach () at /usr/lib64/libglib-2.0.so.0
>> #5  0x0000aaaae042c180 in object_class_foreach (fn=
>>     0xaaaae042c324 <object_class_get_list_tramp>, implements_type=0xaaaae089cc90 "machine", include_abstract=false, opaque=0xfffff9f2bb10)
>>     at ../qom/object.c:1091
>> #6  0x0000aaaae042c3a8 in object_class_get_list (implements_type=0xaaaae089cc90 "machine", include_abstract=false) at ../qom/object.c:1148
>> #7  0x0000aaaae03863d8 in select_machine () at ../softmmu/vl.c:1607
>> #8  0x0000aaaae038ad74 in qemu_init (argc=15, argv=0xfffff9f2be08, envp=0xfffff9f2be88) at ../softmmu/vl.c:3489
>> #9  0x0000aaaadfdcf5a0 in main (argc=15, argv=0xfffff9f2be08, envp=0xfffff9f2be88) at ../softmmu/main.c:49
>>
>>
>> (gdb) frame 2
>> #2  0x0000aaaae042a484 in type_initialize (ti=0xaaaaf0cb37c0) at ../qom/object.c:333
>> 333                     abort();
>> (gdb) p ti[0]
>> $1 = {name = 0xaaaaf0cb3940 "mps2tz", class_size = 408, instance_size = 202224, instance_align = 0, class_init = 
>>     0xaaaae0273408 <mps2tz_class_init>, class_base_init = 0x0, class_data = 0x0, instance_init = 0x0, instance_post_init = 0x0, 
>>   instance_finalize = 0x0, abstract = true, parent = 0xaaaaf0cb3960 "machine", parent_type = 0xaaaaf0cad860, class = 0xaaaaf0d0d830, 
>>   num_interfaces = 1, interfaces = {{typename = 0xaaaaf0cb3980 "idau-interface"}, {typename = 0x0} <repeats 31 times>}}
>>
>>
>> In my view we should revert this until all incompatible boards are disabled
> 
> My view is this is a QOM design problem. Others might hit the
> same issue. It is hard to debug. It should be fixed upfront.
> 
>> In this case, the one failing is MPS2, so the offender is
>>
>> devices/arm-softmmu.mak:CONFIG_MPS2=y
>>
>> from the point of view of the kvm-only build.
>>
>> What I'd suggest is (but I am open to alternatives):
>>
>> * revert this one
>> * complete my arm cleanup series, with now all tests passing
>> * disable the non-KVM boards for KVM-only builds (basically your series)
>> * apply the accelerator classes specializations to ARM
> 
> MPS2TZ uses a Cortex-M33 which is requires TCG.
> The machine shouldn't be present if TCG is not built-in.
> 
> Previous attempt which you acked :)
> "target/arm: Restrict ARMv7 M-profile cpus to TCG accel"
> https://www.mail-archive.com/qemu-block@nongnu.org/msg79943.html
> 

Yes, I would absolutely like to proceed with all of this,

and have only the right configuration for KVM be built,

but I am a bit lost with all these different series.

Ciao,

CLaudio

