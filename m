Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C295E6966E3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:30:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwJR-0003Cx-Cs; Tue, 14 Feb 2023 09:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pRwJL-00038L-IM; Tue, 14 Feb 2023 09:29:36 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pRwJI-0003dr-Ix; Tue, 14 Feb 2023 09:29:35 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 17EE047153;
 Tue, 14 Feb 2023 15:29:21 +0100 (CET)
Message-ID: <746c2aaf-c909-784a-fc63-d0599d6dee9b@proxmox.com>
Date: Tue, 14 Feb 2023 15:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Fiona Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
To: qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 t.lamprecht@proxmox.com, jsnow@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
 <Y9uf1wlXQd4EIwxO@redhat.com>
Content-Language: en-US
In-Reply-To: <Y9uf1wlXQd4EIwxO@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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

Am 02.02.23 um 12:34 schrieb Kevin Wolf:
> Am 02.02.2023 um 11:19 hat Fiona Ebner geschrieben:
>> Am 31.01.23 um 19:18 schrieb Denis V. Lunev:
>>> Frankly speaking I would say that this switch could be considered
>>> NOT QEMU job and we should just send a notification (event) for the
>>> completion of the each iteration and management software should
>>> take a decision to switch from async mode to the sync one.
> 
> My first thought was very similar. We should provide a building block
> that just switches between the two modes and then the management tool
> can decide what the right policy is.
> 
> Adding a new event when the first iteration is done (I'm not sure if
> there is much value in having it for later iterations) makes sense to
> me if someone wants to use it. If we add it, let's not forget that
> events can be lost and clients must be able to query the same
> information, so we'd have to add it to query-jobs, too - which in turn
> requires adding a job type specific struct to JobInfo first.

When exactly should an iteration loop be considered finished?

An idea would be to detect the last call to mirror_perform() in
mirror_iteration(), mark the corresponding operation with a new flag,
and trigger the event once mirror_iteration_done() is called with that
operation.

To implement it, I'd peek (below[0] should make it clear what I mean by
"peek") the dirty iterator in the beginning of mirror_iteration() after
computing nb_chunks. If peeking returns -1, we are in the final batch.
Then in the loop where mirror_perform() is called, we need to figure out
when the last call for that batch is. But the loop abort condition
(seemingly?) depends on the result of mirror_perform(), so that might
get a bit involved. I didn't think about it in detail yet, because I
first wanted to ask if this is the approach to go for.

An alternative would be to have an event when the iteration loop was
restarted rather than when the iteration loop is finished, i.e.
triggering the event in mirror_iteration() when the dirty iterator is
reset. This is simpler, but it does not trigger if there are no writes
to the source at all and otherwise it (most likely) triggers while there
still are pending operations from the current iteration loop.

What do you think?

[0]: Is there a good way to peek the iterator without doing something
like the following (we do know the offset from last time in
mirror_iteration(), so that is not an issue)?
> offset_from_last_time = bdrv_dirty_iter_next(s->dbi);
> ...other stuff...
> peek = bdrv_dirty_iter_next(s->dbi);
> /* Get back to the previous state. */
> bdrv_set_dirty_iter(s->dbi, offset_from_last_time);
> check = bdrv_dirty_iter_next(s->dbi);
> assert(check == offset_from_before); // just to be sure

Best Regards,
Fiona



