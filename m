Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9055E5A3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:22:08 +0200 (CEST)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6D2U-0004Z8-9J
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o6D10-0003fW-T2; Tue, 28 Jun 2022 11:20:34 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:59776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o6D0w-0005ZK-Pm; Tue, 28 Jun 2022 11:20:33 -0400
Received: from vla3-850de775f4df.qloud-c.yandex.net
 (vla3-850de775f4df.qloud-c.yandex.net
 [IPv6:2a02:6b8:c15:341d:0:640:850d:e775])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 605102E1307;
 Tue, 28 Jun 2022 18:20:18 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla3-850de775f4df.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 XRqolCupET-KHKSJEiY; Tue, 28 Jun 2022 18:20:18 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656429618; bh=L1SgexQ+Wk3FvwniYyUUaTNvl63pYNoAAWq28EcpJgA=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=b5IhPCqnhdbUpy7pce8O40VbMseGlFnXVHlHoB3MRfhpW/XK5Njpz3Zn77iWI3tgq
 HShc9nUpsjZS3Uwns4NMT8pKZMYeZ4LpcOjKdoiI1i/UEFX6hmzUblmUoz9mmsWe3t
 y9wjU6CVRcq4h/Oegay+ZR1hsRP4wDy+NqKvcELA=
Authentication-Results: vla3-850de775f4df.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b686::1:1f] (unknown
 [2a02:6b8:b081:b686::1:1f])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 LcfM7YoZ7n-KHMqEuOk; Tue, 28 Jun 2022 18:20:17 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <d7dad7bf-023c-c9cc-d2f1-fddd28aba884@yandex-team.ru>
Date: Tue, 28 Jun 2022 18:20:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 01/18] job.c: make job_mutex and job_lock/unlock()
 public
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-2-eesposit@redhat.com>
 <5284a1ef-6b46-3fc0-12ce-f7fab820e47a@yandex-team.ru>
 <22f84042-c972-9791-9f07-30d8eb82a16e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <22f84042-c972-9791-9f07-30d8eb82a16e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/28/22 16:08, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 24/06/2022 um 20:22 schrieb Vladimir Sementsov-Ogievskiy:
>> I've already acked this (honestly, because Stefan do), but still, want
>> to clarify:
>>
>> On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
>>> job mutex will be used to protect the job struct elements and list,
>>> replacing AioContext locks.
>>>
>>> Right now use a shared lock for all jobs, in order to keep things
>>> simple. Once the AioContext lock is gone, we can introduce per-job
>>> locks.
>>>
>>> To simplify the switch from aiocontext to job lock, introduce
>>> *nop*  lock/unlock functions and macros.
>>> We want to always call job_lock/unlock outside the AioContext locks,
>>> and not vice-versa, otherwise we might get a deadlock.
>>
>> Could you describe here, why we get a deadlock?
>>
>> As I understand, we'll deadlock if two code paths exist simultaneously:
>>
>> 1. we take job mutex under aiocontext lock
>> 2. we take aiocontex lock under job mutex
>>
>> If these paths exists, it's possible that one thread goes through [1]
>> and another through [2]. If thread [1] holds job-mutex and want to take
>> aiocontext-lock, and in the same time thread [2] holds aiocontext-lock
>> and want to take job-mutext, that's a dead-lock.
>>
>> If you say, that we must avoid [1], do you have in mind that we have [2]
>> somewhere? If so, this should be mentioned here
>>
>> If not, could we just make a normal mutex, not a noop?
> 
> Of course we have [2] somewhere, otherwise I wouldn't even think about
> creating a noop function. This idea came up in v1-v2.
> 
> Regarding the specific case, I don't remember. But there are tons of
> functions that are acquiring the AioContext lock and then calling job_*
> API, such as job_cancel_sync in blockdev.c.
> 
> I might use job_cancel_sync as example and write it in the commit
> message though.
> 

Yes, that's obvious that we have tons of [1]. That's why an example of [2] would be lot more valuable.


-- 
Best regards,
Vladimir

