Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B91D2B8DF4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:55:03 +0100 (CET)
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffiY-0006pI-Gj
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kffgo-0005PQ-EF
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:53:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:58382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kffgl-000574-Ve
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:53:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6ECFBAA4F;
 Thu, 19 Nov 2020 08:53:10 +0000 (UTC)
Subject: Re: [RFC v3 9/9] i386: split cpu accelerators from cpu.c
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-10-cfontana@suse.de>
 <20201118182845.GN1509407@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5f6c7b5c-a48a-019d-2646-d0670aeb46e1@suse.de>
Date: Thu, 19 Nov 2020 09:53:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118182845.GN1509407@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:53:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 11/18/20 7:28 PM, Eduardo Habkost wrote:
> On Wed, Nov 18, 2020 at 11:29:36AM +0100, Claudio Fontana wrote:
>> split cpu.c into:
>>
>> cpu.c            cpuid and common x86 cpu functionality
>> host-cpu.c       host x86 cpu functions and "host" cpu type
>> kvm/cpu.c        KVM x86 cpu type
>> hvf/cpu.c        HVF x86 cpu type
>> tcg/cpu.c        TCG x86 cpu type
>>
>> The accel interface of the X86CPUClass is set at MODULE_INIT_ACCEL_CPU
>> time, when the accelerator is known.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
> [...]
>> +/**
>> + * X86CPUAccel:
>> + * @name: string name of the X86 CPU Accelerator
>> + *
>> + * @common_class_init: initializer for the common cpu
> 
> So this will be called for every single CPU class.

Not really, it's called for every TYPE_X86_CPU cpu class (if an accel interface is registered).

This function extends the existing x86_cpu_common_class_init (target/i386/cpu.c),
where some methods of the base class CPUClass are set.

> 
>> + * @instance_init: cpu instance initialization
>> + * @realizefn: realize function, called first in x86 cpu realize
>> + *
>> + * X86 CPU accelerator-specific CPU initializations
>> + */
>> +
>> +struct X86CPUAccel {
>> +    const char *name;
>> +
>> +    void (*common_class_init)(X86CPUClass *xcc);
>> +    void (*instance_init)(X86CPU *cpu);
>> +    void (*realizefn)(X86CPU *cpu, Error **errp);
>>  };
>>  
>> +void x86_cpu_accel_init(const X86CPUAccel *accel);
> [...]
>> +static void x86_cpu_accel_init_aux(ObjectClass *klass, void *opaque)
>> +{
>> +    X86CPUClass *xcc = X86_CPU_CLASS(klass);
>> +    const X86CPUAccel **accel = opaque;
>> +
>> +    xcc->accel = *accel;
>> +    xcc->accel->common_class_init(xcc);
>> +}
>> +
>> +void x86_cpu_accel_init(const X86CPUAccel *accel)
>> +{
>> +    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &accel);
>> +}
> 
> This matches the documented behavior.
> 
> [...]
>> +void host_cpu_class_init(X86CPUClass *xcc)
>> +{
>> +    xcc->host_cpuid_required = true;
>> +    xcc->ordering = 8;
>> +    xcc->model_description =
>> +        g_strdup_printf("%s processor with all supported host features ",
>> +                        xcc->accel->name);
>> +}
> [...]
>> +static void hvf_cpu_common_class_init(X86CPUClass *xcc)
>> +{
>> +    host_cpu_class_init(xcc);
> 
> Why are you calling host_cpu_class_init() for all CPU types?

I am not..

> 
>> +}
> [...]
>> +static void kvm_cpu_common_class_init(X86CPUClass *xcc)
>> +{
>> +    host_cpu_class_init(xcc);
>> +}
> 
> Same question as above.
> 

Ciao,

Claudio

