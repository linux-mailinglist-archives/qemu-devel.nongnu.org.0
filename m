Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6E30F4C7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:20:00 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fUF-0005yQ-8F
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7fT5-0005Pk-Jb
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:18:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7fT3-0007av-Mu
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:18:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C17FEAD24;
 Thu,  4 Feb 2021 14:18:41 +0000 (UTC)
Subject: Re: [PATCH v15 21/23] hw/core/cpu: call qemu_init_vcpu in
 cpu_common_realizefn
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-22-cfontana@suse.de> <871rdxrt08.fsf@linaro.org>
 <7500a412-c94a-6990-eb48-9ee78bfb94e3@suse.de>
 <05980f44-88a6-6ef7-b263-07c2d898b8f0@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <483bc092-cf71-d2c2-59d7-861f3131c8e4@suse.de>
Date: Thu, 4 Feb 2021 15:18:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <05980f44-88a6-6ef7-b263-07c2d898b8f0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 2:41 PM, Philippe Mathieu-Daudé wrote:
> On 2/4/21 11:23 AM, Claudio Fontana wrote:
>> On 2/3/21 5:51 PM, Alex Bennée wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> move the call to qemu_init_vcpu inside cpu_common_realizefn,
>>>> so it does not need to be done explicitly in each target cpu.
>>>>
>>>> Despite this, the way cpu realize is done continues to be not ideal;
>>>>
>>>> ideally the cpu_list_add would be done in common_cpu,
>>>> and in this case we could avoid even more redundant open coded
>>>> additional calls in target/xxx/cpu.c,
>>>>
>>>> but this cannot happen because target cpu code, plugins, etc
>>>> now all came to rely on cpu->index
>>>> (which is updated in cpu_list_add), since no particular order
>>>> was defined previously, so we are stuck with the freak call
>>>> order for the target cpu realizefn.
>>>>
>>>> After this patch the target/xxx/cpu.c realizefn body becomes:
>>>>
>>>> void mycpu_realizefn(DeviceState *dev, Error **errp)
>>>> {
>>>>     /* ... */
>>>>     cpu_exec_realizefn(CPU_STATE(dev), errp);
>>>>
>>>>     /* ... anything that needs done pre-qemu_vcpu_init */
>>>>
>>>>     xcc->parent_realize(dev, errp); /* does qemu_vcpu_init */
>>>>
>>>>     /* ... anything that needs to be done after qemu_vcpu_init */
>>>> }
>>>
>>> Uggh, introducing a magic order seems like inviting trouble for later
>>> on. Is there anyway we can improve things? Paolo?
>>>
>>
>>
>> The magic order is there already. I call it "freak order" instead of "magic", because this is more the result of uncontrolled code growth rather than the work of magic :-)
> 
> Eventually related to this unsolved problem:
> 
>   cpu_reset() might modify architecture-specific fields allocated
>   by qemu_init_vcpu(). To avoid bugs similar to the one fixed in
>   commit 00d0f7cb66 when introducing new architectures, move the
>   cpu_reset() calls after qemu_init_vcpu().

Hi Philippe,

> 
> See discussion:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg686480.html

thanks to the pointer, it is useful.

Maybe there is a point to try to face this challenge.

If we could consistently move not only qemu_vcpu_init, but also reset in the common code in cpu_common_realizefn,
and force the sequence: qemu_vcpu_init(); cpu_reset(); in there,

and this actually works for all targets, maybe this could actually be an improvement.

I could cook the change as at least an aspirational goal, if there is a way to test it maybe it could help targets get progressively fixed in that direction?

It should be an RFC outside of this context I guess.

Ciao, thanks,

Claudio

> 
>>
>> This patch attempts to remove one degree of freedom, but the current situation of cpu realizing is basically fubar. This patch attempts to improve things slightly,
>> but as mentioned elsewhere it basically fails to achieve the goal,
>>
>> so I am tempted to just retire it. Maybe someone interested could look at the situation with new eyes (possibly even me later on).
> 


