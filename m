Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B4566F26
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:24:23 +0200 (CEST)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8iXO-0007kc-MU
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8iWC-0006tu-Ro; Tue, 05 Jul 2022 09:23:09 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:36942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8iW8-0001kH-Ga; Tue, 05 Jul 2022 09:23:07 -0400
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 1C9082E1320;
 Tue,  5 Jul 2022 16:22:45 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 54y7ibXTRB-MhKOVgRU; Tue, 05 Jul 2022 16:22:44 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657027364; bh=ofoHJ2+LgpN8o71w0Ulh9Kh833IEKJ7dRtbeKzCNE50=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=cBwaowUOChKfSf5modpHufmixFLu/wwSKEI6UdIDxixqabnqZRCj+k7uiV5JDJF41
 aUytZce4I+n0iGcqennW8Dl6QlGO7rKNruludG0z7SbbQNg+WiDUd5onOJg027K3Tr
 2dcjQ8NvYLJWmzZa5eZuYtRm83b9cQ1UnwuK1abc=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [172.31.61.95] (172.31.61.95-vpn.dhcp.yndx.net [172.31.61.95])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id JydZTkcSAK-MgPqnxef; Tue, 05 Jul 2022 16:22:43 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <197ee109-450a-746a-e46e-a1ca511c3455@yandex-team.ru>
Date: Tue, 5 Jul 2022 16:22:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 13/20] jobs: group together API calls under the same
 job lock
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-14-eesposit@redhat.com>
 <YsPyzyOItXg9Y4c0@stefanha-x1.localdomain>
 <85eb06db-15ab-1451-c420-ec4956febe98@redhat.com>
 <fa3e1d40-fe1c-7ae8-81da-d0122c753cc8@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <fa3e1d40-fe1c-7ae8-81da-d0122c753cc8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/22 16:01, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 05/07/2022 um 10:17 schrieb Emanuele Giuseppe Esposito:
>>
>>
>> Am 05/07/2022 um 10:14 schrieb Stefan Hajnoczi:
>>> On Wed, Jun 29, 2022 at 10:15:31AM -0400, Emanuele Giuseppe Esposito wrote:
>>>> diff --git a/blockdev.c b/blockdev.c
>>>> index 71f793c4ab..5b79093155 100644
>>>> --- a/blockdev.c
>>>> +++ b/blockdev.c
>>>> @@ -150,12 +150,15 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>>>>           return;
>>>>       }
>>>>   
>>>> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>>>> +    JOB_LOCK_GUARD();
>>>> +
>>>> +    for (job = block_job_next_locked(NULL); job;
>>>> +         job = block_job_next_locked(job)) {
>>>>           if (block_job_has_bdrv(job, blk_bs(blk))) {
>>>>               AioContext *aio_context = job->job.aio_context;
>>>>               aio_context_acquire(aio_context);
>>>
>>> Is there a lock ordering rule for job_mutex and the AioContext lock? I
>>> haven't audited the code, but there might be ABBA lock ordering issues.
>>
>> Doesn't really matter here, as lock is nop. To be honest I forgot which
>> one should go first, probably job_lock because the aiocontext lock can
>> be taken and released in callbacks.
>>
>> Should I resend with ordering fixed? Just to have a consistent logic
> 
> Well actually how do I fix that? I would just add useless additional
> changes into the diff, because for example in the case below I am not
> even sure what exactly is the aiocontext protecting.
> 
> So I guess I'll leave as it is. I will just update the commit message to
> make sure it is clear that the lock is nop and ordering is mixed.
> 

Yes, I think it's OK.

As far as I understand, our final ordering rule is that job_mutex can be taken under aio context lock but not visa-versa.

Still, there some aio-context-lock critical sections that are inside job_mutex-lock critical section during the series, just because we don't know the way to avoid it except just merge almost the whole series into one patch. That's why job_mutex is a noop during the series and should become real mutex in the same time with removing these aio-context-lock critical section which breaks the ordering rule.


-- 
Best regards,
Vladimir

