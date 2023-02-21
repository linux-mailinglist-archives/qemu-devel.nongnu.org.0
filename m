Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E459E69DE50
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:58:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQLS-0000VP-MM; Tue, 21 Feb 2023 05:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pUQLC-0000S7-2z; Tue, 21 Feb 2023 05:57:50 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pUQL9-0004Kc-Uc; Tue, 21 Feb 2023 05:57:45 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C9BE447DDC;
 Tue, 21 Feb 2023 11:57:20 +0100 (CET)
Message-ID: <d03ebb21-999f-fac2-44b0-0a6a1ca3c5ca@proxmox.com>
Date: Tue, 21 Feb 2023 11:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>
Cc: "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org,
 t.lamprecht@proxmox.com, jsnow@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
 <Y9uf1wlXQd4EIwxO@redhat.com>
 <40969191-9a16-0550-e999-bc44584d81fb@proxmox.com>
 <182b70d7-5123-8bc3-e855-c4bf174e98a1@yandex-team.ru>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <182b70d7-5123-8bc3-e855-c4bf174e98a1@yandex-team.ru>
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

Am 14.02.23 um 17:19 schrieb Vladimir Sementsov-Ogievskiy:
> On 02.02.23 16:27, Fiona Ebner wrote:
>> Am 02.02.23 um 12:34 schrieb Kevin Wolf:
>>> But having to switch the mirror job to sync mode just to avoid doing I/O
>>> on an inactive device sounds wrong to me. It doesn't fix the root cause
>>> of that problem, but just papers over it.
>>
>> If you say the root cause is "the job not being completed before
>> switchover", then yes. But if the root cause is "switchover happening
>> while the drive is not actively synced", then a way to switch modes can
>> fix the root cause :)
>>
>>>
>>> Why does your management tool not complete the mirror job before it
>>> does the migration switchover that inactivates images?
>>
>> I did talk with my team leader about the possibility, but we decided to
>> not go for it, because it requires doing the migration in two steps with
>> pause-before-switchover and has the potential to increase guest downtime
>> quite a bit. So I went for this approach instead.
>>
> 
> 
> Interesting point. Maybe we need a way to automatically complete all the
> jobs before switchower?  It seems no reason to break the jobs if user
> didn't cancel them. (and of course no reason to allow a code path
> leading to assertion).
> 

Wouldn't that be a bit unexpected? There could be jobs unrelated to
migration or jobs at early stages. But sure, being able to trigger the
assertion is not nice.

Potential alternatives could be pausing the jobs or failing migration
with a clean error?

For us, the former is still best done in combination with a way to
switch to active (i.e. write-blocking) mode for drive-mirror.

The latter would force us to complete the drive-mirror job before
switchover even with active (i.e. write-blocking) mode, breaking our
usage of drive-mirror+migration that worked (in almost all cases, but it
would have been all cases if we had used active mode ;)) for many years now.

Maybe adding an option for how the jobs should behave upon switchover
(e.g. complete/pause/cancel/cancel-migration) could help? Either as a
job-specific option (more flexible) or a migration option?

CC-ing migration maintainers

Best Regards,
Fiona


