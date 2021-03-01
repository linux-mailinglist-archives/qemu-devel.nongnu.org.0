Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE80C327DF5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:13:51 +0100 (CET)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhQs-0005x7-SC
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lGhPK-0004zL-Su
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:12:14 -0500
Received: from kerio.kamp.de ([195.62.97.192]:37647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lGhPC-0001Gb-Bw
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:12:14 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Mon, 1 Mar 2021 13:11:52 +0100
Received: (qmail 56281 invoked from network); 1 Mar 2021 12:11:55 -0000
Received: from unknown (HELO ?172.20.250.3?) (pl@kamp.de@::ffff:172.20.250.3)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted)
 ESMTPA; 1 Mar 2021 12:11:55 -0000
Subject: Re: block/throttle and burst bucket
To: Kevin Wolf <kwolf@redhat.com>
References: <efe8ee1c-e12f-b739-b9dd-9bd6d80527cb@kamp.de>
 <w51blc7ji0b.fsf@maestria.local.igalia.com>
 <3b68544d-66bc-1790-26f9-6e50683119cc@kamp.de>
 <20210301105934.GB7698@merkur.fritz.box>
From: Peter Lieven <pl@kamp.de>
Message-ID: <a56688da-d433-8405-cec5-3298d4edd91b@kamp.de>
Date: Mon, 1 Mar 2021 13:11:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301105934.GB7698@merkur.fritz.box>
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
Cc: Alberto Garcia <berto@igalia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.03.21 um 11:59 schrieb Kevin Wolf:
> Am 26.02.2021 um 13:33 hat Peter Lieven geschrieben:
>> Am 26.02.21 um 10:27 schrieb Alberto Garcia:
>>> On Thu 25 Feb 2021 06:34:48 PM CET, Peter Lieven <pl@kamp.de> wrote:
>>>> I was wondering if there is a way to check from outside (qmp etc.) if
>>>> a throttled block device has exceeded the iops_max_length seconds of
>>>> time bursting up to iops_max and is now hard limited to the iops limit
>>>> that is supplied?
>>>>
>>>> Would it be also a good idea to exetend the accounting to account for
>>>> requests that must have waited before being sent out to the backend
>>>> device?
>>> No, there's no such interface as far as I'm aware. I think one problem
>>> is that throttling is now done using a filter, that can be inserted
>>> anywhere in the node graph, and accounting is done at the BlockBackend
>>> level.
>>>
>>> We don't even have a query-block-throttle function. I actually started
>>> to write one six years ago but it was never finished.
>>
>> A quick idea that came to my mind was to add an option to emit a QMP
>> event if the burst_bucket is exhausted and hard limits are enforced.
> Do you actually need to do something every time that it's exceeded, so
> QEMU needs to be the active part sending out an event, or is it
> something that you need to check in specific places and could reasonably
> query on demand?
>
> For the latter, my idea would have been adding a new read-only QOM
> property to the throttle group object that exposes how much is still
> left. When it becomes 0, the hard limits are enforced.
>
>> There seems to be something wrong in the throttling code anyway.
>> Throttling causes addtional i/o latency always even if the actual iops
>> rate is far away from the limits and ever more far away from the burst
>> limits. I will dig into this.
>>
>> My wishlist:
>>
>>  - have a possibility to query the throttling state.
>>  - have counters for no of delayed ops and for how long they were delayed.
>>  - have counters for untrottled <= 4k request performance for a backend storage device.
>>
>> The later two seem not trivial as you mentioned.
> Do you need the information per throttle node or per throttle group? For
> the latter, the same QOM property approach would work.


Hi Kevin,


per throttle-group information would be sufficient. So you would expose the the level of the bucket and

additionally a counter for throttled vs. total ops and total delay?


Why we talk about throttling I still do not understand the following part in util/throttle.c function throttle_compute_wait


    if (!bkt->max) {
        /* If bkt->max is 0 we still want to allow short bursts of I/O
         * from the guest, otherwise every other request will be throttled
         * and performance will suffer considerably. */
        bucket_size = (double) bkt->avg / 10;
        burst_bucket_size = 0;
    } else {
        /* If we have a burst limit then we have to wait until all I/O
         * at burst rate has finished before throttling to bkt->avg */
        bucket_size = bkt->max * bkt->burst_length;
        burst_bucket_size = (double) bkt->max / 10;
    }


Why burst_bucket_size = bkt->max / 10?

From what I understand it should be bkt->max. Otherwise we compare the "extra" against a tenth of the bucket capacity

and schedule a timer where it is not necessary.


What am I missing here?



Peter




