Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE306A83E2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjQS-00045S-6G; Thu, 02 Mar 2023 08:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXjQQ-00045I-Bh
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:56:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXjQO-0002sf-QW
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677765407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZF8a0Ee767swSbcm1zGXkZlWWH7iPii5o6IQSQwrg8=;
 b=U9L/Fdcj2nccHVEOmN8bRORO0++kE8SrV33EKHcoDjLCB5KI2WnM97uwGungw3av0asoUi
 jfnuRKMaMPixx+jlFFOFVDUyzHuPfK7f1d9XL+E5BqU1hm/ninehMVQ3jaBn3CMgAGyvuH
 nPDZ5zIABrdohoaB/7qz1ECc1Td7oew=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-FR1Cas48ONKbAZfebFheig-1; Thu, 02 Mar 2023 08:56:46 -0500
X-MC-Unique: FR1Cas48ONKbAZfebFheig-1
Received: by mail-wm1-f69.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so1302213wmb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 05:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RZF8a0Ee767swSbcm1zGXkZlWWH7iPii5o6IQSQwrg8=;
 b=RHmb9cFvvbMdrugrDG9HBtRovkuXyS1AG3Nsn9C+WlWtlthLfGAVXhW2bxIq8CVrhL
 1sBeH7GxlZ6Mf0AKuz2sVvuWTv2XoWINgTrI6Mg65apnoIrd+Otv93WdHH7TfgJkZ1ET
 aS3nR80/cXiE6U93GdAEASGhzbvnaeBNUALD3Vr2tBkM9CMcTzobhONY6cAH5YV0OBQS
 fkI37W4qo87OMkvrH4dy4fox99Os7Vp1BheC3VT6OhmtJiH4kB5DiQKBTX2A8IxwS9Xa
 V139mzbb4Eu19jR3BpEjaRHZVqk9yAaTgVQFK6MT2hivgBNTp6zS89qr3pbOa/DbZSdI
 MZwQ==
X-Gm-Message-State: AO0yUKUkIIFjJolXU7mHMAYuKtAiDonGrVIW0MGCxyGBR1UqyldFDBmZ
 SygXgoyb6idFucLFfDL549MRfLxZd78+cNH/dXGo1hedGWBxHUr5HPEHgcIOrA32FZDpYL74vrw
 9O5wfqxI1F4Y3pzE=
X-Received: by 2002:a5d:4e88:0:b0:2c5:518a:f6e0 with SMTP id
 e8-20020a5d4e88000000b002c5518af6e0mr1560935wru.6.1677765405388; 
 Thu, 02 Mar 2023 05:56:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8rFT9tZ9PMVmyNiVdpsfHj26GZmAbZuj7F371kyBZy77GHzL+Pk1FRD7eD33Po4KvE6WrlBA==
X-Received: by 2002:a5d:4e88:0:b0:2c5:518a:f6e0 with SMTP id
 e8-20020a5d4e88000000b002c5518af6e0mr1560916wru.6.1677765405010; 
 Thu, 02 Mar 2023 05:56:45 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:4f00:87ba:e9e9:3821:677b?
 (p200300cbc70e4f0087bae9e93821677b.dip0.t-ipconnect.de.
 [2003:cb:c70e:4f00:87ba:e9e9:3821:677b])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a5d4f0a000000b002c54911f50bsm15487670wru.84.2023.03.02.05.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 05:56:44 -0800 (PST)
Message-ID: <742db562-5d63-5ef7-8d8b-c4ab9469feff@redhat.com>
Date: Thu, 2 Mar 2023 14:56:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [External] [PATCH] hostmem: Add clear option to file backend
Content-Language: en-US
To: Feiran Zheng <fam.zheng@bytedance.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, fam@euphon.net,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 stefanha@redhat.com
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
 <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
 <ZACMKL5MOeD59OLl@redhat.com>
 <45E8FC3F-B444-4137-8C9D-9BAF9DEE49D9@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <45E8FC3F-B444-4137-8C9D-9BAF9DEE49D9@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02.03.23 12:57, Feiran Zheng wrote:
> 
> 
>> On 2 Mar 2023, at 11:44, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Thu, Mar 02, 2023 at 12:31:46PM +0100, David Hildenbrand wrote:
>>> On 02.03.23 12:09, Fam Zheng wrote:
>>>> This adds a memset to clear the backing memory. This is useful in the
>>>> case of PMEM DAX to drop dirty data, if the backing memory is handed
>>>> over from a previous application or firmware which didn't clean up
>>>> before exiting.
>>>>
>>>
>>> Why can't the VM manager do that instead? If you have a file that's
>>> certainly easily possible.
>>
>> This feels conceptually similar to the case where you expose a host
>> block device to the guest. If that block device was previously given
>> to a different guest it might still have data in it. Someone needs
>> to take responsibility for scrubbing that data. Since that may take
>> a non-trivial amount of time, it is typically todo that scrubbing in
>> the background after the old VM is gone rather than put it into the
>> startup path for a new VM which would delay boot.
>>
>> PMEM is blurring the boundary between memory and disk, but the tradeoff
>> is not so different. We know that in general merely faulting in guest
>> memory is quite time consuming and delays VM startup significantly as
>> RAM size increases. Doing the full memset can only be slower still.
>>
>> For prealloc we've create complex code to fault in memory across many
>> threads and even that's too slow, so we're considering doing it in the
>> background as the VM starts up.
>>
>> IIUC, this patch just puts the memset in the critical serialized path.
>> This will inevitably lead to a demand for improving performance by
>> parallelizing across threads, but we know that's too slow already,
>> and we cant play the background async game with memset as that's
>> actually changunig guest visible contents.
>>
>> IOW, for large PMEM sizes, it does look compelling to do the clearing
>> of old data in the background outside context of QEMU VM startup to
>> avoid delayed startup.
>>
>> I can still understand the appeal of a simple flag to set on QEMU from
>> a usability POV, but not sure its a good idea to encourage this usage
>> by mgmt apps.
> 
> I can totally see the reasoning about the latency here, but I’m a little dubious if multi-threading for memset can actaully help reduce the start-up time; the total cost is going to be bound by memory bandwidth between the CPU and memory (even more so if it’s PMEM) which is limited.

Right, daxio is the magic bit:

daxio.x86_64 : Perform I/O on Device DAX devices or zero a Device DAX device

# daxio -z -o /dev/dax0.0
daxio: copied 8587837440 bytes to device "/dev/dax0.0"

-- 
Thanks,

David / dhildenb


