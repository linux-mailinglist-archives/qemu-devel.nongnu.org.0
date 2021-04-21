Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DFB366723
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:42:34 +0200 (CEST)
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ8RN-0001YD-N7
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lZ8O2-0000H2-P3
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lZ8O0-0006Dg-Kk
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618994343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWCMz4mYSbqdAd7zyeen2IUuHZtgVCsu1RCNvFwitKM=;
 b=FthT3Le2xUGXamMLgRP6q/JMMDWPix/5eaHYYhTo2BcLE1RhYw6HHU8pZ0j9qg/xjZR/xX
 adTUX7aPlo/g/4eUD+oUc9YFMyzh0oP5fcNeYjpTFsF1KNpIwaH7aL/6Ln5uGOR0VIpscV
 TE94WVo6Iec/wWkyBItnNf6cXvCsxOw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-XsIZsGJiMLWF9FasgcQZIw-1; Wed, 21 Apr 2021 04:39:01 -0400
X-MC-Unique: XsIZsGJiMLWF9FasgcQZIw-1
Received: by mail-ej1-f72.google.com with SMTP id
 r17-20020a1709069591b029037cf6a4a56dso5677028ejx.12
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 01:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yWCMz4mYSbqdAd7zyeen2IUuHZtgVCsu1RCNvFwitKM=;
 b=Hp0v4RgWp5S3akcMCADFn5pJXqUVnRph0yYJJt3bmgQD7QtS3EeTkdXaO73QcZatuz
 p10HRG6uPzo/HbpnkNzzETYoSYMN0316Y5UcqrONsxgt65lF0niYb5T00TCPK0dbS/gB
 ISpELH+ufHM4VKzhyMOKsi/35frACtPlo9SpsKUf6UkAV5M2ctlUqSsJ+EZLAKDGSojw
 PhJm0RTWrbPdnDh5WD65YnahoJ8Td512AAHOnGOAszx7FAUiv92YJzNM5f3kkCJY9cy4
 RP9cBJrycET+PYbyVC4FMbvJ2rf1XZaqMyI7Zs4cMjh3SgUJPXfl6cTv1gNqf5b2FaHB
 iZng==
X-Gm-Message-State: AOAM531/syLYdY1Gf8oiJPT0XQejjun1GifU/wZ9lOjlKMbs9feGwTor
 nCWWZfzIM28vqjGiK53ZagFRgNogvV0yFQRlRYRwX7KWv8Ei2o5+9iY9M8IHmajyamZuGBmD5pZ
 YNhUVvw1po5h5JTZVMaZJcA42GpsIlxdUqgngMyYd3qDa9PbrBFnZAKvtNCQKmcy8fOI=
X-Received: by 2002:a05:6402:4d1:: with SMTP id
 n17mr36559840edw.118.1618994340080; 
 Wed, 21 Apr 2021 01:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmQfQgZs2Tf7Vyou2+CW90RcS9MigUCkw9tSVWkaw2vo1mF7k4jowIxlSmxgaP1eRfu8weOQ==
X-Received: by 2002:a05:6402:4d1:: with SMTP id
 n17mr36559809edw.118.1618994339808; 
 Wed, 21 Apr 2021 01:38:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w13sm2363702edx.80.2021.04.21.01.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 01:38:59 -0700 (PDT)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210420100416.30713-1-eesposit@redhat.com>
 <570d2007-fdb9-d90c-4ea9-32a6d1dd14dc@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/3] block-copy: lock tasks and calls list
Message-ID: <98773aac-c971-1451-3d12-aa14c0bd2d40@redhat.com>
Date: Wed, 21 Apr 2021 10:38:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <570d2007-fdb9-d90c-4ea9-32a6d1dd14dc@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/21 15:12, Vladimir Sementsov-Ogievskiy wrote:
> 20.04.2021 13:04, Emanuele Giuseppe Esposito wrote:
>> This serie of patches continues Paolo's series on making the
>> block layer thread safe. Add a CoMutex lock for both tasks and
>> calls list present in block/block-copy.c
>>
> 
> I think, we need more information about what kind of thread-safety we 
> want. Should the whole interface of block-copy be thread safe? Or only 
> part of it? What is going to be shared between different threads? Which 
> functions will be called concurrently from different threads? This 
> should be documented in include/block/block-copy.h.

I guess all of it.  So more state fields should be identified in 
BlockCopyState, especially in_flight_bytes.  ProgressMeter and 
SharedResource should be made thread-safe on their own, just like the 
patch I posted for RateLimit.

> What I see here, is that some things are protected by mutex.. Some 
> things not. What became thread-safe?
> 
> For example, in block_copy_dirty_clusters(), we modify task fields 
> without any mutex held:
> 
>   block_copy_task_shrink doesn't take mutex.
>   task->zeroes is set without mutex as well

Agreed, these are bugs in the series.

> Still all these accesses are done when task is already added to the list.
> 
> Looping in block_copy_common() is not thread safe as well.

That one should be mostly safe, because only one coroutine ever writes 
to all fields except cancelled.  cancelled should be accessed with 
qatomic_read/qatomic_set, but there's also the problem that coroutine 
sleep/wake APIs are hard to use in a thread-safe manner (which affects 
block_copy_kick).  This is a different topic and it is something I'm 
working on,

> You also forget to protect QLIST_REMOVE() call in block_copy_task_end()..
> 
> Next, block-copy uses co-shared-resource API, which is not thread-safe 
> (as it is directly noted in include/qemu/co-shared-resource.h).
> 
> Same thing is block/aio_task API, which is not thread-safe too.
>
> So, we should bring thread-safety first to these smaller helper APIs.

Good point.  Emanuele, can you work on ProgressMeter and SharedResource? 
  AioTaskPool can also be converted to just use CoQueue instead of 
manually waking up coroutines.


