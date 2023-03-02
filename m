Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1826A7F62
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:01:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfk3-0004pC-QQ; Thu, 02 Mar 2023 05:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pXfk1-0004ob-1Q; Thu, 02 Mar 2023 05:00:49 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pXfjz-0005NV-83; Thu, 02 Mar 2023 05:00:48 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 9FFF044D46;
 Thu,  2 Mar 2023 11:00:44 +0100 (CET)
Message-ID: <ed82e058-0d83-8b29-5f10-2076268cac3a@proxmox.com>
Date: Thu, 2 Mar 2023 11:00:43 +0100
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
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <0e9d40ac-42c8-698f-ee75-4cbc5bfe7fa5@yandex-team.ru>
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

Am 01.03.23 um 17:31 schrieb Vladimir Sementsov-Ogievskiy:
> On 24.02.23 17:48, Fiona Ebner wrote:
>> This can be used by management applications starting with a job in
>> background mode to determine when the switch to active mode should
>> happen.
>>
>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
>> ---
>>   block/mirror.c       | 1 +
>>   qapi/block-core.json | 4 +++-
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 02b5bd8bd2..ac83309b82 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -1259,6 +1259,7 @@ static void mirror_query(BlockJob *job,
>> BlockJobInfo *info)
>>         info->u.mirror = (BlockJobInfoMirror) {
>>           .actively_synced = s->actively_synced,
>> +        .remaining_dirty = bdrv_get_dirty_count(s->dirty_bitmap),
> 
> Doesn't it duplicate info->len - info->offset in meaning?
> 

Essentially yes, apart from the in-flight bytes:
>         job_progress_set_remaining(&s->common.job,
>                                    s->bytes_in_flight + cnt +
>                                    s->active_write_bytes_in_flight);

Should I rather use that value (and rename it to e.g. data_remaining to
be more similar to data_sent from 9/9)?

But I'd argue the same way as in 9/9: it's not transparent to users what
offset and len mean for the mirror job, because their documentation is
for a generic block job. E.g. len is documented to be able to change in
both directions while the job runs.

Best Regards,
Fiona


