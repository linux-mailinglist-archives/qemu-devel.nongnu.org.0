Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8525E43C97A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:20:51 +0200 (CEST)
Received: from localhost ([::1]:43410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhvE-0001vQ-Sc
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfhnJ-0004t0-5v
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfhnC-0005dl-Qs
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635336749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d3feJZl8evrrrglhhIfR+uug3QdLVUfueXpm6fmx/j4=;
 b=Nopvsh65wyFxLknurNZpG/ABByryZBlgaHFNyWPEt6Y0ZxpkqqVuhkuQNEDheCOF3ucDBE
 LdCZk6NSl2pnyhac1TR0DsBmpYYGdqvLwjn9zsmC45/39AHOt5CmtpDMQ6pVEGe7gh4aga
 04ReD6cg5CIcbQ/z5mC7t1kE2SUAIwU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-ZHD15-lKMVuTOOJoCfiVpw-1; Wed, 27 Oct 2021 08:12:28 -0400
X-MC-Unique: ZHD15-lKMVuTOOJoCfiVpw-1
Received: by mail-wr1-f71.google.com with SMTP id
 u15-20020a5d514f000000b001687ebddea3so590740wrt.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 05:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d3feJZl8evrrrglhhIfR+uug3QdLVUfueXpm6fmx/j4=;
 b=a8aT7uCzc5fKt3W/v8KRhYZUYs5agaZpu3Z8ADWckiexLeBUxEnEPw3VIuOJtr/UrR
 Fa+Iuj8JoKX/9AHmol9norxwqT+PwCmCHuZy9LWKHFEqSyMFzDOiE65q+rbxPAprWbpR
 RZysBt8E/P8WTBKmnrh4YHrDEzGElmsHk8J17jlD+E3yC8N8kwLzMerBXrW8BuWrswwJ
 H3eyXZgdP2UBj+Q5NyvCUpDAyJT+30iH0WfoOPKxR2KnIJoqxVub0x02Hj/8RPMGxWHd
 Ewpcdh2GNfNKVvLG5IMf6mAH+IeSKjPM+GLV+tiyrM1LCK8qZjkm7WBFzoYv7c1bQH8H
 fsDw==
X-Gm-Message-State: AOAM533RRMNsd4zfp49FuUpkJtbHCpOQbgwI6i/5OMiAB9dKf7+c55B/
 R5BY8Rk/p9N7o6Y8tpfr3cJBnb1KdxyyJiletFV/1jpmzXLWfCT42fiANoTkmvprzj3PnEAE1pr
 A7NxTMzqwZ5v1rYE=
X-Received: by 2002:a5d:4983:: with SMTP id r3mr22578057wrq.29.1635336747342; 
 Wed, 27 Oct 2021 05:12:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgebO19VWLcfnc6YO/L4le0og5ecHk5L0q78daqQh+mk/VWgHkxH6fv19XwWthho+Gva944Q==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr22578023wrq.29.1635336747087; 
 Wed, 27 Oct 2021 05:12:27 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23d76.dip0.t-ipconnect.de. [79.242.61.118])
 by smtp.gmail.com with ESMTPSA id l124sm3470911wml.8.2021.10.27.05.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 05:12:26 -0700 (PDT)
Message-ID: <6ed7c905-1652-75ac-4dbe-e16bbd1bb40e@redhat.com>
Date: Wed, 27 Oct 2021 14:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/3] memory: Make memory_region_is_mapped() succeed
 when mapped via an alias
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211026160649.47545-1-david@redhat.com>
 <20211026160649.47545-3-david@redhat.com>
 <c2ab26d6-b7bd-a92b-cae8-1a66992dd94f@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <c2ab26d6-b7bd-a92b-cae8-1a66992dd94f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.21 19:00, Philippe Mathieu-Daudé wrote:
> On 10/26/21 18:06, David Hildenbrand wrote:
>> memory_region_is_mapped() currently does not return "true" when a memory
>> region is mapped via an alias.
>>
>> Assuming we have:
>>     alias (A0) -> alias (A1) -> region (R0)
>> Mapping A0 would currently only make memory_region_is_mapped() succeed
>> on A0, but not on A1 and R0.
>>
>> Let's fix that by adding a "mapped_via_alias" counter to memory regions and
>> updating it accordingly when an alias gets (un)mapped.
>>
>> I am not aware of actual issues, this is rather a cleanup to make it
>> consistent.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  include/exec/memory.h |  1 +
>>  softmmu/memory.c      | 12 +++++++++++-
>>  2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index a185b6dcb8..35382d9870 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -707,6 +707,7 @@ struct MemoryRegion {
>>      const MemoryRegionOps *ops;
>>      void *opaque;
>>      MemoryRegion *container;
>> +    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
>>      Int128 size;
>>      hwaddr addr;
>>      void (*destructor)(MemoryRegion *mr);
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index e5826faa0c..17ca896c38 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -2524,8 +2524,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
>>                                                 hwaddr offset,
>>                                                 MemoryRegion *subregion)
>>  {
>> +    MemoryRegion *alias;
>> +
>>      assert(!subregion->container);
>>      subregion->container = mr;
>> +    for (alias = subregion->alias; alias; alias = alias->alias) {
>> +        alias->mapped_via_alias++;
>> +    }
>>      subregion->addr = offset;
>>      memory_region_update_container_subregions(subregion);
>>  }
>> @@ -2550,9 +2555,14 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>>  void memory_region_del_subregion(MemoryRegion *mr,
>>                                   MemoryRegion *subregion)
>>  {
>> +    MemoryRegion *alias;
>> +
>>      memory_region_transaction_begin();
>>      assert(subregion->container == mr);
>>      subregion->container = NULL;
>> +    for (alias = subregion->alias; alias; alias = alias->alias) {
>> +        alias->mapped_via_alias--;
> 
>            assert(alias->mapped_via_alias >= 0);

Makes sense, I'll respin with that -- thanks!

-- 
Thanks,

David / dhildenb


