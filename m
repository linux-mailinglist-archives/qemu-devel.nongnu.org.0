Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6F4683E6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 10:55:51 +0100 (CET)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtRlm-0006nH-4N
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 04:55:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mtRjB-0005JQ-Ab; Sat, 04 Dec 2021 04:53:09 -0500
Received: from kerio.kamp.de ([195.62.97.192]:36942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mtRj8-0000rf-Pw; Sat, 04 Dec 2021 04:53:08 -0500
X-Footer: a2FtcC5kZQ==
Received: from smtpclient.apple ([80.187.125.231])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Sat, 4 Dec 2021 10:53:03 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 2/2] qemu-img convert: Fix sparseness detection
Date: Sat, 4 Dec 2021 10:53:02 +0100
Message-Id: <D8C60375-F9A2-4C08-8210-5209CC066F8D@kamp.de>
References: <ba062f58-36b7-7898-1254-313c7bd1d7b3@virtuozzo.com>
In-Reply-To: <ba062f58-36b7-7898-1254-313c7bd1d7b3@virtuozzo.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Mailer: iPhone Mail (18H17)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 04.12.2021 um 00:04 schrieb Vladimir Sementsov-Ogievskiy <vsementsov@vi=
rtuozzo.com>:
>=20
> =EF=BB=BF03.12.2021 14:17, Peter Lieven wrote:
>>> Am 19.05.21 um 18:48 schrieb Kevin Wolf:
>>> Am 19.05.2021 um 15:24 hat Peter Lieven geschrieben:
>>>> Am 20.04.21 um 18:52 schrieb Vladimir Sementsov-Ogievskiy:
>>>>> 20.04.2021 18:04, Kevin Wolf wrote:
>>>>>> Am 20.04.2021 um 16:31 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>>> 15.04.2021 18:22, Kevin Wolf wrote:
>>>>>>>> In order to avoid RMW cycles, is_allocated_sectors() treats zeroed a=
reas
>>>>>>>> like non-zero data if the end of the checked area isn't aligned. Th=
is
>>>>>>>> can improve the efficiency of the conversion and was introduced in
>>>>>>>> commit 8dcd3c9b91a.
>>>>>>>>=20
>>>>>>>> However, it comes with a correctness problem: qemu-img convert is
>>>>>>>> supposed to sparsify areas that contain only zeros, which it doesn'=
t do
>>>>>>>> any more. It turns out that this even happens when not only the
>>>>>>>> unaligned area is zeroed, but also the blocks before and after it. I=
n
>>>>>>>> the bug report, conversion of a fragmented 10G image containing onl=
y
>>>>>>>> zeros resulted in an image consuming 2.82 GiB even though the expec=
ted
>>>>>>>> size is only 4 KiB.
>>>>>>>>=20
>>>>>>>> As a tradeoff between both, let's ignore zeroed sectors only after
>>>>>>>> non-zero data to fix the alignment, but if we're only looking at ze=
ros,
>>>>>>>> keep them as such, even if it may mean additional RMW cycles.
>>>>>>>>=20
>>>>>>> Hmm.. If I understand correctly, we are going to do unaligned
>>>>>>> write-zero. And that helps.
>>>>>> This can happen (mostly raw images on block devices, I think?), but
>>>>>> usually it just means skipping the write because we know that the tar=
get
>>>>>> image is already zeroed.
>>>>>>=20
>>>>>> What it does mean is that if the next part is data, we'll have an
>>>>>> unaligned data write.
>>>>>>=20
>>>>>>> Doesn't that mean that alignment is wrongly detected?
>>>>>> The problem is that you can have bdrv_block_status_above() return the=

>>>>>> same allocation status multiple times in a row, but *pnum can be
>>>>>> unaligned for the conversion.
>>>>>>=20
>>>>>> We only look at a single range returned by it when detecting the
>>>>>> alignment, so it could be that we have zero buffers for both 0-11 and=

>>>>>> 12-16 and detect two misaligned ranges, when both together are a
>>>>>> perfectly aligned zeroed range.
>>>>>>=20
>>>>>> In theory we could try to do some lookahead and merge ranges where
>>>>>> possible, which should give us the perfect result, but it would make t=
he
>>>>>> code considerably more complicated. (Whether we want to merge them
>>>>>> doesn't only depend on the block status, but possibly also on the
>>>>>> content of a DATA range.)
>>>>>>=20
>>>>>> Kevin
>>>>>>=20
>>>>> Oh, I understand now the problem, thanks for explanation.
>>>>>=20
>>>>> Hmm, yes that means, that if the whole buf is zero, is_allocated_secto=
rs must not align it down, to be possibly "merged" with next chunk if it is z=
ero too.
>>>>>=20
>>>>> But it's still good to align zeroes down, if data starts somewhere ins=
ide the buf, isn't it?
>>>>>=20
>>>>> what about something like this:
>>>>>=20
>>>>> diff --git a/qemu-img.c b/qemu-img.c
>>>>> index babb5573ab..d1704584a0 100644
>>>>> --- a/qemu-img.c
>>>>> +++ b/qemu-img.c
>>>>> @@ -1167,19 +1167,39 @@ static int is_allocated_sectors(const uint8_t *=
buf, int n, int *pnum,
>>>>>          }
>>>>>      }
>>>>>  +    if (i =3D=3D n) {
>>>>> +        /*
>>>>> +         * The whole buf is the same.
>>>>> +         *
>>>>> +         * if it's data, just return it. It's the old behavior.
>>>>> +         *
>>>>> +         * if it's zero, just return too. It will work good if target=
 is alredy
>>>>> +         * zeroed. And if next chunk is zero too we'll have no RMW an=
d no reason
>>>>> +         * to write data.
>>>>> +         */
>>>>> +        *pnum =3D i;
>>>>> +        return !is_zero;
>>>>> +    }
>>>>> +
>>>>>      tail =3D (sector_num + i) & (alignment - 1);
>>>>>      if (tail) {
>>>>>          if (is_zero && i <=3D tail) {
>>>>> -            /* treat unallocated areas which only consist
>>>>> -             * of a small tail as allocated. */
>>>>> +            /*
>>>>> +             * For sure next sector after i is data, and it will rewr=
ite this
>>>>> +             * tail anyway due to RMW. So, let's just write data now.=

>>>>> +             */
>>>>>              is_zero =3D false;
>>>>>          }
>>>>>          if (!is_zero) {
>>>>> -            /* align up end offset of allocated areas. */
>>>>> +            /* If possible, align up end offset of allocated areas. *=
/
>>>>>              i +=3D alignment - tail;
>>>>>              i =3D MIN(i, n);
>>>>>          } else {
>>>>> -            /* align down end offset of zero areas. */
>>>>> +            /*
>>>>> +             * For sure next sector after i is data, and it will rewr=
ite this
>>>>> +             * tail anyway due to RMW. Better is avoid RMW and write z=
eroes up
>>>>> +             * to aligned bound.
>>>>> +             */
>>>>>              i -=3D tail;
>>>>>          }
>>>>>      }
>>>> I think we forgot to follow up on this. Has anyone tested this
>>>> suggestion?
>>>>=20
>>>> Otherwise, I would try to rerun the tests I did with the my old and
>>>> Kevins suggestion.
>>> I noticed earlier this week that these patches are still in my
>>> development branch, but didn't actually pick it up again yet. So feel
>>> free to try it out.
>> It seems this time I forgot to follow up. Is this topic still open?
>=20
> Most probably yes :) I now checked, that my proposed diff is still applica=
ble to master and don't break compilation. So, if you have some test, you ca=
n check if it works better with the change.

Unfortunately the reproducer in the original ticket does not work for me. It=
 might also depend on the XFS version used.
What I can say is that your patch has no negative impact for my use cases.
If I find the time I will try the reproducer on CentOS7

Best,
Peter



