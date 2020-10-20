Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E13287475
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 14:43:19 +0200 (CEST)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQVGQ-0007Y3-Jc
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 08:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kQVFK-00074r-6h
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 08:42:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:43012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kQVFI-00081k-0D
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 08:42:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AF68AFDF;
 Thu,  8 Oct 2020 12:42:06 +0000 (UTC)
Subject: Re: [PATCH 2/2] exec: split out non-softmmu-specific parts
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20201006091922.331832-1-pbonzini@redhat.com>
 <20201006091922.331832-3-pbonzini@redhat.com>
 <cb553da1-9cd1-1933-d678-8580a3c0d8f3@suse.de>
 <027d0f5c-d5c4-911b-b349-f63895fc164d@redhat.com>
 <b6e4d4e0-6170-b3e6-f2f7-e337c71b0403@suse.de>
 <0ad53a3b-f28b-b53b-2541-3108e40e282a@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d013a1c0-9450-c864-d762-13ead60ab8f3@suse.de>
Date: Thu, 8 Oct 2020 14:42:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0ad53a3b-f28b-b53b-2541-3108e40e282a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 23:49:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.214,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/20 1:36 PM, Paolo Bonzini wrote:
> On 08/10/20 13:02, Claudio Fontana wrote:
>>>> What is the role of this new module?
>>>
>>> It's [...] "4-500 lines of code for the target
>>> specific parts of the CPU QOM object, plus a few functions for user-mode
>>> emulation that do not have a better place".
>>>
>>> It's basically sitting between hw/core/cpu.c and target/*/cpu.c.  Hence
>>> the non-descriptive name. :)
>>>
>>>> Or its this basically a "leftovers" file for which we did not find a proper role yet?
>>>
>>> The user-mode parts are, but most of it is implementing the QOM CPU
>>> object.  We can move those functions to hw/core/cpu.c and make that file
>>> target-dependent, I wouldn't object to that.
>>
>> this gives me an idea, we already basically have a target-specific part of a cpu QEMU object.
> 
> Which is? :)  Sorry I don't follow.  We have one that depends on the
> target architecture (methods in the CPU class), but not one that depends
> on the target kind.  We could add more methods in the CPU class for
> that, but I'm not sure it would be useful because (unlike CPUs of which
> in theory there could be >1 class in the system) the whole emulation
> _has_ to be either user-level or system.
> 
>> I basically was looking for a place to graft accelerator-specific code in order to refactor target/i386/cpu..., 
>> to split between tcg stuff and non-tcg stuff, and thus refactor even more code.
>>
>> In the past I thought to put them here for example:
>>
>> diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
>> index 3e96f8d668..3716c3e949 100644
>> --- a/target/i386/cpu-qom.h
>> +++ b/target/i386/cpu-qom.h
>> @@ -72,6 +72,12 @@ typedef struct X86CPUClass {
>>      DeviceRealize parent_realize;
>>      DeviceUnrealize parent_unrealize;
>>      DeviceReset parent_reset;
>> +
>> +    /* methods operating on CPUX86State */
>> +    uint32_t (*cpu_compute_eflags)(CPUX86State *env);
>> +    void (*cpu_set_mxcsr)(CPUX86State *env, uint32_t mxcsr);
>> +    void (*cpu_set_fpuc)(CPUX86State *env, uint16_t fpuc);
>> +    void (*cpu_report_tpr_access)(CPUX86State *env, TPRAccess access);
>>  } X86CPUClass;
>>  
>>  typedef struct X86CPU X86CPU;
> 
> I think in this case you would have an X86AccelOps struct and a global
> variable pointing to it.
> 
> Paolo
> 
> 

I was hoping to make use of some of the object model ... but lets get to this when we get to this later on.

Ciao, thanks!

Claudio

