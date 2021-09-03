Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA73C3FFC42
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:48:44 +0200 (CEST)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4sN-00024f-B9
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mM4rP-0001Oq-KM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mM4rL-0000Eg-Sd
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630658858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TT2FlCdZfZeJu9yMO3tVsoUHgXAAgENQ/JeNdH5gv5k=;
 b=YGfGC31r5oWxIdvYoyXyiQ3OpQBwc4+op/1MNlumVFtZP8xpmZOA+SOUu+42viZArD5wWu
 5FkDpPLvjcrYZt9C83z2SyQRXbJnjHKiMxvU8EQfKYfppAvzBzc2fBpJ1hmCejox6pOonR
 udSa78I1DJUo/oYstbMbtkgO2CiQtEc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-1b_RNnO7OM6WIFy0gU71KQ-1; Fri, 03 Sep 2021 04:47:37 -0400
X-MC-Unique: 1b_RNnO7OM6WIFy0gU71KQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so1646427wmc.9
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 01:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TT2FlCdZfZeJu9yMO3tVsoUHgXAAgENQ/JeNdH5gv5k=;
 b=noD0uUBvzpxcmr2NaBi9ObCz3d2uGqfem/W/bfogXuZ4KRzHRW1LREK1STS9COVYe1
 wAxNLimeBhKzPrOV0oFnySVX0/IX8zYYbLMPng+dkXBTNp6OFOptI88b2kBCognz1RSu
 23+HWGddnspuuxJujuiiDfNU1MvOlf3/KDI7e7k+2ufEQBb7ssnTiP7izJ0OXxzuUH8O
 zF9rEbnvCcCS+ApwcSEzcED+YfWNVEz1zgoyAbNovfeyysHZS8SLfU+UqNmkda0mF6r9
 QgULQ90TraLGAkkzK1dVGWFoKmGOAy6Fp/eumpYpcv7bwCGuqyqFR2LczM+FquZ6mqV2
 YQdg==
X-Gm-Message-State: AOAM531DXR2m1QxTScIoFFFvYOKPPsjW6oYGFXEF/uZhw/7VgVviI2Mp
 tTc+Eh3VITWhUkxYdZ+28DbHc6G0iwLYnp5pZnpXEF5Fho3Dh0TVclBIU5SbdCIujmknst85GRj
 qqBpd+lQy9ujAtZg=
X-Received: by 2002:a1c:158:: with SMTP id 85mr7171244wmb.187.1630658856261;
 Fri, 03 Sep 2021 01:47:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyZuuusUBLdsI639p98KoY6UTk+Le3nd7Qrk7ffrJnGPrQYCg7Nn+wAoL2dtiwYFARFRpO6Q==
X-Received: by 2002:a1c:158:: with SMTP id 85mr7171220wmb.187.1630658856042;
 Fri, 03 Sep 2021 01:47:36 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23e05.dip0.t-ipconnect.de. [79.242.62.5])
 by smtp.gmail.com with ESMTPSA id
 b24sm3559718wmj.43.2021.09.03.01.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 01:47:35 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-8-david@redhat.com> <YTFQ6vzTCFTwK3tz@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 7/9] migration: Simplify alignment and alignment checks
Message-ID: <8985fca4-e15c-95a7-2c45-74353a3a19fa@redhat.com>
Date: Fri, 3 Sep 2021 10:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTFQ6vzTCFTwK3tz@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.09.21 00:32, Peter Xu wrote:
> On Thu, Sep 02, 2021 at 03:14:30PM +0200, David Hildenbrand wrote:
>> diff --git a/migration/migration.c b/migration/migration.c
>> index bb909781b7..ae97c2c461 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -391,7 +391,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
>>   int migrate_send_rp_req_pages(MigrationIncomingState *mis,
>>                                 RAMBlock *rb, ram_addr_t start, uint64_t haddr)
>>   {
>> -    void *aligned = (void *)(uintptr_t)(haddr & (-qemu_ram_pagesize(rb)));
>> +    void *aligned = (void *)QEMU_ALIGN_DOWN(haddr, qemu_ram_pagesize(rb));
> 
> Is uintptr_t still needed?  I thought it would generate a warning otherwise but
> not sure.

It doesn't in my setup, but maybe it will on 32bit archs ...

I discussed this with Phil in

https://lkml.kernel.org/r/2c8d80ad-f171-7d5f-3235-92f02fa174b3@redhat.com

Maybe

QEMU_ALIGN_PTR_DOWN((void *)haddr, qemu_ram_pagesize(rb)));

Is really what we want.

> 
> Also, maybe ROUND_DOWN() is better?  QEMU_ALIGN_DOWN is the slow version for
> arbitrary numbers.

We do have exactly 2 direct users of ROUND_DOWN() in the tree (well, we 
do have some more for ROUND_UP) :)

QEMU_ALIGN_DOWN vs. QEMU_ALIGN_DOWN is much easier to map and understand 
IMHO, and there is usually little need to optimize.

I actually do wonder how much of a difference it actually makes on 
modern CPUs ...

-- 
Thanks,

David / dhildenb


