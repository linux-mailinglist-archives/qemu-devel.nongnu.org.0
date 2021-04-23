Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F1D369077
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:38:04 +0200 (CEST)
Received: from localhost ([::1]:46190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtCF-0001JL-Kk
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZtA0-0008CH-C6
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZt9y-0006PY-LQ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619174142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qs2yPc4NqkBW9D3g8knQtwH8vki2w8U3E+myGLLSzZg=;
 b=M+zIqy8iRUz2okHqPkYVLyrWggsulgfn2qhtK1UdAWA5FN4cvYXl2uoZZRIOCDaSgQhcm2
 tvRc7+/VNT3LPjCUQgK8rGcjl2sly7Yt3hwB/+fMrce70JVOUsIo1g9FSSgMueuqCKbatN
 X1Hs2v4hHFhZ1c9XDOwcEHsSpwY5MZ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-bPohrkn6PBKceJRfu5cKow-1; Fri, 23 Apr 2021 06:35:38 -0400
X-MC-Unique: bPohrkn6PBKceJRfu5cKow-1
Received: by mail-wm1-f71.google.com with SMTP id
 o7-20020a1c41070000b02901336831e90fso584224wma.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 03:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Qs2yPc4NqkBW9D3g8knQtwH8vki2w8U3E+myGLLSzZg=;
 b=kHl7d1cT4PiD/I2la5Q7hogdFgXMWc+Wee/FwRcWajUtc95XmL/UNvGc9ngIx/Asw0
 aBbsbyK83Z0YVm57A43ncOWKWjhTTlSzMR8PFX6DIX8Br3uUGfGMj2tucymmKTVQ8MBf
 2xP7Kd8Bp0LoqbtwcdL2GVP4qF2eifjhlu1dTgGc0sFEof09O/e72lLFKuNicpKs7hLC
 S9j0zJxDnKrjcfApI0xpMbSG4FVUDM8i9b0S3YlkM/sEB9fxtty+wRe92QOCkEx9YPGP
 WIlXhiT0TSWjFsvLsFoAOQ9KthFfoJMd5bok6P834cWQMlCSSymFSoSe4N7gJl8YDBoc
 xYVQ==
X-Gm-Message-State: AOAM532EikuvOyRIyDzblg8zc5m4MDCXhsVlFZqXXXio1VQuiyOjv9Q1
 YtlCuiiKXnCklBfaXx8ggquSXsnmg9y2aouSF7kSjAD3CW/0XcR0E8y/VvQ1x5p1iva06jJmYOe
 z8RWd+iyifhcJHAk=
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr3886330wrw.364.1619174137133; 
 Fri, 23 Apr 2021 03:35:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6EWu/ilqxFwTFmE00FF2zkvJoQqelBQrw3c6lhqi4k2/76rxDkEO7Xv8EOlIlxjRVvBt1oQ==
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr3886292wrw.364.1619174136891; 
 Fri, 23 Apr 2021 03:35:36 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6365.dip0.t-ipconnect.de. [91.12.99.101])
 by smtp.gmail.com with ESMTPSA id
 v189sm12118531wmg.9.2021.04.23.03.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 03:35:36 -0700 (PDT)
Subject: Re: [PATCH v6 00/15] RAM_NORESERVE, MAP_NORESERVE and hostmem
 "reserve" property
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210421122624.12292-1-david@redhat.com>
 <20210421210611.wradfrdrbw6ebcdn@habkost.net>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <df7ac86b-7371-5518-9914-f24e9efc91f8@redhat.com>
Date: Fri, 23 Apr 2021 12:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421210611.wradfrdrbw6ebcdn@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.04.21 23:06, Eduardo Habkost wrote:
> On Wed, Apr 21, 2021 at 02:26:09PM +0200, David Hildenbrand wrote:
>> Based-on: 20210406080126.24010-1-david@redhat.com
>>
>> Some cleanups previously sent in other context (resizeable allocations),
>> followed by RAM_NORESERVE, implementing it under Linux using MAP_NORESERVE,
>> and letting users configure it for memory backens using the "reserve"
>> property (default: true).
>>
>> MAP_NORESERVE under Linux has in the context of QEMU an effect on
>> 1) Private/shared anonymous memory
>> -> memory-backend-ram,id=mem0,size=10G
>> 2) Private fd-based mappings
>> -> memory-backend-file,id=mem0,size=10G,mem-path=/dev/shm/0
>> -> memory-backend-memfd,id=mem0,size=10G
>> 3) Private/shared hugetlb mappings
>> -> memory-backend-memfd,id=mem0,size=10G,hugetlb=on,hugetlbsize=2M
>>
>> With MAP_NORESERVE/"reserve=off", we won't be reserving swap space (1/2) or
>> huge pages (3) for the whole memory region.
>>
>> The target use case is virtio-mem, which dynamically exposes memory
>> inside a large, sparse memory area to the VM. MAP_NORESERVE tells the OS
>> "this mapping might be very sparse". This essentially allows
>> avoiding having to set "/proc/sys/vm/overcommit_memory == 1") when using
>> virtio-mem and also supporting hugetlbfs in the future.
> 
> For the memory backend and machine core code:
> 
> Acked-by: Eduardo Habkost <ehabkost@redhat.com>
> 

Thanks Eduardo. I assume Paolo will be the right maintainer to pick this 
up? (I hope he'll have time to look at this and some of my 
pending-for-a-long-time series soon :( )

-- 
Thanks,

David / dhildenb


