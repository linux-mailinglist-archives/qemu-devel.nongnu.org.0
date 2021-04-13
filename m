Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F435DA34
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:39:48 +0200 (CEST)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEaJ-0005X2-1i
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWETH-0000bI-3w
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:32:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:58958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWETB-00055d-KE
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:32:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0694AAFF1;
 Tue, 13 Apr 2021 08:32:24 +0000 (UTC)
Subject: Re: [RFC v12 27/65] target/arm: split a15 cpu model and 32bit class
 functions to cpu32.c
From: Claudio Fontana <cfontana@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-28-cfontana@suse.de>
 <e49aa062-0958-1d4e-c682-28d0a2897493@linaro.org>
 <87e94d27-a1ec-cd6a-8079-0f975121d479@suse.de>
Message-ID: <9fa0e6ae-2594-7a5f-6d5b-9d88495bb47a@suse.de>
Date: Tue, 13 Apr 2021 10:32:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87e94d27-a1ec-cd6a-8079-0f975121d479@suse.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 12:23 PM, Claudio Fontana wrote:
> On 3/28/21 6:18 PM, Richard Henderson wrote:
>> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>>> provide helper functions there to initialize 32bit models,
>>> and export the a15 cpu model.
>>>
>>> We still need to keep around a15 until we sort out the board configurations.
>>>
>>> cpu.c will continue to contain the common parts between
>>> 32 and 64.
>>>
>>> Note that we need to build cpu32 also for TARGET_AARCH64,
>>> because qemu-system-aarch64 is supposed to be able to run
>>> non-aarch64 cpus too.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>
>> Dump state has nothing to do with a15 or the 32-bit models.
> 
> The relationship I see here is that 32-bit builds,
> 
> only really need to use aarch32 version of the dump state, and they do not need to see the aarch64 version.
> 
>> Moving that should be a separate change.
>>
>> The gdbstub changes are also a separate change, afaics.
> 
> 


To hopefully clarify things a bit more here,

the current hierarchy seems not right for ARM CPUs also in this respect.

TYPE_ARM_CPU is the ancestor of all ARM CPUs, ok.
TYPE_AARCH64_CPU is child of TYPE_ARM_CPU, ok.

There is however no TYPE_AARCH32_CPU, or TYPE_ARM32_CPU.

So what ends up being necessary here (both in the mainline code and in this patch, which just makes it more explicit),
is to make the ancestor TYPE_ARM_CPU effectively a 32bit CPU class, with TYPE_AARCH64_CPU overriding class methods in order to morph it into a 64bit CPU class.

What this patch does is to make it explicit, by creating a cpu32.c module that contains this non-explicit 32bit ARM CPU class methods, and the registration function to register 32bit ARM cpus.

Thanks,

Claudio

> But the main concern is to split more, I understand: will do.
> 
>>
>> I don't understand the a15 comment above.  Is it really relevant to moving the 
>> 32-bit cpu models?
> 
> 
> The point there was that we keep around a15 for KVM for the moment, instead of relegating it to the set of "tcg-only" models,
> so that virt board and qtest continue to function also in the KVM-only build.
> 
> Mainly for this code here a question from my side: is the current code actually already "wrong"?
> 
> I mean, we unconditionally set the aarch64-capable cpu classes to all use aarch64_gdb_arch_name and gdbstub64,
> but what about an aarch64-capable cpu running in 32bit mode?
> 
> Why don't we have, like tentatively done here for arm_cpu_dump_state,
> 
> an arm_gdb_arch_name and an arm_cpu_gdb_read_register that check is_a64() and call aaarch32_cpu_gdb_read_register or aarch64_cpu_gdb_read_register accordingly?
> 
> 
>>
>>
>> r~
>>
> 


