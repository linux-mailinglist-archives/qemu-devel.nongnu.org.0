Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6A35A0AA1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 09:48:31 +0200 (CEST)
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7bK-0006xf-CW
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 03:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oR7WP-00043M-Ix
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oR7WM-0000Sa-7P
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661413401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGY2WHZX595MrtRN7vdFNkwfE16x18SST9InLAwrNAg=;
 b=a987B9OUXgZ5xCGJ8q2FrLZT8FsiB4EK1GobPOlYW0cpN+HgBYdeLoPzj7gjyb6vrHMQtS
 RU0yjlAhSIeAJs6BytEmg0lRnM5EXOVeo+N9euPJd8SZAony3LG3Zn72Fmu+5utxi7vDDX
 rZLTaon09lSnq4DfEkugrF11biheBlQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-xYZZxfEWOvSFgfgCoItWOQ-1; Thu, 25 Aug 2022 03:43:19 -0400
X-MC-Unique: xYZZxfEWOvSFgfgCoItWOQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l25-20020adfa399000000b002252058bad2so3181883wrb.11
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 00:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=fGY2WHZX595MrtRN7vdFNkwfE16x18SST9InLAwrNAg=;
 b=U/gmk50yOJwmH5hO1gd2kz1znCN3g/dTVE/SS0Yw20WzH3hBKVOcO+jgMAyHTOpAkF
 c54hy4ql+j/qzcsVGxueYTizFabvtK0woiPmo8YQryZ22VEVl/KrBtJaNp5d0RKJ5f48
 4dVX2iGOmN/XEZ8tVUfVweumGvGOPgVqNIg47ktvqjHeNJg6ZAOlmbrlJJGXvgOXne95
 hw6IchvnrJcufxKjCYrMQ/oC2TGmqgj56+4O5XuYddvMJw0N43OmRF7KhwLbB8Nqaj3T
 SxhoLdGUV+8otw1zg4i7RQpGRCejDsbb5OKis3OQUs1s8Y3LGVG4lwTFiyN2Mkk3OLg4
 oZvw==
X-Gm-Message-State: ACgBeo0MeibMnKU0Shc/2mglukxd13iMMZcusoElEk2E5zpUOIeGyx6C
 pnjVaIxm48um/hK5DCJDhZZMX8L5pZD2Yt6IFvJtXL/Qe7QVCcFkKc9oGNNL6+kfXqPVzyv6OWt
 rjYWi1/2T96MkdVo=
X-Received: by 2002:a05:600c:3ba0:b0:3a5:b73a:8773 with SMTP id
 n32-20020a05600c3ba000b003a5b73a8773mr7301983wms.64.1661413398253; 
 Thu, 25 Aug 2022 00:43:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6cwsV9dSRbdy4XHvutmq5NfeX29EDkWN4Zju/0USUyTnaNnpk9qHjAIHKU/okVYIPzo0OrzA==
X-Received: by 2002:a05:600c:3ba0:b0:3a5:b73a:8773 with SMTP id
 n32-20020a05600c3ba000b003a5b73a8773mr7301952wms.64.1661413397988; 
 Thu, 25 Aug 2022 00:43:17 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a1c5446000000b003a500b612fcsm4225797wmi.12.2022.08.25.00.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 00:43:17 -0700 (PDT)
Message-ID: <9f6d41c6-6d67-611b-a8b6-2a1a93242ff4@redhat.com>
Date: Thu, 25 Aug 2022 09:43:16 +0200
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC v4 11/11] virtio-blk: use BDRV_REQ_REGISTERED_BUF
 optimization hint
In-Reply-To: <YwUo5UgdHjJ7k9QX@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 23.08.22 21:22, Stefan Hajnoczi wrote:
> On Tue, Aug 23, 2022 at 10:01:59AM +0200, David Hildenbrand wrote:
>> On 23.08.22 00:24, Stefan Hajnoczi wrote:
>>> Register guest RAM using BlockRAMRegistrar and set the
>>> BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
>>> accesses in I/O requests.
>>>
>>> This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that rely
>>> on DMA mapping/unmapping.
>>
>> Can you explain why we're monitoring RAMRegistrar to hook into "guest
>> RAM" and not go the usual path of the MemoryListener?
> 
> The requirements are similar to VFIO, which uses RAMBlockNotifier. We

Only VFIO NVME uses RAMBlockNotifier. Ordinary VFIO uses the MemoryListener.

Maybe the difference is that ordinary VFIO has to replicate the actual
guest physical memory layout, and VFIO NVME is only interested in
possible guest RAM inside guest physical memory.

> need to learn about all guest RAM because that's where I/O buffers are
> located.
> 
> Do you think RAMBlockNotifier should be avoided?

I assume it depends on the use case. For saying "this might be used for
I/O" it might be good enough I guess.

> 
>> What will BDRV_REQ_REGISTERED_BUF actually do? Pin all guest memory in
>> the worst case such as io_uring fixed buffers would do ( I hope not ).
> 
> BLK_REQ_REGISTERED_BUF is a hint that no bounce buffer is necessary
> because the I/O buffer is located in memory that was previously
> registered with bdrv_registered_buf().
> 
> The RAMBlockNotifier calls bdrv_register_buf() to let the libblkio
> driver know about RAM. Some libblkio drivers ignore this hint, io_uring
> may use the fixed buffers feature, vhost-user sends the shared memory
> file descriptors to the vhost device server, and VFIO/vhost may pin
> pages.
> 
> So the blkio block driver doesn't add anything new, it's the union of
> VFIO/vhost/vhost-user/etc memory requirements.

The issue is if that backend pins memory inside any of these regions.
Then, you're instantly incompatible to anything the relies on sparse
RAMBlocks, such as memory ballooning or virtio-mem, and have to properly
fence it.

In that case, you'd have to successfully trigger
ram_block_discard_disable(true) first, before pinning. Who would do that
now conditionally, just like e.g., VFIO does?

io_uring fixed buffers would be one such example that pins memory and is
problematic. vfio (unless on s390x) is another example, as you point out.

This has to be treated with care. Another thing to consider is that
different backends might only support a limited number of such regions.
I assume there is a way for QEMU to query this limit upfront? It might
be required for memory hot(un)plug to figure out how many memory slots
we actually have (for ordinary DIMMs, and if we ever want to make this
compatible to virtio-mem, it might be required as well when the backend
pins memory).

-- 
Thanks,

David / dhildenb


