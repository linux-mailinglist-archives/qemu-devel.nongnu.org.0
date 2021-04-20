Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDDA36571A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 13:05:51 +0200 (CEST)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYoCU-0001rR-EW
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 07:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYoA9-0000dc-Dv
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYoA6-00025R-Sb
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618916600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8YaDIUszYCYkn2eUzgflvl7xJRHxVk7/ISmyzf05al0=;
 b=Ra9Dk748ms+v2jC5hgutEbKy/7ar1rXguafWG+b+nmto7ecb7ftbKK7U2mtiVPIx7quJXV
 IqzU/nZYsqvH3AQnNeie2fDMa7TeNZetLzxkJ9GSsOvriIzfKQxrBM5FVKDMOnNt5swGpg
 YIh5OMo7+GhQl9G9+bu9oAzOZCNphQQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-PVtJCqHmMJ26lSWyDMOEhA-1; Tue, 20 Apr 2021 07:03:14 -0400
X-MC-Unique: PVtJCqHmMJ26lSWyDMOEhA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t14-20020a5d6a4e0000b029010277dcae0fso10647174wrw.22
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 04:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8YaDIUszYCYkn2eUzgflvl7xJRHxVk7/ISmyzf05al0=;
 b=dfRF0lGZ1h7roxuv/nRhWtKvm+usvMdEupFoW7dFTP4vdl+LnNGDsxfdbSELmEZW4/
 Mw+cq6H08G1vXqufJj22hvdcb2/KLteKiEHiTk3VFPCJ/Tx/e/rqM62t7H9aM4XgUvLc
 UMAzCQ1Gu46uyDna592bmMGIgSyM5NZYdfzHznlcovmlHSZwp2WvHFhEPbvWdgDxRvQX
 c5jvOW9VlxHQnIH8/b26U+mp8KWqsu9pgM+b639hX0lT19PhF1Uj9zP6d5277KrGkS3o
 H4lAP5Hes7s9cpOJc/xiLE71IF/Zfop8ZqcB0lmAaS90JkDM2Mxebw19hBRBmc8S1ty6
 PFmA==
X-Gm-Message-State: AOAM531UarMo+/J93gEZMUssfWRg9BcibDn4mX+rsIWWKmhYEcCfVzXm
 eAbetygnaXaeaKAEevaIlcCU5VHH850JY4WsC1X1u+LrCdvpzP5LBJ6HW+ObxmMVqxp6LteRIFd
 rVG2o8kY7jo8fHj8=
X-Received: by 2002:adf:828e:: with SMTP id 14mr19714505wrc.410.1618916592975; 
 Tue, 20 Apr 2021 04:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo5r9BdXpFxgkxoYsl3yYUpzvzF9ZtC6LMOIk9h9kDgrHxBsfUKQyQp2pLlbPtM+WNTFt63Q==
X-Received: by 2002:adf:828e:: with SMTP id 14mr19714469wrc.410.1618916592736; 
 Tue, 20 Apr 2021 04:03:12 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 f11sm2931755wmc.6.2021.04.20.04.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 04:03:12 -0700 (PDT)
Subject: Re: [PATCH v5 04/14] softmmu/memory: Pass ram_flags to
 qemu_ram_alloc_from_fd()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-5-david@redhat.com>
 <83201a21-7f05-88dd-abc7-59576bce2fe9@redhat.com>
 <6ab168bd-113c-6fcb-658a-70f71aca4ab0@redhat.com>
 <063387fa-0123-5260-dfb5-caf482dfcd05@redhat.com>
 <32d08d3a-1c81-10a1-31d5-1db842c85535@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f8d03ef9-927e-931e-02ed-034f8709b1b6@redhat.com>
Date: Tue, 20 Apr 2021 13:03:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <32d08d3a-1c81-10a1-31d5-1db842c85535@redhat.com>
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

On 20.04.21 12:45, Philippe Mathieu-Daudé wrote:
> On 4/20/21 12:36 PM, David Hildenbrand wrote:
>> On 20.04.21 12:18, Philippe Mathieu-Daudé wrote:
>>> Hi David,
>>>
>>> On 4/20/21 11:52 AM, Philippe Mathieu-Daudé wrote:
>>>> On 4/13/21 11:14 AM, David Hildenbrand wrote:
>>>>> Let's pass in ram flags just like we do with
>>>>> qemu_ram_alloc_from_file(),
>>>>> to clean up and prepare for more flags.
>>>>>
>>>>> Simplify the documentation of passed ram flags: Looking at our
>>>>> documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
>>>>> repetitive.
>>>>>
>>>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>>    backends/hostmem-memfd.c | 7 ++++---
>>>>>    hw/misc/ivshmem.c        | 5 ++---
>>>>>    include/exec/memory.h    | 9 +++------
>>>>>    include/exec/ram_addr.h  | 6 +-----
>>>>>    softmmu/memory.c         | 7 +++----
>>>>>    5 files changed, 13 insertions(+), 21 deletions(-)
>>>>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>
>>>
>>> Actually it would be clearer to define the 0 value, maybe:
>>>
>>> #define RAM_NOFLAG     (0 << 0)
>>>
>>
>> This will also turn some code into
>>
>> ram_flags = backend->share ? RAM_SHARED : RAM_NOFLAG;
>> ram_flags |= backend->reserve ? RAM_NOFLAG : RAM_NORESERVE;
> 
> This is the callee view, withing the API, where you have all
> the context.
> 
>> Looking at other flag users, I barely see any such usage.
>> XKB_CONTEXT_NO_FLAGS, ALLOC_NO_FLAGS, and MEM_AFFINITY_NOFLAGS seem to
>> be the only ones. That's why I tend to not do it unless there are strong
>> opinions.
> 
> I'm more concerned about the caller perspective. What means this
> magic '0' in the arguments? Then I have to check the prototype.
> If the caller uses RAM_NO_FLAGS, I directly understand what is passed.
> 

Yeah, that makes sense. Even cleaner would be using the type system as 
we do in the kernel, e.g., for GFP flags

typedef unsigned int __bitwise gfp_t;
#define ___GFP_DMA	0x01u
#define __GFP_DMA	((__force gfp_t)___GFP_DMA)

And passing around gfp_t. Then even using "0" will bail out.

> Anyway my comment fits the usual "can be cleaned later" case.

Make sense, thanks.

-- 
Thanks,

David / dhildenb


