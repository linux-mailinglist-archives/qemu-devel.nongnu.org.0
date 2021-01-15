Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B69D2F7FF9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:48:51 +0100 (CET)
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RLG-0001jP-6s
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l0RCA-0000Vr-BT
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:39:27 -0500
Received: from kerio.kamp.de ([195.62.97.192]:54961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l0RC7-0004ea-65
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:39:26 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:39:14 +0100
Received: (qmail 43374 invoked from network); 15 Jan 2021 15:39:18 -0000
Received: from ac13.vpn.kamp-intra.net (HELO ?172.20.250.13?)
 (pl@kamp.de@::ffff:172.20.250.13)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 15 Jan 2021 15:39:18 -0000
Subject: Re: [PATCH 7/7] block/rbd: change request alignment to 1 byte
To: dillaman@redhat.com
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-8-pl@kamp.de>
 <CA+aFP1AJ1cMdMGr-Odq+qzgZo9FF89mVy1KzNcoKifjQFwDvJA@mail.gmail.com>
 <f7358dc9-6135-dfa7-fd50-f863d0c8890a@kamp.de>
 <CA+aFP1Aayup5p482M8tsK3Zy62FLsfgUuQYnw_bSte-RuBrQXg@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <75992ffb-3b6e-c31a-a9a0-956daa7752e6@kamp.de>
Date: Fri, 15 Jan 2021 16:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+aFP1Aayup5p482M8tsK3Zy62FLsfgUuQYnw_bSte-RuBrQXg@mail.gmail.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.01.21 um 16:27 schrieb Jason Dillaman:
> On Thu, Jan 14, 2021 at 2:59 PM Peter Lieven <pl@kamp.de> wrote:
>> Am 14.01.21 um 20:19 schrieb Jason Dillaman:
>>> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>>>> since we implement byte interfaces and librbd supports aio on byte granularity we can lift
>>>> the 512 byte alignment.
>>>>
>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>>> ---
>>>>  block/rbd.c | 2 --
>>>>  1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>> index 27b4404adf..8673e8f553 100644
>>>> --- a/block/rbd.c
>>>> +++ b/block/rbd.c
>>>> @@ -223,8 +223,6 @@ done:
>>>>  static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
>>>>  {
>>>>      BDRVRBDState *s = bs->opaque;
>>>> -    /* XXX Does RBD support AIO on less than 512-byte alignment? */
>>>> -    bs->bl.request_alignment = 512;
>>> Just a suggestion, but perhaps improve discard alignment, max discard,
>>> optimal alignment (if that's something QEMU handles internally) if not
>>> overridden by the user.
>>
>> Qemu supports max_discard and discard_alignment. Is there a call to get these limits
>>
>> from librbd?
>>
>>
>> What do you mean by optimal_alignment? The object size?
> krbd does a good job of initializing defaults [1] where optimal and
> discard alignment is 64KiB (can actually be 4KiB now), max IO size for
> writes, discards, and write-zeroes is the object size * the stripe
> count.


Okay, I will have a look at it. If qemu issues a write, discard, write_zero greater than

obj_size  * stripe count will librbd split it internally or will the request fail?


Regarding the alignment it seems that rbd_dev->opts->alloc_size is something that comes from the device

configuration and not from rbd? I don't have that information inside the Qemu RBD driver.


Peter



