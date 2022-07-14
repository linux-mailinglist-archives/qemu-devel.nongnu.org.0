Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA765747A4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 10:58:22 +0200 (CEST)
Received: from localhost ([::1]:45966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBufs-00043J-OZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 04:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBuc2-0001wX-6Y
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 04:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBuby-0003gB-KG
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 04:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657788857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nb1qCogyOSIjxZDz1Cn/mBvYLKdYmF2uBpe/vzSvKbM=;
 b=jJhDb5G3FOkLUHjgUq4ywviyDeiuCZGARkz/G1GGBtvlCyat/LPY0LelN2G0nlMV0V2A35
 tBzNVkDy7CEkPSVIYQ3BBPVPO6m+CXzDlCPAMfTBkdYygs67bhYrCK6f2k1OLd8he1+6fl
 8PeNxDCMWu2yA6VvtB79CbfZunEe1FY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-tS6TtSRoPQ-2nVQUYGPW1Q-1; Thu, 14 Jul 2022 04:54:15 -0400
X-MC-Unique: tS6TtSRoPQ-2nVQUYGPW1Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 m13-20020a056402430d00b0043ac2f27d83so1085506edc.20
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 01:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=Nb1qCogyOSIjxZDz1Cn/mBvYLKdYmF2uBpe/vzSvKbM=;
 b=bo6STrJoatbunkKUWAnoN822TEGczfbpl8OOtmW/NeObjp4rPRNEpMLf4LiuL1jsOj
 +l2fULYa/vxmb2IGE2s/OLkHIx3XplQaISbE5lJIgGC9hRZjJ39Dq6mCajuQcO5kVJ5n
 mGdqMdo1D2wTpY1IyFZNzspyOF6V01rkHmSrY0kYU7HExCZlh65WPfgnlJhVQaV+BN4Y
 5cnnwQWKeSqwfBut57pgN23gYvFzLOjfcPH9ErEkZlwHVqDDlYJrvqJA6jA22asUW9CY
 4Grhy5pc8/0ZypP30KwdNFVw28/b6p0s0hZGA06NJja9iG84FHnGU/olArOt0CHDr0Px
 Cdig==
X-Gm-Message-State: AJIora8J4YD1Mr00gJ53f+j6zf+9sEGBngBt6wUaY4uO6PzqiJe0GbMQ
 36aPMLa71Kv1W/XgF2fXWTk+XbOXP06XoV9EdkJsT+VcOUBCcVpxF+K++lV9tD/Tcb2+NKWx6tN
 XAiPzuNqfhuBQBGI=
X-Received: by 2002:a17:907:9619:b0:72b:4761:be19 with SMTP id
 gb25-20020a170907961900b0072b4761be19mr8098498ejc.20.1657788854631; 
 Thu, 14 Jul 2022 01:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOowxTk0dbD7zwcvfFxIU0+UqN9p0hc1bqZH5+fiW0ipAhCV2EPODyQR/+wbt++wqBhEqMKw==
X-Received: by 2002:a17:907:9619:b0:72b:4761:be19 with SMTP id
 gb25-20020a170907961900b0072b4761be19mr8098450ejc.20.1657788854204; 
 Thu, 14 Jul 2022 01:54:14 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a17090604d100b00722e52d043dsm443347eja.114.2022.07.14.01.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 01:54:13 -0700 (PDT)
Message-ID: <5ef9e60c-bcb2-7172-4664-688a5f3b2844@redhat.com>
Date: Thu, 14 Jul 2022 10:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC v3 4/8] block: add BDRV_REQ_REGISTERED_BUF request flag
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Yanan Wang <wangyanan55@huawei.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-5-stefanha@redhat.com>
Content-Language: en-US
In-Reply-To: <20220708041737.1768521-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 08.07.22 06:17, Stefan Hajnoczi wrote:
> Block drivers may optimize I/O requests accessing buffers previously
> registered with bdrv_register_buf(). Checking whether all elements of a
> request's QEMUIOVector are within previously registered buffers is
> expensive, so we need a hint from the user to avoid costly checks.
>
> Add a BDRV_REQ_REGISTERED_BUF request flag to indicate that all
> QEMUIOVector elements in an I/O request are known to be within
> previously registered buffers.
>
> bdrv_aligned_preadv() is strict in validating supported read flags and
> its assertions fail when it sees BDRV_REQ_REGISTERED_BUF. There is no
> harm in passing BDRV_REQ_REGISTERED_BUF to block drivers that do not
> support it, so update the assertions to ignore BDRV_REQ_REGISTERED_BUF.
>
> Care must be taken to clear the flag when the block layer or filter
> drivers replace QEMUIOVector elements with bounce buffers since these
> have not been registered with bdrv_register_buf(). A lot of the changes
> in this commit deal with clearing the flag in those cases.
>
> Ensuring that the flag is cleared properly is somewhat invasive to
> implement across the block layer and it's hard to spot when future code
> changes accidentally break it. Another option might be to add a flag to
> QEMUIOVector itself and clear it in qemu_iovec_*() functions that modify
> elements. That is more robust but somewhat of a layering violation, so I
> haven't attempted that.

Yeah...  I will say that most read code already looks quite reasonable 
in that it’ll pass @flags to lower layers basically only if it’s an 
unmodified request, so it seems like in the past most people have 
already adhered to “don’t pass on any flags if you’re reading to a local 
bounce buffer”.

> Signed-off-by: Stefan Hajnoczi<stefanha@redhat.com>
> ---
>   include/block/block-common.h |  9 +++++++++
>   block/blkverify.c            |  4 ++--
>   block/crypto.c               |  2 ++
>   block/io.c                   | 30 +++++++++++++++++++++++-------
>   block/mirror.c               |  2 ++
>   block/raw-format.c           |  2 ++
>   6 files changed, 40 insertions(+), 9 deletions(-)

Some things not covered here that look a bit wrong:

While bdrv_driver_preadv() asserts that the flags don’t contain anything 
the driver couldn’t handle (and this new flag is made exempt from that 
assertion here in this patch), bdrv_driver_pwritev() just hides those 
flags from drivers silently. I think just like we exempt the new flag 
from the assertion in bdrv_driver_preadv(), we should have 
bdrv_driver_pwritev() always pass it to drivers.

The following driver read/write functions assert that @flags is 0, which 
is probably no longer ideal:
- bdrv_qed_co_writev()
- block_crypto_co_preadv()
- nbd_client_co_preadv()
- parallels_co_writev()
- qcow_co_preadv()
- qcow_co_pwritev()
- qemu_gluster_co_writev()
- raw_co_pwritev() (block/file-posix.c)
- replication_co_writev()
- ssh_co_writev()
- vhdx_co_writev()

snapshot_access_co_preadv_part() returns an error when any flags are 
set, but should probably ignore BDRV_REQ_REGISTERED_BUF for this check.


While looking around, I spotted a couple of places that look like they 
could pass the flag on but currently don’t (just FYI, not asking for 
anything here):

bdrv_co_do_copy_on_readv() never passes the flags through to its calls, 
but I think it could pass this flag on in the one bdrv_driver_preadv() 
call where it doesn’t use a bounce buffer (“Read directly into the 
destination”).

qcow2’s qcow2_co_preadv_task() and qcow2_co_pwritev_task() (besides the 
encryption part) also look like they should pass this flag on, but, 
well, the functions themselves currently don’t get the flag, so they can’t.

qcow1’s qcow_co_preadv() and qcow_co_pwritev() are so-so, sometimes 
using a bounce buffer, and sometimes not, but those function could use 
optimization in general if anyone cared.

vpc_co_preadv()’s and vpc_co_pwritev()’s first 
bdrv_co_preadv()/bdrv_co_pwritev() invocations look straightforward, but 
as with qcow1, not sure if anyone cares.

I’m too lazy to thoroughly check what’s going on with 
qed_aio_write_main().  Passing 0 is safe, and it doesn’t get the 
original request flags, so I guess doing anything about this would be 
difficult.

quorum’s read_fifo_child() probably could pass acb->flags. Probably.  
Perhaps not.  Difficult to say it is.

block/replication.c also looks like a candidate for passing flags, but 
personally, I’d like to refrain from touching it.  (Well, besides the 
fact that replication_co_writev() asserts that @flags is 0.)


(And finally, I found that block/parallels.c invokes bdrv_co_pwritev() 
with a buffer instead of an I/O vector, which looks really wrong, but 
has nothing to do with this patch.)

[...]

> diff --git a/block/io.c b/block/io.c
> index e7f4117fe7..83b8259227 100644
> --- a/block/io.c
> +++ b/block/io.c

[...]

> @@ -1902,6 +1910,11 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>           return -ENOTSUP;
>       }
>   
> +    /* By definition there is no user buffer so this flag doesn't make sense */
> +    if (flags & BDRV_REQ_REGISTERED_BUF) {
> +        return -EINVAL;
> +    }
> +

Here we return an error when the flag is met...

>       /* Invalidate the cached block-status data range if this write overlaps */
>       bdrv_bsc_invalidate_range(bs, offset, bytes);
>   
> @@ -2187,6 +2200,9 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
>       bool padding;
>       BdrvRequestPadding pad;
>   
> +    /* This flag doesn't make sense for padding or zero writes */
> +    flags &= ~BDRV_REQ_REGISTERED_BUF;
> +

...and here we just ignore it.  Why don’t we handle this the same in 
both of these functions?  (And what about bdrv_co_pwrite_zeroes()?)

Besides that, if we do make it an error, I wonder if it shouldn’t be an 
assertion instead so the duty of clearing the flag falls on the caller.  
(I personally like just silently clearing it in the zero-write 
functions, though.)

Hanna


