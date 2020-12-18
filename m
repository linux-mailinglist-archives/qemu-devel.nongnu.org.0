Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166662DE88A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 18:53:00 +0100 (CET)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqJw3-00010A-5K
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 12:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kqJuJ-0007kB-Nh
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:51:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:34870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kqJuH-00061s-Nz
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:51:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97E38ACC4;
 Fri, 18 Dec 2020 17:51:06 +0000 (UTC)
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-11-cfontana@suse.de>
 <6cbd508c-b24b-3219-3302-196dfefaa8f7@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ff157643-5245-85ba-123e-32800f212f4b@suse.de>
Date: Fri, 18 Dec 2020 18:51:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6cbd508c-b24b-3219-3302-196dfefaa8f7@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 7:21 AM, Paolo Bonzini wrote:
> On 26/11/20 23:32, Claudio Fontana wrote:
>> +    if (acc) {
>> +        object_class_foreach(accel_init_cpu_int_aux, cpu_type, false, acc);
>> +    }
> 
> Any reason to do it for cpu_type only, rather than for all subclasses of 
> CPU_RESOLVING_TYPE?  This would remove the cpu_type argument to 
> accel_init_cpu_interfaces and accel_init_interfaces.
> 
> Otherwise I haven't done a careful review yet but it looks very nice, 
> thanks!
> 
> Paolo
> 

Hi Paolo,

going back to this topic:

while doing some experiments in applying the ACCEL_CPU_TYPE classes for all targets (TCG for now, not KVM or other hw accels),
and merging all tcg cpu ops,

I did encounter some issue.

For the simplest of targets like hppa for example, it works just fine, we can do:

static void hppa_tcg_cpu_class_init(CPUClass *cc)
{
    cc->tcg_ops.initialize = hppa_translate_init;
    cc->tcg_ops.do_interrupt = hppa_cpu_do_interrupt;
    cc->tcg_ops.cpu_exec_interrupt = hppa_cpu_exec_interrupt;
    cc->tcg_ops.synchronize_from_tb = hppa_cpu_synchronize_from_tb;
    cc->tcg_ops.tlb_fill = hppa_cpu_tlb_fill;
#ifndef CONFIG_USER_ONLY
    cc->tcg_ops.do_unaligned_access = hppa_cpu_do_unaligned_access;
#endif
}

*(later on I will try to change the cc->tcg_ops thing to something that ends up in cc->accel_cpu->tcg_ops->initialize, as I try to merge tcg_ops with accel_cpu, but this is spoiler of the future)*

static void hppa_tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
{
    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);

    acc->cpu_class_init = hppa_tcg_cpu_class_init;
}

static const TypeInfo hppa_tcg_cpu_accel_type = {
    .name = ACCEL_CPU_NAME("tcg"),

    .parent = TYPE_ACCEL_CPU,
    .class_init = hppa_tcg_cpu_accel_class_init,
};

static void hppa_cpu_register_types(void)
{
    type_register_static(&hppa_cpu_type_info);
    type_register_static(&hppa_tcg_cpu_accel_type);
}

type_init(hppa_cpu_register_types)

So this is good.

But with things like cris/ for example, 
the tcg functions to use are actually versioned per each subclass of TYPE_CRIS_CPU.

Different tcg_ops need to be used for different subclasses of the CPU_RESOLVING_TYPE.

So in order to avoid code in the class initialization like this:

if (version1) { then set the tcg ops for version 1; }
if (version2) { then set the tcg ops for version 2; ...} etc,

we could define the right tcg op variants corresponding to the cpu variants, so that everything can be matched automatically.

But I think we'd need to pass explicitly the cpu type in accel_init_cpu_interfaces for this to work..
we could still in the future call accel_init_cpu_interfaces multiple times, once for each cpu model we want to use.

Or, we could do something else: we could delay the accel cpu interface initialization and call it in cpu_create(const char *typename),
where typename needs to be known for sure.

This last option seems kinda attractive, but any ideas?

Thanks, ciao,

Claudio







