Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7C65EF7B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:56:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRdI-00066t-Nt; Thu, 05 Jan 2023 09:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDRd5-0005wA-OO
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDRd3-0004yH-Q4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672930430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIZSUUWiQHDfjtz4MM/GXpwuVCSuhhAsex2TLPrGvX8=;
 b=EnzetbBXDaJvpWsDJY6wH7nVQmMhtYAIsMQUWJh/d4Q2meeMJ1Svf2Fln/CO2bPNAziHE2
 Vtcfbo7cf/4cnnukmLpZiBkR5oUFQLSFNxR8im8uJlVDJDXvZrHOXJaVjn65xgLVTp8IBJ
 UaGJjZlX5nIh15TOyb3tjAeEXxjfsWg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-i6V4__ezO9eCn8ThsRMXQg-1; Thu, 05 Jan 2023 09:53:48 -0500
X-MC-Unique: i6V4__ezO9eCn8ThsRMXQg-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay32-20020a05600c1e2000b003d9730391b5so17245931wmb.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 06:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pIZSUUWiQHDfjtz4MM/GXpwuVCSuhhAsex2TLPrGvX8=;
 b=05JvQ09uJ8hmr///yq1bDFJA/fpPkyrOlkpcyUT5aahXZ6UMUFD/UUsBwjAR1/HW79
 aQGpRbXIzZtX/ZolIWX0ygdmncee9oB1FnHVA13uaFSci98kLLKXgI6zT8gBJMvGvhed
 hyUQ8yI55sbtecBtkUQOVXyJPq6q64Mc86LLIejzYl64EB2s+r8mLuZNuLq7hl7GyLuv
 CiMk9xn/bQKSVYwrWuZowYUCNyBL9+7c8vjNKQVQpv7UV1egLCnmDgCljDpN98nByRTb
 ls09JDudZsN4mQqLYUE3HDiTXnQ1ESylEbwJ7wTqixbQfJC5sZUoSCAL3B+y44JrhAMi
 0a4w==
X-Gm-Message-State: AFqh2kqCoutGVNNMxnuLZd/CqKka9Hjh4d/zo3WVU+438tzPEzWmhxRS
 DIsymyncCaSvnLya0pIAcxcrdPyG5ooq7ZQ7j4BIduGMFyG0b3DU4phAr8NgwsKAIEQ29IMAlFq
 poNGujCeKP6uOK7I=
X-Received: by 2002:adf:e445:0:b0:2a8:65c4:4ad9 with SMTP id
 t5-20020adfe445000000b002a865c44ad9mr3328825wrm.11.1672930427234; 
 Thu, 05 Jan 2023 06:53:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXscx8ekUhUxfFp8D1qsc0YH5l6m1u8kV+WjCdAYLznCv5GYEtSQROXWdh/6Uf4ft7ymN9f8iw==
X-Received: by 2002:adf:e445:0:b0:2a8:65c4:4ad9 with SMTP id
 t5-20020adfe445000000b002a865c44ad9mr3328806wrm.11.1672930426935; 
 Thu, 05 Jan 2023 06:53:46 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 i13-20020a5d438d000000b0029e1aa67fd2sm8182612wrq.115.2023.01.05.06.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 06:53:46 -0800 (PST)
Message-ID: <0ec1a61f-4ae9-e867-11ea-4f29944d31f8@redhat.com>
Date: Thu, 5 Jan 2023 15:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/5] s390x/pv: Implement CGS check handler
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-3-clg@kaod.org>
 <61d70e15-770b-7f62-54aa-3cc0ac3b3a35@redhat.com>
 <20230105145823.6a7345e6@p-imbrenda>
 <41e8c81a-ac90-3b57-c34b-c4e461323391@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <41e8c81a-ac90-3b57-c34b-c4e461323391@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05/01/2023 15.47, Cédric Le Goater wrote:
> On 1/5/23 14:58, Claudio Imbrenda wrote:
>> On Thu, 5 Jan 2023 12:42:54 +0100
>> Thomas Huth <thuth@redhat.com> wrote:
>>
>>> On 04/01/2023 12.51, Cédric Le Goater wrote:
>>>> From: Cédric Le Goater <clg@redhat.com>
>>>>
>>>> When a protected VM is started with the maximum number of CPUs (248),
>>>> the service call providing information on the CPUs requires more
>>>> buffer space than allocated and QEMU disgracefully aborts :
>>>>
>>>>       LOADPARM=[........]
>>>>       Using virtio-blk.
>>>>       Using SCSI scheme.
>>>>       
>>>> ................................................................................... 
>>>>
>>>>       qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long
>>>>
>>>> Implement a test for this limitation in the ConfidentialGuestSupportClass
>>>> check handler and provide some valid information to the user before the
>>>> machine starts.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>>> ---
>>>>    hw/s390x/pv.c | 23 +++++++++++++++++++++++
>>>>    1 file changed, 23 insertions(+)
>>>>
>>>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
>>>> index 8dfe92d8df..3a7ec70634 100644
>>>> --- a/hw/s390x/pv.c
>>>> +++ b/hw/s390x/pv.c
>>>> @@ -266,6 +266,26 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, 
>>>> Error **errp)
>>>>        return 0;
>>>>    }
>>>> +static bool s390_pv_check_cpus(Error **errp)
>>>> +{
>>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>> +    uint32_t pv_max_cpus = mc->max_cpus - 1;
>>>
>>> Not sure whether "mc->max_cpus - 1" is the right approach here. I think it
>>> would be better to calculate the amount of CPUs that we can support.
>>>
>>> So AFAIK the problem is that SCLP information that is gathered during
>>> read_SCP_info() in hw/s390x/sclp.c. If protected virtualization is enabled,
>>> everything has to fit in one page (i.e. 4096 bytes) there.
>>>
>>> So we have space for
>>>
>>>    (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry)
>>>
>>> CPUs.
>>>
>>> With S390_FEAT_EXTENDED_LENGTH_SCCB enabled, offset_cpu is 144 (see struct
>>> ReadInfo in sclp.h), otherwise it is 128.
>>>
>>> That means, with S390_FEAT_EXTENDED_LENGTH_SCCB we can have a maximum of:
>>>
>>>    (4096 - 144) / 16 = 247 CPUs
>>>
>>> which is what you were trying to check with the mc->max_cpus - 1 here.
> 
> yes. That's much better.
> 
>>> But with "-cpu els=off", it sounds like we could fit all 248 also with
>>> protected VMs? Could you please give it a try?
> 
> It runs. Unfortunately, QEMU also complains with :
> 
>    qemu-system-s390x: warning: 'diag318' requires 'els'.
>    qemu-system-s390x: warning: 'diag318' requires 'els'.
>    qemu-system-s390x: warning: 'diag318' requires 'els'.
> 
> when els is off.

There is also a switch for that: -cpu els=off,diag318=off

>>> Anyway, instead of using "pv_max_cpus = mc->max_cpus - 1" I'd suggest to use
>>> something like this instead:
>>>
>>>    int offset_cpu = s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
>>>                        offsetof(ReadInfo, entries) :
>>>                        SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
>>>    pv_max_cpus = (TARGET_PAGE_SIZE - offset_cpu) /sizeof(CPUEntry);
>>
>> I agree with Thomas here
> 
> 
> The problem is that QEMU doesn't know about the S390_FEAT_EXTENDED_LENGTH_SCCB
> feature when the PV object link is first checked. So #248 CPUs is considered
> valid, but when DIAG308_PV_START is called, it fails.

Drat. Is there any chance that the check could be done somewhere later?

> Let's simplify and use :
> 
>      int offset_cpu = offsetof(ReadInfo, entries);
>      pv_max_cpus = (TARGET_PAGE_SIZE - offset_cpu) /sizeof(CPUEntry);
> 
> ?

Depends ... if it is possible to use 248 CPUs with -cpu els=off,diag318=off 
then it would be nicer to allow that, too?

  Thomas


