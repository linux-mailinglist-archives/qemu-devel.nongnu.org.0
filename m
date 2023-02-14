Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC8669692B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:20:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRy1i-000129-8F; Tue, 14 Feb 2023 11:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRy1Z-0000sd-HT; Tue, 14 Feb 2023 11:19:21 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRy1U-0006VS-W7; Tue, 14 Feb 2023 11:19:21 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E39365FC8C;
 Tue, 14 Feb 2023 19:19:04 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3JmTH10RgGk1-xbb4qtqW; Tue, 14 Feb 2023 19:19:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676391544; bh=txwdS4NpbUNaCqoajq1rp/rc4IDRwIPz5BLVnC/7OzI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=qZ0dSwHeqnXmN2fCUhWcqueVYtk0b2FOW5sAVdzyurOm9S+Yc9L7iM2DuZtWwRGIv
 hlLaTCphnDZ/sseFEeCXUe+PHL4g3S/pDmheEnnV2He7iUiFcriwDSFSnNxu0we0QV
 LybrvlX5MqqjTjIhM+E7THRTQAtUF48ajjNBQqBw=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <182b70d7-5123-8bc3-e855-c4bf174e98a1@yandex-team.ru>
Date: Tue, 14 Feb 2023 19:19:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, Kevin Wolf <kwolf@redhat.com>
Cc: "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org,
 t.lamprecht@proxmox.com, jsnow@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
 <Y9uf1wlXQd4EIwxO@redhat.com>
 <40969191-9a16-0550-e999-bc44584d81fb@proxmox.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <40969191-9a16-0550-e999-bc44584d81fb@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 02.02.23 16:27, Fiona Ebner wrote:
> Am 02.02.23 um 12:34 schrieb Kevin Wolf:
>> Am 02.02.2023 um 11:19 hat Fiona Ebner geschrieben:
>>> Am 31.01.23 um 19:18 schrieb Denis V. Lunev:
>>>> Frankly speaking I would say that this switch could be considered
>>>> NOT QEMU job and we should just send a notification (event) for the
>>>> completion of the each iteration and management software should
>>>> take a decision to switch from async mode to the sync one.
>>
>> My first thought was very similar. We should provide a building block
>> that just switches between the two modes and then the management tool
>> can decide what the right policy is.
>>
>> Adding a new event when the first iteration is done (I'm not sure if
>> there is much value in having it for later iterations) makes sense to
>> me if someone wants to use it. If we add it, let's not forget that
>> events can be lost and clients must be able to query the same
>> information, so we'd have to add it to query-jobs, too - which in turn
>> requires adding a job type specific struct to JobInfo first.
>>
> 
> Well, Denis said 2 iterations might be better. But I'm fine with
> initially adding an event just for the first iteration, further ones can
> still be added later. Returning the number of completed iterations as
> part of the mirror-specific job info would anticipate that.
> 
>> Once we have this generic infrastructure with low-level building block,
>> I wouldn't necessarily be opposed to having an option build on top where
>> QEMU automatically does what we consider most useful for most users.
>> auto-finalize/dismiss already do something similar.
>>
>>> Unfortunately, our management software is a bit limited in that regard
>>> currently and making listening for events available in the necessary
>>> place would take a bit of work. Having the switch command would nearly
>>> be enough for us (we'd just switch after READY). But we'd also need
>>> that when the switch happens after READY, that all remaining
>>> asynchronous operations are finished by the command. Otherwise, the
>>> original issue with inactivating block drives while mirror still has
>>> work remains. Do those semantics for the switch sound acceptable?
>>
>> Completing the remaining asynchronous operations can take a while, so I
>> don't think it's something to be done in a synchronous QMP command.
>> Do we need an event that tells you that the switch has completed?
>>
> 
> Sure, makes sense. Since you said that an having an event implies that
> there will be a possibility to query for the same information, yes ;)
> 
> What Denis suggested in the other mail also sounds good to me:
> 
> Am 02.02.23 um 12:09 schrieb Denis V. Lunev:
>> On 2/2/23 11:19, Fiona Ebner wrote:
>>> Unfortunately, our management software is a bit limited in that regard
>>> currently and making listening for events available in the necessary
>>> place would take a bit of work. Having the switch command would nearly
>>> be enough for us (we'd just switch after READY). But we'd also need that
>>> when the switch happens after READY, that all remaining asynchronous
>>> operations are finished by the command.
>> That could be a matter of the other event I believe. We switch mode and reset
>> the state. New READY event will be sent once the bitmap is cleared. That seems
>> fair.
> 
> That would avoid adding a new kind of event.
> 
>> But having to switch the mirror job to sync mode just to avoid doing I/O
>> on an inactive device sounds wrong to me. It doesn't fix the root cause
>> of that problem, but just papers over it.
> 
> If you say the root cause is "the job not being completed before
> switchover", then yes. But if the root cause is "switchover happening
> while the drive is not actively synced", then a way to switch modes can
> fix the root cause :)
> 
>>
>> Why does your management tool not complete the mirror job before it
>> does the migration switchover that inactivates images?
> 
> I did talk with my team leader about the possibility, but we decided to
> not go for it, because it requires doing the migration in two steps with
> pause-before-switchover and has the potential to increase guest downtime
> quite a bit. So I went for this approach instead.
> 


Interesting point. Maybe we need a way to automatically complete all the jobs before switchower?  It seems no reason to break the jobs if user didn't cancel them. (and of course no reason to allow a code path leading to assertion).

-- 
Best regards,
Vladimir


