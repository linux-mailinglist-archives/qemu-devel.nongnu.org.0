Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E2C650902
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:03:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7C22-000076-CY; Mon, 19 Dec 2022 04:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p7C20-00006s-SR
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:01:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p7C1z-00026L-0r
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671440513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZiHCSqNCp+AsUQxTsQG04FInItoKaTRRc3T/rjkEoE=;
 b=WDv8EDTp7PQCNER8Zl6ZRjy26TnUK85ZZxq5lDW+s/xEr1mrzen6W3x7VmBK2bKsP3CCQa
 9SHq0omz9mXtRPJP3bH9hEJgT1eViQYTRmPGhQvrx+V2vaKoRCUz/g5rsNQrezmybofJZj
 HP1k3QgSjV2kcv02OaelnhxYPIx005A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-89KJcCiXNQOpJSOavHpVYA-1; Mon, 19 Dec 2022 04:01:51 -0500
X-MC-Unique: 89KJcCiXNQOpJSOavHpVYA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso1603875wml.9
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZiHCSqNCp+AsUQxTsQG04FInItoKaTRRc3T/rjkEoE=;
 b=MbiTs9iXEAjd6VkpCb3WXzshIak/56Ja4pf6VtEyzlcDumZd6ZPH+dbJZuaggvT40n
 YN4gsi4dGdyP+vMz728RalTTkXyjmGWxXNBnfCjxulf56Sut0HZNAjk7b4JgxBeEIdJu
 1nGIbI4iwYjf1bqPzc96Ag3368k3nwmtSeu/bKFL3Q7kmXpb6PxLoBPxIFTCPLIcMdPl
 Q6i1XuiBG/l/P/J9vpIJEyHQ/PoRoOemjaYhE2LZjsAgdneh7kR9KfOdUqKHb1CVrJzD
 V8rNtS5IRbGE/oBEmf0Hi0OR0iukYEQO/1PTlk6GOKkiIHHQalh96cj99bsWnXKVGo0m
 ir8A==
X-Gm-Message-State: ANoB5pmqZBDrLMF/vBylDSTM7OQMJ/rOaQY5N+tXVDvyCioNBjpzHm3f
 CM50bAZXRPQFdsT0qAHSKo7k0RfDjYOrKGgvgzjdEeZVfYHzbsOXhG3O3neFT8DFizKtGV0L+cZ
 saH47deKJCY3nlD4=
X-Received: by 2002:a05:600c:500a:b0:3d2:3ca2:2d4f with SMTP id
 n10-20020a05600c500a00b003d23ca22d4fmr14177420wmr.36.1671440510295; 
 Mon, 19 Dec 2022 01:01:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7be5YB5KACV/0Rcayyqcfl2mUgX/5Mc5qca4ZaVZWeDVeHkgOKxcaKs6OxfppqMP2/+K0XAw==
X-Received: by 2002:a05:600c:500a:b0:3d2:3ca2:2d4f with SMTP id
 n10-20020a05600c500a00b003d23ca22d4fmr14177405wmr.36.1671440510056; 
 Mon, 19 Dec 2022 01:01:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:e900:df20:b417:7171:f748?
 (p200300cbc704e900df20b4177171f748.dip0.t-ipconnect.de.
 [2003:cb:c704:e900:df20:b417:7171:f748])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c21c800b003b47ff307e1sm11292421wmj.31.2022.12.19.01.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:01:49 -0800 (PST)
Message-ID: <008b5a99-497b-5c99-9366-d0eb9001a0e5@redhat.com>
Date: Mon, 19 Dec 2022 10:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] virtio-mem: Fix the bitmap index of the section offset
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20221216062231.11181-1-chenyi.qiang@intel.com>
 <b661461d-fb24-c974-2d8e-d3e760e00033@redhat.com>
 <13e3d3fb-bfa7-26e3-2e21-1bb21cf577c3@redhat.com>
 <f030b3cb-71a9-a8e1-89b1-5fa2846afb8b@intel.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <f030b3cb-71a9-a8e1-89b1-5fa2846afb8b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19.12.22 02:21, Chenyi Qiang wrote:
> 
> 
> On 12/16/2022 6:30 PM, David Hildenbrand wrote:
>> On 16.12.22 09:52, David Hildenbrand wrote:
>>> On 16.12.22 07:22, Chenyi Qiang wrote:
>>>> vmem->bitmap indexes the memory region of the virtio-mem backend at a
>>>> granularity of block_size. To calculate the index of target section
>>>> offset,
>>>> the block_size should be divided instead of the bitmap_size.
>>>
>>> I'm curious, what's the user-visible effect and how did you identify
>>> this issue?
>>>
>>> IIUC, we could end up our search for a plugged/unplugged block "too
>>> late", such that we miss to process blocks.
>>>
>>> That would be the case if the bitmap_size < block_size, which should
>>> effectively always happen ...
>>>
>>>
>>> unplug_all and migration would be affected, which is why a simple test
>>> case without a guest reboot/migration wouldn't run into it.
>>
>> I just realized that unplug_all is fine because only vfio implements the
>> ram_discard_listener so far and always sets
>> double_discard_supported=true. So migration should be the issue (and
>> IIRC migration with VFIO is still shaky).
> 
> Yes, actually, no obvious visible effect on my side. I was just learning
> the RamDiscardManager interface and found this issue. :)

Good, thanks.

Queuing this to

https://github.com/davidhildenbrand/qemu.git mem-next

-- 
Thanks,

David / dhildenb


