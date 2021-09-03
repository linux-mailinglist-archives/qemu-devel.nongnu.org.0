Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3563FFE28
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:24:03 +0200 (CEST)
Received: from localhost ([::1]:54640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6Mc-0006vz-5g
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mM6Lb-0006FE-UP
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 06:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mM6LX-0005ih-83
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 06:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630664573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLRlVvGxLmFD4sbuow2aDYEe5qO8XakwmqLOpg4l99I=;
 b=TTJtT/Pga8bJI56WD+ja16HEaIP0V5k8UPN4gVrbZfCPgUiWZBpXwmdd35KBKb3+Xwc8eZ
 9pgw4Ynnu3hWjenqn+eTFInuEyeqhqfW83gDxqQi6hqp15xzcTt+0136bELKGw51OBgVPd
 kuOSczIq5n/N73cZIWQ0puHZTdCikK8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-_C5YVRrSNjCDuCuqi4Pi6w-1; Fri, 03 Sep 2021 06:22:52 -0400
X-MC-Unique: _C5YVRrSNjCDuCuqi4Pi6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso1753742wma.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 03:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KLRlVvGxLmFD4sbuow2aDYEe5qO8XakwmqLOpg4l99I=;
 b=A7uPSF+A/fe6KmSEag3qQvOiRDVjpRD9tgM1TySfcsMmTBFZKnosS8iDei/GoSjJvZ
 hvQ7TLS1l/Ef9LrdEr3e+vpwFxGqnhVCtJqxrwMCd2fFJ+/rQReRTr+ut6KXuos2/EaJ
 1CZWrzlMaKRLmUarpZ6oGM2aHl++2nxtFdtkKo5VH0m2V6V7G+wsbRwrC7mQqFitz2IZ
 /cHpnyiCKG4ZkwPgqx93Nw675R7zQDj2ts5N1SKcQ/zfCWLgvvJZu/RXClSEyyZZ6OUY
 kQXOhZK8x+MC4MBXG2wQQHyxU5BbeRw70ONsgIGojSoTeDLxH60optzBgkIG3DsGMIDH
 rsJA==
X-Gm-Message-State: AOAM531WVO4chm0te1WTwQsaIENJcfr+LK0lXrZNnLKbeFzsC8U9ff9a
 CmWgMfhrlbHLDY6pEBIko+PZYVS4FpQqfykNyEaVIfnAbV2UWgSPdfLOUMjmEqja9hCaFqbC9iX
 5Dv16TbPHuQVafV8=
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr3258909wrz.242.1630664571368; 
 Fri, 03 Sep 2021 03:22:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn2p1gSl7Xgwjp91UdHNEtn2cUlva0I9H5UQbmbBiPPbqdyaEvIFMIJkSRhAGkGeWxi5VwVA==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr3258880wrz.242.1630664571187; 
 Fri, 03 Sep 2021 03:22:51 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23e05.dip0.t-ipconnect.de. [79.242.62.5])
 by smtp.gmail.com with ESMTPSA id
 f3sm3873000wmj.28.2021.09.03.03.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 03:22:50 -0700 (PDT)
Subject: Re: [PATCH v4 7/9] migration: Simplify alignment and alignment checks
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-8-david@redhat.com> <YTFQ6vzTCFTwK3tz@t490s>
 <8985fca4-e15c-95a7-2c45-74353a3a19fa@redhat.com>
 <2d04741d-94bd-9cd2-4d70-f6505bc8db16@redhat.com>
Organization: Red Hat
Message-ID: <f22454d9-c8e1-2fb9-44fb-fc06f8cf9c72@redhat.com>
Date: Fri, 3 Sep 2021 12:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2d04741d-94bd-9cd2-4d70-f6505bc8db16@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 03.09.21 12:07, David Hildenbrand wrote:
> On 03.09.21 10:47, David Hildenbrand wrote:
>> On 03.09.21 00:32, Peter Xu wrote:
>>> On Thu, Sep 02, 2021 at 03:14:30PM +0200, David Hildenbrand wrote:
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index bb909781b7..ae97c2c461 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -391,7 +391,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
>>>>     int migrate_send_rp_req_pages(MigrationIncomingState *mis,
>>>>                                   RAMBlock *rb, ram_addr_t start, uint64_t haddr)
>>>>     {
>>>> -    void *aligned = (void *)(uintptr_t)(haddr & (-qemu_ram_pagesize(rb)));
>>>> +    void *aligned = (void *)QEMU_ALIGN_DOWN(haddr, qemu_ram_pagesize(rb));
>>>
>>> Is uintptr_t still needed?  I thought it would generate a warning otherwise but
>>> not sure.
>>
>> It doesn't in my setup, but maybe it will on 32bit archs ...
>>
>> I discussed this with Phil in
>>
>> https://lkml.kernel.org/r/2c8d80ad-f171-7d5f-3235-92f02fa174b3@redhat.com
>>
>> Maybe
>>
>> QEMU_ALIGN_PTR_DOWN((void *)haddr, qemu_ram_pagesize(rb)));
>>
>> Is really what we want.
> 
> ... but it would suffer the same issue I think. I just ran it trough the
> gitlab pipeline, including "i386-fedora-cross-compile" ... and it seems
> to compile just fine, which is weird, because I'd also expect

[I know, talking to my self] Some 32bit tests actually did fail later, 
so the CI is able to catch this properly.

-- 
Thanks,

David / dhildenb


