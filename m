Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19C662875
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:29:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEstR-0004vm-6U; Mon, 09 Jan 2023 09:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEstD-0004ss-0u
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEst9-000135-Q3
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673273554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWqfP7F5uddsdlue0Vk/G/Fr7SiuM8wPtWGD459/GHY=;
 b=AaH3cZnntKcMkt+zOl9QioQHl+tsDg37nMnUFduqPC/TTekTPoas9WUoBLo4QtrTX/LdXb
 c2PUUJ4epPlplpYGLY3mzCMtD/CA2LKmXOWswmzPzQHSBilZBemYsz1hgX0xYGVmV0est6
 KDEVJLmBpT/m/asva7bBAv3eS7qNnD0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-OiJG6LfUM7-boUdytF8omw-1; Mon, 09 Jan 2023 09:12:33 -0500
X-MC-Unique: OiJG6LfUM7-boUdytF8omw-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-4c1456d608cso92470197b3.15
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mWqfP7F5uddsdlue0Vk/G/Fr7SiuM8wPtWGD459/GHY=;
 b=ThvTaHijBj8qEKFe8TSyQsszfJv64YLRHIXM8wTYHVCx/qhM3GzoApYdd3uIl6x2A8
 TzFNAC2p0/GUXwcwioApyKWZuYoNeoGRWTGPXgb0OY3H4MJNbHWPPy7dVNkf2X+BNJ4r
 FTHz30fepyIigZS+Vdz/e3/kVq2bqJoVUm+2FS423Ok6S/AetpsxZEXxNzIgL9jR1wvM
 2tCeUS6vR6xy/L1LjzoCAgaARg3hJZjBfvUaDFpvp91fhBsAeby30NxgVP0nhtbqhiJZ
 W1DHekS27Xk6JqH4yHuvujx89xGkBOUlULbY5Mv7+EuhJ7/sGZsdEf9px4u0wuXIpT+V
 YL6g==
X-Gm-Message-State: AFqh2kq+WAPo66e3SsBty5Y5BHPrGq58/TnghBqku0sjdT5Pi+dZ2SMr
 Q32tOVeqwItbz99N+J1I4+nQMf1h0DkidLhbRznJDRTDyYJ5j/HXTegKw/OxBO5M3K9D3YVH1nR
 AVUkgegFGg2+UPxw=
X-Received: by 2002:a05:7500:1b0c:b0:f0:44e9:a334 with SMTP id
 dp12-20020a0575001b0c00b000f044e9a334mr182123gab.47.1673273552668; 
 Mon, 09 Jan 2023 06:12:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv6ejAZnWgyl22SM3sL7abSUQC6mEtsxkoEP37F+homAlaiizMsikey6AVYKvvifFSskSu2yQ==
X-Received: by 2002:a05:7500:1b0c:b0:f0:44e9:a334 with SMTP id
 dp12-20020a0575001b0c00b000f044e9a334mr182110gab.47.1673273552298; 
 Mon, 09 Jan 2023 06:12:32 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-179-204.web.vodafone.de.
 [109.43.179.204]) by smtp.gmail.com with ESMTPSA id
 m15-20020a05620a24cf00b007055dce4cecsm5431891qkn.97.2023.01.09.06.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 06:12:31 -0800 (PST)
Message-ID: <7f5de5f7-2bf1-869d-7b9b-ef44cbf78116@redhat.com>
Date: Mon, 9 Jan 2023 15:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/4] s390x/pv: Implement a CGS check helper
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, frankja@linux.ibm.com,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-2-clg@kaod.org>
 <db93e8a0-1591-1646-e920-e25842d76ec9@redhat.com>
 <cd41a799-3f5b-7503-66d7-c5a8c99611f9@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <cd41a799-3f5b-7503-66d7-c5a8c99611f9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 09/01/2023 14.57, Cédric Le Goater wrote:
> On 1/9/23 14:34, Thomas Huth wrote:
>> On 06/01/2023 08.53, Cédric Le Goater wrote:
>>> From: Cédric Le Goater <clg@redhat.com>
>>>
>>> When a protected VM is started with the maximum number of CPUs (248),
>>> the service call providing information on the CPUs requires more
>>> buffer space than allocated and QEMU disgracefully aborts :
>>>
>>>      LOADPARM=[........]
>>>      Using virtio-blk.
>>>      Using SCSI scheme.
>>>      
>>> ................................................................................... 
>>>
>>>      qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long
>>>
>>> When protected virtualization is initialized, compute the maximum
>>> number of vCPUs supported by the machine and return useful information
>>> to the user before the machine starts in case of error.
>>>
>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>   hw/s390x/pv.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 40 insertions(+)
>>>
>>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
>>> index 8dfe92d8df..8a1c71436b 100644
>>> --- a/hw/s390x/pv.c
>>> +++ b/hw/s390x/pv.c
>>> @@ -20,6 +20,7 @@
>>>   #include "exec/confidential-guest-support.h"
>>>   #include "hw/s390x/ipl.h"
>>>   #include "hw/s390x/pv.h"
>>> +#include "hw/s390x/sclp.h"
>>>   #include "target/s390x/kvm/kvm_s390x.h"
>>>   static bool info_valid;
>>> @@ -249,6 +250,41 @@ struct S390PVGuestClass {
>>>       ConfidentialGuestSupportClass parent_class;
>>>   };
>>> +/*
>>> + * If protected virtualization is enabled, the amount of data that the
>>> + * Read SCP Info Service Call can use is limited to one page. The
>>> + * available space also depends on the Extended-Length SCCB (ELS)
>>> + * feature which can take more buffer space to store feature
>>> + * information. This impacts the maximum number of CPUs supported in
>>> + * the machine.
>>> + */
>>> +static uint32_t s390_pv_get_max_cpus(void)
>>> +{
>>> +    int offset_cpu = s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
>>> +        offsetof(ReadInfo, entries) : SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
>>> +
>>> +    return (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry);
>>> +}
>>> +
>>> +static bool s390_pv_check_cpus(Error **errp)
>>> +{
>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>> +    uint32_t pv_max_cpus = s390_pv_get_max_cpus();
>>> +
>>> +    if (ms->smp.max_cpus > pv_max_cpus) {
>>> +        error_setg(errp, "Protected VMs support a maximum of %d CPUs",
>>> +                   pv_max_cpus);
>>> +        return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static bool s390_pv_guest_check(ConfidentialGuestSupport *cgs, Error 
>>> **errp)
>>> +{
>>> +    return s390_pv_check_cpus(errp);
>>> +}
>>> +
>>>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>>>   {
>>>       if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
>>> @@ -261,6 +297,10 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, 
>>> Error **errp)
>>>           return -1;
>>>       }
>>> +    if (!s390_pv_guest_check(cgs, errp)) {
>>> +        return -1;
>>> +    }
>>> +
>>>       cgs->ready = true;
>>>       return 0;
>>
>> Looks good to me now.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> I think we could move the huge page test in s390_pv_guest_check() also.
> We are finishing a discussion with Janosch on the runtime test and I will
> send a v3.

Core question is likely: What if the hypervisor admin does not know whether 
the guest will run in protected mode or not, and thus always wants to enable 
the feature (so that the owner of the guest can decide)? So we cannot know 
right from the start whether we have a confidential guest or not? ... should 
we then really check the condition at the beginning, or is it better to 
check when the guest tries to switch to protected mode?

  Thomas


