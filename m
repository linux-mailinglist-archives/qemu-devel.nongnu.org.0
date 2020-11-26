Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F42C58EB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 17:00:09 +0100 (CET)
Received: from localhost ([::1]:48010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJgm-0000F5-CO
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 11:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiJWp-00043f-QN
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:49:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:51944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiJWn-0001m0-0J
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:49:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DB70ACE0;
 Thu, 26 Nov 2020 15:49:47 +0000 (UTC)
Subject: Re: [RFC v5 11/12] i386: centralize initialization of cpu accel
 interfaces
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201124162210.8796-12-cfontana@suse.de>
 <7dc27df6-1c81-f8fb-3e56-aa6ffe9e8475@redhat.com>
 <20201124213159.GA2271382@habkost.net>
 <1205be9d-d2f0-4533-68aa-608b16ad2181@suse.de>
 <20201126134425.GH2271382@habkost.net>
 <86ba92db-7b01-5644-7452-2fde753ddba6@suse.de>
 <20201126144959.GJ2271382@habkost.net>
 <16445790-3371-9775-3d03-f8c8f0d66b18@suse.de>
 <20201126151432.GL2271382@habkost.net>
 <dfcdf02b-0bb6-215b-464b-7704cb27818f@suse.de>
 <20201126154808.GN2271382@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <491297da-2545-a76c-90f4-6096e2648b1d@suse.de>
Date: Thu, 26 Nov 2020 16:49:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201126154808.GN2271382@habkost.net>
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

On 11/26/20 4:48 PM, Eduardo Habkost wrote:
> On Thu, Nov 26, 2020 at 04:34:17PM +0100, Claudio Fontana wrote:
>> On 11/26/20 4:14 PM, Eduardo Habkost wrote:
>>> On Thu, Nov 26, 2020 at 03:55:37PM +0100, Claudio Fontana wrote:
>>>> On 11/26/20 3:49 PM, Eduardo Habkost wrote:
>>>>> On Thu, Nov 26, 2020 at 03:33:17PM +0100, Claudio Fontana wrote:
>>>>>> On 11/26/20 2:44 PM, Eduardo Habkost wrote:
>>>>>>> On Thu, Nov 26, 2020 at 11:57:28AM +0100, Claudio Fontana wrote:
>>>>>>>> On 11/24/20 10:31 PM, Eduardo Habkost wrote:
>>>>>>>>> On Tue, Nov 24, 2020 at 09:13:13PM +0100, Paolo Bonzini wrote:
>>>>>>>>>> On 24/11/20 17:22, Claudio Fontana wrote:
>>>>>>>>>>> +static void x86_cpu_accel_init(void)
>>>>>>>>>>>  {
>>>>>>>>>>> -    X86CPUAccelClass *acc;
>>>>>>>>>>> +    const char *ac_name;
>>>>>>>>>>> +    ObjectClass *ac;
>>>>>>>>>>> +    char *xac_name;
>>>>>>>>>>> +    ObjectClass *xac;
>>>>>>>>>>> -    acc = X86_CPU_ACCEL_CLASS(object_class_by_name(accel_name));
>>>>>>>>>>> -    g_assert(acc != NULL);
>>>>>>>>>>> +    ac = object_get_class(OBJECT(current_accel()));
>>>>>>>>>>> +    g_assert(ac != NULL);
>>>>>>>>>>> +    ac_name = object_class_get_name(ac);
>>>>>>>>>>> +    g_assert(ac_name != NULL);
>>>>>>>>>>> -    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &acc);
>>>>>>>>>>> +    xac_name = g_strdup_printf("%s-%s", ac_name, TYPE_X86_CPU);
>>>>>>>>>>> +    xac = object_class_by_name(xac_name);
>>>>>>>>>>> +    g_free(xac_name);
>>>>>>>>>>> +
>>>>>>>>>>> +    if (xac) {
>>>>>>>>>>> +        object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, xac);
>>>>>>>>>>> +    }
>>>>>>>>>>>  }
>>>>>>>>>>> +
>>>>>>>>>>> +accel_cpu_init(x86_cpu_accel_init);
>>>>>>>>>>
>>>>>>>>>> If this and cpus_accel_ops_init are the only call to accel_cpu_init, I'd
>>>>>>>>>> rather make them functions in CPUClass (which you find and call via
>>>>>>>>>> CPU_RESOLVING_TYPE) and AccelClass respectively.
>>>>>>>>>
>>>>>>>>> Making x86_cpu_accel_init() be a CPUClass method sounds like a
>>>>>>>>> good idea.  This way we won't need a arch_cpu_accel_init() stub
>>>>>>>>> for non-x86.
>>>>>>>>>
>>>>>>>>> accel.c can't use cpu.h, correct?  We can add a:
>>>>>>>>>
>>>>>>>>>   CPUClass *arch_base_cpu_type(void)
>>>>>>>>>   {
>>>>>>>>>       return object_class_by_name(CPU_RESOLVING_TYPE);
>>>>>>>>>   }
>>>>>>>>>
>>>>>>>>> function to arch_init.c, to allow target-independent code call
>>>>>>>>> target-specific code.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Eduardo,
>>>>>>>>
>>>>>>>> we can't use arch-init because it is softmmu only, but we could put this in $(top_srcdir)/cpu.c
>>>>>>>
>>>>>>> That would work, too.
>>>>>>>
>>>>>>>>
>>>>>>>> however, it would be very useful to put a:
>>>>>>>>
>>>>>>>> #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>>>>>>>> #define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
>>>>>>>>
>>>>>>>> in an H file somewhere, for convenience for the programmer that
>>>>>>>> has to implement subclasses in target/xxx/
>>>>>>>
>>>>>>> Absolutely.
>>>>>>>
>>>>>>>>
>>>>>>>> But it is tough to find a header where CPU_RESOLVING_TYPE can be used.
>>>>>>>
>>>>>>> cpu-all.h?
>>>>>>>
>>>>>>>>
>>>>>>>> We could I guess just use plain "cpu" instead of CPU_RESOLVING_TYPE,
>>>>>>>> maybe that would be acceptable too? The interface ends up in CPUClass, so maybe ok?
>>>>>>>>
>>>>>>>> So we'd end up having
>>>>>>>>
>>>>>>>> accel-cpu
>>>>>>>>
>>>>>>>> instead of the previous
>>>>>>>>
>>>>>>>> accel-x86_64-cpu
>>>>>>>>
>>>>>>>> on top of the hierarchy.
>>>>>>>
>>>>>>> It seems OK to have a accel-cpu type at the top, but I don't see
>>>>>>> why it solves the problem above.  What exactly would be the value
>>>>>>> of `kvm_cpu_accel.name`?
>>>>>>>
>>>>>>
>>>>>> It does solve the problem, because we can put then all AccelOpsClass and AccelCPUClass stuff in accel.h,
>>>>>> resolve everything in accel/accel-*.c, and make a generic solution fairly self-contained (already tested, will post soonish).
>>>>>>
>>>>>> But I'll try cpu-all.h if it's preferred to have accel-x86_64-cpu, accel-XXX-cpu on top, I wonder what the preference would be?
>>>>>
>>>>> I don't have a specific preference, but I still wonder how
>>>>> exactly you would name the X86CPUAccel implemented at
>>>>> target/i386/kvm, and how exactly you would look for it when
>>>>> initializing the accelerator.
>>>>>
>>>>
>>>> If we agree to use "accel-cpu" I would lookup "kvm-accel-cpu"
>>>
>>> The structure in target/i386/kvm is x86-specific and
>>> kvm-specific.  If we name it "kvm-accel-cpu", how would you name
>>> the equivalent structures at target/s390x/kvm, target/arm/kvm,
>>> target/ppc/kvm?
>>
>> The same way; only one of them would be compiled into the target binary, so the lookup would not collide in practice,
> 
> That's not always going to be true.  Maybe for KVM it will, but
> not necessarily for TCG.
> 
>> but I wonder whether we want separate names anyway.
> 
> I believe we do.  Avoiding duplicate QOM type names is a good
> idea in either case.
> 

Ok will try, for now I CPU_RESOLVING_TYPE is not playing nice with my attempts..

Ciao,

Claudio

