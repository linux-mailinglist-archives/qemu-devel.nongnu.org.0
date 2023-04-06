Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABB86D919A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 10:32:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkL1c-0004dc-Dc; Thu, 06 Apr 2023 04:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkL1S-0004ZK-8Q
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkL1M-0007xB-Tx
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680769861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ERnzxn9Qx+vwXFLzk0V7Z+TZPxG+skd++dkET3pEDA=;
 b=fq5hrbMEhSr5sV2EYnGWDORJco4nvgQELjlwSO/41rdakmqlGvjgpENehimCW/VeH4zX4E
 E3+MFG9oYrgfH21vqyXP12eLTt6XkqWt+OpZlH0ND/A1Qczeq2sZn/vir4+eG5heyVdYfs
 eXQrftlGl1/oTebIvowhRfkevqjzYhY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-3Oa8ez4TNr-_ctt7P85WgA-1; Thu, 06 Apr 2023 04:31:00 -0400
X-MC-Unique: 3Oa8ez4TNr-_ctt7P85WgA-1
Received: by mail-qt1-f200.google.com with SMTP id
 u22-20020a05622a011600b003dfd61e8594so26270975qtw.15
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 01:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680769860;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ERnzxn9Qx+vwXFLzk0V7Z+TZPxG+skd++dkET3pEDA=;
 b=VDI1kToRUfXF05DTkyo/u6f9N1WuWB1jHsAteZNk5Ws+LeYQqFegP7wF/IMEZyJ+XT
 O4qDYhXy0HaaPbD6RV883V/mHHt4FKauRhv8InP3ijyD/N3hkHY674FYgElaj6YdT+Bs
 WcWR6gtvO3YlRZqs7Auhn7RTR5OhtguKSb1xRlgQB/Ms5xWTTTvaGmYlcwnHEt2VRAdC
 gJhnjC1bD27VCDLmSURXVyDhE4XsJ78icMymqHe6FE26MnqVpcO8PxraduMi3hPdZnxo
 IvsslSYcJTUPOfUS7vUaiVAeAVDxPJZiueTef2d+plekaFs/l6DGaqCVfqSEnTeGuKIH
 nMtg==
X-Gm-Message-State: AAQBX9cRnnKd9V6azhrK8wUbpfaYTlyy9pM4zymBj8c3nm8eMu+uw94R
 8LFTKagODCgazpKbxbzGJ+mlXUREW4JeMc+M+aSvKCay4MrUWs3URNntlAZ6xkfpqDQ5rLpwBWL
 mp43yb/uJLT8zfYs=
X-Received: by 2002:a05:622a:1707:b0:3e3:93ae:d104 with SMTP id
 h7-20020a05622a170700b003e393aed104mr10590519qtk.30.1680769859915; 
 Thu, 06 Apr 2023 01:30:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bX/yu95XVWK0ZnZ1Tm5Ts1RGGCREWa6oXibiKT2zJGhGsp/AR1+Uw/BcOp85JRID7YKxdxlw==
X-Received: by 2002:a05:622a:1707:b0:3e3:93ae:d104 with SMTP id
 h7-20020a05622a170700b003e393aed104mr10590489qtk.30.1680769859542; 
 Thu, 06 Apr 2023 01:30:59 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-193.web.vodafone.de.
 [109.43.178.193]) by smtp.gmail.com with ESMTPSA id
 b125-20020ae9eb83000000b0071eddd3bebbsm306099qkg.81.2023.04.06.01.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 01:30:59 -0700 (PDT)
Message-ID: <82060846-281f-8c30-6938-7ad35a8c5548@redhat.com>
Date: Thu, 6 Apr 2023 10:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-11-philmd@linaro.org>
 <3cccc7e6-3a39-b3b4-feaf-85a3faa58570@redhat.com>
 <3fe240da-9a75-0e39-7762-cd91af9ed3f0@linux.ibm.com>
 <c47e1b5a-38bb-fe08-8020-29361fd0e99a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
In-Reply-To: <c47e1b5a-38bb-fe08-8020-29361fd0e99a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/04/2023 10.22, Philippe Mathieu-Daudé wrote:
> On 6/4/23 10:04, Janosch Frank wrote:
>> On 4/6/23 09:50, Thomas Huth wrote:
>>> On 05/04/2023 18.04, Philippe Mathieu-Daudé wrote:
>>>> Protected Virtualization is specific to KVM.
>>>> Rename the file as 'pv-kvm.c' to make this clearer.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    hw/s390x/{pv.c => pv-kvm.c} | 0
>>>>    hw/s390x/meson.build        | 2 +-
>>>>    2 files changed, 1 insertion(+), 1 deletion(-)
>>>>    rename hw/s390x/{pv.c => pv-kvm.c} (100%)
>>>>
>>>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv-kvm.c
>>>> similarity index 100%
>>>> rename from hw/s390x/pv.c
>>>> rename to hw/s390x/pv-kvm.c
>>>> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
>>>> index f291016fee..2f43b6c473 100644
>>>> --- a/hw/s390x/meson.build
>>>> +++ b/hw/s390x/meson.build
>>>> @@ -22,7 +22,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>>>>      'tod-kvm.c',
>>>>      's390-skeys-kvm.c',
>>>>      's390-stattrib-kvm.c',
>>>> -  'pv.c',
>>>> +  'pv-kvm.c',
>>>>      's390-pci-kvm.c',
>>>>    ))
>>>>    s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
>>>
>>> Hmmm, maybe we should rather move it to target/s390x/kvm/ instead?
>>>
>>> Janosch, what's your opinion?
>>>
>>>    Thomas
>>>
>>>
>>
>> Don't care as long as the file is not deleted :)
> 
> I followed the current pattern:
> 
> $ ls -1 hw/s390x/*kvm*
> hw/s390x/s390-pci-kvm.c
> hw/s390x/s390-skeys-kvm.c
> hw/s390x/s390-stattrib-kvm.c
> hw/s390x/tod-kvm.c

There's a differences for those: First, these devices have an implementation 
that works with TCG, too. Second, protected virtualization (pv) is not a 
real hardware device, it's a feature of the firmware on s390x that is 
exposed to userspace via the KVM interface. So target/s390x/kvm/ slightly 
sounds like a better place to me ... no strong opinion, though.

  Thomas


