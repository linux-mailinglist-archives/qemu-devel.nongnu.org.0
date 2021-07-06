Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559783BCA82
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:46:36 +0200 (CEST)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ib5-0002m6-CC
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0hxj-0001Aw-VG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0hxh-0004Wy-UQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JREEolEe9cM2KjlDuRMEOu2l9aTV/FR58OZbWOsZSls=;
 b=foTos+E0fRSdqmeFCIMx5++ucaElVNwgF32iQngYU0S79aIuczgjDJSb1ekez00JoL2jUQ
 B4DE3lRe/W47bexSx/SM0la8o1UZJTKEd0exNoa4UmMF8RArzuWMjxlzXsZ/K1njy20GzF
 6TcHGid/x+Rca+ds7+4s773e1UyV6t4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-mo-YsupJMRu05lM-nWg-EA-1; Tue, 06 Jul 2021 06:05:52 -0400
X-MC-Unique: mo-YsupJMRu05lM-nWg-EA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so4911313wrs.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JREEolEe9cM2KjlDuRMEOu2l9aTV/FR58OZbWOsZSls=;
 b=YJ/JKwrqQxPsSBZgqta4w8fa8R9gIF5w32qhzU7YiUcH84bLMfkEksM67yvTt7SeUk
 8dUtq/9AD4p4x9rJ3SduejG61joY5NKCVfSFI2J6nODXDsnNr3EHwvYy1IZrNsNKIXvA
 Dt3rS/EBRwN8g9jDXbOnvxa4CO98uNmcB9cj2Sh/zJmggVL02BLBZ6ZPUYPRnAX4Zpo1
 5bRH0wBzMJo6rob9Lh8/9EohaAct5YjboaJ1SZ4xET6VppBw73wrD7d53WLqICi1Cpi2
 QBSofmNclQC9I19bJa+T1JTUgliXgYUVg+RP9tc95pjacZFEByStFoKjsOjBtEn4nOUA
 LizQ==
X-Gm-Message-State: AOAM530qi6F6Ca2YdRb9P1GlWcYifAL1JtO2OGqP93d0YQEWifaDw+vR
 zgcu+3nrXPL1WMY0mW7nsxuouu48HAsl7nGlfg7vYwMDVZZHyJLti6aXzI/svTQHfPHpty4HPDT
 WTOvSiV/hAv3J9B8=
X-Received: by 2002:a1c:f616:: with SMTP id w22mr3890185wmc.73.1625565951080; 
 Tue, 06 Jul 2021 03:05:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj3TyJXE4jelUemyZAtjm2eCnam2FR6+0m9ilGB0YzfvB7BTTfe9kkmqmFpbzOAkJ4afjGSw==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr3890164wmc.73.1625565950852; 
 Tue, 06 Jul 2021 03:05:50 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id d186sm2411120wmd.14.2021.07.06.03.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:05:50 -0700 (PDT)
To: "Wang, Wei W" <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
 <a5877d58-d501-0ff6-676b-c98df44d1b6f@redhat.com>
 <a01758f98b3f46f282f0d6974862680d@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <f554501a-19d9-a22d-f399-5db4dbb81764@redhat.com>
Date: Tue, 6 Jul 2021 12:05:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a01758f98b3f46f282f0d6974862680d@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.07.21 11:41, Wang, Wei W wrote:
> On Monday, July 5, 2021 9:42 PM, David Hildenbrand wrote:
>> On 03.07.21 04:53, Wang, Wei W wrote:
>>> On Friday, July 2, 2021 3:07 PM, David Hildenbrand wrote:
>>>> On 02.07.21 04:48, Wang, Wei W wrote:
>>>>> On Thursday, July 1, 2021 10:22 PM, David Hildenbrand wrote:
>>>>>> On 01.07.21 14:51, Peter Xu wrote:
>>>>
>>>> I think that clearly shows the issue.
>>>>
>>>> My theory I did not verify yet: Assume we have 1GB chunks in the clear bmap.
>>>> Assume the VM reports all pages within a 1GB chunk as free (easy with
>>>> a fresh VM). While processing hints, we will clear the bits from the
>>>> dirty bmap in the RAMBlock. As we will never migrate any page of that
>>>> 1GB chunk, we will not actually clear the dirty bitmap of the memory
>>>> region. When re-syncing, we will set all bits bits in the dirty bmap
>>>> again from the dirty bitmap in the memory region. Thus, many of our
>>>> hints end up being mostly ignored. The smaller the clear bmap chunk, the
>> more extreme the issue.
>>>
>>> OK, that looks possible. We need to clear the related bits from the
>>> memory region bitmap before skipping the free pages. Could you try with
>> below patch:
>>
>> I did a quick test (with the memhog example) and it seems like it mostly works.
>> However, we're now doing the bitmap clearing from another, racing with the
>> migration thread. Especially:
>>
>> 1. Racing with clear_bmap_set() via cpu_physical_memory_sync_dirty_bitmap()
>> 2. Racing with migration_bitmap_clear_dirty()
>>
>> So that might need some thought, if I'm not wrong.
> 
> I think this is similar to the non-clear_bmap case, where the rb->bmap is set or cleared by
> the migration thread and qemu_guest_free_page_hint. For example, the migration thread
> could find a bit is set from rb->bmap before qemu_guest_free_page_hint gets that bit cleared in time.
> The result is that the free page is transferred, which isn't necessary, but won't cause any issue.
> This is very rare in practice.

Here are my concerns regarding races:

a) We now end up calling migration_clear_memory_region_dirty_bitmap() 
without holding the bitmap_mutex. We have to clarify if that is ok. At 
least migration_bitmap_clear_dirty() holds it *while* clearing the log 
and migration_bitmap_sync() while setting bits in the clear_bmap. I 
think we also have to hold the mutex on the new path.

b) We now can end up calling memory_region_clear_dirty_bitmap() 
concurrently, not sure if all notifiers can handle that. I'd assume it 
is okay, but I wouldn't bet on it.

Maybe Peter can help clarifying.

-- 
Thanks,

David / dhildenb


