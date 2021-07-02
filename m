Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE73B9BE8
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 07:16:48 +0200 (CEST)
Received: from localhost ([::1]:59590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzBXj-0002Mg-Fv
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 01:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1lzBWB-0001Rh-Fu
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 01:15:12 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1lzBW5-0005T3-Vv
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 01:15:08 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c15so4958592pls.13
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 22:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bitsTFbaSgi55l603WjcGKdIz+e62JMCbs99rXkFdr0=;
 b=CHXSJWbfFhFXUP2gozxFr1La2yF/qfaZAzVyZJ7lqeFaHgU045mYRr2K6As5UhXnMx
 /mnjnoYmlgerC1nN4uJOYsofd2JxmyIbENT+ju6lRA0dTT5YoR5rDsh/BcxnzwAQ8RQB
 0+G5x7SdT1bk81vNFppIqkbwjdAihbXVIoro7yY6jQpHDnFIyjjloiuEA+c3o9xBpDpq
 cCAd14dsMNAuZnof/dZrU9gnxuBf13bDlgzFduM8R2lAHXmE/4/a+L5lPuKSmywwHIK8
 sfAr2g/3g/jk91+B6iTUFbTJJ/JjpiFABN/Tq4bxp6MSKTrdk0zbjMXdwQIUjJpIT2nh
 +FQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bitsTFbaSgi55l603WjcGKdIz+e62JMCbs99rXkFdr0=;
 b=A/BkDhybNy/V9roD59hqvJtcS/BKQbZJKsmQZwyFRLfFm+eCmim4voENL9+LGrJZTF
 04oiNjd15fNxmS3ZlOCZTxKJlHenXY5UXERRio5nok8HpwlN6c9PYTsDQbvLwJbaLjqw
 5JbLjsQbEG+3Gnq9plZynzvR8VumhsG7eDbVmSd+duwAJzs0vV+lY9Uz6FgkuinQsF98
 ceT3fdbgP/cutB7Us9ciZZhJCmy9q4sQJZWODjdBMJIkgc7amPhqP6XRKS/0dLCayinY
 ISGZk04GsSu8TZ9cxtqnixFCWu6TdbuBSRLtgnulLyunxJVm1owLdf/hQhUXibxJoI/D
 +e7g==
X-Gm-Message-State: AOAM532xMDy7lb8nkq7bcvvJwxrrI9pNxgc+tsdhi50FwD1p4T+nw3aA
 qfV+mgWVnKA9qcnncZO+LTvdFA==
X-Google-Smtp-Source: ABdhPJyDU8KdcupDT8ZhVEZYyY/jCFsrciQdQEmpAkmtVTqcBtHaMBOP/znhlCjMtFE4aWLiHh8Mjg==
X-Received: by 2002:a17:90b:370b:: with SMTP id
 mg11mr13588470pjb.136.1625202903125; 
 Thu, 01 Jul 2021 22:15:03 -0700 (PDT)
Received: from [10.76.12.68] ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id f6sm1685397pfj.28.2021.07.01.22.14.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Jul 2021 22:15:02 -0700 (PDT)
Subject: Re: [External] Re: [PATCH] target/i386: Fix cpuid level for AMD
To: Michael Roth <michael.roth@amd.com>, Igor Mammedov <imammedo@redhat.com>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm> <162508068941.526217.2563710865841096339@amd.com>
 <20210701104313.5b64a9b4@redhat.com>
 <162517174973.564224.1039189315728194554@amd.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <2952f218-f391-36d5-6331-006d9312cc66@bytedance.com>
Date: Fri, 2 Jul 2021 13:14:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <162517174973.564224.1039189315728194554@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: ehabkost@redhat.com, like.xu@linux.intel.com, qemu-devel@nongnu.org,
 wei.huang2@amd.com, richard.henderson@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, armbru@redhat.com,
 babu.moger@amd.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 4:35 AM, Michael Roth wrote:
> Quoting Igor Mammedov (2021-07-01 03:43:13)
>> On Wed, 30 Jun 2021 14:18:09 -0500
>> Michael Roth <michael.roth@amd.com> wrote:
>>
>>> Quoting Dr. David Alan Gilbert (2021-06-29 09:06:02)
>>>> * zhenwei pi (pizhenwei@bytedance.com) wrote:
>>>>> A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
>>>>> should not be changed to 0x1f in multi-dies case.
>>>>>
>>>>> Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
>>>>> for multi-dies PCMachine)
>>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>>
>>>> (Copying in Babu)
>>>>
>>>> Hmm I think you're right.  I've cc'd in Babu and Wei.
>>>>
>>>> Eduardo: What do we need to do about compatibility, do we need to wire
>>>> this to machine type or CPU version?
>>>
>>> FWIW, there are some other CPUID entries like leaves 2 and 4 that are
>>> also Intel-specific. With SEV-SNP CPUID enforcement, advertising them to
>>> guests will result in failures when host SNP firmware checks the
>>> hypervisor-provided CPUID values against the host-supported ones.
>>>
>>> To address this we've been planning to add an 'amd-cpuid-only' property
>>> to suppress them:
>>>
>>>    https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3eff03e21b
>>>
>>> My thinking is this property should be off by default, and only defined
>>> either via explicit command-line option, or via new CPU types. We're also
>>> planning to add new CPU versions for EPYC* CPU types that set this
>>> 'amd-cpuid-only' property by default:
>>>
>>>    https://github.com/mdroth/qemu/commits/new-cpu-types-upstream
>> It look like having new cpu versions is enough to change behavior,
>> maybe keep 'amd-cpuid-only' as internal field and not expose it to users
>> as a property.
> 
> Hmm, I defined it as a property mainly to make use of
> X86CPUVersionDefinition.props to create new versions of the CPU types
> with those properties set.
> 
> There's a patch there that adds X86CPUVersionDefinition.cache_info so
> that new cache definitions can be provided for new CPU versions. So
> would you suggest a similar approach here, e.g. adding an
> X86CPUVersionDefinition.amd_cpuid_only field that could be used directly
> rather than going through X86CPUVersionDefinition.props?
> 
> There's also another new "amd-xsave" prop in that series that does something
> similar to "amd-cpuid-only", so a little worried about tacking to much extra
> into X86CPUVersionDefinition. But maybe that one could just be rolled into
> "amd-cpuid-only" since it is basically fixing up xsave-related cpuid
> entries for AMD...
> 
Hi, this patch wants to fix the issue:
AMD CPU (Rome/Milan) should get the cpuid level 0x10, not 0x1F in the 
guest. If QEMU reports a 0x1F to guest, guest(Linux) would use leaf 0x1F 
instead of leaf 0xB to get extended topology:

https://github.com/torvalds/linux/blob/master/arch/x86/kernel/cpu/topology.c#L49

static int detect_extended_topology_leaf(struct cpuinfo_x86 *c)
{
	if (c->cpuid_level >= 0x1f) {
		if (check_extended_topology_leaf(0x1f) == 0)
			return 0x1f;
	}

	if (c->cpuid_level >= 0xb) {
		if (check_extended_topology_leaf(0xb) == 0)
			return 0xb;
	}

	return -1;
}

Because of the wrong cpuid level, the guest gets unexpected topology 
from leaf 0x1F.

I tested https://github.com/mdroth/qemu/commits/new-cpu-types-upstream, 
and it seems that these patches could not fix this issue.

>>
>>> So in general I think maybe this change should be similarly controlled by
>>> this proposed 'amd-cpuid-only' property. Maybe for this particular case it's
>>> okay to do it unconditionally, but it sounds bad to switch up the valid CPUID
>>> range after a guest has already booted (which might happen with old->new
>>> migration for instance), since it might continue treating values in the range
>>> as valid afterward (but again, not sure that's the case here or not).
>>>
>>> There's some other changes with the new CPU types that we're still
>>> considering/testing internally, but should be able to post them in some form
>>> next week.
>>>
>>> -Mike
>>>
>>>>
>>>> Dave
>>>>    
>>>>> ---
>>>>>   target/i386/cpu.c | 8 ++++++--
>>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>>>> index a9fe1662d3..3934c559e4 100644
>>>>> --- a/target/i386/cpu.c
>>>>> +++ b/target/i386/cpu.c
>>>>> @@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>>>>>               }
>>>>>           }
>>>>>   
>>>>> -        /* CPU topology with multi-dies support requires CPUID[0x1F] */
>>>>> -        if (env->nr_dies > 1) {
>>>>> +        /*
>>>>> +         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
>>>>> +         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
>>>>> +         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU.
>>>>> +         */
>>>>> +        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
>>>>>               x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
>>>>>           }
>>>>>   
>>>>> -- 
>>>>> 2.25.1
>>>>>
>>>>>    
>>>> -- 
>>>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>>>>
>>>>   
>>>
>>
>>

-- 
zhenwei pi

