Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E65EA637
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:33:07 +0200 (CEST)
Received: from localhost ([::1]:57932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnII-0005e1-7r
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocn7N-0003Fy-QE; Mon, 26 Sep 2022 08:21:50 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocn7I-0001k8-LF; Mon, 26 Sep 2022 08:21:48 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id DFFB22E1020;
 Mon, 26 Sep 2022 15:21:31 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b683::1:39] (unknown
 [2a02:6b8:b081:b683::1:39])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 eDe2BW4GXR-LUOeYr7V; Mon, 26 Sep 2022 15:21:31 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1664194891; bh=S00hJb8i4lSTNa6vTx9JLLdLveLke/XSShcUo2D5ufw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=gjdJdTnulXQvRoNHMr1DH7CrZGNFS7Fn8RbckC60IphlzN5B13w4Vj0YC6Ebp+tA9
 g8krZ9k42GxQNzY0S+TRE/jT0P7ppcUu3HJ1x2+u33yapiqmw8iocnmMfESlCNcdFq
 xR1ETcGo7MaMdDL3lMvgQpOzEuOJCan07/ytfg4Y=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <083bbff4-d1b9-6485-a1fc-9f75461a5bb7@yandex-team.ru>
Date: Mon, 26 Sep 2022 15:21:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v11 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-19-eesposit@redhat.com>
 <09759123-8ed4-9c6e-2086-7f65af921a13@yandex-team.ru>
 <508253cf-3134-06ba-b5e6-9f2e594cc9ed@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <508253cf-3134-06ba-b5e6-9f2e594cc9ed@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/22 20:12, Emanuele Giuseppe Esposito wrote:
>>> --- a/qemu-img.c
>>> +++ b/qemu-img.c
>>> @@ -911,7 +911,6 @@ static void run_block_job(BlockJob *job, Error
>>> **errp)
>>>        AioContext *aio_context = block_job_get_aio_context(job);
>>>        int ret = 0;
>>>    -    aio_context_acquire(aio_context);
>>>        job_lock();
>>>        job_ref_locked(&job->job);
>>>        do {
>> aio_poll() call here, doesn't require aio_context to be acquired?
> On the contrary I think, if you see in AIO_WAIT_WHILE we explicitly
> release it because we don't want to allow something else to run with the
> aiocontext acquired.
> 

Still, in AIO_WAIT_WHILE() we release ctx_, but do aio_poll(qemu_get_aio_context(), true), so we poll in other context.

But here in qemu-img.c we drop aiocontext lock exactly for aio_context, which is an argument of aio_poll()..

-- 
Best regards,
Vladimir

