Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DDA322797
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:15:10 +0100 (CET)
Received: from localhost ([::1]:60662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETmY-0001yo-NJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lETkL-0000nS-Ha
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:12:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:55626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lETkJ-0003Jy-62
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:12:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4E90AC6E;
 Tue, 23 Feb 2021 09:12:41 +0000 (UTC)
Subject: Re: [RFC v1 34/38] target/arm: cpu: only initialize TCG gt timers
 under CONFIG_TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-35-cfontana@suse.de> <87v9ak5cz0.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <03502e51-99f5-239d-42a6-e57892faa297@suse.de>
Date: Tue, 23 Feb 2021 10:12:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87v9ak5cz0.fsf@linaro.org>
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

On 2/22/21 4:34 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>
>> KVM has its own cpu->kvm_vtime.
>>
>> Adjust cpu vmstate by putting unused fields instead of the
>> VMSTATE_TIMER_PTR when TCG is not available.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/arm/cpu.c     | 4 +++-
>>  target/arm/machine.c | 5 +++++
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 1d81a1e7ac..b929109054 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1322,6 +1322,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          }
>>      }
>>  
>> +#ifdef CONFIG_TCG
>>      {
>>          uint64_t scale;
>>  
>> @@ -1347,7 +1348,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
>>                                                    arm_gt_hvtimer_cb, cpu);
>>      }
>> -#endif
>> +#endif /* CONFIG_TCG */
>> +#endif /* !CONFIG_USER_ONLY */
>>  
>>      cpu_exec_realizefn(cs, &local_err);
>>      if (local_err != NULL) {
>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>> index 666ef329ef..13d7c6d930 100644
>> --- a/target/arm/machine.c
>> +++ b/target/arm/machine.c
>> @@ -822,8 +822,13 @@ const VMStateDescription vmstate_arm_cpu = {
>>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
>> +#ifdef CONFIG_TCG
>>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
>>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
>> +#else
>> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
>> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
>> +#endif /* CONFIG_TCG */
> 
> I'm not sure this is correct - VMSTATE_TIMER_PTR chases the links to
> just expose expired time but QEMUTimer has more in it than that. Paolo


I am not sure I follow can you state more precisely where the issue could be?

it's not a VMSTATE_TIMER, it's a VMSTATE_TIMER_PTR,
it ends up in VMSTATE_POINTER where a single pointer is assigned;

so if we don't use gt_timer at all (as is the case with !CONFIG_TCG), we just
need to ensure that an unused number is there to assign, migrating from old to new version?


> suggested a straight VMSTATE_UNUSED(8) on IRC but I wonder if it would
> be better to have a VMSTATE_UNUSED_TIMER?
> 
> I don't think there is an impact for Xen because I'm fairly certain
> migration isn't a thing we do - but I'll double check.
> 

Thanks Alex, that would be helpful,
if Xen uses gt_timer in any way I would not want to unwillingly break it.

Thanks,

Claudio


