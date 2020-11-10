Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1AB2AD2A9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:41:34 +0100 (CET)
Received: from localhost ([::1]:47782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQ9d-0008AJ-Gx
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kcQ8H-0007be-R6
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:40:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:40412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kcQ8F-0005V0-VQ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:40:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43DF1AC19;
 Tue, 10 Nov 2020 09:40:06 +0000 (UTC)
Subject: Re: [RFC v1 09/10] i386: split cpu.c and defer x86 models registration
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201109172755.16500-1-cfontana@suse.de>
 <20201109172755.16500-10-cfontana@suse.de>
 <20201109180302.GB814975@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <971cfde9-d24e-a3dc-6389-8a7c9e477f63@suse.de>
Date: Tue, 10 Nov 2020 10:40:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109180302.GB814975@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 23:19:25
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 7:03 PM, Daniel P. Berrangé wrote:
> On Mon, Nov 09, 2020 at 06:27:54PM +0100, Claudio Fontana wrote:
>> split cpu.c into:
>>
>> cpu.c            cpuid and common x86 cpu functionality
>> host-cpu.c       host x86 cpu functions and "host" cpu type
>> kvm-cpu-type.c   KVM x86 cpu type
>> hvf-cpu-type.c   HVF x86 cpu type
>> tcg-cpu-type.c   TCG x86 cpu type
>>
>> Defer the x86 models registration to MODULE_INIT_ACCEL_CPU,
>> so that accel-specific types can be used as parent types for all
>> cpu models. Use the generic TYPE_X86_CPU only if no
>> accel-specific specialization is enabled.
> 
> Can you give more info on why this is needed and/or desirable ?

Hello Daniel, there is a pointer to the overall higher level motivation in the cover letter.

But I am not pushing for this specific mechanism to be used, as mentioned in the cover letter.

If we need another mechanism to achieve that (not delaying the x86 model registration and make them inherit from the specialized class), but something else,
I would be happy to get additional ideas.

> 
> Dynamically changing the class hierarchy of CPUs at runtime feels
> like a rather suspicious approach to me

TYPE_X86_CPU is base type is registered as usual.
New accel-specialized types are defined (TYPE_TCG_CPU, TYPE_KVM_CPU, TYPE_HVF_CPU), also using normal type registration.

The missing step is how to adapt all the cpu models to use the functionality.

The accelerator that is finally chosen to be used is only known at a specific point in the qemu initialization.
This point of time I defined as MODULE_INIT_ACCEL_CPU.

That is the time when we know how the CPU should actually really behave (how it should be realized, etc).

In this series I realized this by registering the cpu models only at MODULE_INIT_ACCEL_CPU time, and not earlier.
But maybe there is a better idea on how to do it, and I am all ears.

.
> 
> It is contrary to work we've been doing recently to try to make all
> classes be fully statically defined by getting rid of dynamic properties,
> such that introspection of classes does not depend on other CLI flags
> you might have passed.

Understood, this goes against other requirements.

The dynamism introduced here is to register the cpu models at MODULE_INIT_ACCEL_CPU time instead of MODULE_INIT_QOM time.
As a result, for any chosen accelerator, the type tree and class tree is identical.

So maybe there is a way to leverage this to accommodate both needs?

> 
> 
> Regards,
> Daniel
> 


