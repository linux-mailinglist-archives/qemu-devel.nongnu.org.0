Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206506879FD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:20:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNWgg-0003Na-10; Thu, 02 Feb 2023 05:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pNWgX-0003Hw-9B; Thu, 02 Feb 2023 05:19:18 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pNWgU-00052J-Rj; Thu, 02 Feb 2023 05:19:16 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id CDB3343ACE;
 Thu,  2 Feb 2023 11:19:04 +0100 (CET)
Message-ID: <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
Date: Thu, 2 Feb 2023 11:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: t.lamprecht@proxmox.com, jsnow@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 31.01.23 um 19:18 schrieb Denis V. Lunev:
> On 1/31/23 18:44, Vladimir Sementsov-Ogievskiy wrote:
>> + Den
>>
>> Den, I remember we thought about that, and probably had a solution?
>>
>> Another possible approach to get benefits from both modes is to switch
>> to blocking mode after first loop of copying. [*]
>>
>> Hmm. Thinking about proposed solution it seems, that [*] is better.
>> The main reason of "write-blocking" mode is to force convergence of
>> the mirror job. But you lose this thing if you postpone switching to
>> the moment when mirror becomes READY: we may never reach it.
>>
>>
>>
>> Or, may be we can selectively skip or block guest writes, to keep some
>> specified level of convergence?
>>
>> Or, we can start in "background" mode, track the speed of convergence
>> (like dirty-delta per minute), and switch to blocking if speed becomes
>> less than some threshold.
>>
> 
> That is absolutely correct. It would be very kind to start with
> asynchronous mirror and switch to the synchronous one after
> specific amount of loops. This should be somehow measured.
> 
> Originally we have thought about switching after the one loop
> (when basic background sending is done), but may be 2 iterations
> (initial + first one) would be better.
> 
> Talking about this specific approach and our past experience
> I should note that reaching completion point in the
> asynchronous mode was a real pain and slow down for the guest.
> We have intentionally switched at that time to the sync mode
> for that purpose. Thus this patch is a "worst half-way" for
> us.

While the asynchronous mode can take longer of course, the slowdown of
the guest is bigger with the synchronous mode, or what am I missing?

We have been using asynchronous mode for years (starting migration after
all drive-mirror jobs are READY) and AFAIK our users did not complain
about them not reaching READY or heavy slowdowns in the guest. We had
two reports about an assertion failure recently when drive-mirror still
got work left at the time the blockdrives are inactivated by migration.

> Frankly speaking I would say that this switch could be considered
> NOT QEMU job and we should just send a notification (event) for the
> completion of the each iteration and management software should
> take a decision to switch from async mode to the sync one.

Unfortunately, our management software is a bit limited in that regard
currently and making listening for events available in the necessary
place would take a bit of work. Having the switch command would nearly
be enough for us (we'd just switch after READY). But we'd also need that
when the switch happens after READY, that all remaining asynchronous
operations are finished by the command. Otherwise, the original issue
with inactivating block drives while mirror still has work remains. Do
those semantics for the switch sound acceptable?

> Under such a condition we should have a command to perform mode
> switch. This seems more QEMU/QAPI way :)
> 

I feel like a switch at an arbitrary time might be hard to do correctly,
i.e. to not miss some (implicit) assertion.

But I can try and go for this approach if it's more likely to be
accepted upstream. So a 'drive-mirror-change' command which takes the
'job-id' and a 'copy-mode' argument? And only allow the switch from
'background' to 'active' (initially)?

Or a more generic 'block-job-change'? But that would need a way to take
'JobType'-specific arguments. Is that doable?

(...)

>>> @@ -1035,10 +1036,31 @@ static int coroutine_fn mirror_run(Job *job,
>>> Error **errp)
>>>           if (s->in_flight == 0 && cnt == 0) {
>>>               trace_mirror_before_flush(s);
>>>               if (!job_is_ready(&s->common.job)) {
>>> +                if (s->copy_mode ==
>>> + MIRROR_COPY_MODE_WRITE_BLOCKING_AFTER_READY) {
>>> +                    /*
>>> +                     * Pause guest I/O to check if we can switch to
>>> active mode.
>>> +                     * To set actively_synced to true below, it is
>>> necessary to
>>> +                     * have seen and synced all guest I/O.
>>> +                     */
>>> +                    s->in_drain = true;
>>> +                    bdrv_drained_begin(bs);
>>> +                    if (bdrv_get_dirty_count(s->dirty_bitmap) > 0) {
>>> +                        bdrv_drained_end(bs);
>>> +                        s->in_drain = false;
>>> +                        continue;
>>> +                    }
>>> +                    s->in_active_mode = true;
>>> + bdrv_disable_dirty_bitmap(s->dirty_bitmap);
>>> +                    bdrv_drained_end(bs);
>>> +                    s->in_drain = false;
>>> +                }
>>
>> I doubt, do we really need the drained section?
> 
> Frankly speaking I do not like this. I'd better would not
> rely on the enable/disable of the whole bitmap but encode
> mode into MirrorOp and mark blocks dirty only for those
> operations for which in_active_mode was set at the
> operation start.
>

Do you mean "for which in_active_mode was *not* set at the operation
start"? Also, the dirty bitmap gets set by things like the
bdrv_co_pwritev() call in bdrv_mirror_top_do_write(), so how would we
prevent setting it? The dirty bitmap does get reset in
do_sync_target_write(), so maybe that already takes care of it, but I
didn't check in detail.


