Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764AD6E9AA0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 19:23:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppXzh-00049O-12; Thu, 20 Apr 2023 13:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ppXzf-00049F-Ke
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:22:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ppXze-0006i9-6F
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682011369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KjIZp/auA97xeuNY3tYnRGOBlSImC/bBkgYlFLISEM=;
 b=Z+ptCCtkMF7jA/SEuk4qPVV3lHEnj80ugh/32z6B5FOwaW70WVyIhqnX7SI1UASJWNoPeu
 LfuPEEv7k7UW3bDyGMJWOPVkZ4G6uMkhjzNWjVZFcfXxs1bbRnON3NMrljcG5QtXzpzUXX
 71OvHLihEQGP4Z0sr96Ie7fTtJR0xq8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-fwM4bSeqPZCDCaCwKU9dNg-1; Thu, 20 Apr 2023 13:22:45 -0400
X-MC-Unique: fwM4bSeqPZCDCaCwKU9dNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f065208a64so5069305e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 10:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682011365; x=1684603365;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6KjIZp/auA97xeuNY3tYnRGOBlSImC/bBkgYlFLISEM=;
 b=jDxcsta19grCTO7sIUdR4/wBv9OhW1Xiqd91dAl1FDBk3Q0zFsZBmX2jKElKnILmdC
 9uk3cKFZOT3qELX4VYZ1NuA+uJ0Bkh7Le0LjaMO8Sw4dLBthaw2wR2oLf/KZXbxCRDAr
 AJWtCPT3bi1W3pjO/MdGWJk3I5+3tGeufrFOuExRNr3g0q4rG95JThj1oYqHS8AXtEq2
 9GgBi6Xb/s/Kw5fjPTwV3jIiOYicR0n0PS9jnOSQ+xzeTAB2ApnMCZ82K6Vs2NMri4wP
 yisC5LQYaB4XFvTLT5JpbCW6o+/uIb2liPRywVx5Sn1WTENyINrma8L2W1DFjehF3l57
 ZMBg==
X-Gm-Message-State: AAQBX9cLcd7q0cKgDAQI1P55LNhC6Nprb/Xabr3t2jVGSIHa+DkT0+ob
 hdgbQI4tv7V0BIdHsq+PMepokyzFf061dFbSnk20DPbvNyUhWvwuugNkCPtisULMULm4arVEC/d
 naLOtO8oyfbudstA=
X-Received: by 2002:a5d:5222:0:b0:2fe:851c:672f with SMTP id
 i2-20020a5d5222000000b002fe851c672fmr2139662wra.8.1682011364804; 
 Thu, 20 Apr 2023 10:22:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z5/s83FRKPyOzG8oTKVwycIEhIFzyN9ba3T50lv7YsdTb3xclQx/SjRJqv9cYwFgm5M4o1ow==
X-Received: by 2002:a5d:5222:0:b0:2fe:851c:672f with SMTP id
 i2-20020a5d5222000000b002fe851c672fmr2139638wra.8.1682011364443; 
 Thu, 20 Apr 2023 10:22:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c712:8100:8ea7:9fc9:e956:89?
 (p200300cbc71281008ea79fc9e9560089.dip0.t-ipconnect.de.
 [2003:cb:c712:8100:8ea7:9fc9:e956:89])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm2431829wrz.75.2023.04.20.10.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 10:22:43 -0700 (PDT)
Message-ID: <3577db7d-27ab-d5a2-8765-4378ef313fab@redhat.com>
Date: Thu, 20 Apr 2023 19:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5] hostmem-file: add offset option
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, Alexander Graf <graf@amazon.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 Philippe Mathieu-Daude <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230403221421.60877-1-graf@amazon.com> <ZCw16TyJf1iOS/1T@x1n>
 <9930c066-44bf-9365-9c68-aa5ff505c9ba@redhat.com>
 <20230411134604.7a617bd7@imammedo.users.ipa.redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230411134604.7a617bd7@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11.04.23 13:46, Igor Mammedov wrote:
> On Wed, 5 Apr 2023 15:58:31 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 04.04.23 16:36, Peter Xu wrote:
>>> On Mon, Apr 03, 2023 at 10:14:21PM +0000, Alexander Graf wrote:
>>>> Add an option for hostmem-file to start the memory object at an offset
>>>> into the target file. This is useful if multiple memory objects reside
>>>> inside the same target file, such as a device node.
>>>>
>>>> In particular, it's useful to map guest memory directly into /dev/mem
>>>> for experimentation.
>>>>
>>>> To make this work consistently, also fix up all places in QEMU that
>>>> expect fd offsets to be 0.
>>>>
>>>> Signed-off-by: Alexander Graf <graf@amazon.com>
>>>
>>> Acked-by: Peter Xu <peterx@redhat.com>
>>>
>>> I also agree it'll be nicer to split the fix into separate patch, though.
>>> The only affected part IIUC is multi-process QEMU since 6.0.0.  Copying the
>>> maintainers too so they'll be aware.
>>>
>>> Corresponds to the tag:
>>>
>>> Fixes: ed5d001916 ("multi-process: setup memory manager for remote device")
>>>    
>>
>> If there are no options on splitting out the fix, I'll route this via my
>> tree.
> 
> Having fixes as separate prep patch is much more preferable.
> 

Right. Question is if it's really worth it. (it's quite a corner cases I 
guess ...)

> Another question is if we should also check that provided
> offset honors 'align' option?

Good point, but I wonder if it's a real requirement (IOW, what would go 
wrong)? The important part seems to be that the offset is aligned to the 
underlying page size.

I'll be on vacation until 2. Mai, planning on picking it up by then to 
send it upstream.

-- 
Thanks,

David / dhildenb


