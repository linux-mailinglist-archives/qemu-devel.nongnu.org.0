Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B2322AAE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 13:41:03 +0100 (CET)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEWzu-0006UB-7f
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 07:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEWy2-00063V-PN
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:39:08 -0500
Received: from mx2.suse.de ([195.135.220.15]:44298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEWxu-0003Ho-03
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:39:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C944AC69;
 Tue, 23 Feb 2021 12:38:55 +0000 (UTC)
Subject: Re: [RFC v1 34/38] target/arm: cpu: only initialize TCG gt timers
 under CONFIG_TCG
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-35-cfontana@suse.de> <87v9ak5cz0.fsf@linaro.org>
 <03502e51-99f5-239d-42a6-e57892faa297@suse.de> <87wnuz3v0u.fsf@linaro.org>
 <b93a69bd-e8db-bf4a-2357-be51151c2c13@suse.de>
Message-ID: <2b3556b7-8f10-5c59-d098-7d1ca0598e8b@suse.de>
Date: Tue, 23 Feb 2021 13:38:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b93a69bd-e8db-bf4a-2357-be51151c2c13@suse.de>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 12:36 PM, Claudio Fontana wrote:
> On 2/23/21 12:01 PM, Alex Bennée wrote:
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> On 2/22/21 4:34 PM, Alex Bennée wrote:
>>>>
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>
>>>>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>>>>
>>>>> KVM has its own cpu->kvm_vtime.
>>>>>
>>>>> Adjust cpu vmstate by putting unused fields instead of the
>>>>> VMSTATE_TIMER_PTR when TCG is not available.
>>>>>
>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>> ---
>>>>>  target/arm/cpu.c     | 4 +++-
>>>>>  target/arm/machine.c | 5 +++++
>>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>>>> index 1d81a1e7ac..b929109054 100644
>>>>> --- a/target/arm/cpu.c
>>>>> +++ b/target/arm/cpu.c
>>>>> @@ -1322,6 +1322,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>>>>          }
>>>>>      }
>>>>>  
>>>>> +#ifdef CONFIG_TCG
>>>>>      {
>>>>>          uint64_t scale;
>>>>>  
>>>>> @@ -1347,7 +1348,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>>>>          cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
>>>>>                                                    arm_gt_hvtimer_cb, cpu);
>>>>>      }
>>>>> -#endif
>>>>> +#endif /* CONFIG_TCG */
>>>>> +#endif /* !CONFIG_USER_ONLY */
>>>>>  
>>>>>      cpu_exec_realizefn(cs, &local_err);
>>>>>      if (local_err != NULL) {
>>>>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>>>>> index 666ef329ef..13d7c6d930 100644
>>>>> --- a/target/arm/machine.c
>>>>> +++ b/target/arm/machine.c
>>>>> @@ -822,8 +822,13 @@ const VMStateDescription vmstate_arm_cpu = {
>>>>>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>>>>>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>>>>>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
>>>>> +#ifdef CONFIG_TCG
>>>>>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
>>>>>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
>>>>> +#else
>>>>> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
>>>>> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
>>>>> +#endif /* CONFIG_TCG */
>>>>
>>>> I'm not sure this is correct - VMSTATE_TIMER_PTR chases the links to
>>>> just expose expired time but QEMUTimer has more in it than that. Paolo
>>>
>>>
>>> I am not sure I follow can you state more precisely where the issue could be?
>>>
>>> it's not a VMSTATE_TIMER, it's a VMSTATE_TIMER_PTR,
>>> it ends up in VMSTATE_POINTER where a single pointer is assigned;
>>
>> Does it? I thought it ended up with the .expire_time (int64_t) which
>> will be bigger than sizeof(QemuTimer *) on a 32 bit system.
> 
> Ok I understand what you mean. Lets see:
> 
> Looking at vmstate.h,
> 
> #define VMSTATE_TIMER_PTR(_f, _s)                                         \
>     VMSTATE_TIMER_PTR_V(_f, _s, 0)
> 
> #define VMSTATE_TIMER_PTR_V(_f, _s, _v)                                   \
>     VMSTATE_POINTER(_f, _s, _v, vmstate_info_timer, QEMUTimer *)
> 
> #define VMSTATE_POINTER(_field, _state, _version, _info, _type) {    \
>     .name       = (stringify(_field)),                               \
>     .version_id = (_version),                                        \
>     .info       = &(_info),                                          \
>     .size       = sizeof(_type),                                     \
>     .flags      = VMS_SINGLE|VMS_POINTER,                            \
>     .offset     = vmstate_offset_value(_state, _field, _type),       \
> }
> 
> so here we get the vmstate field definition.
> 
> .size is fine, as it is sizeof(QEMUTimer *).
> 
> .info, is &vmstate_info_timer, migration/savevm.c:
> 
> const VMStateInfo vmstate_info_timer = {
>     .name = "timer",
>     .get  = get_timer,
>     .put  = put_timer,
> };
> 
> void timer_put(QEMUFile *f, QEMUTimer *ts)
> {
>     uint64_t expire_time;
> 
>     expire_time = timer_expire_time_ns(ts);
>     qemu_put_be64(f, expire_time);
> }
> 
> void timer_get(QEMUFile *f, QEMUTimer *ts)
> {
>     uint64_t expire_time;
> 
>     expire_time = qemu_get_be64(f);
>     if (expire_time != -1) {
>         timer_mod_ns(ts, expire_time);
>     } else {
>         timer_del(ts);
>     }
> }
> 
> ---
> 
> And the migration code does: (migration/vmstate.c):
> 
> int vmstate_save_state_v() {
>   ...
>   ret = field->info->put(f, curr_elem, size, field, vmdesc_loop);
>   ...
> }
> 
> which puts a BE64 in the QEMUFile *f (see timer_put above).
> 
> The load code in the same file does:
> 
> int vmstate_load_state() {
>   ...
>   ret = field->info->get(f, curr_elem, size, field);
>   ...
> }
> 
> which reads a BE64 from the QEMUFile *f (see timer_get above).
> 
> Would be "fine" from the field sizes perspective (the .size of the field type, and the value of the BE64),
> 
> but it's the calculations done in timer_get and timer_put which are scary, as they dereference the timer pointer.
> 
> 
> Should we actually have a check for null pointer in vmstate.c?
> 
> We _do_ have one in vmstate_save_state_v and vmstate_load_state, but it is actually active only for VMS_ARRAY_OF_POINTER.
> Why? Why not also do the same (write the null pointer and not following it) for normal VMS_POINTER ?
> 
> int vmstate_save_state_v() {
>  ...
>                 if (!curr_elem && size) {
>                     /* if null pointer write placeholder and do not follow */
>                     assert(field->flags & VMS_ARRAY_OF_POINTER);
>                     ret = vmstate_info_nullptr.put(f, curr_elem, size, NULL,
>                                                    NULL);
> 
>  ...
> 
> 
> int vmstate_load_state() {
> 
> ...
>                 if (!curr_elem && size) {
>                     /* if null pointer check placeholder and do not follow */
>                     assert(field->flags & VMS_ARRAY_OF_POINTER);
>                     ret = vmstate_info_nullptr.get(f, curr_elem, size, NULL);
> ...
> 
> }
> 
> 
> This is worthwhile investigating further, any other ideas?
> 
> Thanks,
> 
> Claudio
> 
> 

Btw here it would be good to be able to rely on the existing tests,
do we have full coverage of these compatibility situations?

According to make check it's all a-ok, but... is the testing coverage insufficient
for these VMSTATE compatibility issues?

Ciao,

Claudio


>>
>>>
>>> so if we don't use gt_timer at all (as is the case with !CONFIG_TCG), we just
>>> need to ensure that an unused number is there to assign, migrating from old to new version?
>>>
>>>
>>>> suggested a straight VMSTATE_UNUSED(8) on IRC but I wonder if it would
>>>> be better to have a VMSTATE_UNUSED_TIMER?
>>>>
>>>> I don't think there is an impact for Xen because I'm fairly certain
>>>> migration isn't a thing we do - but I'll double check.
>>>>
>>>
>>> Thanks Alex, that would be helpful,
>>> if Xen uses gt_timer in any way I would not want to unwillingly break
>>> it.
>>
>> Not for ARM no, currently there is no ARM specific machine emulated by
>> QEMU for Xen. All ARM guests are PV guests.
>>
>>>
>>> Thanks,
>>>
>>> Claudio
>>
>>
> 


