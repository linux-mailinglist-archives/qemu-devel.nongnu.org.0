Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29091399C4D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:15:12 +0200 (CEST)
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiVS-0003Yw-MC
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1loiTv-0002rj-DN
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:13:35 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:57814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1loiTt-0002Ju-8C
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:13:35 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9CEA2219E0;
 Thu,  3 Jun 2021 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622708011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0hAS/+JOqW0pC3+f93GRJjQSSlwZsp5HUXVeOPm3Jo=;
 b=zTArNU/5QZWIzv6BbzAdGNlKCvtSflyt7ZEnAIQnggkZxRdnA3YHyeE8/2wPmFopHJ1D+Q
 PAVP/R/IYaWRWrW0GMQHOUmOifWA1kth+MXP80BmwaAbYnq++pzn2JTStpg6/0kOVxr45/
 NxT5K6+RE9qCPGfFmUErArPsJkLikTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622708011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0hAS/+JOqW0pC3+f93GRJjQSSlwZsp5HUXVeOPm3Jo=;
 b=5NS+Hn6Xf811hAr0jc4ckcfOjeY4w0YCaXHbymHmUpJVXwqYldlAQrxgmZW6ULKo9l1rY0
 jsKMzVgDdwFT0GBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 1F35A118DD;
 Thu,  3 Jun 2021 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622708011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0hAS/+JOqW0pC3+f93GRJjQSSlwZsp5HUXVeOPm3Jo=;
 b=zTArNU/5QZWIzv6BbzAdGNlKCvtSflyt7ZEnAIQnggkZxRdnA3YHyeE8/2wPmFopHJ1D+Q
 PAVP/R/IYaWRWrW0GMQHOUmOifWA1kth+MXP80BmwaAbYnq++pzn2JTStpg6/0kOVxr45/
 NxT5K6+RE9qCPGfFmUErArPsJkLikTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622708011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0hAS/+JOqW0pC3+f93GRJjQSSlwZsp5HUXVeOPm3Jo=;
 b=5NS+Hn6Xf811hAr0jc4ckcfOjeY4w0YCaXHbymHmUpJVXwqYldlAQrxgmZW6ULKo9l1rY0
 jsKMzVgDdwFT0GBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id y7WWBSuPuGAFKAAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 03 Jun 2021 08:13:31 +0000
Subject: Re: [PATCH 1/2] i386: reorder call to cpu_exec_realizefn in
 x86_cpu_realizefn
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210529091313.16708-1-cfontana@suse.de>
 <20210529091313.16708-2-cfontana@suse.de>
 <20210601184832.teij5fkz6dvyctrp@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <dade01d5-071e-75f7-481f-01f6d2ba907c@suse.de>
Date: Thu, 3 Jun 2021 10:13:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210601184832.teij5fkz6dvyctrp@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Siddharth Chandrasekaran <sidcha@amazon.de>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 8:48 PM, Eduardo Habkost wrote:
> +Vitaly
> 
> On Sat, May 29, 2021 at 11:13:12AM +0200, Claudio Fontana wrote:
>> we need to expand features first, before we attempt to check them
>> in the accel realizefn code called by cpu_exec_realizefn().
>>
>> At the same time we need checks for code_urev and host_cpuid_required,
>> and modifications to cpu->mwait to happen after the initial setting
>> of them inside the accel realizefn code.
> 
> I miss an explanation why those 3 steps need to happen after
> accel realizefn.
> 
> I'm worried by the fragility of the ordering.  If there are
> specific things that must be done before/after
> cpu_exec_realizefn(), this needs to be clear in the code.

Hi Eduardo,

indeed the initialization and realization code for x86 appears to be very sensitive to ordering.
This continues to be the case after the fix.

cpu_exec_realizefn



> 
>>
>> Partial Fix.
>>
>> Fixes: 48afe6e4eabf ("i386: split cpu accelerators from cpu.c, using AccelCPUClass")
> 
> Shouldn't this be
>   f5cc5a5c1686 ("i386: split cpu accelerators from cpu.c, using AccelCPUClass")
> ?
> 
> Also, it looks like part of the ordering change was made in
> commit 30565f10e907 ("cpu: call AccelCPUClass::cpu_realizefn in
> cpu_exec_realizefn").
> 
> 
> 
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/i386/cpu.c | 56 +++++++++++++++++++++++------------------------
>>  1 file changed, 28 insertions(+), 28 deletions(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 9e211ac2ce..6bcb7dbc2c 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -6133,34 +6133,6 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>>      Error *local_err = NULL;
>>      static bool ht_warned;
>>  
>> -    /* Process Hyper-V enlightenments */
>> -    x86_cpu_hyperv_realize(cpu);
> 
> Vitaly, is this reordering going to affect the Hyper-V cleanup
> work you are doing?  It seems harmless and it makes sense to keep
> the "realize" functions close together, but I'd like to confirm.
> 
>> -
>> -    cpu_exec_realizefn(cs, &local_err);
>> -    if (local_err != NULL) {
>> -        error_propagate(errp, local_err);
>> -        return;
>> -    }
>> -
>> -    if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
>> -        g_autofree char *name = x86_cpu_class_get_model_name(xcc);
>> -        error_setg(&local_err, "CPU model '%s' requires KVM or HVF", name);
>> -        goto out;
>> -    }
>> -
>> -    if (cpu->ucode_rev == 0) {
>> -        /* The default is the same as KVM's.  */
>> -        if (IS_AMD_CPU(env)) {
>> -            cpu->ucode_rev = 0x01000065;
>> -        } else {
>> -            cpu->ucode_rev = 0x100000000ULL;
>> -        }
>> -    }
>> -
>> -    /* mwait extended info: needed for Core compatibility */
>> -    /* We always wake on interrupt even if host does not have the capability */
>> -    cpu->mwait.ecx |= CPUID_MWAIT_EMX | CPUID_MWAIT_IBE;
>> -
>>      if (cpu->apic_id == UNASSIGNED_APIC_ID) {
>>          error_setg(errp, "apic-id property was not initialized properly");
>>          return;
>> @@ -6190,6 +6162,34 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>>             & CPUID_EXT2_AMD_ALIASES);
>>      }
>>  
>> +    /* Process Hyper-V enlightenments */
>> +    x86_cpu_hyperv_realize(cpu);
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
> 
> I'm worried by the reordering of cpu_exec_realizefn().  That
> function does a lot, and reordering it might have even more
> unwanted side effects.
> 
> I wonder if it wouldn't be easier to revert commit 30565f10e907
> ("cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn").

the part that is wrong in that commit does not I think have to do with where the accel_cpu::cpu_realizefn() is called, but rather
the move of the call to cpu_exec_realizefn (now including the accel_cpu::cpu_realizefn) to the very beginning of the function.

This was done due to the fact that the accel-specific code needs to be called before the code:

* if (cpu->ucode_rev == 0) {

(meaning "use default if nothing accelerator specific has been set"), as this could be set by accel-specific code,

* cpu->mwait.ecx |= CPUID_MWAIT_EMX | CPUID_MWAIT_IBE;

(as the mwait is written to by cpu "host" kvm/hvf-specific code when enabling cpu pm),

* if (cpu->phys_bits && ...

(as the phys bits can be set by calling the host CPUID)

But I missed there that we cannot move the call before the expansion of cpu features,
as the accel realize code checks and enables additional features assuming expansion has already happened.

This was what was breaking the cpu "host" phys bits, even after correcting the cpu instance initialization order,
as the KVM/HVF -specific code would do the adjustment of phys bits to match the host only if:

* if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {



> 
> 
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>> +    if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
>> +        g_autofree char *name = x86_cpu_class_get_model_name(xcc);
>> +        error_setg(&local_err, "CPU model '%s' requires KVM or HVF", name);
>> +        goto out;
>> +    }
>> +
>> +    if (cpu->ucode_rev == 0) {
>> +        /* The default is the same as KVM's.  */
>> +        if (IS_AMD_CPU(env)) {
>> +            cpu->ucode_rev = 0x01000065;
>> +        } else {
>> +            cpu->ucode_rev = 0x100000000ULL;
>> +        }
>> +    }
>> +
>> +    /* mwait extended info: needed for Core compatibility */
>> +    /* We always wake on interrupt even if host does not have the capability */
>> +    cpu->mwait.ecx |= CPUID_MWAIT_EMX | CPUID_MWAIT_IBE;
>> +
> 
> The dependency between those lines and cpu_exec_realizefn() is
> completely unclear here.  What can we do to make this clearer and
> less fragile?

Should I add something similar to my comment above?

There _is_ something already in the patch that I added as I detected these dependencies,
but I notably did not mention the mwait one, and missed completely the cpu expansion issue.

It's in kvm-cpu.c:

static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
{
    /*                                                                                                                                      
     * The realize order is important, since x86_cpu_realize() checks if                                                                    
     * nothing else has been set by the user (or by accelerators) in                                                                        
     * cpu->ucode_rev and cpu->phys_bits.                                                                                                   
     *                                                                                                                                      
     * realize order:                                                                                                                       
     * kvm_cpu -> host_cpu -> x86_cpu                                                                                                       
     */

Maybe there is a better place to document this, where we could also describe in more detail the other dependencies?

On my side the main question would be: did I miss some other order dependency?

Knowing exactly what the current code assumptions are, and where those dependencies lie
would be preferable I think compared with reverting the commits.

Something able to cover this with reliable tests would be a good way to feel more confident with the resolution,
to make sure that something else is not hiding in there..

> 
> Note that this is not a comment on this fix, specifically, but on
> how the initialization ordering is easy to break here.
> 
> 
>>      /* For 64bit systems think about the number of physical bits to present.
>>       * ideally this should be the same as the host; anything other than matching
>>       * the host can cause incorrect guest behaviour.
>> -- 
>> 2.26.2
>>
> 

Thanks,

Claudio

