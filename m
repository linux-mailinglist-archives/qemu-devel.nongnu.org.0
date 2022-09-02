Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A045AA9F3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:28:36 +0200 (CEST)
Received: from localhost ([::1]:59200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU22Q-0001dF-PA
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oU1hX-0001PB-Vk
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oU1hU-0007f6-Pb
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662106012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pc/hxKNYIKCLx6AIddYaoLIJYQ3lLiqMt3MJije/a+M=;
 b=DYJWJqKiezcdY6H+OObAfprNCPmUkLRVdYwNcfS4nlZt/CekWsxyMaYPfgt8sU3U5HEUU5
 WVeMQK37EHo2OhZ4xjU32H5LD3b8yjprH3knLbIVu/CrL77dIxt/g8kDWcrjN7C267jJ4t
 SMhzaUu5U5D6V7jzSLDY74fgrbFk0vk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-rBEaXWOuPa-EhkuoxTmQUA-1; Fri, 02 Sep 2022 04:06:51 -0400
X-MC-Unique: rBEaXWOuPa-EhkuoxTmQUA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b16-20020a05600c4e1000b003a5a47762c3so810266wmq.9
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 01:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=pc/hxKNYIKCLx6AIddYaoLIJYQ3lLiqMt3MJije/a+M=;
 b=zbTu5AOHSosGgXJjEoiz7MUmQIpsb1H++iH2Q035j4yJ8otsqenPqZRKK2H/d5KpcR
 ME2S6xoNfrAe5bbLNTnAz+qMGyt0anVUs4oDmhXF/YLLjQSg56UZKUXLEchkz6ppHaEN
 N4g/aKWxuJEO1Tv8z49o/qW0+N5082AhhfHmgTmYWVjr4LXB/eDEGZtrDBUgHVm87t6D
 9i8pn9C7LncUDJRdmVQREP/K9eAUVTgX4iNCR+zwyPlD1MJFc2+sBhL75AUHIIfQWZh6
 Zn0FWvKH6NahImeQcUF4jDZRUbw0i2i466d3cSMCTp+dlOhtZbIISTaM6vwH0H6nZwIE
 Fd3Q==
X-Gm-Message-State: ACgBeo1StAOqnxOaExPnAgZrdr1M+bObpTsbmL9Yj9X8J822dk6ZVJWg
 X3mhXh9/C+Zl6KCIm7FQtHZQLfmIcDM7hsus/huThm3hjMuj5G7bi6/fdmslvOr9hadlPGWFofW
 2myVbS4FwTnhkhvg=
X-Received: by 2002:a5d:5847:0:b0:227:5972:c4a3 with SMTP id
 i7-20020a5d5847000000b002275972c4a3mr1235938wrf.384.1662106007736; 
 Fri, 02 Sep 2022 01:06:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR572s7K5/JBqDOJhBmr9vwE3SShRIpjv6v3ObNvWSdQcxmQP7EbRn0u3HXcSFLG6AKZCT1e8g==
X-Received: by 2002:a5d:5847:0:b0:227:5972:c4a3 with SMTP id
 i7-20020a5d5847000000b002275972c4a3mr1235894wrf.384.1662106007318; 
 Fri, 02 Sep 2022 01:06:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c714:4800:2077:1bf6:40e7:2833?
 (p200300cbc714480020771bf640e72833.dip0.t-ipconnect.de.
 [2003:cb:c714:4800:2077:1bf6:40e7:2833])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfed8d000000b00226d217c3e6sm887150wro.64.2022.09.02.01.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Sep 2022 01:06:46 -0700 (PDT)
Message-ID: <fa31cadb-2163-fc58-e1cc-0766aa343f4c@redhat.com>
Date: Fri, 2 Sep 2022 10:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, sgarzare@redhat.com, Alberto Faria <afaria@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Xie Changlong <xiechanglong.d@gmail.com>
References: <20220822222402.176088-1-stefanha@redhat.com>
 <20220822222402.176088-12-stefanha@redhat.com>
 <b068f95e-fc8f-1ecc-5bf5-d7774ce6c13a@redhat.com> <YwUo5UgdHjJ7k9QX@fedora>
 <9f6d41c6-6d67-611b-a8b6-2a1a93242ff4@redhat.com> <Yw5wGEhdsztxhV2s@fedora>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC v4 11/11] virtio-blk: use BDRV_REQ_REGISTERED_BUF
 optimization hint
In-Reply-To: <Yw5wGEhdsztxhV2s@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.08.22 22:16, Stefan Hajnoczi wrote:
> On Thu, Aug 25, 2022 at 09:43:16AM +0200, David Hildenbrand wrote:
>> On 23.08.22 21:22, Stefan Hajnoczi wrote:
>>> On Tue, Aug 23, 2022 at 10:01:59AM +0200, David Hildenbrand wrote:
>>>> On 23.08.22 00:24, Stefan Hajnoczi wrote:
>>>>> Register guest RAM using BlockRAMRegistrar and set the
>>>>> BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
>>>>> accesses in I/O requests.
>>>>>
>>>>> This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that rely
>>>>> on DMA mapping/unmapping.
>>>>
>>>> Can you explain why we're monitoring RAMRegistrar to hook into "guest
>>>> RAM" and not go the usual path of the MemoryListener?
>>>
>>> The requirements are similar to VFIO, which uses RAMBlockNotifier. We
>>
>> Only VFIO NVME uses RAMBlockNotifier. Ordinary VFIO uses the MemoryListener.
>>
>> Maybe the difference is that ordinary VFIO has to replicate the actual
>> guest physical memory layout, and VFIO NVME is only interested in
>> possible guest RAM inside guest physical memory.
>>
>>> need to learn about all guest RAM because that's where I/O buffers are
>>> located.
>>>
>>> Do you think RAMBlockNotifier should be avoided?
>>
>> I assume it depends on the use case. For saying "this might be used for
>> I/O" it might be good enough I guess.
>>
>>>
>>>> What will BDRV_REQ_REGISTERED_BUF actually do? Pin all guest memory in
>>>> the worst case such as io_uring fixed buffers would do ( I hope not ).
>>>
>>> BLK_REQ_REGISTERED_BUF is a hint that no bounce buffer is necessary
>>> because the I/O buffer is located in memory that was previously
>>> registered with bdrv_registered_buf().
>>>
>>> The RAMBlockNotifier calls bdrv_register_buf() to let the libblkio
>>> driver know about RAM. Some libblkio drivers ignore this hint, io_uring
>>> may use the fixed buffers feature, vhost-user sends the shared memory
>>> file descriptors to the vhost device server, and VFIO/vhost may pin
>>> pages.
>>>
>>> So the blkio block driver doesn't add anything new, it's the union of
>>> VFIO/vhost/vhost-user/etc memory requirements.
>>
>> The issue is if that backend pins memory inside any of these regions.
>> Then, you're instantly incompatible to anything the relies on sparse
>> RAMBlocks, such as memory ballooning or virtio-mem, and have to properly
>> fence it.
>>
>> In that case, you'd have to successfully trigger
>> ram_block_discard_disable(true) first, before pinning. Who would do that
>> now conditionally, just like e.g., VFIO does?
>>
>> io_uring fixed buffers would be one such example that pins memory and is
>> problematic. vfio (unless on s390x) is another example, as you point out.
> 
> Okay, I think libblkio needs to expose a bool property called
> "mem-regions-pinned" so QEMU whether or not the registered buffers will
> be pinned.
> 
> Then the QEMU BlockDriver can do:
> 
>   if (mem_regions_pinned) {
>       if (ram_block_discard_disable(true) < 0) {
>           ...fail to open block device...
>       }
>   }
> 
> Does that sound right?

Yes, I think so.

> 
> Is "pinned" the best word to describe this or is there a more general
> characteristic we are looking for?

pinning should be the right term. We want to express that all user page
tables will immediately get populated and that a kernel subsystem will
take longterm references on mapped page that will go out of sync as soon
as we discard memory e.g., using madvise(MADV_DONTEED).

We just should not confuse it with memlock / locking into memory, which
are yet different semantics (e.g., don't swap it out).

> 
>>
>> This has to be treated with care. Another thing to consider is that
>> different backends might only support a limited number of such regions.
>> I assume there is a way for QEMU to query this limit upfront? It might
>> be required for memory hot(un)plug to figure out how many memory slots
>> we actually have (for ordinary DIMMs, and if we ever want to make this
>> compatible to virtio-mem, it might be required as well when the backend
>> pins memory).
> 
> Yes, libblkio reports the maximum number of blkio_mem_regions supported
> by the device. The property is called "max-mem-regions".
> 
> The QEMU BlockDriver currently doesn't use this information. Are there
> any QEMU APIs that should be called to propagate this value?

I assume we have to do exactly the same thing as e.g.,
vhost_has_free_slot()/kvm_has_free_slot() does.

Especially, hw/mem/memory-device.c needs care and
slots_limit/used_memslots handling in hw/virtio/vhost.c might be
relevant as well.


Note that I have some patches pending that extend that handling, by also
providing how many used+free slots there are, such as:

https://lore.kernel.org/all/20211027124531.57561-3-david@redhat.com/

-- 
Thanks,

David / dhildenb


