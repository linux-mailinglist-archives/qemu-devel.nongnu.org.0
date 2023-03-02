Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13426A7FC2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:15:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfwi-0006fV-HL; Thu, 02 Mar 2023 05:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXfwg-0006f9-17; Thu, 02 Mar 2023 05:13:54 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXfwd-0008Ig-PR; Thu, 02 Mar 2023 05:13:53 -0500
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:5708:0:640:5704:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 037A75E8EE;
 Thu,  2 Mar 2023 13:13:36 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7321::1:10] (unknown
 [2a02:6b8:b081:7321::1:10])
 by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id YDTE3E0OeqM0-5HJPOU0Z; Thu, 02 Mar 2023 13:13:35 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net;
 dkim=pass
Message-ID: <708f6131-1d4f-ff4d-611c-30b0da891223@yandex-team.ru>
Date: Thu, 2 Mar 2023 13:13:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 8/9] mirror: return the remaining dirty bytes upon query
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, den@virtuozzo.com,
 t.lamprecht@proxmox.com, alexander.ivanov@virtuozzo.com
References: <20230224144825.466375-1-f.ebner@proxmox.com>
 <20230224144825.466375-9-f.ebner@proxmox.com>
 <0e9d40ac-42c8-698f-ee75-4cbc5bfe7fa5@yandex-team.ru>
 <ed82e058-0d83-8b29-5f10-2076268cac3a@proxmox.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <ed82e058-0d83-8b29-5f10-2076268cac3a@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 02.03.23 13:00, Fiona Ebner wrote:
> Am 01.03.23 um 17:31 schrieb Vladimir Sementsov-Ogievskiy:
>> On 24.02.23 17:48, Fiona Ebner wrote:
>>> This can be used by management applications starting with a job in
>>> background mode to determine when the switch to active mode should
>>> happen.
>>>
>>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
>>> ---
>>>    block/mirror.c       | 1 +
>>>    qapi/block-core.json | 4 +++-
>>>    2 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/block/mirror.c b/block/mirror.c
>>> index 02b5bd8bd2..ac83309b82 100644
>>> --- a/block/mirror.c
>>> +++ b/block/mirror.c
>>> @@ -1259,6 +1259,7 @@ static void mirror_query(BlockJob *job,
>>> BlockJobInfo *info)
>>>          info->u.mirror = (BlockJobInfoMirror) {
>>>            .actively_synced = s->actively_synced,
>>> +        .remaining_dirty = bdrv_get_dirty_count(s->dirty_bitmap),
>>
>> Doesn't it duplicate info->len - info->offset in meaning?
>>
> 
> Essentially yes, apart from the in-flight bytes:

Is it worth reporting to user?

>>          job_progress_set_remaining(&s->common.job,
>>                                     s->bytes_in_flight + cnt +
>>                                     s->active_write_bytes_in_flight);
> 
> Should I rather use that value (and rename it to e.g. data_remaining to
> be more similar to data_sent from 9/9)?
> 
> But I'd argue the same way as in 9/9: it's not transparent to users what
> offset and len mean for the mirror job, because their documentation is
> for a generic block job. E.g. len is documented to be able to change in
> both directions while the job runs.
> 

Still I'm not sure that we need new status values. I.e. if you need some new ones, you should explain the case and why existing information is not enough.

Especially when documentation of existing things is unclear, its better to start from improving it. And when we understand what len and offset means for mirror, it would probably be enough.


-- 
Best regards,
Vladimir


