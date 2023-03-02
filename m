Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1A6A82DC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:55:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiBX-0007tE-QH; Thu, 02 Mar 2023 07:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pXi8v-0004KZ-4v; Thu, 02 Mar 2023 07:34:41 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pXi8s-0004BW-Rs; Thu, 02 Mar 2023 07:34:40 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 1119C48DB1;
 Thu,  2 Mar 2023 13:34:36 +0100 (CET)
Message-ID: <cfd20e33-8f5e-c121-6cbd-2c751756b725@proxmox.com>
Date: Thu, 2 Mar 2023 13:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 8/9] mirror: return the remaining dirty bytes upon query
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, den@virtuozzo.com,
 t.lamprecht@proxmox.com, alexander.ivanov@virtuozzo.com
References: <20230224144825.466375-1-f.ebner@proxmox.com>
 <20230224144825.466375-9-f.ebner@proxmox.com>
 <0e9d40ac-42c8-698f-ee75-4cbc5bfe7fa5@yandex-team.ru>
 <ed82e058-0d83-8b29-5f10-2076268cac3a@proxmox.com>
 <708f6131-1d4f-ff4d-611c-30b0da891223@yandex-team.ru>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <708f6131-1d4f-ff4d-611c-30b0da891223@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
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

Am 02.03.23 um 11:13 schrieb Vladimir Sementsov-Ogievskiy:
> On 02.03.23 13:00, Fiona Ebner wrote:
>> Am 01.03.23 um 17:31 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 24.02.23 17:48, Fiona Ebner wrote:
>>>> This can be used by management applications starting with a job in
>>>> background mode to determine when the switch to active mode should
>>>> happen.
>>>>
>>>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>>> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
>>>> ---
>>>>    block/mirror.c       | 1 +
>>>>    qapi/block-core.json | 4 +++-
>>>>    2 files changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/block/mirror.c b/block/mirror.c
>>>> index 02b5bd8bd2..ac83309b82 100644
>>>> --- a/block/mirror.c
>>>> +++ b/block/mirror.c
>>>> @@ -1259,6 +1259,7 @@ static void mirror_query(BlockJob *job,
>>>> BlockJobInfo *info)
>>>>          info->u.mirror = (BlockJobInfoMirror) {
>>>>            .actively_synced = s->actively_synced,
>>>> +        .remaining_dirty = bdrv_get_dirty_count(s->dirty_bitmap),
>>>
>>> Doesn't it duplicate info->len - info->offset in meaning?
>>>
>>
>> Essentially yes, apart from the in-flight bytes:
> 
> Is it worth reporting to user?
> 

You suggested that data_sent and remaining_dirty are important:
https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg03831.html

But I guess info->len - info->offset is just as good as part of a
heuristic to decide when the switch to active mode should happen.

For us, it doesn't really matter right now, because our users didn't
report issues with convergence, so our plan is to just switch to active
mode after the job is ready. We just need actively_synced to infer when
the switch is complete.

>>>          job_progress_set_remaining(&s->common.job,
>>>                                     s->bytes_in_flight + cnt +
>>>                                     s->active_write_bytes_in_flight);
>>
>> Should I rather use that value (and rename it to e.g. data_remaining to
>> be more similar to data_sent from 9/9)?
>>
>> But I'd argue the same way as in 9/9: it's not transparent to users what
>> offset and len mean for the mirror job, because their documentation is
>> for a generic block job. E.g. len is documented to be able to change in
>> both directions while the job runs.
>>
> 
> Still I'm not sure that we need new status values. I.e. if you need some
> new ones, you should explain the case and why existing information is
> not enough.
> 
> Especially when documentation of existing things is unclear, its better
> to start from improving it. And when we understand what len and offset
> means for mirror, it would probably be enough.
> 

Okay, makes sense! But I'm not sure how. Should I just add a paragraph
describing what the values mean for mirror in the description of @len
and @offset in @BlockJobInfo? Or where should this be documented?


