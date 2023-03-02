Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364086A841F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:27:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjsv-00007q-C7; Thu, 02 Mar 2023 09:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXjst-00006A-6D
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:26:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXjsr-0006qD-9r
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677767171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBwlIkeSS1Z6U/yElDJIQ8xn8pInbSw4HvTB/VHtQOU=;
 b=BS7QFa2usf3l1jTI1CSbYjX/El7TNfAxdHm+F1pUnzLQeeJqwNRQUZM4P+KVbjsAicPrFL
 1JEfZbqbCabUk/Sl4skBwkDjsWAO2j+6+PLO2/ANj8aINbmXI66SL3qvdjglHIX7KxPJGL
 7yKJZeyEEmZtrZQF5AXDAWpNIFjyBIo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-dwP_okwQNIm6VtnJR6Wzcg-1; Thu, 02 Mar 2023 09:26:10 -0500
X-MC-Unique: dwP_okwQNIm6VtnJR6Wzcg-1
Received: by mail-wm1-f69.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so1326950wme.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:26:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rBwlIkeSS1Z6U/yElDJIQ8xn8pInbSw4HvTB/VHtQOU=;
 b=ysZSS5CrGIKrFPO82Jb4Nh/xvd7gIXVSGl3NNFNgFyPXV0QbEJWkuYSyoZQb0evPse
 2jM0+bs0KBc4oTV5bsAwCvStuPhuobLTrvt+/0KQt15nxuV7jtAGsfMdXDlYMLXnVevq
 9f+BGGqa/pNKMFXUerxLy4pUqt84LSC9uumrjCCNfKnUbH1ldZQNOZpGXFYglXYzxErd
 a2nVVaGCfTPwsWbNkIi89DHPhPJ23IongRT2X/sHIW8f5SJusN4DeOyb+4dSegYIa/MJ
 oOwT5gXKJaFFQr3eevtuucsdktJNt9WZHcKBpb9mbNNMcmwsiUFTxtgSW7xsgMxxg0le
 dPjg==
X-Gm-Message-State: AO0yUKU2R9msf+s8hGYvypBSdIeT0IkZt92lwII2QDAYuuMwrnYgZWIi
 F+JYLV4GUthsxLy+z1thsrArT0F0IwgiwDxgXnGJr0OpbWX9DrzCTPHm334Ak6/ay/VAvKnGyfS
 9FaCm4a+QlHe7rUo=
X-Received: by 2002:a05:600c:45c8:b0:3da:fc30:bfc5 with SMTP id
 s8-20020a05600c45c800b003dafc30bfc5mr7881223wmo.13.1677767169436; 
 Thu, 02 Mar 2023 06:26:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/K2ja5Rg3jP7zxzKLutdY7lBAUvy4TRSKS1ASWEAbPDBgzv2zVwC/WLTT+Gw8kigSkNLL1PQ==
X-Received: by 2002:a05:600c:45c8:b0:3da:fc30:bfc5 with SMTP id
 s8-20020a05600c45c800b003dafc30bfc5mr7881196wmo.13.1677767169117; 
 Thu, 02 Mar 2023 06:26:09 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:4f00:87ba:e9e9:3821:677b?
 (p200300cbc70e4f0087bae9e93821677b.dip0.t-ipconnect.de.
 [2003:cb:c70e:4f00:87ba:e9e9:3821:677b])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b003e2052bad94sm3484297wms.33.2023.03.02.06.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 06:26:08 -0800 (PST)
Message-ID: <9421f5e0-41d5-fe86-092d-defb94ab8b16@redhat.com>
Date: Thu, 2 Mar 2023 15:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [External] [PATCH] hostmem: Add clear option to file backend
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
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
 <742db562-5d63-5ef7-8d8b-c4ab9469feff@redhat.com>
Organization: Red Hat
In-Reply-To: <742db562-5d63-5ef7-8d8b-c4ab9469feff@redhat.com>
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

On 02.03.23 14:56, David Hildenbrand wrote:
> On 02.03.23 12:57, Feiran Zheng wrote:
>>
>>
>>> On 2 Mar 2023, at 11:44, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Thu, Mar 02, 2023 at 12:31:46PM +0100, David Hildenbrand wrote:
>>>> On 02.03.23 12:09, Fam Zheng wrote:
>>>>> This adds a memset to clear the backing memory. This is useful in the
>>>>> case of PMEM DAX to drop dirty data, if the backing memory is handed
>>>>> over from a previous application or firmware which didn't clean up
>>>>> before exiting.
>>>>>
>>>>
>>>> Why can't the VM manager do that instead? If you have a file that's
>>>> certainly easily possible.
>>>
>>> This feels conceptually similar to the case where you expose a host
>>> block device to the guest. If that block device was previously given
>>> to a different guest it might still have data in it. Someone needs
>>> to take responsibility for scrubbing that data. Since that may take
>>> a non-trivial amount of time, it is typically todo that scrubbing in
>>> the background after the old VM is gone rather than put it into the
>>> startup path for a new VM which would delay boot.
>>>
>>> PMEM is blurring the boundary between memory and disk, but the tradeoff
>>> is not so different. We know that in general merely faulting in guest
>>> memory is quite time consuming and delays VM startup significantly as
>>> RAM size increases. Doing the full memset can only be slower still.
>>>
>>> For prealloc we've create complex code to fault in memory across many
>>> threads and even that's too slow, so we're considering doing it in the
>>> background as the VM starts up.
>>>
>>> IIUC, this patch just puts the memset in the critical serialized path.
>>> This will inevitably lead to a demand for improving performance by
>>> parallelizing across threads, but we know that's too slow already,
>>> and we cant play the background async game with memset as that's
>>> actually changunig guest visible contents.
>>>
>>> IOW, for large PMEM sizes, it does look compelling to do the clearing
>>> of old data in the background outside context of QEMU VM startup to
>>> avoid delayed startup.
>>>
>>> I can still understand the appeal of a simple flag to set on QEMU from
>>> a usability POV, but not sure its a good idea to encourage this usage
>>> by mgmt apps.
>>
>> I can totally see the reasoning about the latency here, but I’m a little dubious if multi-threading for memset can actaully help reduce the start-up time; the total cost is going to be bound by memory bandwidth between the CPU and memory (even more so if it’s PMEM) which is limited.
> 
> Right, daxio is the magic bit:
> 
> daxio.x86_64 : Perform I/O on Device DAX devices or zero a Device DAX device
> 
> # daxio -z -o /dev/dax0.0
> daxio: copied 8587837440 bytes to device "/dev/dax0.0"
> 

^ accidentally replied that to the wrong thread.

Regarding this thread: memory preallocation (page zeroing) benefits 
heavily from concurrency in QEMU. I assume it would similarly do it on 
pmem, I didn't try, though.

-- 
Thanks,

David / dhildenb


