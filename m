Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3BA640861
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 15:27:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p16zw-0005d7-1K; Fri, 02 Dec 2022 09:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p16zl-0005cJ-QA
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 09:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p16zj-0006EV-VL
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 09:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669991187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktJw7/THvKJQoer2k/gtmvKNVq80OfR1EB/ZswF3ibA=;
 b=EEXqMlEL8qfzkb543pUsxKs291S8/9w5P65F44g5LF2tya2JGE0MqW0VXKPf3Xu4u0ayqt
 506WHm29Zf92L5qvddMik4gIXoun8pTDuuXkefHd25QbOEkobbsPtIqCCJrR7zwlv4E4t6
 QXEIXVN5e5gw6dpFZVXOVmKkgtPO3Z0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-Sw-S3x6dPd6eJ5_rWOWh7w-1; Fri, 02 Dec 2022 09:26:26 -0500
X-MC-Unique: Sw-S3x6dPd6eJ5_rWOWh7w-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso2575843wmb.4
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 06:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ktJw7/THvKJQoer2k/gtmvKNVq80OfR1EB/ZswF3ibA=;
 b=6rHvhTNI4PBGQYvR0F6G8AowNk7GPId3fFEX7VadwB4Mxf1KAdvbuRAeKniMwwVSOD
 vj8Q4/7oAxcqV4uuU1dhki7ynU1aDvkdgcT7zwiU1DmiNGJAeN8F3O3evYrW5DWS7K+0
 XSv6qMgGHGkeVPZrsTUCnaGLCbdMx9xVYGaeos0z+ZkOBs43PVSDqTSKCPOTJRd4AZgZ
 KMPTE2RwcEzvSoZXCDsJ6TxC7kY4CqoFMTBm7qBCFTE8aNTkM1eE04hPyHesNAjhbjzt
 YScZ2EBO2iudcKvKkaDY9rNRmr1BTxrmy3uBLtIBd0Fs4oA4Ohogey5DVmC0YcL1GDC0
 Q05w==
X-Gm-Message-State: ANoB5pm2GnhqAJshPuieEafodcXFfMrZ38iiIGyxxPIPZjGt/Q2dWtKJ
 zOnjF2Wj9FcLMm8f36rfyKdIZJHaEnxJsCUe4tTUYcMzYisUt7wIRMmKEPxd6ozigYvPG57dZqg
 s8mxFawgkysomJDw=
X-Received: by 2002:a5d:44c9:0:b0:242:ac5:e5e6 with SMTP id
 z9-20020a5d44c9000000b002420ac5e5e6mr19110898wrr.127.1669991184794; 
 Fri, 02 Dec 2022 06:26:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf74xCjHk/8jPmEDg28xhITzDYfDfF6+mdxAi0ScwpscCS6wYsH4t8jqx+tup07nZhB63CHYJg==
X-Received: by 2002:a5d:44c9:0:b0:242:ac5:e5e6 with SMTP id
 z9-20020a5d44c9000000b002420ac5e5e6mr19110859wrr.127.1669991184430; 
 Fri, 02 Dec 2022 06:26:24 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-86.web.vodafone.de.
 [109.43.178.86]) by smtp.gmail.com with ESMTPSA id
 q1-20020a05600000c100b002422fddcc94sm6545678wrx.96.2022.12.02.06.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 06:26:23 -0800 (PST)
Message-ID: <2c65f234-688a-796b-b451-e1661b2c07a4@redhat.com>
Date: Fri, 2 Dec 2022 15:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 david@redhat.com
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, cohuck@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, kvm@vger.kernel.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, scgl@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
 <20221129174206.84882-7-pmorel@linux.ibm.com>
 <fcedb98d-4333-9100-5366-8848727528f3@redhat.com>
 <ea965d1c-ab6a-5aa3-8ce3-65b8177f6320@linux.ibm.com>
 <37a20bee-a3fb-c421-b89d-c1760e77cb11@redhat.com>
 <59669e8e-6242-9c01-4c2e-5d70b9c31b2b@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v12 6/7] s390x/cpu_topology: activating CPU topology
In-Reply-To: <59669e8e-6242-9c01-4c2e-5d70b9c31b2b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/12/2022 15.08, Pierre Morel wrote:
> 
> 
> On 12/2/22 10:05, Thomas Huth wrote:
>> On 01/12/2022 12.52, Pierre Morel wrote:
>>>
>>>
>>> On 12/1/22 11:15, Thomas Huth wrote:
>>>> On 29/11/2022 18.42, Pierre Morel wrote:
>>>>> The KVM capability, KVM_CAP_S390_CPU_TOPOLOGY is used to
>>>>> activate the S390_FEAT_CONFIGURATION_TOPOLOGY feature and
>>>>> the topology facility for the guest in the case the topology
>>>>> is available in QEMU and in KVM.
>>>>>
>>>>> The feature is fenced for SE (secure execution).
>>>>
>>>> Out of curiosity: Why does it not work yet?
>>>>
>>>>> To allow smooth migration with old QEMU the feature is disabled by
>>>>> default using the CPU flag -disable-topology.
>>>>
>>>> I stared at this code for a while now, but I have to admit that I don't 
>>>> quite get it. Why do we need a new "disable" feature flag here? I think 
>>>> it is pretty much impossible to set "ctop=on" with an older version of 
>>>> QEMU, since it would require the QEMU to enable 
>>>> KVM_CAP_S390_CPU_TOPOLOGY in the kernel for this feature bit - and older 
>>>> versions of QEMU don't set this capability yet.
>>>>
>>>> Which scenario would fail without this disable-topology feature bit? 
>>>> What do I miss?
>>>
>>> The only scenario it provides is that ctop is then disabled by default on 
>>> newer QEMU allowing migration between old and new QEMU for older machine 
>>> without changing the CPU flags.
>>>
>>> Otherwise, we would need -ctop=off on newer QEMU to disable the topology.
>>
>> Ah, it's because you added S390_FEAT_CONFIGURATION_TOPOLOGY to the default 
>> feature set here:
>>
>>   static uint16_t default_GEN10_GA1[] = {
>>       S390_FEAT_EDAT,
>>       S390_FEAT_GROUP_MSA_EXT_2,
>> +    S390_FEAT_DISABLE_CPU_TOPOLOGY,
>> +    S390_FEAT_CONFIGURATION_TOPOLOGY,
>>   };
>>
>> ?
>>
>> But what sense does it make to enable it by default, just to disable it by 
>> default again with the S390_FEAT_DISABLE_CPU_TOPOLOGY feature? ... sorry, 
>> I still don't quite get it, but maybe it's because my sinuses are quite 
>> clogged due to a bad cold ... so if you could elaborate again, that would 
>> be very appreciated!
>>
>> However, looking at this from a distance, I would not rather not add this 
>> to any default older CPU model at all (since it also depends on the kernel 
>> to have this feature enabled)? Enabling it in the host model is still ok, 
>> since the host model is not migration safe anyway.
>>
>>   Thomas
>>
> 
> I think I did not understand what is exactly the request that was made about 
> having a CPU flag to disable the topology when we decide to not have a new 
> machine with new machine property.
> 
> Let see what we have if the only change to mainline is to activate 
> S390_FEAT_CONFIGURATION_TOPOLOGY with the KVM capability:
> 
> In mainline, ctop is enabled in the full GEN10 only.
> 
> Consequently we have this feature activated by default for the host model 
> only and deactivated by default if we specify the CPU.
> It can be activated if we specify the CPU with the flag ctop=on.
> 
> This is what was in the patch series before the beginning of the discussion 
> about having a new machine property for new machines.

Sorry for all the mess ... I'm also not an expert when it comes to CPU model 
features paired with compatibility and migration, and I'm still in progress 
of learning ...

> If this what we want: activating the topology by the CPU flag ctop=on it is 
> perfect for me and I can take the original patch.
> We may later make it a default for new machines.

Given my current understanding, I think it's the best thing to do right now. 
Not enable it by default, except for the host model where the enablement is 
fine since migration is not supported any.

As you said, we could still decide later to change the default for new 
machines. Though, I recently learnt that features should also not be enable 
by default at all if they depend on the environment, like a Linux kernel 
that needs to have support for the feature. So maybe we should keep it off 
by default forever - or just enable it on new CPU models (>=z17?) that would 
require a new host kernel anyway.

  Thomas


