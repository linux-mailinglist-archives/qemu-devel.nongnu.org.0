Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7464EC45
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:48:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6B3f-0005Xw-Au; Fri, 16 Dec 2022 08:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1p6B3Y-0005WT-DQ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:47:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1p6B3W-0006GR-68
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:47:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671198437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cycX1Buwpl6AHiytjMhS7Ge/9kVjSqFdiiHpaq6PV4=;
 b=aJLYJtGAkfokZUrGCLqdKmsjP54/2C2wzIL5oYo5oe+EKb1o943xt+/vJSAKeeeZK12N8Z
 H2C7Kadi6QouXuJemKnoUlXPIdgRTo1AmjJ33vjEEMfFTZFi2g7if0XqtB0UNSKKu52r9W
 zw58o7+gV26O+HHdpKQwW7xiLxw1oKQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-hkBYe-RUMIWuC76s6P7FFQ-1; Fri, 16 Dec 2022 08:47:15 -0500
X-MC-Unique: hkBYe-RUMIWuC76s6P7FFQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 j11-20020aa7c40b000000b0046b45e2ff83so1907195edq.12
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 05:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2cycX1Buwpl6AHiytjMhS7Ge/9kVjSqFdiiHpaq6PV4=;
 b=OAz5hloKLVAD/TTaesPgCO3j1XSMKCzSIOri/P8pvrPGk652O+jKUBKucjxMbm8q2q
 aDlOHgPrAalIzPnpmu1w/Xu3kt24yFEG+MZyhFlG8wMT+YqcmHrL65NVsbl7sFr+Hqd8
 mmpZqE7eflGKrhZ5bK+IggkOhl/Wjneep8ApY72Tt2ZnPmRsEbREyvySuALrmBTutyO7
 pOzliQ9EybjKtKkwZkP1qpHVabkPqvqGUK0oqnWzCB0qTngbRPm9JyB6Fc9v/dLzaCnF
 /5RoCAo7ytnpFUwLrgxMzaSKNPZ0NL8HtM3VCa/K6xNTsIOgxEqNAuQe6OnMVqYsN4oS
 0CoQ==
X-Gm-Message-State: ANoB5pmWUFNnney0a/JWoMhwNgOv+KZEczdABND7JB/M5r/fo2HXQAMA
 wud6ddxdhB1VlHfI6mEl4f5Uek4BL5WB9c6NAXhgYVRqzgt0AuF2q2ho+fyyk92OCVlzyDHmPuE
 bxLrFrnfCUb422qU=
X-Received: by 2002:a17:906:df4a:b0:7c0:efbd:70a2 with SMTP id
 if10-20020a170906df4a00b007c0efbd70a2mr24513664ejc.42.1671198434646; 
 Fri, 16 Dec 2022 05:47:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5hpw4eeKCEs89wZBkWoCrka/X9VWxmvoKLDXx3hxtsCJWed75l4w1CYFkathzq1fPWg0e0ZQ==
X-Received: by 2002:a17:906:df4a:b0:7c0:efbd:70a2 with SMTP id
 if10-20020a170906df4a00b007c0efbd70a2mr24513653ejc.42.1671198434434; 
 Fri, 16 Dec 2022 05:47:14 -0800 (PST)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906310a00b007c0d64c1886sm872005ejx.33.2022.12.16.05.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 05:47:13 -0800 (PST)
Message-ID: <c7fc7797-6696-e9d8-8c1a-dd4b86cc2781@redhat.com>
Date: Fri, 16 Dec 2022 14:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] hostmem: Honor multiple preferred nodes if possible
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: imammedo@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com
References: <a0b4adce1af5bd2344c2218eb4a04b3ff7bcfdb4.1671097918.git.mprivozn@redhat.com>
 <f06e436f-223a-9318-d631-c9d5c711af1b@redhat.com>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <f06e436f-223a-9318-d631-c9d5c711af1b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/16/22 14:41, David Hildenbrand wrote:
> On 15.12.22 10:55, Michal Privoznik wrote:
>> If a memory-backend is configured with mode
>> HOST_MEM_POLICY_PREFERRED then
>> host_memory_backend_memory_complete() calls mbind() as:
>>
>>    mbind(..., MPOL_PREFERRED, nodemask, ...);
>>
>> Here, 'nodemask' is a bitmap of host NUMA nodes and corresponds
>> to the .host-nodes attribute. Therefore, there can be multiple
>> nodes specified. However, the documentation to MPOL_PREFERRED
>> says:
>>
>>    MPOL_PREFERRED
>>      This mode sets the preferred node for allocation. ...
>>      If nodemask specifies more than one node ID, the first node
>>      in the mask will be selected as the preferred node.
>>
>> Therefore, only the first node is honored and the rest is
>> silently ignored. Well, with recent changes to the kernel and
>> numactl we can do better.
>>
>> The Linux kernel added in v5.15 via commit cfcaa66f8032
>> ("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")
>> support for MPOL_PREFERRED_MANY, which accepts multiple preferred
>> NUMA nodes instead.
>>
>> Then, numa_has_preferred_many() API was introduced to numactl
>> (v2.0.15~26) allowing applications to query kernel support.
>>
>> Wiring this all together, we can pass MPOL_PREFERRED_MANY to the
>> mbind() call instead and stop ignoring multiple nodes, silently.
>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>> ---
> 
> [...]
> 
>> +#ifdef HAVE_NUMA_SET_PREFERRED_MANY
>> +        if (mode == MPOL_PREFERRED && numa_has_preferred_many() > 0) {
>> +            /*
>> +             * Replace with MPOL_PREFERRED_MANY otherwise the mbind()
>> below
>> +             * silently picks the first node.
>> +             */
>> +            mode = MPOL_PREFERRED_MANY;
>> +        }
>> +#endif
>> +
> 
> 
> I was curios if we want to warn the user if "mode ==
> MPOL_PREFERRED_MANY" and we were given more than one node.

I was wondering about that, but given that we currently silently ignore
other nodes, I think it's safe to assume the warning is not necessary.
Then again, as users upgrade to newer kernels this is going to be the
new norm and the warning won't be necessary.

> 
> 
> Apart from that LGTM, thanks
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 

Thanks,
Michal


