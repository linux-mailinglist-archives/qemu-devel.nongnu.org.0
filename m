Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165D2F1D99
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 19:10:05 +0100 (CET)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1dk-0005w2-3X
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 13:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kz1cQ-0005KR-7l
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:08:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:54550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kz1cL-00084Z-Vx
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:08:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99EA5B7DB;
 Mon, 11 Jan 2021 18:08:34 +0000 (UTC)
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
From: Claudio Fontana <cfontana@suse.de>
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
 <ff157643-5245-85ba-123e-32800f212f4b@suse.de>
 <51838c6c-8a44-afef-1acf-b8acb3eada19@redhat.com>
 <050bc10b-861c-f463-18e1-c4d1aa0c301e@suse.de>
 <4bca1b60-ceeb-4b99-dd92-77dac07e9064@suse.de>
 <343846ce-12ba-23d6-4832-4aa16cb22f9d@suse.de>
 <2f50e4f3-dd13-bbd4-1963-daf695bbe428@suse.de>
 <28d06da1-296d-3b2b-bb58-e41faed6fd16@suse.de>
Message-ID: <d986e86f-e852-394c-50df-e334dfa0ac8d@suse.de>
Date: Mon, 11 Jan 2021 19:08:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <28d06da1-296d-3b2b-bb58-e41faed6fd16@suse.de>
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
 "Emilio G . Cota" <cota@braap.org>, haxm-team@intel.com,
 Cameron Esfahani <dirty@apple.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 5:13 PM, Claudio Fontana wrote:
> On 12/19/20 12:00 AM, Claudio Fontana wrote:
>> On 12/18/20 11:30 PM, Claudio Fontana wrote:
>>> On 12/18/20 10:55 PM, Claudio Fontana wrote:
>>>> On 12/18/20 7:04 PM, Claudio Fontana wrote:
>>>>> On 12/18/20 7:01 PM, Paolo Bonzini wrote:
>>>>>> On 18/12/20 18:51, Claudio Fontana wrote:
>>>>>>> But with things like cris/ for example,
>>>>>>> the tcg functions to use are actually versioned per each subclass of TYPE_CRIS_CPU.
>>>>>>>
>>>>>>> Different tcg_ops need to be used for different subclasses of the CPU_RESOLVING_TYPE.
>>>>>>
>>>>>> CRIS is not that bad since it's TCG only.  You can just make it a field 
>>>>>> in CRISCPUClass and copy it over to tcg_ops.
>>>>>>
>>>>>> I think ARM had something similar though, with different do_interrupt 
>>>>>> implementations for M and A processors.  Somebody from Linaro was 
>>>>>> cleaning it up as part of some BQL work, but it was never merged.  But 
>>>>>> even in that case, do_interrupt is somewhat special for ARM so making it 
>>>>>> an xxxCPUClass field makes sense.
>>>>>>
>>>>>> Paolo
>>>>>
>>>>> Ok that's a good alternative,
>>>>>
>>>>>>
>>>>>>> So in order to avoid code in the class initialization like this:
>>>>>>>
>>>>>>> if (version1) { then set the tcg ops for version 1; }
>>>>>>> if (version2) { then set the tcg ops for version 2; ...} etc,
>>>>>>>
>>>>>>> we could define the right tcg op variants corresponding to the cpu variants, so that everything can be matched automatically.
>>>>>>>
>>>>>>> But I think we'd need to pass explicitly the cpu type in accel_init_cpu_interfaces for this to work..
>>>>>>> we could still in the future call accel_init_cpu_interfaces multiple times, once for each cpu model we want to use.
>>>>>>>
>>>>>>> Or, we could do something else: we could delay the accel cpu interface initialization and call it in cpu_create(const char *typename),
>>>>>>> where typename needs to be known for sure.
>>>>>
>>>>>
>>>>> I take you don't like this idea to initialize the accel cpu interface in cpu_create()?
>>>>> It seems to make sense to me, but any drawbacks?
>>>>>
>>>>> Ciao thanks!
>>>>>
>>>>> Claudio
>>>>>
>>>>>
> 
> 
> Happy new year,
> 
> picking up this topic again, i am looking at at now a different aspect of this problem, of setting the right tcg ops for the right cpu class.
> 
> This issue I am highlighting is present because different targets behave differently in this regard.
> 
> Ie, we have targets for which we always initialize all cpu classes, as a result of different machine definitions.
> 
> This is the case of arm, for example where we end up with backtraces like:
> 
> arm_v7m_class_init
> type_initialize
> object_class_foreach_tramp
> g_hash_table_foreach ()
> object_class_foreach
> object_class_get_list
> select_machine ()
> qemu_init
> main
> 
> with the arm_v7m_class_init called even if we are just going to use an aarch64 cpu (so the class initializer for arm_v7m is called even for unused cpus classes),
> 
> while in other cases we have the target explicitly relying on the fact that only the right cpu class is initialized, for example in cris we have code like:
> 
> target/cris/cpu.c:
> 
> static void crisv9_cpu_class_init(ObjectClass *oc, void *data)
> {
>     CPUClass *cc = CPU_CLASS(oc);
>     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
> 
>     ccc->vr = 9;
>     cc->do_interrupt = crisv10_cpu_do_interrupt;
>     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
>     cc->tcg_initialize = cris_initialize_crisv10_tcg;
> }
> 
> where the class initialization of the cpu is explicitly setting the methods of CPUClass, therefore implicitly relying on the fact that no other class initializer screws things up.
> 
> Given this context, which one of these methods is "right"? Should we rework things so that only used cpu classes are actually initialized?
> Or should we maybe not do these settings in cpu class_init at all, but rather at cpu initfn time, or at cpu realize time?
> 
> any comments/preferences?
>

Or is the hierarchy magically fixing this for us (ie, we rely on the class initializers being called again when the cpu we are actually going to be used is going to be created?)
That seems the likely solution right?

Thanks,

Claudio


