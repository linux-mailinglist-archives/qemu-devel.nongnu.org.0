Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CB32F231E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 00:36:51 +0100 (CET)
Received: from localhost ([::1]:35774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz6jy-0005yU-FR
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 18:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kz6ij-0005Xr-Ln
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:35:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:37246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kz6ie-0000d4-3A
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:35:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CE35AD0B;
 Mon, 11 Jan 2021 23:35:25 +0000 (UTC)
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
To: Eduardo Habkost <ehabkost@redhat.com>
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
 <20210111223529.GA4161@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <eb354bde-606d-ba75-3e9f-fd464b1fefbc@suse.de>
Date: Tue, 12 Jan 2021 00:35:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210111223529.GA4161@habkost.net>
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

On 1/11/21 11:35 PM, Eduardo Habkost wrote:
> On Mon, Jan 11, 2021 at 05:13:27PM +0100, Claudio Fontana wrote:
>> Happy new year,
> 
> Hi!
> 
>>
>> picking up this topic again, i am looking at at now a different aspect of this problem, of setting the right tcg ops for the right cpu class.
>>
>> This issue I am highlighting is present because different targets behave differently in this regard.
>>
>> Ie, we have targets for which we always initialize all cpu classes, as a result of different machine definitions.
>>
>> This is the case of arm, for example where we end up with backtraces like:
>>
>> arm_v7m_class_init
>> type_initialize
>> object_class_foreach_tramp
>> g_hash_table_foreach ()
>> object_class_foreach
>> object_class_get_list
>> select_machine ()
>> qemu_init
>> main
>>
>> with the arm_v7m_class_init called even if we are just going to use an aarch64 cpu (so the class initializer for arm_v7m is called even for unused cpus classes),
>>
>> while in other cases we have the target explicitly relying on the fact that only the right cpu class is initialized, for example in cris we have code like:
> 
> This shouldn't matter at all, because class_init is not supposed
> to have any side effects outside the corresponding ObjectClass
> struct.
> 
> So, I don't understand what you mean below:
> 
>>
>> target/cris/cpu.c:
>>
>> static void crisv9_cpu_class_init(ObjectClass *oc, void *data)
>> {
>>     CPUClass *cc = CPU_CLASS(oc);
>>     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
>>
>>     ccc->vr = 9;
>>     cc->do_interrupt = crisv10_cpu_do_interrupt;
>>     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
>>     cc->tcg_initialize = cris_initialize_crisv10_tcg;
>> }
>>
>> where the class initialization of the cpu is explicitly setting the methods of CPUClass, therefore implicitly relying on the fact that no other class initializer screws things up.
> 
> I don't see the problem here.  Having all other class
> initializers being called should be completely OK, because each
> class has its own ObjectClass struct.
> 
> 
>>
>> Given this context, which one of these methods is "right"?
>> Should we rework things so that only used cpu classes are actually initialized?
> 
> This option wouldn't make sense.  class_init is supposed to be
> called on demand on class lookup, and can be triggered by
> object_class_get_list(), object_class_by_name(), or similar
> functions.  This is by design.
> 
> 
>> Or should we maybe not do these settings in cpu class_init at all, but rather at cpu initfn time, or at cpu realize time?
> 
> If you are talking about initializing
> ObjectClass/CPUClass/...Class fields, they can always be safely
> initialized in class_init.

Ok, so I can initialize the CPUClass fields for the tcg ops in the CPUClass subclass class inits safely..

Thanks for clearing this up!

Claudio

> 
> If you are talking about touching anything outside the class
> struct (like in CPUState), class_init is not the right place to
> do it.
> 


