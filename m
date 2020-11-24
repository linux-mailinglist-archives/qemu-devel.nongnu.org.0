Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D742C300F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 19:40:25 +0100 (CET)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khdEm-00049G-6D
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 13:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khdCw-0003f3-PL
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:38:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khdCq-0004Zz-IT
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:38:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60303AC55;
 Tue, 24 Nov 2020 18:38:22 +0000 (UTC)
Subject: Re: [RFC v5 11/12] i386: centralize initialization of cpu accel
 interfaces
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-12-cfontana@suse.de>
 <20201124165906.GR2271382@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <93f55856-639e-877f-cced-6b5f368ccd14@suse.de>
Date: Tue, 24 Nov 2020 19:38:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201124165906.GR2271382@habkost.net>
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

On 11/24/20 5:59 PM, Eduardo Habkost wrote:
> On Tue, Nov 24, 2020 at 05:22:09PM +0100, Claudio Fontana wrote:
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
> Probably this can be squashed into patch 10/12.


Yes, you are right, no point building things fragmented and then merging together later.


> 
>> ---
>>  target/i386/cpu-qom.h |  2 --
>>  target/i386/cpu.c     | 27 ++++++++++++++++++++-------
>>  target/i386/hvf/cpu.c |  9 ---------
>>  target/i386/kvm/cpu.c |  8 --------
>>  target/i386/tcg/cpu.c |  9 ---------
>>  5 files changed, 20 insertions(+), 35 deletions(-)
>>
>> diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
>> index 9316e78e71..2cea5394c6 100644
>> --- a/target/i386/cpu-qom.h
>> +++ b/target/i386/cpu-qom.h
>> @@ -98,6 +98,4 @@ struct X86CPUAccelClass {
>>      void (*cpu_realizefn)(X86CPU *cpu, Error **errp);
>>  };
>>  
>> -void x86_cpu_accel_init(const char *accel_name);
>> -
>>  #endif
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index b799723e53..f6fd055046 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -7066,18 +7066,31 @@ type_init(x86_cpu_register_types)
>>  static void x86_cpu_accel_init_aux(ObjectClass *klass, void *opaque)
>>  {
>>      X86CPUClass *xcc = X86_CPU_CLASS(klass);
>> -    const X86CPUAccelClass **accel = opaque;
>> +    X86CPUAccelClass *accel = opaque;
>>  
>> -    xcc->accel = *accel;
>> +    xcc->accel = accel;
>>      xcc->accel->cpu_common_class_init(xcc);
>>  }
>>  
>> -void x86_cpu_accel_init(const char *accel_name)
>> +static void x86_cpu_accel_init(void)
>>  {
>> -    X86CPUAccelClass *acc;
>> +    const char *ac_name;
>> +    ObjectClass *ac;
>> +    char *xac_name;
>> +    ObjectClass *xac;
>>  
>> -    acc = X86_CPU_ACCEL_CLASS(object_class_by_name(accel_name));
>> -    g_assert(acc != NULL);
>> +    ac = object_get_class(OBJECT(current_accel()));
>> +    g_assert(ac != NULL);
>> +    ac_name = object_class_get_name(ac);
>> +    g_assert(ac_name != NULL);
>>  
>> -    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &acc);
>> +    xac_name = g_strdup_printf("%s-%s", ac_name, TYPE_X86_CPU);
>> +    xac = object_class_by_name(xac_name);
>> +    g_free(xac_name);
>> +
>> +    if (xac) {
>> +        object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, xac);
>> +    }
>>  }
>> +
>> +accel_cpu_init(x86_cpu_accel_init);
> 
> This keeps the hidden initialization ordering dependency between
> MODULE_INIT_ACCEL_CPU and current_accel().  I thought we were
> going to get rid of module init functions that depend on runtime
> state.
> 
> This is an improvement to the code in patch 10/12, though.  If
> others believe it is an acceptable (temporary) solution, I won't
> block it.


In the way I thought about it, MODULE_INIT_ACCEL_CPU meant exactly that: initializations to be done after accel is chosen.
So in my view the relationship with current_accel() was then following naturally.



> 
> I would still prefer to have a
>   void arch_accel_cpu_init(AccelState*)
> function which would call a
>   void x86_cpu_accel_init(AccelState*)
> function.  That would make the dependency between
> x86_cpu_accel_init() and accelerator creation explicit.
> 


not a bad idea either,
what I would lose here is a single point to discover the codebase, ie

MODULE_INIT_ACCEL_CPU via a simple grep or gid MODULE_INIT_ACCEL_CPU gives me all initializations done
for this phase, not only the arch_ stuff, but also currently the Ops stuff.


> 
>> diff --git a/target/i386/hvf/cpu.c b/target/i386/hvf/cpu.c
>> index 7e7dc044d3..70b6dbfc10 100644
>> --- a/target/i386/hvf/cpu.c
>> +++ b/target/i386/hvf/cpu.c
>> @@ -65,12 +65,3 @@ static void hvf_cpu_accel_register_types(void)
>>      type_register_static(&hvf_cpu_accel_type_info);
>>  }
>>  type_init(hvf_cpu_accel_register_types);
>> -
>> -static void hvf_cpu_accel_init(void)
>> -{
>> -    if (hvf_enabled()) {
>> -        x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME("hvf"));
>> -    }
>> -}
>> -
>> -accel_cpu_init(hvf_cpu_accel_init);
>> diff --git a/target/i386/kvm/cpu.c b/target/i386/kvm/cpu.c
>> index bc5f519479..c17ed5a3f2 100644
>> --- a/target/i386/kvm/cpu.c
>> +++ b/target/i386/kvm/cpu.c
>> @@ -147,11 +147,3 @@ static void kvm_cpu_accel_register_types(void)
>>      type_register_static(&kvm_cpu_accel_type_info);
>>  }
>>  type_init(kvm_cpu_accel_register_types);
>> -
>> -static void kvm_cpu_accel_init(void)
>> -{
>> -    if (kvm_enabled()) {
>> -        x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME("kvm"));
>> -    }
>> -}
>> -accel_cpu_init(kvm_cpu_accel_init);
>> diff --git a/target/i386/tcg/cpu.c b/target/i386/tcg/cpu.c
>> index e7d4effdd0..00166c36e9 100644
>> --- a/target/i386/tcg/cpu.c
>> +++ b/target/i386/tcg/cpu.c
>> @@ -170,12 +170,3 @@ static void tcg_cpu_accel_register_types(void)
>>      type_register_static(&tcg_cpu_accel_type_info);
>>  }
>>  type_init(tcg_cpu_accel_register_types);
>> -
>> -static void tcg_cpu_accel_init(void)
>> -{
>> -    if (tcg_enabled()) {
>> -        x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME("tcg"));
>> -    }
>> -}
>> -
>> -accel_cpu_init(tcg_cpu_accel_init);
>> -- 
>> 2.26.2
>>
> 


