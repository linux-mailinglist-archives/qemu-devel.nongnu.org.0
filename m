Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37C957B72A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:17:16 +0200 (CEST)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9Zj-0002Kq-Ny
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oE9TR-0003zP-W4; Wed, 20 Jul 2022 09:10:46 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:37050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oE9TM-0006cl-Fh; Wed, 20 Jul 2022 09:10:43 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 860E12E1FB9;
 Wed, 20 Jul 2022 16:10:29 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b715::1:28] (unknown
 [2a02:6b8:b081:b715::1:28])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 gTrl4zexdG-AROuGNEm; Wed, 20 Jul 2022 13:10:28 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658322628; bh=+AIJ9YhVlYBDsVApU3lV5TRVIA1Ld4vNPFy5RWBsB1M=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=bl2tnU/UndYQ+KSUaql53KW/OETl4efrafjgW487aC6ck+1BNa4PUwjUxY6Lzcjxi
 5F29a2fddagCiAbrNlfsOVJoMpuIQEWFEIzqMpunLYpJKmN9iJAMz3lmlL0YBGZVje
 iQzeQiMP0FQ38IjdTQv5cqPOn0AIL48M9j/59w/c=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <dfd48f7c-c7a2-882c-6af8-c630c140d74a@yandex-team.ru>
Date: Wed, 20 Jul 2022 16:10:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 11/21] jobs: group together API calls under the same
 job lock
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-12-eesposit@redhat.com>
 <1925769b-7fc1-a5f3-b9bf-9799a0656b69@yandex-team.ru>
 <5e29e502-95a9-3776-b12e-6e70ced6c83f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <5e29e502-95a9-3776-b12e-6e70ced6c83f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

On 7/19/22 15:40, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 11/07/2022 um 15:26 schrieb Vladimir Sementsov-Ogievskiy:
>>>    }
>>>      static bool child_job_drained_poll(BdrvChild *c)
>>> @@ -111,8 +113,10 @@ static bool child_job_drained_poll(BdrvChild *c)
>>>        /* An inactive or completed job doesn't have any pending
>>> requests. Jobs
>>>         * with !job->busy are either already paused or have a pause
>>> point after
>>>         * being reentered, so no job driver code will run before they
>>> pause. */
>>> -    if (!job->busy || job_is_completed(job)) {
>>> -        return false;
>>> +    WITH_JOB_LOCK_GUARD() {
>>> +        if (!job->busy || job_is_completed_locked(job)) {
>>> +            return false;
>>> +        }
>>>        }
>>
>> This doesn't correspond to commit subject. I'd put such things to
>> separate commit "correct use of job_mutex in blockjob.c".
>>
>>>          /* Otherwise, assume that it isn't fully stopped yet, but
>>> allow the job to
>>> @@ -127,7 +131,9 @@ static bool child_job_drained_poll(BdrvChild *c)
>>>    static void child_job_drained_end(BdrvChild *c, int
>>> *drained_end_counter)
>>>    {
>>>        BlockJob *job = c->opaque;
>>> -    job_resume(&job->job);
>>> +    WITH_JOB_LOCK_GUARD() {
>>> +        job_resume_locked(&job->job);
>>> +    }
>>>    }
>>
>> Again, don't see a reason for such change.
>>
>>
>> [my comments relate to more similar cases in the patch]
> 
> I think you misunderstood: I aim to group API calls under the same lock.
> One application of such grouping involves loops, but not only them.

I mean that pre-patch job->busy is accessed without any lock at all. So we not just group correctly locked calls into one critical section, we also fix direct field accesses to be under lock.


> 
> Regarding the single-line WITH_JOB_LOCK_GUARD (job_next, job_pause,
> job_resume and similar), I guess I will keep the not-locked function.
> 
> Emanuele
> 


-- 
Best regards,
Vladimir

