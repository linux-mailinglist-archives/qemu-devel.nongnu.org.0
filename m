Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021422FF5E5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:32:14 +0100 (CET)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gcn-0005ZL-1O
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l2ga1-0003Y2-3N
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:29:21 -0500
Received: from kerio.kamp.de ([195.62.97.192]:50778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l2gZy-0007qQ-5C
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:29:20 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 21:29:09 +0100
Received: (qmail 53122 invoked from network); 21 Jan 2021 20:29:14 -0000
Received: from ac41.vpn.kamp-intra.net (HELO ?172.20.250.41?)
 (pl@kamp.de@::ffff:172.20.250.41)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 21 Jan 2021 20:29:14 -0000
Subject: Re: [PATCH 7/7] block/rbd: change request alignment to 1 byte
To: dillaman@redhat.com
References: <0A9D3682-CE03-4984-AC06-83DA0ABF7BDF@kamp.de>
 <CA+aFP1BvV8YsLqmO7nefO4u3cdVGY4DJsD95WbGrgbYKmRnGoQ@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <bae91481-ab1a-c255-5762-188e8eccc414@kamp.de>
Date: Thu, 21 Jan 2021 21:29:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+aFP1BvV8YsLqmO7nefO4u3cdVGY4DJsD95WbGrgbYKmRnGoQ@mail.gmail.com>
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

Am 21.01.21 um 20:42 schrieb Jason Dillaman:
> On Wed, Jan 20, 2021 at 6:01 PM Peter Lieven <pl@kamp.de> wrote:
>>
>>> Am 19.01.2021 um 15:20 schrieb Jason Dillaman <jdillama@redhat.com>:
>>>
>>> ﻿On Tue, Jan 19, 2021 at 4:36 AM Peter Lieven <pl@kamp.de> wrote:
>>>>> Am 18.01.21 um 23:33 schrieb Jason Dillaman:
>>>>> On Fri, Jan 15, 2021 at 10:39 AM Peter Lieven <pl@kamp.de> wrote:
>>>>>> Am 15.01.21 um 16:27 schrieb Jason Dillaman:
>>>>>>> On Thu, Jan 14, 2021 at 2:59 PM Peter Lieven <pl@kamp.de> wrote:
>>>>>>>> Am 14.01.21 um 20:19 schrieb Jason Dillaman:
>>>>>>>>> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>>>>>>>>>> since we implement byte interfaces and librbd supports aio on byte granularity we can lift
>>>>>>>>>> the 512 byte alignment.
>>>>>>>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>>>>>>>>> ---
>>>>>>>>>> block/rbd.c | 2 --
>>>>>>>>>> 1 file changed, 2 deletions(-)
>>>>>>>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>>>>>>>> index 27b4404adf..8673e8f553 100644
>>>>>>>>>> --- a/block/rbd.c
>>>>>>>>>> +++ b/block/rbd.c
>>>>>>>>>> @@ -223,8 +223,6 @@ done:
>>>>>>>>>> static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
>>>>>>>>>> {
>>>>>>>>>>    BDRVRBDState *s = bs->opaque;
>>>>>>>>>> -    /* XXX Does RBD support AIO on less than 512-byte alignment? */
>>>>>>>>>> -    bs->bl.request_alignment = 512;
>>>>>>>>> Just a suggestion, but perhaps improve discard alignment, max discard,
>>>>>>>>> optimal alignment (if that's something QEMU handles internally) if not
>>>>>>>>> overridden by the user.
>>>>>>>> Qemu supports max_discard and discard_alignment. Is there a call to get these limits
>>>>>>>> from librbd?
>>>>>>>> What do you mean by optimal_alignment? The object size?
>>>>>>> krbd does a good job of initializing defaults [1] where optimal and
>>>>>>> discard alignment is 64KiB (can actually be 4KiB now), max IO size for
>>>>>>> writes, discards, and write-zeroes is the object size * the stripe
>>>>>>> count.
>>>>>> Okay, I will have a look at it. If qemu issues a write, discard, write_zero greater than
>>>>>> obj_size  * stripe count will librbd split it internally or will the request fail?
>>>>> librbd will handle it as needed. My goal is really just to get the
>>>>> hints down the guest OS.
>>>>>> Regarding the alignment it seems that rbd_dev->opts->alloc_size is something that comes from the device
>>>>>> configuration and not from rbd? I don't have that information inside the Qemu RBD driver.
>>>>> librbd doesn't really have the information either. The 64KiB guess
>>>>> that krbd uses was a compromise since that was the default OSD
>>>>> allocation size for HDDs since Luminous. Starting with Pacific that
>>>>> default is going down to 4KiB.
>>>> I will try to adjust these values as far as it is possible and makes sense.
>>>> Is there a way to check the minimum supported OSD release in the backend from librbd / librados?
>>> It's not a minimum -- RADOS will gladly access 1 byte writes as well.
>>> It's really just the optimal (performance and space-wise). Sadly,
>>> there is no realistic way to query this data from the backend.
>> So you would suggest to advertise an optimal transfer length of 64k and max transfer length of obj size * stripe count to the guest unless we have an API in the future to query these limits from the backend?
> I'll open a Ceph tracker ticket to expose these via the API in a future release.


That would be good to have!


>
>> I would leave request alignment at 1 byte as otherwise Qemu will issue RMWs for all write requests that do not align. Everything that comes from a guest OS is very likely 4k aligned anyway.
> My goal is definitely not to have QEMU do any extra work for splitting
> or aligning IOs. I am really only trying to get hints passed down the
> guest via the virtio drivers. If there isn't the plumbing in QEMU for
> that yet, disregard.


From what I read from the code Qemu emulates the Block Limits VPD Page for virtio-scsi, but the limits there are not taken from the backend driver. They can be passed as config to the virtio-scsi device.

However, Qemu uses all the Block Limit that can be found in include/block/block_int.h in the BlockLimits struct to generate optimal requests if it comes to block operations like mirroring, or zeroing of a whole

device etc. Some of the alignments (e.g. the request alignment) have direct influence and make Qemu split requests from the guest or even make RMW cycles.

If my understanding is incorrect please anyone correct me.


It would indeed be nice to have an option to propagate the settings from the backend driver into the Guest. But from my understanding this is not there yet.


So I would leave it as it. Drop the request_alignment = 512 (like in the patch) and just advertise the cluster_size at obj_size. This is already in the rbd driver today.

The cluster_size e.g. is used in any qemu-img convert operation to align read / write requests and size them apropiately.


Peter



