Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F433657D6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 13:46:22 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYoph-0000zt-9J
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 07:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYonX-0000Wz-2E
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYonS-0001N8-TZ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618919041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMY6fHBC3GmdWQFzcP9p4cgLJFBRNr6nfn7Za578m5I=;
 b=O9WTZaAlc3IQODQvvwDffi83pzZtrvSVgQ2+4y4YhqHeLCcydeHPHqN9D6NaO0a9YcyrL4
 WRNxypL2L0lg19D3G56UPP+99V7eI82to0CAFyR6ZVxRvdE7pWadBsEdfBGwj8XpF1/vyg
 UoPqOK6mcytmT2DGR/HDqC/y8rp/UMo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-Mx59rS6EOpakk42kArfG6Q-1; Tue, 20 Apr 2021 07:43:57 -0400
X-MC-Unique: Mx59rS6EOpakk42kArfG6Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 y13-20020adfdf0d0000b02901029a3bf796so10760837wrl.15
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 04:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FMY6fHBC3GmdWQFzcP9p4cgLJFBRNr6nfn7Za578m5I=;
 b=LBnTkQFcQr31TqzemmInaJ24JPLUgn5hbkqL0ydw7hUGASaPyLc9jhEzfuW7DSuYdA
 rSAJDDtofdhYDB6ahNV53j5ocwvfMFSQt9DDJ0sOEW407uHx7+1W4f7CiTcCAILelGwL
 FhiwDYBpG7o60AHeWjRZ6O1gQSHeaUM2rb00hMDctR5d7FjygZFL2mb8q6jTB9KfQChu
 xsQOFla6Mh7uQL/Ukn0Set3OIqrn6ovdL1/RelHV6OLB15nUUfCmvhXVoclI29r6S/44
 XTm9HPnh/hjOfCO4BBI5c7QueUhxXeyzfuDEN0rFvGAJOoDLn8zAO1x4bxnQjH5Lg/Tj
 RWlw==
X-Gm-Message-State: AOAM532uCWKuFBSOQppt0mSSe4PXyGaMcPfw39M355Udtz9mrX11zbU6
 WOoX5JF6WHgpFnv+Ol+xco9KMadO7pCsf2CJTzSyLSBQQZtE8ILPxVZ1piyIP99wnQdqwZCJctU
 dF69yY5QTrDe5hY0=
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr3994302wml.41.1618919036336; 
 Tue, 20 Apr 2021 04:43:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUlwu6S9aWrXlm78O9rjTbUzDaPQktwFOirfnrB0krQMzpicVW3ueRE8ZDBA01CwtCLS+nFw==
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr3994268wml.41.1618919036078; 
 Tue, 20 Apr 2021 04:43:56 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 x23sm3020921wmj.43.2021.04.20.04.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 04:43:55 -0700 (PDT)
Subject: Re: [PATCH v5 05/14] softmmu/memory: Pass ram_flags to
 memory_region_init_ram_shared_nomigrate()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-6-david@redhat.com>
 <34931ee0-1bde-16f5-d929-1c9d9157f45a@redhat.com>
 <ce266bac-0bfa-4b45-0159-af3e7b17a234@redhat.com>
 <f298a62c-59e5-b562-63d1-8bdd2a44f7fe@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <4fe7a33f-f230-1c43-b05a-d53e98b78b19@redhat.com>
Date: Tue, 20 Apr 2021 13:43:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f298a62c-59e5-b562-63d1-8bdd2a44f7fe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:40, Philippe Mathieu-Daudé wrote:
> On 4/20/21 12:27 PM, David Hildenbrand wrote:
>> On 20.04.21 12:20, Philippe Mathieu-Daudé wrote:
>>> Hi David,
>>>
>>> On 4/13/21 11:14 AM, David Hildenbrand wrote:
>>>> Let's forward ram_flags instead, renaming
>>>> memory_region_init_ram_shared_nomigrate() into
>>>> memory_region_init_ram_flags_nomigrate(). Forward flags to
>>>> qemu_ram_alloc() and qemu_ram_alloc_internal().
>>>>
>>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    backends/hostmem-ram.c                        |  6 +++--
>>>>    hw/m68k/next-cube.c                           |  4 ++--
>>>>    include/exec/memory.h                         | 24 +++++++++----------
>>>>    include/exec/ram_addr.h                       |  2 +-
>>>>    .../memory-region-housekeeping.cocci          |  8 +++----
>>>>    softmmu/memory.c                              | 20 ++++++++--------
>>>
>>> OK up to here, but the qemu_ram_alloc_internal() changes
>>> in softmmu/physmem.c belong to a different patch (except
>>> the line adding "new_block->flags = ram_flags").
>>> Do you mind splitting it?
>>>
>>
>> Can you elaborate? Temporarily passing both "ram_flags" and "bool
>> resizeable, bool share" to qemu_ram_alloc_internal()?
>>
>> I don't see a big benefit in doing that besides even more effective
>> changes in two individual patches. But maybe if you elaborate, i can see
>> what you would like to see :)
> 
> In this patch I see
> 
> 1/ change a parameter and propagate it
> 2/ adapt assertions

FWIW, I'll separate the qemu_ram_alloc*() changes from the 
memory_region_init_ram_shared_nomigrate() changes.

-- 
Thanks,

David / dhildenb


