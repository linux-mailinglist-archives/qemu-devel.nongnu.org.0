Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4A2C3F4E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 12:49:39 +0100 (CET)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khtIo-0001PH-9P
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 06:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khtHh-0000YG-Ni
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 06:48:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:47734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khtHf-00079C-HO
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 06:48:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CDF6AC41;
 Wed, 25 Nov 2020 11:48:24 +0000 (UTC)
Subject: Re: [RFC v5 12/12] accel: centralize initialization of CpusAccelOps
From: Claudio Fontana <cfontana@suse.de>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-13-cfontana@suse.de>
 <20201124174821.GT2271382@habkost.net>
 <4deb0de9-9556-85da-76fb-8050551d6dd6@suse.de>
 <20201124192756.GX2271382@habkost.net>
 <115546ec-1024-e515-8eba-b89937fb23ac@suse.de>
 <20201124203452.GZ2271382@habkost.net>
 <60e9ff3e-8896-c9a1-302c-c1378a48a564@suse.de>
Message-ID: <6328a231-a3d0-92c7-7da6-f383c14748ac@suse.de>
Date: Wed, 25 Nov 2020 12:48:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <60e9ff3e-8896-c9a1-302c-c1378a48a564@suse.de>
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/20 10:32 AM, Claudio Fontana wrote:
> On 11/24/20 9:34 PM, Eduardo Habkost wrote:
>> On Tue, Nov 24, 2020 at 08:39:33PM +0100, Claudio Fontana wrote:
>>> On 11/24/20 8:27 PM, Eduardo Habkost wrote:
>>>> On Tue, Nov 24, 2020 at 07:52:15PM +0100, Claudio Fontana wrote:
>>>> [...]
>>>>>>> +    }
>>>>>>
>>>>>> Additionally, if you call arch_cpu_accel_init() here, you won't
>>>>>> need MODULE_INIT_ACCEL_CPU anymore.  The
>>>>>>
>>>>>>   module_call_init(MODULE_INIT_ACCEL_CPU)
>>>>>>
>>>>>> call with implicit dependencies on runtime state inside vl.c and
>>>>>> *-user/main.c becomes a trivial:
>>>>>>
>>>>>>   accel_init(accel)
>>>>>>
>>>>>> call in accel_init_machine() and *-user:main().


On this one I see an issue:

the *-user_main() would still need an ac->machine_init() call to initialize tcg itself,
currently the accelerator initialization is put into ac->machine_init

(tcg_init, kvm_init, xen_init, etc).

Or are you proposing to move tcg initialization away from the current ->machine_init(),
into the new ac->init called by accel_init()?

This would make tcg even more different from the other accelerators.

Or are you proposing for all accelerators to separate the initialization of the accelerator itself
from the machine state input, leading to, for example, separating kvm-all.c kvm_init() into two
functions, one which takes the input from MachineState and puts it into the AccelState, and
another one which actually then initializes kvm proper? And same for all accels?

In my view we could still do in *-user main.c,

ac = ACCEL_GET_CLASS(current_accel())
ac->machine_init(NULL);
ac->init_cpu_interfaces(ac);

to solve this, or something like that, but also the option of fixing all accelerators to separate
the gathering of the input from the MachineState to the actual accelerator initialization is
a possibility to me.

Ciao,

Claudio


>>>>>
>>>>>
>>>>>
>>>>> I do need a separate thing for the arch cpu accel specialization though,
>>>>> without MODULE_INIT_ACCEL_CPU that link between all operations done at accel-chosen time is missing..
>>>>>
>>>>
>>>> I think this is a key point we need to sort out.
>>>>
>>>> What do you mean by "link between all operations done at
>>>> accel-chosen time" and why that's important?
>>>
>>>
>>> For understanding by a reader that tries to figure this out,
>>> (see the gid MODULE_INIT_ACCEL_CPU comment elsewhere in the thread).
>>
>> Right, but how does the module_call_init(MODULE_INIT_ACCEL_CPU)
>> indirection makes this easier to figure out than just looking at
>> a accel_init() function that makes regular function calls?
> 
> 
> I agree, if we accomplish a single accel_init() call that does everything (accelerator initialization and arch independent ops initialization and arch dependent specialization of the x86 cpu),
> that would be the best outcome in my view also.
> 
> 
>>
>>
>>>
>>> And it could be that the high level plan to make accelerators fully dynamically loadable plugins in the future
>>> also conditioned me to want to have a very clear demarcation line around the choice of the accelerator.
>>
>> We have dynamically loadable modules for other QOM types,
>> already, and they just use type_init().  I don't see why an extra
>> module_init() type makes this easier.
>>
>>>
>>>
>>>>
>>>> accel_init_machine() has 2-3 lines of code with side effects.  It
>>>> calls AccelClass.init_machine(), which may may have hundreds of
>>>
>>>
>>> could we initialize also all arch-dependent stuff in here?
>>
>> You can, if you use a wrapper + stub, like arch_cpu_accel_init().
>>
> 
> As mentioned elsewhere, I'll try to avoid stubs. One is too many I think in the codebase (well one is probably ok, but you get what I mean, I don't like their proliferation).
> 
>>
>>>
>>>
>>>> lines of code.  accel_setup_post() has one additional method
>>>> call, which is triggered at a slightly different moment.
>>>>
>>>> You are using MODULE_INIT_ACCEL for 2 additional lines of code:
>>>> - the cpus_register_accel() call
>>>> - the x86_cpu_accel_init() call
>>>>
>>>> What makes those 2 lines of code so special, to make them deserve
>>>> a completely new mechanism to trigger them, instead of using
>>>> trivial function calls inside a accel_init() function?
>>>>
>>>
>>> ...can we do also the x86_cpu_accel_init inside accel_init()?
>>>
>>>
>>> In any case I'll try also the alternative, it would be nice if I could bring everything together under the same roof,
>>> and easily discoverable, both the arch-specific steps that we need to do at accel-chosen time and the non-arch-specific steps.
>>
>> One way to bring everything together under the same roof is to
>> call everything inside a accel_init() function.
> 
> Will try!
> 
> 
>>
>>
>>>
>>> Hope this helps clarifying where I am coming from,
>>> but I am open to have my mind changed, also trying the alternatives you propose here could help me see first hand how things play out.
>>
>> Thanks!
>>
> 
> Thanks,
> 
> Ciao,
> 
> Claudio
> 





