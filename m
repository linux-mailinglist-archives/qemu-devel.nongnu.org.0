Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7D6B0C88
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 16:23:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZvcB-0005TS-Fa; Wed, 08 Mar 2023 10:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZvc8-0005T0-Pk
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 10:22:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZvc5-0007GJ-7t
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 10:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678288914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqPOBP/leOXXahEuqsmabrDuExuFwzyb2tfpQuifqVU=;
 b=eGcTozThZBAC8TKbeDDlHTSN90n742oOma8kE3XEt63TMfCCM2MizHCjmjxPpzDA1+G0KH
 Zpau3n8f9IekuEJMTnYBqfgi1gxBKcWiyZ4sSFAqZmZPV7jcO/DXU/uW79R/xThDgqmx1z
 qhJNo71rVgUp1v3pLjlOSpEFPpxbK0w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-NO2hq4zGNnmg9zCwYAHFnw-1; Wed, 08 Mar 2023 10:21:52 -0500
X-MC-Unique: NO2hq4zGNnmg9zCwYAHFnw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so5983768wml.4
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 07:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678288911;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iqPOBP/leOXXahEuqsmabrDuExuFwzyb2tfpQuifqVU=;
 b=wABNXgaeB/LKCKVBceSFQym/qPqqSAc0XYvJ6mbIs8zFe9quXLZFzuVZ+f+4ob+rtK
 gtby+AMOEv8vRhwFjWWcGUaV4MGRxzcsUFDy/4I5fwbKubFSQ3LFU4tbfAMfOFr3xfPL
 UVCkLjqkndaP1Iyi3OJoaxe17lFMCrKQy5+Qeb1punsmrBLe+Xbs/TqiQJoH8QdNTa/k
 HcTNbcr4hlzI+nQalxIzbPTy2ee6trzZUlOC8/chQbVAMO0KxNlYUJldEeNvk42ST4Qp
 AJPn6ZRs/8xmJ/X41M8jzB7dRMNwQnN7UrHW+BZkBA+s/h7FnwcgNP9ZbWqnkMBjnfJj
 fekw==
X-Gm-Message-State: AO0yUKUBn4+JU+NHeISp0sjOgdtpbyOQjdQzYJzCEi/rFoCNRULM/o6Y
 3GZY5S8dtwqEKXqzmB+PJUInBd0sSgiQqyVaQi6Pu6XveA5YAMpYCk6a4htUp3oc1Rj8St/cC7+
 e3s9DnQbySMOVCDQ=
X-Received: by 2002:a05:600c:2150:b0:3eb:253c:faae with SMTP id
 v16-20020a05600c215000b003eb253cfaaemr16577318wml.36.1678288911173; 
 Wed, 08 Mar 2023 07:21:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8FrzyJZtmVCWwr4/LVzpeAXEb+PYpbkdj6Ll8G06/VzkF8RzHih9VM2VamgxP5UxXo0rnkdQ==
X-Received: by 2002:a05:600c:2150:b0:3eb:253c:faae with SMTP id
 v16-20020a05600c215000b003eb253cfaaemr16577301wml.36.1678288910839; 
 Wed, 08 Mar 2023 07:21:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c71b:cb00:d372:1da8:9e9e:422d?
 (p200300cbc71bcb00d3721da89e9e422d.dip0.t-ipconnect.de.
 [2003:cb:c71b:cb00:d372:1da8:9e9e:422d])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c45c700b003dc434b39c7sm2923285wmo.0.2023.03.08.07.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 07:21:50 -0800 (PST)
Message-ID: <034f9e1c-ceb5-c8a5-e660-1b3a80d2059d@redhat.com>
Date: Wed, 8 Mar 2023 16:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-2-david@redhat.com>
 <20230307115147.42df4ba0@imammedo.users.ipa.redhat.com>
 <fad9136f-08d3-3fd9-71a1-502069c000cf@redhat.com>
 <20230308133020.28aabe98@imammedo.users.ipa.redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 1/2] vhost: Defer filtering memory sections until
 building the vhost memory structure
In-Reply-To: <20230308133020.28aabe98@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

>>
>> So we tricked used_memslots to be smaller than it actually has to be, because
>> we're ignoring the memslots filtered out by the vhost-user device.
>>
>>
>> Now, this is all far from relevant in practice as of now I think, and
>> usually would indicate user errors already (memory that's not shared with
>> vhost-user?).
> 
> well vhost-user device_add should fail if it can't get hands on all RAM
> (if it doesn't we have a bug somewhere else)

There are some corner cases already. Like R/O NVDIMMs are completely 
ignored -- I assume because we wouldn't be able to use them for virtio 
queues either way, so it kind-of makes sense I guess.

I have not yet figured out *why* 988a27754bbb ("vhost: allow backends to 
filter memory sections") was included at all. Why should we have 
memory-backend-ram mapped into guest address space that vhost-user 
cannot handle?

Take my NVDIMM example, if we'd use that NVDIMM memory in the guest as 
ordinary RAM, it could eventually be used for virtio queues ... and we 
don't even warn the user.

So I agree that hotplugging that device should fail. But it could also 
break some existing setups (we could work around it using compat 
machines I guess).

But we also have to fail hotplugging such a vhost-user device, ... and I 
am not sure where to even put such checks.


> 
>>
>> It might gets more relevant when virtio-mem dynamically adds/removes memslots and
>> relies on precise tracking of used vs. free memslots.
>>
>>
>> But maybe I should just ignore that case and live a happy life instead, it's
>> certainly hard to even trigger right now :)
>>>      
>>>> Further, it will be helpful in memory device context in the near future
>>>> to know that a RAM memory region section will consume a memslot, and be
>>>> accounted for in the used vs. free memslots, such that we can implement
>>>> reservation of memslots for memory devices properly. Whether a device
>>>> filters this out and would theoretically still have a free memslot is
>>>> then hidden internally, making overall vhost memslot accounting easier.
>>>>
> 
>>>> Let's filter the memslots when creating the vhost memory array,
>>>> accounting all RAM && !ROM memory regions as "used_memslots" even if
>>>> vhost_user isn't interested in anonymous RAM regions, because it needs
>>>> an fd.
> 
> that would regress existing setups where it was possible
> to start with N DIMMs and after this patch the same VM could fail to
> start if N was close to vhost's limit in otherwise perfectly working
> configuration. So this approach doesn't seem right.

As discussed already with MST, this was the state before that change. So 
I strongly doubt that we would break anything because using 
memory-backend-ram in that setup would already be suspicious.

Again, I did not figure out *why* that change was even included and 
which setups even care about that.

Maybe Tiwei can comment.

> 
> Perhaps redoing vhost's used_memslots accounting would be
> a better approach, right down to introducing reservations you'd
> like to have eventually.

The question what to do with memory-backend-ram for vhost-user still 
remains. It's independent of the "used_memslot" tracking, because used 
vs. reserved would depend on the vhost-backend filtering demands ... and 
I really wanted to avoid that with this commit. It just makes tracking 
much harder.

> 
> Something like:
>    1: s/vhost_has_free_slot/vhost_memory_region_limit/
>       and maybe the same for kvm_has_free_slot
>    then rewrite memory_device_check_addable() moving all
>    used_memslots accounting into memory_device core.

I do something similar already, however, by querying the free memslots 
from kvm and vhost, not the limits (limits are not very expressive).

Thanks!

-- 
Thanks,

David / dhildenb


