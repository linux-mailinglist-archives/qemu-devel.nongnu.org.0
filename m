Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D012C312D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 20:49:34 +0100 (CET)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kheJh-0000YZ-UC
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 14:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kheA7-0002ln-He
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:39:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:58412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kheA5-0004jq-5L
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:39:39 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A61AAC2E;
 Tue, 24 Nov 2020 19:39:35 +0000 (UTC)
Subject: Re: [RFC v5 12/12] accel: centralize initialization of CpusAccelOps
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-13-cfontana@suse.de>
 <20201124174821.GT2271382@habkost.net>
 <4deb0de9-9556-85da-76fb-8050551d6dd6@suse.de>
 <20201124192756.GX2271382@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <115546ec-1024-e515-8eba-b89937fb23ac@suse.de>
Date: Tue, 24 Nov 2020 20:39:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201124192756.GX2271382@habkost.net>
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

On 11/24/20 8:27 PM, Eduardo Habkost wrote:
> On Tue, Nov 24, 2020 at 07:52:15PM +0100, Claudio Fontana wrote:
> [...]
>>>> +    }
>>>
>>> Additionally, if you call arch_cpu_accel_init() here, you won't
>>> need MODULE_INIT_ACCEL_CPU anymore.  The
>>>
>>>   module_call_init(MODULE_INIT_ACCEL_CPU)
>>>
>>> call with implicit dependencies on runtime state inside vl.c and
>>> *-user/main.c becomes a trivial:
>>>
>>>   accel_init(accel)
>>>
>>> call in accel_init_machine() and *-user:main().
>>
>>
>>
>> I do need a separate thing for the arch cpu accel specialization though,
>> without MODULE_INIT_ACCEL_CPU that link between all operations done at accel-chosen time is missing..
>>
> 
> I think this is a key point we need to sort out.
> 
> What do you mean by "link between all operations done at
> accel-chosen time" and why that's important?


For understanding by a reader that tries to figure this out,
(see the gid MODULE_INIT_ACCEL_CPU comment elsewhere in the thread).

And it could be that the high level plan to make accelerators fully dynamically loadable plugins in the future
also conditioned me to want to have a very clear demarcation line around the choice of the accelerator.


> 
> accel_init_machine() has 2-3 lines of code with side effects.  It
> calls AccelClass.init_machine(), which may may have hundreds of


could we initialize also all arch-dependent stuff in here?


> lines of code.  accel_setup_post() has one additional method
> call, which is triggered at a slightly different moment.
> 
> You are using MODULE_INIT_ACCEL for 2 additional lines of code:
> - the cpus_register_accel() call
> - the x86_cpu_accel_init() call
> 
> What makes those 2 lines of code so special, to make them deserve
> a completely new mechanism to trigger them, instead of using
> trivial function calls inside a accel_init() function?
> 

...can we do also the x86_cpu_accel_init inside accel_init()?


In any case I'll try also the alternative, it would be nice if I could bring everything together under the same roof,
and easily discoverable, both the arch-specific steps that we need to do at accel-chosen time and the non-arch-specific steps.

Hope this helps clarifying where I am coming from,
but I am open to have my mind changed, also trying the alternatives you propose here could help me see first hand how things play out.

Thanks!

Claudio

