Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51369388F75
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:48:00 +0200 (CEST)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMYJ-00004x-Ep
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ljMBz-0000LZ-UY
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:24:57 -0400
Received: from kerio.kamp.de ([195.62.97.192]:37355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ljMBv-0002SQ-Lk
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:24:55 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:24:39 +0200
Received: (qmail 18859 invoked from network); 19 May 2021 13:24:41 -0000
Received: from ac40.vpn.kamp-intra.net (HELO ?172.20.250.40?)
 (pl@kamp.de@::ffff:172.20.250.40)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 19 May 2021 13:24:41 -0000
Subject: Re: [RFC PATCH 2/2] qemu-img convert: Fix sparseness detection
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210415152214.279844-1-kwolf@redhat.com>
 <20210415152214.279844-3-kwolf@redhat.com>
 <06e1910c-102a-e41d-116f-00458f41243c@virtuozzo.com>
 <YH7tah47XxdYs3VW@merkur.fritz.box>
 <f0ba8d30-3380-41d5-e3e7-c1ee52fc46be@virtuozzo.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <dde3af63-994d-4b60-03f7-fc71273e149f@kamp.de>
Date: Wed, 19 May 2021 15:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f0ba8d30-3380-41d5-e3e7-c1ee52fc46be@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.04.21 um 18:52 schrieb Vladimir Sementsov-Ogievskiy:
> 20.04.2021 18:04, Kevin Wolf wrote:
>> Am 20.04.2021 um 16:31 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> 15.04.2021 18:22, Kevin Wolf wrote:
>>>> In order to avoid RMW cycles, is_allocated_sectors() treats zeroed areas
>>>> like non-zero data if the end of the checked area isn't aligned. This
>>>> can improve the efficiency of the conversion and was introduced in
>>>> commit 8dcd3c9b91a.
>>>>
>>>> However, it comes with a correctness problem: qemu-img convert is
>>>> supposed to sparsify areas that contain only zeros, which it doesn't do
>>>> any more. It turns out that this even happens when not only the
>>>> unaligned area is zeroed, but also the blocks before and after it. In
>>>> the bug report, conversion of a fragmented 10G image containing only
>>>> zeros resulted in an image consuming 2.82 GiB even though the expected
>>>> size is only 4 KiB.
>>>>
>>>> As a tradeoff between both, let's ignore zeroed sectors only after
>>>> non-zero data to fix the alignment, but if we're only looking at zeros,
>>>> keep them as such, even if it may mean additional RMW cycles.
>>>>
>>>
>>> Hmm.. If I understand correctly, we are going to do unaligned
>>> write-zero. And that helps.
>>
>> This can happen (mostly raw images on block devices, I think?), but
>> usually it just means skipping the write because we know that the target
>> image is already zeroed.
>>
>> What it does mean is that if the next part is data, we'll have an
>> unaligned data write.
>>
>>> Doesn't that mean that alignment is wrongly detected?
>>
>> The problem is that you can have bdrv_block_status_above() return the
>> same allocation status multiple times in a row, but *pnum can be
>> unaligned for the conversion.
>>
>> We only look at a single range returned by it when detecting the
>> alignment, so it could be that we have zero buffers for both 0-11 and
>> 12-16 and detect two misaligned ranges, when both together are a
>> perfectly aligned zeroed range.
>>
>> In theory we could try to do some lookahead and merge ranges where
>> possible, which should give us the perfect result, but it would make the
>> code considerably more complicated. (Whether we want to merge them
>> doesn't only depend on the block status, but possibly also on the
>> content of a DATA range.)
>>
>> Kevin
>>
>
> Oh, I understand now the problem, thanks for explanation.
>
> Hmm, yes that means, that if the whole buf is zero, is_allocated_sectors must not align it down, to be possibly "merged" with next chunk if it is zero too.
>
> But it's still good to align zeroes down, if data starts somewhere inside the buf, isn't it?
>
> what about something like this:
>
> diff --git a/qemu-img.c b/qemu-img.c
> index babb5573ab..d1704584a0 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -1167,19 +1167,39 @@ static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum,
>          }
>      }
>  
> +    if (i == n) {
> +        /*
> +         * The whole buf is the same.
> +         *
> +         * if it's data, just return it. It's the old behavior.
> +         *
> +         * if it's zero, just return too. It will work good if target is alredy
> +         * zeroed. And if next chunk is zero too we'll have no RMW and no reason
> +         * to write data.
> +         */
> +        *pnum = i;
> +        return !is_zero;
> +    }
> +
>      tail = (sector_num + i) & (alignment - 1);
>      if (tail) {
>          if (is_zero && i <= tail) {
> -            /* treat unallocated areas which only consist
> -             * of a small tail as allocated. */
> +            /*
> +             * For sure next sector after i is data, and it will rewrite this
> +             * tail anyway due to RMW. So, let's just write data now.
> +             */
>              is_zero = false;
>          }
>          if (!is_zero) {
> -            /* align up end offset of allocated areas. */
> +            /* If possible, align up end offset of allocated areas. */
>              i += alignment - tail;
>              i = MIN(i, n);
>          } else {
> -            /* align down end offset of zero areas. */
> +            /*
> +             * For sure next sector after i is data, and it will rewrite this
> +             * tail anyway due to RMW. Better is avoid RMW and write zeroes up
> +             * to aligned bound.
> +             */
>              i -= tail;
>          }
>      }
>
>

I think we forgot to follow up on this. Has anyone tested this suggestion?

Otherwise, I would try to rerun the tests I did with the my old and Kevins suggestion.


Peter




