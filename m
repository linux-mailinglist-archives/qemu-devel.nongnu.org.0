Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5502ADD28
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:41:07 +0100 (CET)
Received: from localhost ([::1]:47348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXdi-0004EU-FC
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kcXbc-00034G-I9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:38:57 -0500
Received: from mx2.suse.de ([195.135.220.15]:54804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kcXba-0001sW-BU
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:38:56 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 567A8ABCC;
 Tue, 10 Nov 2020 17:38:51 +0000 (UTC)
Subject: Re: [RFC v1 09/10] i386: split cpu.c and defer x86 models registration
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201109172755.16500-1-cfontana@suse.de>
 <20201109172755.16500-10-cfontana@suse.de>
 <20201109180302.GB814975@redhat.com>
 <971cfde9-d24e-a3dc-6389-8a7c9e477f63@suse.de>
 <20201110100438.GF866671@redhat.com>
 <c4c56c06-7530-5705-9ce8-5eff8cf1a0d3@redhat.com>
 <20201110152314.GF5733@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ddd6f791-c05c-1a7a-8fae-987435645e99@suse.de>
Date: Tue, 10 Nov 2020 18:38:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201110152314.GF5733@habkost.net>
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Colin Xu <colin.xu@intel.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Bruce Rogers <brogers@suse.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 4:23 PM, Eduardo Habkost wrote:
> On Tue, Nov 10, 2020 at 11:41:46AM +0100, Paolo Bonzini wrote:
>> On 10/11/20 11:04, Daniel P. Berrangé wrote:
>>>
>>> ie, we should have one class hierarchy for CPU model definitions, and
>>> one class hierarchy  for accelerator CPU implementations.
>>>
>>> So at runtime we then get two object instances - a CPU implementation
>>> and a CPU definition. The CPU implementation object should have a
>>> property which is a link to the desired CPU definition.
>>
>> It doesn't even have to be two object instances.  The implementation can be
>> nothing more than a set of function pointers.
> 
> A set of function pointers is exactly what a QOM interface is.
> Could the methods be provided by a TYPE_X86_ACCEL interface type,
> implemented by the accel object?
> 

Looking at the 2 axes mentioned by Daniel before, on the "accelerator cpu axis", we have TYPE_TCG_CPU, TYPE_KVM_CPU, TYPE_HVF_CPU,
which look like simple subclasses of TYPE_X86_CPU to me, with basically all the divergent functionality being added by composition.
TYPE_HVF_CPU seems to do everything that TYPE_X86_CPU does on construction (and device realization), and then some.

On the "cpu models" axis we have all the current subclasses of TYPE_X86_CPU, which include "links" to X86CPUModel objects in the form
of class_data:

static void x86_register_cpu_model_type(const char *name, X86CPUModel *model,
                                        const char *parent_type)
{
    g_autofree char *typename = x86_cpu_type_name(name);
    TypeInfo ti = {
        .name = typename,
        .parent = parent_type,
        .class_init = x86_cpu_cpudef_class_init,
        .class_data = model,
    };

    type_register(&ti);
}

so this would be close to the "link" property that Daniel you were speaking about before?
Should X86CPUmodel be the prime citizen of the "cpu models" axis, without constructing a separate TYPE_X86_CPU subclass for each cpu model?

A separate topic we did not address in comments before, where I'd like opinions, is how should we treat cpu types "base" and "max" and "host"?

Just to avoid forgetting about them, currently TYPE_X86_CPU is the parent type of "base" and of "max",
and "max" is the parent type of "host".

"host" is only allowed when using accelerator kvm or hvf. Attempts to create such a cpu without a kvm or hvf accelerator enabled will error out.
"max" behaves differently when using hvf or kvm.

Thanks,

Claudio

