Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475412FDCCA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 00:03:19 +0100 (CET)
Received: from localhost ([::1]:38206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2MVS-00012A-CE
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 18:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1l2MTj-0000W5-Kv; Wed, 20 Jan 2021 18:01:31 -0500
Received: from kerio.kamp.de ([195.62.97.192]:43079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1l2MTg-0006ub-VA; Wed, 20 Jan 2021 18:01:30 -0500
X-Footer: a2FtcC5kZQ==
Received: from [192.168.178.98] ([79.200.90.163])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Thu, 21 Jan 2021 00:01:11 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 7/7] block/rbd: change request alignment to 1 byte
Message-Id: <0A9D3682-CE03-4984-AC06-83DA0ABF7BDF@kamp.de>
Date: Thu, 21 Jan 2021 00:01:13 +0100
To: dillaman@redhat.com
X-Mailer: iPhone Mail (18C66)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=EF=BB=BF
> Am 19.01.2021 um 15:20 schrieb Jason Dillaman <jdillama@redhat.com>:
>=20
> =EF=BB=BFOn Tue, Jan 19, 2021 at 4:36 AM Peter Lieven <pl@kamp.de> wrote:
>>> Am 18.01.21 um 23:33 schrieb Jason Dillaman:
>>> On Fri, Jan 15, 2021 at 10:39 AM Peter Lieven <pl@kamp.de> wrote:
>>>> Am 15.01.21 um 16:27 schrieb Jason Dillaman:
>>>>> On Thu, Jan 14, 2021 at 2:59 PM Peter Lieven <pl@kamp.de> wrote:
>>>>>> Am 14.01.21 um 20:19 schrieb Jason Dillaman:
>>>>>>> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>>>>>>>> since we implement byte interfaces and librbd supports aio on byte g=
ranularity we can lift
>>>>>>>> the 512 byte alignment.
>>>>>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>>>>>>> ---
>>>>>>>> block/rbd.c | 2 --
>>>>>>>> 1 file changed, 2 deletions(-)
>>>>>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>>>>>> index 27b4404adf..8673e8f553 100644
>>>>>>>> --- a/block/rbd.c
>>>>>>>> +++ b/block/rbd.c
>>>>>>>> @@ -223,8 +223,6 @@ done:
>>>>>>>> static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **e=
rrp)
>>>>>>>> {
>>>>>>>>    BDRVRBDState *s =3D bs->opaque;
>>>>>>>> -    /* XXX Does RBD support AIO on less than 512-byte alignment? *=
/
>>>>>>>> -    bs->bl.request_alignment =3D 512;
>>>>>>> Just a suggestion, but perhaps improve discard alignment, max discar=
d,
>>>>>>> optimal alignment (if that's something QEMU handles internally) if n=
ot
>>>>>>> overridden by the user.
>>>>>> Qemu supports max_discard and discard_alignment. Is there a call to g=
et these limits
>>>>>> from librbd?
>>>>>> What do you mean by optimal_alignment? The object size?
>>>>> krbd does a good job of initializing defaults [1] where optimal and
>>>>> discard alignment is 64KiB (can actually be 4KiB now), max IO size for=

>>>>> writes, discards, and write-zeroes is the object size * the stripe
>>>>> count.
>>>> Okay, I will have a look at it. If qemu issues a write, discard, write_=
zero greater than
>>>> obj_size  * stripe count will librbd split it internally or will the re=
quest fail?
>>> librbd will handle it as needed. My goal is really just to get the
>>> hints down the guest OS.
>>>> Regarding the alignment it seems that rbd_dev->opts->alloc_size is some=
thing that comes from the device
>>>> configuration and not from rbd? I don't have that information inside th=
e Qemu RBD driver.
>>> librbd doesn't really have the information either. The 64KiB guess
>>> that krbd uses was a compromise since that was the default OSD
>>> allocation size for HDDs since Luminous. Starting with Pacific that
>>> default is going down to 4KiB.
>> I will try to adjust these values as far as it is possible and makes sens=
e.
>> Is there a way to check the minimum supported OSD release in the backend f=
rom librbd / librados?
>=20
> It's not a minimum -- RADOS will gladly access 1 byte writes as well.
> It's really just the optimal (performance and space-wise). Sadly,
> there is no realistic way to query this data from the backend.

So you would suggest to advertise an optimal transfer length of 64k and max t=
ransfer length of obj size * stripe count to the guest unless we have an API=
 in the future to query these limits from the backend?

I would leave request alignment at 1 byte as otherwise Qemu will issue RMWs f=
or all write requests that do not align. Everything that comes from a guest O=
S is very likely 4k aligned anyway.

Peter



